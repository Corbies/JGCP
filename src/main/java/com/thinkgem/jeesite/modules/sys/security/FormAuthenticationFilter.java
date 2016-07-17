/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.security;

import com.thinkgem.jeesite.common.persistence.AjaxJson;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Service;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 表单验证（包含验证码）过滤类
 *
 * @author ThinkGem
 * @version 2014-5-19
 */
@Service
public class FormAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {

    public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";
    public static final String DEFAULT_MOBILE_PARAM = "mobileLogin";
    public static final String DEFAULT_MESSAGE_PARAM = "message";

    private String captchaParam = DEFAULT_CAPTCHA_PARAM;
    private String mobileLoginParam = DEFAULT_MOBILE_PARAM;
    private String messageParam = DEFAULT_MESSAGE_PARAM;

    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        String username = getUsername(request);
        String password = getPassword(request);
        if (password == null) {
            password = "";
        }
        boolean rememberMe = isRememberMe(request);
        String host = StringUtils.getRemoteAddr((HttpServletRequest) request);
        String captcha = getCaptcha(request);
        boolean mobile = isMobileLogin(request);
        return new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host, captcha, mobile);
    }

    public String getCaptchaParam() {
        return captchaParam;
    }

    protected String getCaptcha(ServletRequest request) {
        return WebUtils.getCleanParam(request, getCaptchaParam());
    }

    public String getMobileLoginParam() {
        return mobileLoginParam;
    }

    protected boolean isMobileLogin(ServletRequest request) {
        return WebUtils.isTrue(request, getMobileLoginParam());
    }

    public String getMessageParam() {
        return messageParam;
    }

    /**
     * 登录成功之后跳转URL
     */
    public String getSuccessUrl() {
        return super.getSuccessUrl();
    }

    @Override
    protected void issueSuccessRedirect(ServletRequest request,
                                        ServletResponse response) throws Exception {
//		Principal p = UserUtils.getPrincipal();
//		if (p != null && !p.isMobileLogin()){
        WebUtils.issueRedirect(request, response, getSuccessUrl(), null, true);
//		}else{
//			super.issueSuccessRedirect(request, response);
//		}
    }

    /*
     *  RebelZhang于2015年7月22日添加
     *  主要是针对登入成功的处理方法。对于请求头是AJAX的之间返回JSON字符串。
     */
    @Override
    protected boolean onLoginSuccess(AuthenticationToken token,
                                     Subject subject, ServletRequest request, ServletResponse response)
            throws Exception {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        SystemAuthorizingRealm.Principal p = UserUtils.getPrincipal();
        if (!p.isMobileLogin()) {
            // 不是mobile请求
            issueSuccessRedirect(request, response);
        } else {
            AjaxJson ajaxJson = new AjaxJson();
            ajaxJson.setObj(p);
            ajaxJson.setMsg("登录成功");
            ajaxJson.outFlushJson(httpServletResponse);
        }
        return false;
    }


    /**
     * 登录失败调用事件
     */
    @Override
    protected boolean onLoginFailure(AuthenticationToken token,
                                     AuthenticationException e, ServletRequest request, ServletResponse response) {


        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        if (!com.thinkgem.jeesite.common.utils.WebUtils.fromMobile(httpServletRequest)) {
            String className = e.getClass().getName(), message = "";
            if (IncorrectCredentialsException.class.getName().equals(className)
                    || UnknownAccountException.class.getName().equals(className)) {
                message = "用户或密码错误, 请重试.";
            } else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "msg:")) {
                message = StringUtils.replace(e.getMessage(), "msg:", "");
            } else {
                message = "系统出现点问题，请稍后再试！";
                e.printStackTrace(); // 输出到控制台
            }
            request.setAttribute(getFailureKeyAttribute(), className);
            request.setAttribute(getMessageParam(), message);
            return true;
        }
        else{
//mobile请求
            try {

                String message = e.getClass().getSimpleName();
                AjaxJson ajaxJson = new AjaxJson();
                if ("IncorrectCredentialsException".equals(message)) {
                    ajaxJson.setSuccess(false);
                    ajaxJson.setMsg("密码错误");
                } else if ("UnknownAccountException".equals(message)) {
                    ajaxJson.setSuccess(false);
                    ajaxJson.setMsg("账号不存在");
                } else if ("LockedAccountException".equals(message)) {
                    ajaxJson.setSuccess(false);
                    ajaxJson.setMsg("账号被锁定");
                } else {
                    ajaxJson.setSuccess(false);
                    ajaxJson.setMsg("未知原因" + e.getMessage());
                }
                ajaxJson.outFlushJson(httpServletResponse);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            return false;
        }
    }

}
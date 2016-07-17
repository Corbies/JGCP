package com.thinkgem.jeesite.modules.sys.security;

import com.thinkgem.jeesite.common.persistence.AjaxJson;
import com.thinkgem.jeesite.common.utils.WebUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * Rebelzhang于2016年5月24日添加
 * 用于过滤移动端请求
 * 还需要在spring-context-shiro中增加相关的配置
 *
 * 1.自定义角色鉴权过滤器(满足其中一个角色则认证通过) 2.扩展异步请求认证提示功能;
 *
 * @author shadow
 */
@Service
public class RoleAuthorizationFilter extends AuthorizationFilter {

    //@Autowired
    //private RkGerenjibenxinxiService rkGerenjibenxinxiService;

    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        Subject subject = getSubject(request, response);

        if (subject.getPrincipal() == null) {
            if (WebUtils.fromMobile(httpRequest)) {
                AjaxJson ajaxJson = new AjaxJson();
                //表示用户未登陆，要求进行登录验证
                ajaxJson.setSuccess(false);
                ajaxJson.setMsg("888");
                ajaxJson.outFlushJson(httpResponse);
            } else {
                saveRequestAndRedirectToLogin(request, response);
            }
        } else {
            //用户登录了但是没有权限
            if (WebUtils.fromMobile(httpRequest)) {
                AjaxJson ajaxJson = new AjaxJson();
                ajaxJson.setSuccess(false);
                ajaxJson.setMsg("401");
                ajaxJson.outFlushJson(httpResponse);
            } else {

                String unauthorizedUrl = getUnauthorizedUrl();
                if (StringUtils.hasText(unauthorizedUrl)) {
                    WebUtils.issueRedirect(request, response, unauthorizedUrl);
                } else {
                    WebUtils.toHttp(response).sendError(401);
                }

            }

        }
        return false;
    }

    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
            throws IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        Subject subject = getSubject(request, response);

        if(subject.getPrincipal() == null) {
            //不合法，交给onAccessDenied 处理
            return false;
        } else {
            //已经登录，在客户端访问
            if (WebUtils.fromMobile(httpRequest)) {
                //判断是否是需要过滤的URL
                String requestURI = httpRequest.getRequestURI();
                /*if(!requestURI.contains("/ruoker/rkGerenjibenxinxi")) {
                    //判断用户是否完成绑定
                    String userid = httpRequest.getHeader("__userid");
                    RkGerenjibenxinxi rkGerenjibenxinxi = new RkGerenjibenxinxi();
                    rkGerenjibenxinxi.setXitongyonghuid(Long.parseLong(userid));
                    List<RkGerenjibenxinxi> rkGerenjibenxinxis = rkGerenjibenxinxiService.findList(rkGerenjibenxinxi);
                    if(rkGerenjibenxinxis == null || rkGerenjibenxinxis.size() == 0) {
                        AjaxJson ajaxJson = new AjaxJson();
                        //表示用户未绑定，要求进行个人信息绑定
                        ajaxJson.setSuccess(false);
                        ajaxJson.setMsg("666");
                        ajaxJson.outFlushJson(httpResponse);
                    }
                } else {
                    return true;
                }*/

                //设备是否认证
                String eid = httpRequest.getHeader("_eid");

                if("123".equals(eid)){
                    //认证设备
                    return true;
                }else {
                    AjaxJson ajaxJson = new AjaxJson();
                    //表示用户未绑定，要求进行个人信息绑定
                    ajaxJson.setSuccess(false);
                    ajaxJson.setMsg("不是认证设备");
                    ajaxJson.outFlushJson(httpResponse);
                }
            }

        }

        String[] rolesArray = (String[]) mappedValue;

        if (rolesArray == null || rolesArray.length == 0) {
            // no roles specified, so nothing to check - allow access.
            return true;
        }

        Set<String> roles = CollectionUtils.asSet(rolesArray);
        for (String role : roles) {
            if (subject.hasRole(role)) {
                return true;
            }
        }
        return false;
    }

}
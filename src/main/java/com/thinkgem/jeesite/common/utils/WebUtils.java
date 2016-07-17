package com.thinkgem.jeesite.common.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangjing on 2015/8/9.
 */
public class WebUtils extends org.apache.shiro.web.util.WebUtils{

    public static boolean fromH5(HttpServletRequest request) {
        return request.getHeader("_pingtai") != null && "h5".equals(request.getHeader("_pingtai").toLowerCase());
    }

    public static boolean fromIos(HttpServletRequest request) {
        return request.getHeader("_pingtai") != null && "ios".equals(request.getHeader("_pingtai").toLowerCase());
    }

    public static boolean fromAndroid(HttpServletRequest request) {
        return request.getHeader("_pingtai") != null && "android".equals(request.getHeader("_pingtai").toLowerCase());
    }

    public static boolean fromWx(HttpServletRequest request) {
        return request.getHeader("_pingtai") != null && "wx".equals(request.getHeader("_pingtai").toLowerCase());
    }

    public static boolean fromMobile(HttpServletRequest request) {
        return fromH5(request) || fromIos(request) || fromAndroid(request) || fromWx(request);
    }
}

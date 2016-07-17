<%
    response.setStatus(403);

//获取异常类
    Throwable ex = Exceptions.getThrowable(request);

// 如果是异步请求或是手机端，则直接返回信息
    if (Servlets.isAjaxRequest(request)) {
        if (ex != null && StringUtils.startsWith(ex.getMessage(), "msg:")) {
            out.print(StringUtils.replace(ex.getMessage(), "msg:", ""));
        } else {
            out.print("操作权限不足.");
        }
    }

//输出异常信息页面
    else {

%>
<%@page import="com.thinkgem.jeesite.common.utils.Exceptions" %>
<%@page import="com.thinkgem.jeesite.common.utils.StringUtils" %>
<%@page import="com.thinkgem.jeesite.common.web.Servlets" %>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8"/>
    <title>Metronic | Coming Soon</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${mctx}/googleFonts.css" rel="stylesheet" type="text/css"/>
    <link href="${mctx}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${mctx}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${mctx}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${mctx}/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="${mctx}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="${mctx}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${mctx}/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${mctx}/pages/css/coming-soon.css" rel="stylesheet" type="text/css"/>
    <style>
        .sec{
            font-weight: bold;
            color: #000000;
            font-size: 20px;
        }
    </style>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->

<body class="">
<div class="container">
    <div class="row">
        <div class="col-md-12 coming-soon-header">
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 coming-soon-content">
            <h1><i class="fa fa-warning"></i> 403 超时 / 无权限！ <br>Oops! Something went wrong</h1>
            <p>
                由于您长时间未操作、没有操作权限或其他原因，您的登录已经超时，系统将于&nbsp;<span class="sec">5</span>&nbsp;秒钟后返回登录页面。<br>
                如果您在做这个操作时反复出现这个提示，请您和系统管理员联系。
            </p>
            <p>Because you are not operating, long time no operating authority or other reasons, you have the login
                timeout, the system will return to the login page in <span class="sec">5</span> seconds.
                If this error occurs repeatedly in you do this operation, contact your administrator.
            </p>
            <p>
                <%
                    if (ex != null && StringUtils.startsWith(ex.getMessage(), "msg:")) {
                        out.print("<div>异常信息：" + StringUtils.replace(ex.getMessage(), "msg:", "") + " <br/> <br/></div>");
                    }
                %>
            </p>
            <br>
        </div>
    </div>
</div>
<!--[if lt IE 9]>
<script src="${mctx}/global/plugins/respond.min.js"></script>
<script src="${mctx}/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${mctx}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script>
    function countDown(secs) {
        if (--secs > 0) {
            $(".sec").text(secs);
            setTimeout("countDown(" + secs + ")", 1000);
        }
        else {
            top.location = "${ctx}/logout";
        }
    }
    countDown(1);
</script>
</body>

</html>
<%
    }
%>
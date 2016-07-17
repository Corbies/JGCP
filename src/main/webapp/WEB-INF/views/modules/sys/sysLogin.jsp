<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="cn">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8"/>
    <title>${fns:getConfig('productName')} 登录</title>
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
    <link href="${mctx}/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
    <link href="${mctx}/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="${mctx}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${mctx}/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${mctx}/pages/css/login-4.min.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
    <style>
        body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
            font-family: Microsoft YaHei, '宋体', Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
        }
    </style>
</head>
<!-- END HEAD -->

<body class=" login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="index.html">
        <img src="${mctx}/pages/img/logo-big.png" alt=""/> </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" id="loginForm" action="${ctx}/login" method="post" target="_top">
        <h3 class="form-title">登录<br/>Login to your account</h3>
        <div id="loginError" class="alert alert-danger ${empty message ? 'display-hide' : ''}">
            <button class="close" data-close="alert"></button>
            <span> ${message} </span>
        </div>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">用户名 / Username</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="on"
                       placeholder="用户名 / Username" name="username" value="admin"/></div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码 / Password</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="on"
                       placeholder="密码 / Password" name="password" value="admin"/></div>
        </div>
        <c:if test="${isValidateCodeLogin}">
            <div class="validateCode">
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">验证码 / Captcha</label>
                    <sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
                </div>
            </div>
        </c:if>
        <div class="form-actions">
            <label class="checkbox">
                <input type="checkbox" name="remember" value="1"/>记住我 Remember me </label>
            <button type="submit" class="btn green pull-right"> 登录 / Login</button>
        </div>
    </form>
    <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright"> 2016 &copy; ZopsenFramework.</div>
<!-- END COPYRIGHT -->
<!--[if lt IE 9]>
<script src="${mctx}/global/plugins/respond.min.js"></script>
<script src="${mctx}/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${mctx}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="${mctx}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${mctx}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"
        charset="UTF-8"></script>
<script src="${mctx}/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${mctx}/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${mctx}/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${mctx}/pages/scripts/login-4.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<!-- END THEME LAYOUT SCRIPTS -->
</body>

</html>
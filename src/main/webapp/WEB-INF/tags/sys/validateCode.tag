<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ attribute name="name" type="java.lang.String" required="true" description="验证码输入框名称" %>
<%@ attribute name="inputCssStyle" type="java.lang.String" required="false" description="验证框样式" %>
<%@ attribute name="imageCssStyle" type="java.lang.String" required="false" description="验证码图片样式" %>
<%@ attribute name="buttonCssStyle" type="java.lang.String" required="false" description="看不清按钮样式" %>
<div class="input-icon">
    <i class="fa fa-code"></i>
    <input class="form-control placeholder-no-fix" type="text" autocomplete="off"
           placeholder="验证码 / Captcha" id="${name}" name="${name}" maxlength="5"/>
</div>
<div style="margin-top: 5px;" class="">
    <img src="${pageContext.request.contextPath}/servlet/validateCodeServlet" onclick="$('.${name}Refresh').click();"
         class="mid ${name}" style="${imageCssStyle};margin: 5px;"/>
    <a href="javascript:"
       onclick="$('.${name}').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());"
       class="mid ${name}Refresh" style="color: #0a001f"><i class="fa fa-repeat"></i></a>
</div>


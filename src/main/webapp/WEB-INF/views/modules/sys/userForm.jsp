<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>用户管理</title>
    <meta name="decorator" content="metronic"/>
</head>
<body>
<div class="tabbable-custom ">
    <ul class="nav nav-tabs">
        <li><a href="${ctx}/sys/user/list">用户列表</a></li>
        <li class="active"><a href="${ctx}/sys/user/form?id=${user.id}">用户<shiro:hasPermission
                name="sys:user:edit">${not empty user.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
                name="sys:user:edit">查看</shiro:lacksPermission></a></li>
    </ul>
    <div class="tab-content">
        <form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post"
                   class="form-horizontal">
            <div class="form-body">
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    表单内容没有填写完整，请检查。
                </div>
                <div class="alert alert-success display-hide">
                    <button class="close" data-close="alert"></button>
                    表单验证通过。
                </div>
                <form:hidden path="id"/>
                <sys:message content="${message}"/>
                <div class="form-group">
                    <label class="control-label col-sm-2">头像 </label>
                    <div class="col-sm-6">
                        <form:hidden id="nameImage" path="photo" maxlength="255"/>
                        <sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false"
                                      maxWidth="100" maxHeight="100"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">归属公司 </label>
                    <div class="col-sm-6">
                        <sys:treeselect id="company" name="company.id" value="${user.company.id}"
                                        labelName="company.name"
                                        labelValue="${user.company.name}" cssClass="required"
                                        title="公司" url="/sys/office/treeData?type=1"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">归属部门 </label>
                    <div class="col-sm-6">
                        <sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name"
                                        labelValue="${user.office.name}"
                                        title="部门" url="/sys/office/treeData?type=2"
                                        notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">工号 <span class="required"> * </span></label>
                    <div class="col-sm-6">
                        <form:input path="no" maxlength="50" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">姓名 <span class="required"> * </span></label>
                    <div class="col-sm-6">
                        <form:input path="name" maxlength="50" class="form-control required"
                                    data-required="1"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">登录名 <span class="required"> * </span></label>
                    <div class="col-sm-6">
                        <input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
                        <form:input path="loginName" maxlength="50" class="form-control required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">密码 <c:if test="${empty user.id}"><span
                            class="required"> * </span></c:if></label>
                    <div class="col-sm-6">
                        <input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3"
                               class="form-control"/>
                        <c:if test="${not empty user.id}"><span class="help-block">若不修改密码，请留空。</span></c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">确认密码<c:if test="${empty user.id}"><span
                            class="required"> * </span></c:if></label>
                    <div class="col-sm-6">
                        <input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50"
                               minlength="3" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">邮箱:</label>
                    <div class="col-sm-6">
                        <form:input path="email" maxlength="100" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">电话:</label>
                    <div class="col-sm-6">
                        <form:input path="phone" maxlength="100" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">手机:</label>
                    <div class="col-sm-6">
                        <form:input path="mobile" maxlength="100" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">是否允许登录<span class="required"> * </span></label>
                    <div class="col-sm-6">
                        <form:select path="loginFlag" class="input-large">
                            <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                        <span class="help-block"> “是”代表此账号允许登录，“否”则表示此账号不允许登录</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">用户类型</label>
                    <div class="col-sm-6">
                        <form:select path="userType" class="input-large">
                            <form:option value="" label="请选择"/>
                            <form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label"
                                          itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">用户角色<span class="required"> * </span></label>
                    <div class="col-sm-6">
                        <c:forEach var="role" items="${allRoles}" varStatus="status">
                            <form:checkbox path="roleIdList" value="${role.id}" label="${role.name}"
                                           htmlEscape="false"/>&nbsp;
                            <c:if test="${((status.index+1) % 3) eq 0}"><br/></c:if>
                        </c:forEach>
                            <%--<form:checkboxes path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id"--%>
                            <%--htmlEscape="false"/>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">备注</label>
                    <div class="col-sm-6">
                        <form:textarea path="remarks" rows="3" maxlength="200" class="form-control"/>
                    </div>
                </div>
                <c:if test="${not empty user.id}">
                    <div class="form-group">
                        <label class="control-label col-sm-2">创建时间:</label>
                        <div class="col-sm-6">
                            <label class="lbl"><fmt:formatDate value="${user.createDate}" type="both"
                                                               dateStyle="full"/></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">最后登陆:</label>
                        <div class="col-sm-6">
                            <label class="lbl">IP: ${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate
                                    value="${user.loginDate}" type="both" dateStyle="full"/></label>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-8">
                            <shiro:hasPermission name="sys:user:edit">
                                <button id="btnSubmit" type="submit" class="btn green">
                                    <i class="icon-check"></i> 保存
                                </button>
                                &nbsp;
                            </shiro:hasPermission>
                            <button id="btnCancel" type="button" class="btn default" onclick="history.go(-1)">
                                <i class="icon-close"></i> 取消
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
<script>

    $(function () {
        var form1 = $('#inputForm');
        var error1 = $('.alert-danger', form1);
        var success1 = $('.alert-success', form1);

        form1.validate({
            errorElement: 'span', //默认显示错误的容器
            errorClass: 'help-block help-block-error', // 默认显示错误的样式
            focusInvalid: false, // 不自动跳转到最后一个验证未通过的类
            ignore: "",  // 验证所有表单内容，包含隐藏域
            messages: {
                loginName: {
                    remote: "此登录名已经被使用"
                },
                confirmNewPassword: {
                    equalTo: "和上面输入的密码不一致"
                },
                roleIdList: {
                    required: "至少选择1个角色",
                    minlength: jQuery.validator.format("最少选择 {0} 项")
                }
            },
            rules: {
                no: {
                    minlength: 2,
                    required: true
                },
                loginName: {
                    remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')
                },
                email: {
                    email: true
                },
                newPassword: {
                    required: ${empty user.id?'true':'false'}
                },
                confirmNewPassword: {
                    equalTo: "#newPassword"
                },
                roleIdList: {
                    required: true,
                    minlength: 1
                }
            },

            invalidHandler: function (event, validator) {
                //显示错误信息
                success1.hide();
                error1.show();
            },

            highlight: function (element) {
                // 高亮显示错误控件
                $(element)
                        .closest('.form-group').addClass('has-error');
            },

            unhighlight: function (element) {
                // 正确后取消高亮
                $(element)
                        .closest('.form-group').removeClass('has-error');
            },

            success: function (label) {
                label
                        .closest('.form-group').removeClass('has-error');
            },

            submitHandler: function (form) {
                success1.show();
                error1.hide();
                form.submit();
            }
        });
    });

</script>
</body>
</html>
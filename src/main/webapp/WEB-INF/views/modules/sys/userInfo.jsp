<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<title>个人信息</title>
	<meta name="decorator" content="metronic"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
<div class="tabbable-custom ">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/info">个人信息</a></li>
		<li><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/info" method="post" class="form-horizontal"><%--
		<form:hidden path="email" htmlEscape="false" maxlength="255" class="input-xlarge"/>
		<sys:ckfinder input="email" type="files" uploadPath="/mytask" selectMultiple="false"/> --%>
	<div class="form-body">
		<sys:message content="${message}"/>
		<div class="form-group">
			<label class="control-label  col-sm-2">头像:</label>
			<div class="col-sm-6">
				<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">归属公司:</label>
			<div class="col-sm-6">
				<label class="control-label">${user.company.name}</label>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">归属部门:</label>
			<div class="col-sm-6">
				<label class="control-label">${user.office.name}</label>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">姓名:</label>
			<div class="col-sm-6">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">邮箱:</label>
			<div class="col-sm-6">
				<form:input path="email" htmlEscape="false" maxlength="50" class="email"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">电话:</label>
			<div class="col-sm-6">
				<form:input path="phone" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">手机:</label>
			<div class="col-sm-6">
				<form:input path="mobile" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">备注:</label>
			<div class="col-sm-6">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">用户类型:</label>
			<div class="col-sm-6">
				<label class="control-label">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">用户角色:</label>
			<div class="col-sm-6">
				<label class="control-label">${user.roleNames}</label>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label  col-sm-2">上次登录:</label>
			<div class="col-sm-6">
				<label class="control-label">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>
			</div>
		</div>

		<div class="form-group">
			<div class="row">
				<div class="col-sm-offset-3 col-sm-8">
						<button id="btnSubmit" type="submit" class="btn green">
							<i class="icon-check"></i> 保存
						</button>
				</div>
			</div>
		</div>
	</div>
		</div>
	</form:form>
	</div>
</body>
</html>
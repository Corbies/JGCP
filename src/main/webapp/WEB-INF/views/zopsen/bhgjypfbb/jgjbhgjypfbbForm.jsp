<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>不合格情况分布</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
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
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb/">不合格分布列表</a></li>
		<li class="active"><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb/form?id=${jgjBhgjyfbb.id}">不合格分布添加<shiro:hasPermission name="bhgjyfbb:jgjbhgjyfbb:edit">${not empty jgjJczfxddxal.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="bhgjyfbb:jgjbhgjyfbb:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="jgjBhgjyfbb" action="${ctx}/bhgjyfbb/jgjbhgjyfbb/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="lb"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">产品名称：</label>
			<div class="controls">
				<form:input path="cpmc" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品标准：</label>
			<div class="controls">
				<form:input path="cpbz" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">规格型号：</label>
			<div class="controls">
				<form:input path="ggxh" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">材料/性能等级：</label>
			<div class="controls">
				<form:input path="clxndj" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">批号：</label>
			<div class="controls">
				<form:input path="ph" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">检测标准：</label>
			<div class="controls">
				<form:input path="jcbz" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">生产企业类别：</label>
			<div class="controls">
				<%--<form:input path="scqylb" htmlEscape="false" maxlength="255" class="input-xlarge "/>--%>
					<form:select path="scqylb">
						<form:option value="军口"/>
						<form:option value="民口"/>
					</form:select><br/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">不合格项目检测：</label>
			<div class="controls">
			<%--//	<form:input path="bhgjcxm" htmlEscape="false" maxlength="255" class="input-xlarge "/>--%>
				<form:select path="bhgjcxm" items="${wordbooks}" itemLabel="WordBook_VALUE" itemValue="WordBook_VALUE">

				</form:select><br/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">不合格级别：</label>
			<div class="controls">
				<%--<form:input path="bhgjb" htmlEscape="false" maxlength="255" class="input-xlarge "/>--%>
				<form:select path="bhgjb">
					<form:option value="致命缺陷"/>
					<form:option value="严重缺陷"/>
					<form:option value="轻缺陷"/>

				</form:select><br/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="bz" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="bhgjyfbb:jgjbhgjyfbb:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
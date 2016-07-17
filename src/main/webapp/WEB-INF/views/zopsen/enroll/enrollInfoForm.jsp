<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>面试信息管理</title>
    <meta name="decorator" content="metronic"/>
</head>
<body>
<div class="tabbable-custom ">
    <ul class="nav nav-tabs">
		<li><a href="${ctx}/enroll/enrollInfo/">面试信息列表</a></li>
		<li class="active"><a href="${ctx}/enroll/enrollInfo/form?id=${enrollInfo.id}">面试信息<shiro:hasPermission name="enroll:enrollInfo:edit">${not empty enrollInfo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="enroll:enrollInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<div class="tab-content">
		<form:form id="inputForm" modelAttribute="enrollInfo" action="${ctx}/enroll/enrollInfo/save" method="post" class="form-horizontal">
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
					<label class="control-label" for="xingming">姓名 </label>
					<div class="col-sm-6">
						<form:input path="xingming" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="zhunkaozhenghao">准考证号 </label>
					<div class="col-sm-6">
						<form:input path="zhunkaozhenghao" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="zhongkaochengji">中考成绩 </label>
					<div class="col-sm-6">
						<form:input path="zhongkaochengji" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="shifoushengneikaosheng">是否省内考生 </label>
					<div class="col-sm-6">
						<form:input path="shifoushengneikaosheng" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="shenfenzhenghao">身份证号 </label>
					<div class="col-sm-6">
						<form:input path="shenfenzhenghao" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="hujisuozaidi">户籍所在地 </label>
					<div class="col-sm-6">
						<form:input path="hujisuozaidi" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="hujileibie">户籍类别 </label>
					<div class="col-sm-6">
						<form:input path="hujileibie" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="jiachanglianxidianhua">家长联系电话 </label>
					<div class="col-sm-6">
						<form:input path="jiachanglianxidianhua" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="chuzhongbiyexuexiao">初中毕业学校 </label>
					<div class="col-sm-6">
						<form:input path="chuzhongbiyexuexiao" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="baokaozhuanye1">报考专业1 </label>
					<div class="col-sm-6">
						<form:input path="baokaozhuanye1" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="baokaozhuanye2">报考专业2 </label>
					<div class="col-sm-6">
						<form:input path="baokaozhuanye2" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="mianshijieguo">面试结果 </label>
					<div class="col-sm-6">
						<form:input path="mianshijieguo" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="zhaopian">zhaopian </label>
					<div class="col-sm-6">
						<form:input path="zhaopian" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="remarks">备注信息 </label>
					<div class="col-sm-6">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>

				<div class="form-group">
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-8">
                        	<shiro:hasPermission name="enroll:enrollInfo:edit">
                        		<button id="btnSubmit" type="submit" class="btn green">
                                    <i class="icon-check"></i> 保存
                                </button>
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

            },
            rules: {

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
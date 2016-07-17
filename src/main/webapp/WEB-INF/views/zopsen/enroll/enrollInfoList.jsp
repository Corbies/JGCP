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
        <li class="active">
            <a href="${ctx}/enroll/enrollInfo/"> 面试信息列表 </a>
        </li>
        <shiro:hasPermission name="enroll:enrollInfo:edit">
            <li>
                <a href="${ctx}/enroll/enrollInfo/form">面试信息添加</a>
            </li>
        </shiro:hasPermission>
    </ul>
    <div class="tab-content">
        <div class="portlet box blue-sharp" style="margin-bottom: 3px">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-search"></i>多条件组合搜索
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"> </a>
                </div>
            </div>
            <div class="portlet-body">
				<form:form id="searchForm" modelAttribute="enrollInfo" action="${ctx}/enroll/enrollInfo/" method="post" cssClass="form-inline">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
						<div class="form-group">
							<label>姓名：</label>
								<form:input path="xingming" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>准考证号：</label>
								<form:input path="zhunkaozhenghao" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>中考成绩：</label>
								<form:input path="zhongkaochengji" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>是否省内考生：</label>
								<form:input path="shifoushengneikaosheng" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>身份证号：</label>
								<form:input path="shenfenzhenghao" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>户籍所在地：</label>
								<form:input path="hujisuozaidi" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>户籍类别：</label>
								<form:input path="hujileibie" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>家长联系电话：</label>
								<form:input path="jiachanglianxidianhua" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>初中毕业学校：</label>
								<form:input path="chuzhongbiyexuexiao" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>报考专业1：</label>
								<form:input path="baokaozhuanye1" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>报考专业2：</label>
								<form:input path="baokaozhuanye2" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>面试结果：</label>
								<form:input path="mianshijieguo" htmlEscape="true" maxlength="200" class="form-control"/>
						</div>
						<div class="form-group">
							<label>备注信息：</label>
								<form:input path="remarks" htmlEscape="true" maxlength="255" class="form-control"/>
						</div>
						<button id="btnSubmit" class="btn blue btn-outline" onclick="return page();">
                        	<i class="icon-magnifier"></i> 查询
                    	</button>
					</form:form>
				</div>
			</div>
			<sys:message content="${message}"/>
			<div class="note note-info" style="margin-bottom: 3px;padding: 3px;">
				<button href="javascript:;" class="btn blue btn-outline" id="btnImport">
					<i class="icon-cloud-upload"></i> 功能按钮1
				</button>
				<button href="javascript:;" class="btn blue btn-outline" id="btnExport">
					<i class="icon-cloud-download"></i> 功能按钮2
				</button>
			</div>
			<table class="table table-striped table-bordered table-hover contentTable" id="ListTable" style="margin-bottom: 0;">
				<thead>
					<tr>
						<th>序号</th>
						<th>备注信息</th>
						<shiro:hasPermission name="enroll:enrollInfo:edit"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="enrollInfo" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td><a href="${ctx}/enroll/enrollInfo/form?id=${enrollInfo.id}">
							${enrollInfo.remarks}
						</a></td>
						<shiro:hasPermission name="enroll:enrollInfo:edit">
							<td>
								<div class="btn-group btn-group-sm btn-group-circle">
									<a 	class="btn btn-outline blue"
										href="${ctx}/enroll/enrollInfo/form?id=${enrollInfo.id}"
										style="margin-right: 0">
										<i class="fa fa-edit"></i> 修改
									</a>
									<a 	class="btn btn-outline red"
										href="${ctx}/enroll/enrollInfo/delete?id=${enrollInfo.id}"
										onclick="return confirmx('确认要删除该面试信息吗？', this.href)">
										<i class="fa fa-close"></i> 删除
									</a>
								</div>
							</td>
						</shiro:hasPermission>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		<div class="pagination">${page}</div>
    </div>
</div>

<!--页面脚本-->
<script type="text/javascript">
	$(function() {

	});

	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>

</body>
</html>
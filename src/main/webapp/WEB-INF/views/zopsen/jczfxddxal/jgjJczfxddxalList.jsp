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
	<title>检测中发现的典型案例管理</title>
	<meta name="decorator" content="metronic"/>
</head>
<body>
<div class="tabbable-custom ">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="${ctx}/jczfxddxal/jgjJczfxddxal/"> 检测中发现的典型案例列表 </a>
        </li>
        <shiro:hasPermission name="jczfxddxal:jgjJczfxddxal:edit">
            <li>
                <a href="${ctx}/jczfxddxal/jgjJczfxddxal/form">检测中发现的典型案例添加</a>
            </li>
        </shiro:hasPermission>
    </ul>
    <div class="tab-content">

			<sys:message content="${message}"/>

			<table class="table table-striped table-bordered table-hover contentTable" id="ListTable" style="margin-bottom: 0;">
				<thead>
					<tr>
						<th>序号</th>
						<th>试样基本信息</th>
						<th>质量现象</th>
						<th>原因分析与处理</th>
						<th>更新时间</th>
						<th>备注</th>
						<shiro:hasPermission name="jczfxddxal:jgjJczfxddxal:edit"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="jgjJczfxddxal" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td><a href="${ctx}/jczfxddxal/jgjJczfxddxal/form?id=${jgjJczfxddxal.id}">
							${jgjJczfxddxal.syjbxx}
						</a></td>
						<td>
							${jgjJczfxddxal.zlxx}
						</td>
						<td>
							${jgjJczfxddxal.yyfxycl}
						</td>
						<td>
							<fmt:formatDate value="${jgjJczfxddxal.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							${jgjJczfxddxal.remarks}
						</td>
						<shiro:hasPermission name="jczfxddxal:jgjJczfxddxal:edit">
							<td>
								<div class="btn-group btn-group-sm btn-group-circle">
									<a 	class="btn btn-outline blue"
										href="${ctx}/jczfxddxal/jgjJczfxddxal/form?id=${jgjJczfxddxal.id}"
										style="margin-right: 0">
										<i class="fa fa-edit"></i> 修改
									</a>
									<a 	class="btn btn-outline red"
										href="${ctx}/jczfxddxal/jgjJczfxddxal/delete?id=${jgjJczfxddxal.id}"
										onclick="return confirmx('确认要删除该检测中发现的典型案例吗？', this.href)">
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
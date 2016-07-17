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
<div id="importBox" class="hide">
    <form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
          class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
        <input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
        <input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
        <a href="${ctx}/sys/user/import/template">下载模板</a>
    </form>
</div>
<div class="tabbable-custom ">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="${ctx}/sys/user/list"> 用户列表 </a>
        </li>
        <shiro:hasPermission name="sys:user:edit">
            <li>
                <a href="${ctx}/sys/user/form"> 用户添加 </a>
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
                <form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/list" method="post"
                           cssClass="form-inline">
                    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                    <sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
                    <div class="form-group">
                        <label>归属公司：</label><sys:treeselect id="company" name="company.id"
                                                            value="${user.company.id}"
                                                            labelName="company.name"
                                                            labelValue="${user.company.name}"
                                                            title="公司" url="/sys/office/treeData?type=1"
                                                            allowClear="true"/>
                    </div>
                    <div class="form-group">
                        <label>登录名：</label><form:input path="loginName" htmlEscape="false" maxlength="50"
                                                       class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>归属部门：</label><sys:treeselect id="office" name="office.id" value="${user.office.id}"
                                                            labelName="office.name" labelValue="${user.office.name}"
                                                            title="部门" url="/sys/office/treeData?type=2"
                                                            allowClear="true" notAllowSelectParent="true"/>
                    </div>
                    <div class="form-group">
                        <label>姓&nbsp;&nbsp;&nbsp;名：</label><form:input path="name" htmlEscape="false"
                                                                        maxlength="50"
                                                                        class="form-control"/>
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
                <i class="icon-cloud-upload"></i> 导入
            </button>
            <button href="javascript:;" class="btn blue btn-outline" id="btnExport">
                <i class="icon-cloud-download"></i> 导出
            </button>
        </div>
        <table class="table table-striped table-bordered table-hover contentTable" id="userListTable"
               style="margin-bottom: 0;">
            <thead>
            <tr>
                <th>序号</th>
                <th>归属公司</th>
                <th>归属部门</th>
                <th>登录名</th>
                <th>姓名</th>
                <th>电话</th>
                <th>手机</th>
                <shiro:hasPermission name="sys:user:edit">
                    <th>操作</th>
                </shiro:hasPermission></tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="user" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${user.company.name}</td>
                    <td>${user.office.name}</td>
                    <td>${user.loginName}</td>
                    <td>${user.name}</td>
                    <td>${user.phone}</td>
                    <td>${user.mobile}</td>
                    <shiro:hasPermission name="sys:user:edit">
                        <td>
                            <div class="btn-group btn-group-sm btn-group-circle">
                                <a class="btn btn-outline blue" href="${ctx}/sys/user/form?id=${user.id}"
                                   style="margin-right: 0">
                                    <i class="fa fa-edit"></i> 修改
                                </a>
                                <a class="btn btn-outline red" href="${ctx}/sys/user/delete?id=${user.id}"
                                   onclick="return confirmx('确认要删除该用户吗？', this.href)">
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

<script type="text/javascript">
    $(document).ready(function () {
        var searchFrom = $("#searchForm");

        $("#btnExport").click(function () {
            $.jBox.confirm("确认要导出用户数据吗？", "系统提示", function (v, h, f) {
                if (v == "ok") {
                    searchFrom.attr("action", "${ctx}/sys/user/export");
                    searchFrom.submit();
                }
            }, {buttonsFocus: 1});
            $('.jbox-body .jbox-icon').css('top', '55px');
        });

        $("#btnImport").click(function () {
            $.jBox($("#importBox").html(), {
                title: "导入数据", buttons: {"关闭": true},
                bottomText: "导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"
            });
        });
    });
    function page(n, s) {
        var searchFrom = $("#searchForm");
        if (n) $("#pageNo").val(n);
        if (s) $("#pageSize").val(s);
        searchFrom.attr("action", "${ctx}/sys/user/list");
        searchFrom.submit();
        return false;
    }
</script>
</body>
</html>
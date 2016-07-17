<%--
  Created by IntelliJ IDEA.
  User: Corbie
  Date: 2016/6/1
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<title>不合格检验批分布表</title>
<meta name="decorator" content="metronic"/>
<head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb/">不合格分布列表</a></li>
    <li ><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb/form?lb=${lb}">不合格分布添加<shiro:hasPermission name="bhgjyfbb:jgjbhgjyfbb:edit">${not empty jgjJczfxddxal.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="bhgjyfbb:jgjbhgjyfbb:edit">查看</shiro:lacksPermission></a></li>
</ul><br/>

<div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
            data-toggle="dropdown">
        紧固件类别
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb?lb=ld">柳钉</a></li>
        <li><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb?lb=ls">螺栓</a></li>
        <li><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb?lb=lm">螺母</a></li>
        <li><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb?lb=dq">垫圈</a></li>
    </ul>
</div>

<div class="tabbable-custom ">


    <table class="table table-striped table-bordered table-hover contentTable" id="ListTable" style="margin-bottom: 0;">
        <thead>
        <tr>
            <th>序号</th>
            <th>产品名称</th>
            <th>产品标准</th>
            <th>规格型号</th>
            <th>材料/性能等级</th>
            <th>批号</th>
            <th>检测标准 </th>
            <th>生产企业类别 </th>
            <th>不合格项目检测</th>
            <th>不合格级别</th>
            <th>备注 </th>
            <shiro:hasPermission name="jczfxddxal:jgjJczfxddxal:edit"><th>操作</th></shiro:hasPermission>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="jgjbhgjyfbb" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td><a href="${ctx}/bhgjyfbb/jgjbhgjyfbb/form?id=${jgjbhgjyfbb.id}">
                        ${jgjbhgjyfbb.cpmc}
                </a></td>
                <td>
                        ${jgjbhgjyfbb.cpbz}
                </td>
                <td>
                        ${jgjbhgjyfbb.ggxh}
                </td>
                <td>
                        ${jgjbhgjyfbb.clxndj}
                </td>
                <td>
                        ${jgjbhgjyfbb.ph}
                </td>
                <td>
                        ${jgjbhgjyfbb.jcbz}
                </td>
                <td>
                        ${jgjbhgjyfbb.scqylb}
                </td>
                <td>
                        ${jgjbhgjyfbb.bhgjcxm}
                </td>
                <td>
                        ${jgjbhgjyfbb.bhgjb}
                </td>
                <td>
                        ${jgjbhgjyfbb.bz}
                </td>
                <td>
                    <fmt:formatDate value="${jgjJczfxddxal.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>

                <shiro:hasPermission name="jczfxddxal:jgjJczfxddxal:edit">
                    <td>
                        <div class="btn-group btn-group-sm btn-group-circle">
                            <a 	class="btn btn-outline blue"
                                  href="${ctx}/bhgjyfbb/jgjbhgjyfbb/form?id=${jgjJczfxddxal.id}&lb=${lb}"
                                  style="margin-right: 0">
                                <i class="fa fa-edit"></i> 修改
                            </a>
                            <a 	class="btn btn-outline red"
                                  href="${ctx}/bhgjyfbb/jgjbhgjyfbb/delete?id=${jgjJczfxddxal.id}"
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
</div>

</body>
</html>

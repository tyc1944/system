<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/31
  Time: 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript"
            src="/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <span class="x-right" style="line-height: 40px">共有数据：${pageInfo.total} 条</span>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                姓名
            </th>
            <th>
                性别
            </th>
            <th>
                入职时间
            </th>
            <th>
                职位
            </th>
            <th>
                操作
            </th>
        </thead>
        <tbody>
        <c:forEach var="staff" items="${pageInfo.list}">
        <tr>
            <td>
                ${staff.name}
            </td>
            <td>
                    ${staff.sex}
            </td>
            <td>
                <fmt:formatDate value="${staff.hiredate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${staff.position}
            </td>
            <!--  管理员展示块
            <td>
                D001
            </td>
            -->
            <td class="td-manage">
                <a title="员工详细信息"
                   onclick="x_admin_show('员工详细信息','/emp-details?username=${staff.username}',600,400)"
                   href="javascript:;"> <i class="layui-icon">&#xe60a;</i> </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>

            <a class="prev" href="${pageContext.request.contextPath}/emp-list?page=${pageInfo.pageNum-1}">&lt;&lt;</a>
            <c:forEach var="p" begin="1" end="${pageInfo.pages}">
                <c:if test="${p!=pageInfo.pageNum}">
                    <a class="num" href="${pageContext.request.contextPath}/emp-list?page=${p}">${p}</a>
                </c:if>
                <c:if test="${p==pageInfo.pageNum}">
                    <span class="current">${p}</span>&nbsp;
                </c:if>
            </c:forEach>
            <a class="next" href="${pageContext.request.contextPath}/emp-list?page=${pageInfo.pageNum+1}">&gt;&gt;</a>
        </div>
    </div>

</div>
</body>

</html>
<SCRIPT Language=VBScript><!--

//--></SCRIPT>

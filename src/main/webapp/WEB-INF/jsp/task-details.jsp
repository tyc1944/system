<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/30
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>任务详细信息</title>
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
    <table class="layui-table">
        <thead>
        <i class="layui-icon">&#xe60a;</i>任务信息
        </thead>

        <tr>
            <td colspan="2">
                任务名称：${Task.taskname}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                任务描述：${Task.taskdescription}
            </td>
        </tr>
        <tr>
            <td>
                开始时间：<fmt:formatDate value="${Task.taskbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                结束时间：<fmt:formatDate value="${Task.taskendtiime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <!-- 主管展示块-->

            <td>
                实际开始时间：<fmt:formatDate value="${Task.taskbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                实际结束时间：<fmt:formatDate value="${Task.taskendtiime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>

        <tr>
            <td>
                实施人：${Task.user.name}
            </td>
            <td>
                <!-- 跟踪任务展示块
                <select id="type" name="type" class="valid">
                    <option value="0">
                        未实施
                    </option>
                    <option value="1">
                        实施中
                    </option>
                    <option value="2">
                        已完成
                    </option>
                </select>
                -->
                <!-- 查看任务和员工权限展示块 -->
                任务状态:${Task.taskstate}


            </td>

        </tr>
    </table>
</div>
<div class="x-body">
    <table class="layui-table">
        <thead>
        <i class="layui-icon">&#xe62d;</i>实施计划
        </thead>
        <!-- 员工权限展示模块 -->
        <thead>

        <tr>
            <th>
                计划名称
            </th>
            <th>
                完成状态
            </th>
            <th>
                是否反馈
            </th>
            <th>
                开始时间
            </th>
            <th>
                结束时间
            </th>
            <th>
                操作
            </th>
        </thead>
        <tbody>
        <c:forEach var="plan" items="${Plan}">
        <tr>
            <td>
    ${plan.planname}
            </td>
            <td>
    ${plan.planstate}
            </td>
            <td>
    ${plan.feedback}
            </td>
            <td>
    <fmt:formatDate value="${plan.planbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
    <fmt:formatDate value="${plan.planendtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 管理员权限展示模块-->
            <td class="td-manage">
                <a title="计划详细信息"
                    onclick="x_admin_show('计划详细信息','/plan-details?pid=${plan.pid}',500,300)"
                    href="javascript:;"> <i class="layui-icon">&#xe60a;</i> </a>
            </td>


        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>

</html>
<SCRIPT Language=VBScript><!--

//--></SCRIPT>

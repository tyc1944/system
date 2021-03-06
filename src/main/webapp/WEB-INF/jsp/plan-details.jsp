<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/30
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>计划详细信息</title>
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
        <tr>
            <td colspan="2">
                计划名称：${plan.planname}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                计划描述：${plan.plandescription}
            </td>
        </tr>
        <tr>
            <td>
                开始时间：<fmt:formatDate value="${plan.planbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                结束时间：<fmt:formatDate value="${plan.planendtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <tr>
            <td>
                所属任务：${plan.task.taskname}
            </td>
            <td>
                计划状态：${plan.planstate}
            </td>

        </tr>
        <tr>
            <td colspan="2">
                反馈信息：${plan.feedback}
            </td>
        </tr>
    </table>
</div>
</body>

</html>
<SCRIPT Language=VBScript><!--

//--></SCRIPT>

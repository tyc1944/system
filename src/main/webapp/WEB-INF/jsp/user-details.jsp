<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/31
  Time: 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>人员详细信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
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
    <div class="layui-input">
        <label class="layui-form-label">
            姓名：
        </label>
        <label>
            ${User.name}
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            性别：
        </label>
        <label>
            ${User.sex}
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            入职时间：
        </label>
        <label>
            <fmt:formatDate value="${User.hiredate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            职位：
        </label>
        <label>
            ${User.position}
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            出生年月：
        </label>
        <label>
            <fmt:formatDate value="${User.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            学历：
        </label>
        <label>
            ${User.qualification}
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            专业：
        </label>
        <label>
            ${User.professional}
        </label>
    </div>
    <div class="layui-input">
        <label class="layui-form-label">
            行业经历：
        </label>
        <label>
            <c:if test="${User.experience==null}">
                暂无
            </c:if>
            <c:if test="${User.experience!=null}">
                ${User.experience}
            </c:if>
        </label>
    </div>
</div>

</body>

</html>
<SCRIPT Language=VBScript><!--

//-->

</SCRIPT>
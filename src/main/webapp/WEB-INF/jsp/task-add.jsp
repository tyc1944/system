<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/9/2
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>新建任务</title>
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
    <script type="text/javascript">
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#L_begin' //指定元素
            });
            //执行一个laydate实例
            laydate.render({
                elem: '#L_end' //指定元素
            });
        });


    </script>
</head>

<body>
<div class="x-body">
    <form class="layui-form" name="regForm" id="regForm">
        <div class="layui-form-item">
            <label for="L_task" class="layui-form-label">
                <span class="x-red">*</span>任务名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_task" name="taskname"
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_det" class="layui-form-label">
                <span class="x-red">*</span>任务描述
            </label>
            <div class="layui-input-inline">
						<textarea id="L_det" name="taskdescription" lay-verify="required"
                                  autocomplete="off" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_beign" class="layui-form-label">
                <span class="x-red">*</span>开始时间
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input" name="taskbegintime"
                       id="L_begin">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_end" class="layui-form-label">
                <span class="x-red">*</span>结束时间
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input" name="taskendtiime"
                       id="L_end">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>实施人
            </label>
            <div class="layui-input-inline">
                <select name="staffid" class="valid">
                    <c:forEach var="staff" items="${staff}">
                        <option value="${staff.username}">${staff.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <input type="hidden" name="empid" value="${sessionScope.User.username}">
        <div class="layui-form-item">
            <label for="L_type" class="layui-form-label">
                <span class="x-red">*</span>任务状态
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input" name="taskstate"
                       id="L_type" readonly="readonly" value="未实施">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                提交
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer', 'jquery'], function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;


        form.on('submit(add)',
            function (data) {

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/taskadd",
                    data: $("#regForm").serialize(),
                    success: function (result) {
                        if (result == "ok") {
                            //发异步，把数据提交给php
                            layer.alert("添加成功", {
                                    icon: 6
                                }, function (index) {
                                    location.reload();
                                    layer.close(index);
                                }
                            );
                        } else {
                            layer.alert("添加失败", {
                                icon: 5
                            });
                        }
                    },
                    error: function () {
                        layer.msg("请求失败");
                    }
                })


                return false;
            });
    });
</script>

</body>

</html>
<SCRIPT Language=VBScript><!--

//-->



</SCRIPT>
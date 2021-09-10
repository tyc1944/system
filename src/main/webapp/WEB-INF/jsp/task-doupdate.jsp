<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/9/2
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>调整任务</title>
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
                <input value="${Task.taskname}" type="text" id="L_task" name="taskname"
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_det" class="layui-form-label">
                <span class="x-red">*</span>任务描述
            </label>
            <div class="layui-input-inline">
						<textarea id="L_det" name="taskdescription" lay-verify="required"
                                  autocomplete="off" class="layui-textarea" >${Task.taskdescription}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_beign" class="layui-form-label">
                <span class="x-red">*</span>开始时间
            </label>
            <div class="layui-input-inline">
                <input value=" <fmt:formatDate value="${Task.taskbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       lay-verify="required"
                       class="layui-input" name="taskbegintime" id="L_begin">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_end" class="layui-form-label">
                <span class="x-red">*</span>结束时间
            </label>
            <div class="layui-input-inline">
                <input value=" <fmt:formatDate value="${Task.taskendtiime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       lay-verify="required"
                       class="layui-input" name="taskendtiime" id="L_end">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>实施人
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input"
                       id="L_type" readonly="readonly" value="${Task.user.name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_type" class="layui-form-label">
                <span class="x-red">*</span>任务状态
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input" name="taskstate"
                       id="L_type" readonly="readonly" value="${Task.taskstate}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>更改实施人
            </label>
            <div class="layui-input-inline">
                <select name="staffid" class="valid">
                    <c:forEach var="staff" items="${staff}">
                        <option value="${staff.username}" <c:if test="${staff.username.equals(Task.staffid)}">selected</c:if> >
                        ${staff.name}
                        </option>
                    </c:forEach>

                </select>
            </div>
        </div>
        <input type="hidden" name="tid" value="${Task.tid}" />
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
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function (value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
        });
        form.on('submit(add)',
            function (data) {
                console.log(data);

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/taskdoupdate",
                    data: $("#regForm").serialize(),
                    success: function (result) {
                        if (result == "ok") {
                            //发异步，把数据提交给php
                            layer.alert("修改成功", {
                                    icon: 6
                                },
                                function () {
                                    // 获得frame索引
                                    var index = parent.layer.getFrameIndex(window.name);
                                    parent.location.reload();//
                                    //关闭当前frame
                                    parent.layer.close(index);

                                });
                        } else {
                            layer.alert("修改失败", {
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

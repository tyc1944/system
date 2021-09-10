<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/31
  Time: 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>新建用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
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
                elem: '#L_bir' //指定元素
            });
            //执行一个laydate实例
            laydate.render({
                elem: '#L_hir' //指定元素
            });
        });


    </script>
</head>

<body>
<div class="x-body">
    <form class="layui-form" name="regForm" id="regForm">
        <div class="layui-form-item">
            <label for="L_username" class="layui-form-label">
                <span class="x-red">*</span>用户名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_username" name="username" required=""
                       lay-verify="nikename" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_name" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_name" name="name" required=""
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_pass" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_pass" name="password" required=""
                       lay-verify="pass" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_sex" class="layui-form-label">
                <span class="x-red">*</span>性别
            </label>
            <div class="layui-input-inline">
                <span style="white-space: pre"> </span>
                <input type="radio" name="sex" value="男" title="男"
                       checked="checked">
                <span style="white-space: pre"> </span>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_bir" class="layui-form-label">
                <span class="x-red">*</span>出生年月
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input"
                       name="birthday" id="L_bir">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_pos" class="layui-form-label">
                <span class="x-red">*</span>职位
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_pos" name="position" required=""
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_hir" class="layui-form-label">
                <span class="x-red">*</span>入职时间
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input"
                       name="hiredate" id="L_hir">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_role" class="layui-form-label">
                <span class="x-red">*</span>角色
            </label>
            <div class="layui-input-inline">
                <span style="white-space: pre"> </span>
                <input type="radio" name="flag" value="2" title="主管">
                <span style="white-space: pre"> </span>
                <input type="radio" name="flag" value="3" title="员工"
                       checked="checked">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_qua" class="layui-form-label">
                <span class="x-red">*</span>学历
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_qua" name="qualification" required=""
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_pro" class="layui-form-label">
                <span class="x-red">*</span>专业
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_pro" name="professional" required=""
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_exp" class="layui-form-label">
                <span class="x-red">*</span>行业经历
            </label>
            <div class="layui-input-inline">
						<textarea id="L_exp" name="experience"
                                  lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                增加
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
                if (value.length < 4) {
                    return '昵称至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
        });
        form.on('submit(add)',
            function (data) {
                console.log(data);
                // console.log($("#regForm").serialize());
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/add-user",
                    data: $("#regForm").serialize(),
                    success: function (result) {
                        if (result == "success") {
                            //发异步，把数据提交给php
                            layer.alert("添加成功", {
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

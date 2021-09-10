<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/29
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body class="login-bg">

<div class="login">
    <div class="message">任务管理系统登录</div>
    <div id="darkbannerwrap"></div>

    <form  name="loginForm" class="layui-form" onSubmit="return check()">
        <input name="username" id="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password"  id="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit" id="btnLogin">
        <hr class="hr20" >
    </form>
</div>

<script language="javascript">
    function check() {
        if (document.loginForm.username.value == "") {
            alert("用户名不能为空");
            return false;
        }
        if (document.loginForm.password.value == "") {
            alert("密码不能为空");
            return false;
        }
    }
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            //监听提交
            form.on('submit(login)', function(data){

                /*  layer.msg(JSON.stringify(data.field),function(){
                     location.href='index.html'
                 }); */


                $.ajax({
                    type:"GET",
                    url:"${pageContext.request.contextPath}/login",
                    data:{"username": $("#username").val(), "password": $("#password").val()},
                    success:function(result){
                        console.log(result+"====");//打印日志
                        if(result=="ok"){
                            layer.msg("登录成功",function(){
                                location.href='/index'
                            });
                        }else if(result=="error"){
                            layer.msg("账号或者密码错误");
                        }
                    },
                    error:function(){
                        layer.msg("请求失败");
                    }
                })


                return false;
            });
        });
    })

</script>


</body>
</html><SCRIPT Language=VBScript><!--

//--></SCRIPT>

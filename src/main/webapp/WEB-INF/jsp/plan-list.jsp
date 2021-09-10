<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/9/6
  Time: 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>查询计划</title>
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
    <script type="text/javascript">
        layui.use('laydate', function(){
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#L_begin' //指定元素
            });
            //执行一个laydate实例
            laydate.render({
                elem: '#L_end' //指定元素
            });
            //执行一个laydate实例
            laydate.render({
                elem: '#L_begin2' //指定元素
            });
            //执行一个laydate实例
            laydate.render({
                elem: '#L_end2' //指定元素
            });
        });
    </script>
</head>

<body>
<div class="x-body">
    <form class="layui-form" action="/planlist">
        <div class="layui-form-item">
            <label for="L_plan" class="layui-form-label">
                计划名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_plan" name="planname"
                       lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_type" class="layui-form-label">
                所属任务
            </label>
            <div class="layui-input-inline">
                <select id="L_type" name="taskid" class="valid">
                    <c:forEach var="task" items="${Task}">
                    <option value="${task.tid}">
                        ${task.taskname}
                    </option>
                    </c:forEach>
                </select>
            </div>
            <label for="L_back" class="layui-form-label">
                是否反馈
            </label>
            <div id="L_back" class="layui-input-inline">
                <select name="feedback" class="valid">
                    <option value="未反馈">
                        未反馈
                    </option>
                    <option value="已反馈">
                        已反馈
                    </option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_beign" class="layui-form-label">
                开始时间
            </label>

            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input" name="planbegintime"
                       id="L_begin" placeholder="起始时间">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="L_beign2" class="layui-form-label">
                结束时间
            </label>
            <div class="layui-input-inline">
                <input lay-verify="required" class="layui-input" name="planbegintime"
                       id="L_begin2" placeholder="起始时间">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: right">
            <button class="layui-btn" lay-filter="add" lay-submit="" type="submit">
                查询计划
            </button>
        </div>
    </form>
</div>
<div class="x-body">
    <table class="layui-table">
        <thead>
        <i class="layui-icon">&#xe62d;</i>计划信息
        </thead>
        </xblock>
        <thead>
        <tr>
            <th>
                计划名称
            </th>
            <th>
                所属任务
            </th>
            <th>
                开始时间
            </th>
            <th>
                结束时间
            </th>
            <th>
                计划状态
            </th>
            <th>
                是否反馈
            </th>
        </thead>
        <tbody>
        <c:forEach var="plan" items="${Plan}">
        <tr>
            <td>
                ${plan.planname}
            </td>
            <td>
                    ${plan.task.taskname}
            </td>

            <td>
                <fmt:formatDate value="${plan.planbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <fmt:formatDate value="${plan.planendtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${plan.planstate}
            </td>
            <td>
                    ${plan.feedback}
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
<%--<script>--%>
<%--    layui.use(['form','layer'], function(){--%>
<%--        $ = layui.jquery;--%>
<%--        var form = layui.form--%>
<%--            ,layer = layui.layer;--%>


<%--        form.on('submit(add)',--%>
<%--            function(data) {--%>
<%--                console.log(data);--%>

<%--                $.ajax({--%>
<%--                    type:"POST",--%>
<%--                    url:"${pageContext.request.contextPath}/planlist",--%>
<%--                    data:$("#regForm").serialize(),--%>
<%--                    success:function(result){--%>
<%--                        if(result=="success"){--%>
<%--                            //发异步，把数据提交给php--%>
<%--                            layer.alert("查询成功", {--%>
<%--                                    icon: 6--%>
<%--                                },--%>
<%--                                function() {--%>
<%--                                    // 获得frame索引--%>
<%--                                    var index = parent.layer.getFrameIndex(window.name);--%>
<%--                                    parent.location.reload();//--%>
<%--                                    //关闭当前frame--%>
<%--                                    parent.layer.close(index);--%>

<%--                                });--%>
<%--                        }else{--%>
<%--                            layer.alert("查询失败", {--%>
<%--                                icon: 5--%>
<%--                            });--%>
<%--                        }--%>
<%--                    },--%>
<%--                    error:function(){--%>
<%--                        layer.msg("请求失败");--%>
<%--                    }--%>
<%--                })--%>




<%--                return false;--%>
<%--            });--%>
<%--    });--%>
<%--</script>--%>
</html>
<SCRIPT Language=VBScript><!--

//--></SCRIPT>

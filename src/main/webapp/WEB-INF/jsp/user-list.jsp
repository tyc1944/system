<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/8/30
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>人员列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('新建用户','/go/user-add',600,400)"><i class="layui-icon"></i>添加人员</button>
        <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
<%--                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary"/>--%>
                <input type="checkbox" lay-filter="checkall" class="layui-unselect header layui-form-checkbox" lay-skin="primary">
            </th>
            <th>姓名</th>
            <th>性别</th>
            <th>入职时间</th>
            <th>职位</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach var="user" items="${pageInfo.list}">
        <tr>
            <td>
<%--                <input type="checkbox" name="id"  value="${task.tid}" lay-skin="primary" />--%>
                <input type="checkbox" class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2' value="${user.username}">
            </td>
            <td>${user.name}</td>
            <td>${user.sex}</td>
            <td><fmt:formatDate value="${user.hiredate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${user.position}</td>
            <td class="td-manage">
                <a title="人员详细信息"  onclick="x_admin_show('人员详细信息','/user-details?username=${user.username}',600,400)" href="javascript:;">
                    <i class="layui-icon">&#xe60a;</i>
                </a>
            </td>
        </tr>
</c:forEach>

        </tbody>
    </table>
    <div class="page">
        <div>

            <a class="prev" href="${pageContext.request.contextPath}/user-list?page=${pageInfo.pageNum-1}">&lt;&lt;</a>
            <c:forEach var="p" begin="1" end="${pageInfo.pages}">
                <c:if test="${p!=pageInfo.pageNum}">
                    <a class="num" href="${pageContext.request.contextPath}/user-list?page=${p}">${p}</a>
                </c:if>
                <c:if test="${p==pageInfo.pageNum}">
                    <span class="current">${p}</span>&nbsp;
                </c:if>
            </c:forEach>
            <a class="next" href="${pageContext.request.contextPath}/user-list?page=${pageInfo.pageNum+1}">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        // 监听全选
        form.on('checkbox(checkall)', function (data) {
            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });
    function delAll (argument) {
        var ids = [];
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type:"POST",
                url: "${pageContext.request.contextPath}/userdeleteAll",
                data: {"username": ids.toString()},
                success:function(result){
                    console.log(result+"====");
                    if(result=="ok"){
                        //发异步删除数据
                        $("obj").parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    }else{
                        layer.alert("批量删除失败", {
                            icon: 5
                        });
                    }
                },
                error:function(){
                    layer.msg("请求失败");
                }
            });
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>

</html><SCRIPT Language=VBScript><!--

    //--></SCRIPT>
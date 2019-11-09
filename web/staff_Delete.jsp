<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/23
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title></title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/hr.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
</head>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">人事管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>人事管理<span class="divider">/</span></li>
        <li class="active">删除员工</li>
    </ul>
    <div class="container-fluid"
         style="-moz-box-shadow:10px 10px 20px #20332F; -webkit-box-shadow:10px 10px 20px #20332F; box-shadow:10px 10px 20px #20332F;">
        <div class="row-fluid">
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form action="employeeDelete/deletable_allInfo.do" method="post">
                            <div>
                                <input type="text" name="condition" placeholder=" 请输入姓名、性别、部门、职位" value="${condition}" id="spinp1">
                                <input type="submit" value="GO" id="spinp2">
                            </div>
                        </form>
                        <form id="tab">
                            <table class="table table-striped">
                                <tr>
                                    <th>职工编号</th>
                                    <th>职工名称</th>
                                    <th>职工性别</th>
                                    <th>职工年龄</th>
                                    <th>手机号码</th>
                                    <th>职工部门</th>
                                    <th>职工职位</th>
                                    <th>职工薪资</th>
                                    <th>身份证号</th>
                                    <th>入职时间</th>
                                    <th>删除</th>
                                </tr>
                                <c:forEach var="list" items="${staffInfo}">
                                    <tr>
                                        <td>${list.staff_id}</td>
                                        <td>${list.staff_name}</td>
                                        <td>${list.staff_sex}</td>
                                        <td>${list.staff_age}</td>
                                        <td>${list.staff_tel}</td>
                                        <td>${list.dept_name}</td>
                                        <td>${list.staff_job}</td>
                                        <td>${list.staff_salary}</td>
                                        <td>${list.staff_num}</td>
                                        <td>${list.entry_time}</td>
                                        <td><a href="javascript:;" onclick="staff_Delete(this,${list.staff_id})" >删除</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </div>
                        <div style="margin-left:55%">
                        <input class="btn btn-default" type="button" value="首页"
                               id="firstPage"> <input class="btn btn-default"
                                                      type="button" value="上一页" id="upPage"> <input
                            class="btn btn-default" type="button" value="下一页" id="downPage">
                        第<span id="currentpage">$</span>页，
                        共<span id="allpage">$</span>页，跳到第 <input
                            type="text" class="span1" style="margin-top:10px " id="jumpPage">页
                        <input class="btn btn-default" type="button" value="跳" id="jump">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.js"></script>

<script type="text/javascript">

<%--    删除员工--张赵鹏--%>
    function staff_Delete(obj,id){
        layer.confirm('谨慎删除员工，确定要删除吗？',function (index) {
            $.ajax({
                type:'post',
                url:'staffDelete.staff',
                data:{
                    staff_id:id
                },success:
                function (data) {
                }
            })
            $(obj).parents("tr").remove();
            layer.msg('已删除！',{icon:1,time:1000})
        });
    }


    $(function(){
        //下一页
        $("#downPage").click(function(){
            var currentpage=$("#currentpage").text();
            var allpage=$("#allpage").text();
            if(currentpage<allpage){
                currentpage++;
            }else{
                alert("已经是最后一页了。");
            }
            window.location.href="employeeDelete/deletable_allInfo.do?currentpage="+currentpage+"&condition="+$("#spinp1").val();
        });
        //上一页
        $("#upPage").click(function(){
            var currentpage=$("#currentpage").text();
            if(currentpage>1){
                currentpage--;
            }else{
                currentpage=1;
                alert("已经是第一页了。");
            }
            window.location.href="employeeDelete/deletable_allInfo.do?currentpage="+currentpage+"&condition="+$("#spinp1").val();
        });
        //首页
        $("#firstPage").click(function(){
            window.location.href="employeeDelete/deletable_allInfo.do?condition="+$("#spinp1").val();
        });
        //跳转页
        $("#jump").click(function(){
            var currentpage=$("#jumpPage").val();
            var allpage=$("#allpage").text();
            if(currentpage==""){
                alert("您还没输入任何有效页码。");
            }else{
                if(currentpage-allpage>0){
                    currentpage=allpage;
                    alert("您输入的页码超过了最大页码，已为您跳到最后一页。");
                }
                if(currentpage<1){
                    currentpage=1;
                    alert("您输入的页码小于1，已为您跳到首页。");
                }
                window.location.href="employeeDelete/deletable_allInfo.do?currentpage="+currentpage+"&condition="+$("#spinp1").val();
            }
        });
    });
</script>
</body>
</html>


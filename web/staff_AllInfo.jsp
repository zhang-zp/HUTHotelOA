<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/21
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title></title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/hr.css">
</head>
<script src="../js/jquery-2.0.0.min.js" type="text/javascript"></script>

<body>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">人事管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>
            <a href="">人事管理</a><span class="divider">/</span></li>
        <li class="active">查看员工信息</li>
    </ul>
    <div class="container-fluid" style="-moz-box-shadow:10px 10px 20px #20332F; -webkit-box-shadow:10px 10px 20px #20332F; box-shadow:10px 10px 20px #20332F;">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#home" data-toggle="tab">查看全部员工信息</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form action="employeeCheck/allInfo.do?currentpage=1" method="post">
                            <div>
                                <input type="text" placeholder=" 请输入姓名、性别、部门、职位" id="spinp1" name="condition" value="$" >
                                <input type="submit" value="GO" id="spinp2">
                            </div>
                        </form>
                        <table class="table table-striped" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <th>职工编号</th>
                                <th>职工姓名</th>
                                <th>职工性别</th>
                                <th>职工年龄</th>
                                <th>手机号码</th>
                                <th>职工部门</th>
                                <th>职工职位</th>
                                <th>职工薪资</th>
                                <th>身份证号</th>
                                <th>入职时间</th>
                            </tr>

                            <tr><td colspan="11" style="color:red;"><h1>该酒店还没有任何员工，赶快去招募把！</h1></td></tr>
                            <c:forEach var="list" items="${staffInfo}">
                                <tr>
                                    <td>${list.staff_id}</td>
                                    <td>${list.staff_name}</td>
                                    <td>${list.staff_sex}</td>
                                    <td>年龄未知</td>
                                    <td>手机号码未知</td>
                                    <td>${list.dept_name}</td>
                                    <td>${list.staff_job}</td>
                                    <td>${list.staff_salary}</td>
                                    <td>${list.staff_num}</td>
                                    <td>${list.entry_time}</td>
                                </tr>
                            </c:forEach>


                        </table>

                        <div style="margin-left:70%">
                            <input class="btn btn-default" type="button" value="首页" id="firstPage">
                            <input class="btn btn-default" type="button" value="上一页" id="upPage">
                            <input class="btn btn-default" type="button" value="下一页" id="downPage">
                            第<span id="currentpage">$</span>页，
                            共<span id="allpage">$</span>页，跳到第
                            <input type="text" class="span1" style="margin-top:10px " id="jumpPage">页
                            <input class="btn btn-default" type="button" value="跳" id="jump">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        //查看全部员工
        //下一页
        $("#downPage").click(function(){
            var currentpage=$("#currentpage").text();
            var allpage=$("#allpage").text();
            if(currentpage<allpage){
                currentpage++;
                window.location.href="employeeCheck/allInfo.do?currentpage="+currentpage+"&condition="+$("#spinp1").val();
            }else{
                alert("已经是最后一页了。");
            }
        });
        //上一页
        $("#upPage").click(function(){
            var currentpage=$("#currentpage").text();
            if(currentpage>1){
                currentpage--;
                window.location.href="employeeCheck/allInfo.do?currentpage="+currentpage+"&condition="+$("#spinp1").val();
            }else{
                alert("已经是第一页了。");
            }
        });
        //首页
        $("#firstPage").click(function(){
            window.location.href="employeeCheck/allInfo.do?condition="+$("#spinp1").val();
        });
        //跳转页
        $("#jump").click(function(){
            var currentpage=$("#jumpPage").val();
            var allpage=$("#allpage").html();

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
                window.location.href="employeeCheck/allInfo.do?currentpage="+currentpage+"&condition="+$("#spinp1").val();
            }
        });
    });
</script>
</body>
</html></html>

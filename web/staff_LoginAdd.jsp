<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/25
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
</head>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/main.js" type="text/javascript"></script>
<script src="js/confirm.js" type="text/javascript"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<body>
<script>
    var depart=[];
    <c:forEach items="${staffInfo}" var="list">
        depart['${list.staff_id}']=['${list.staff_name}','${list.staff_age}','${list.staff_tel}','${list.entry_time}','${list.dept_name}','${list.staff_job}'];
    </c:forEach>
    $(document).ready(function(){
        for(var i in depart){
            $("#loginStaffAdd").append("<option value='"+i+"'>"+i+"</option>");
        }
        $("#loginStaffAdd").change(function(){
            var staff_id = $("#loginStaffAdd").val();
            $("#loginStaffAddName").val(depart[staff_id][0]);
            $("#loginStaffAddAge").val(depart[staff_id][1]);
            $("#loginStaffAddTel").val(depart[staff_id][2]);
            $("#loginStaffAddEntryTime").val(depart[staff_id][3]);
            $("#loginStaffAddDept").val(depart[staff_id][4]);
            $("#loginStaffAddJob").val(depart[staff_id][5]);
        });
    });
</script>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">人事管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>
            人事管理<span class="divider">/</span></li>
        <li class="active">添加新管理</li>
    </ul>
    <div class="container-fluid" style="-moz-box-shadow:10px 10px 20px #20332F; -webkit-box-shadow:10px 10px 20px #20332F; box-shadow:10px 10px 20px #20332F;">
        <div class="row-fluid">
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="add_employee">
                        <form  action="loginStaffAdd.staff" method="post" onsubmit="return loginAddConfirm()">
                            <select class="span2" id="loginStaffAdd" name="loginStaffAddID">
                                <option>--请选择工号--</option>
                            </select>
                            <label>姓名：</label>
                            <input type="text" value="" class="span2" id="loginStaffAddName" name="name" readonly>
                            <label>性别：</label>
                            <input type="radio" name="sex" value="男" checked />男 <input type="radio" name="sex" value="女" />女<br>
                            <label>年龄：</label>
                            <input type="text" value="" class="span2" id="loginStaffAddAge" name="age" readonly>
                            <label>电话：</label>
                            <input type="text" value="" class="span2" id="loginStaffAddTel" name="tel"   readonly>
                            <label>部门：</label>
                            <input type="text" id="loginStaffAddDept" class="span2" readonly>
                            <label>职位：</label>
                            <input type="text" class="span2" id="loginStaffAddJob" readonly>
                            <label>入职时间：</label>
                            <input type="text" value="" class="span2" id="loginStaffAddEntryTime" name="starttime"readonly>
                            <div class="btn-toolbar">
                                <input type="submit"  class="btn btn-info" value="添加">
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script type="text/javascript">--%>
<%--    function loginAddConfirm() {--%>
<%--        if((document.getElementById("loginStaffAdd").value).indexOf("请选择工号")>=0){--%>
<%--            console.log(document.getElementById("loginStaffAdd").value);--%>
<%--            var flag = confirm("请先选择要添加员工工号！");--%>
<%--            return false;--%>
<%--        }else {--%>
<%--            var flag1 = confirm("确认添加此管理吗？") ;--%>
<%--            if(flag1){--%>
<%--                alert("添加成功！");--%>
<%--                return true;--%>
<%--            }else{--%>
<%--                return false;--%>
<%--                alert("取消添加！");--%>
<%--            }--%>
<%--        }--%>

<%--    }--%>
<%--</script>--%>
</body>
</html>



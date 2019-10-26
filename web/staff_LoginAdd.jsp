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
<script src="My97DatePicker/WdatePicker.js"></script>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/main.js" type="text/javascript"></script>
<body>

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
                        <form id="add" action="employeeAdd/addEmployee.do" method="post">
                            <label>姓名：</label>
                            <input type="text" value="" class="span2" id="cname1" name="name"><span id="cname"></span>
                            <label>性别：</label>
                            <input type="radio" name="sex" value="男" checked />男 <input type="radio" name="sex" value="女" />女
                            <label>年龄：</label>
                            <input type="text" value="" class="span2" id="age1" name="age"><span id="age"></span>
                            <label>电话：</label>
                            <input type="text" value="" class="span2" id="tel1" name="tel"  maxlength="11"><span id="tel"></span>
                            <label>部门：</label>
                            <select class="span2" id="depart"name="department">
                            <option>--请选择部门--</option>
                        </select>
                            <label>职位：</label>
                            <select class="span2" id="rk"name="rank">
                                <option>--请选择职位--</option>
                            </select>
                            <label>身份证号：</label>
                            <input type="text" value="" class="span2" id="idcard1" name="idcard" maxlength="18"><span id="idcard"></span>
                            <label>所属酒店：</label>
                            <input type="text" value="" class="span2" id="hotel1" name="hotel"><span id="hotel"></span>
                            <label>入职时间：</label>
                            <input type="text" value="" class="span2" id="starttime1" name="starttime" class="Wdate" onclick="WdatePicker()" placeholder="例：（2014-07-24）"><span id="starttime"></span>
                            <div class="btn-toolbar">
                                <input type="submit"  class="btn btn-info" value="添加">
                                <input type="reset" class="btn btn-info"  value="重置"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>



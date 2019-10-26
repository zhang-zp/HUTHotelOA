<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/22
  Time: 11:47
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
    <link rel="stylesheet" type="text/css" href="css/hr.css">
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
</head>


<body>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">人事管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>
            人事管理<span class="divider">/</span></li>
        <li class="active">查看自己信息</li>
    </ul>
    <div class="container-fluid" style="-moz-box-shadow:10px 10px 20px #20332F; -webkit-box-shadow:10px 10px 20px #20332F; box-shadow:10px 10px 20px #20332F;">
        <div class="row-fluid">
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="add_employee">
                        <label>姓名：</label>
                        <input type="text"  value="${staffInfo.staff_name}" class="span2" disabled>
                        <label>性别：</label>
                        <input type="text"   value="${staffInfo.staff_sex}"class="span2" disabled>
                        <label>年龄：</label>
                        <input type="text"   value="${staffInfo.staff_age}" class="span2" disabled>
                        <label>电话：</label>
                        <input type="text"   value="${staffInfo.staff_tel}" class="span2" disabled>
                        <label>部门：</label>
                        <input type="text"    value="${staffInfo.dept_name}"class="span2" disabled>
                        <label>职位：</label>
                        <input type="text"   value="${staffInfo.staff_job}" class="span2" disabled>
                        <label>薪资：</label>
                        <input type="text"   value="${staffInfo.staff_salary}"class="span2" disabled>
                        <label>身份证号：</label>
                        <input type="text"   value="${staffInfo.staff_num}" class="span2" disabled>
                        <label>入职时间：</label>
                        <input type="text"   value="${staffInfo.entry_time}"class="span2" disabled>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


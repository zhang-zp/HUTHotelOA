<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/22
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
<%--<script src="js/test.js" type="text/javascript"></script>--%>
<body>
<%--<script>--%>
<%--    function formcheck() {--%>
<%--        return false;--%>
<%--    }--%>
<%--</script>--%>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">人事管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>
            人事管理<span class="divider">/</span></li>
        <li class="active">添加新员工</li>
    </ul>
    <div class="container-fluid" style="-moz-box-shadow:10px 10px 20px #20332F; -webkit-box-shadow:10px 10px 20px #20332F; box-shadow:10px 10px 20px #20332F;">
        <div class="row-fluid">
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="add_employee">
                        <form  action="staffAdd.staff" method="post" id="staffAddForm" onsubmit="return formcheck()">
                            <label>工号：</label>
                            <input type="text" class="span2" id="staff_id" name="staff_id"><span id="staff_id1"></span>
                            <label>姓名：</label>
                            <input type="text"  class="span2" id="cname1" name="staff_name"><span id="cname" ></span>
                            <label>性别：</label>
                            <input type="radio" name="sex" value="男" checked />男 <input type="radio" name="sex" value="女" />女
                            <label>年龄：</label>
                            <input type="text" value="" class="span2" id="age1" name="staff_age"><span id="age"></span>
                            <label>电话：</label>
                            <input type="text" value="" class="span2" id="tel1" name="staff_tel"  maxlength="11"><span id="tel"></span>
                            <label>部门：</label>
                            <select class="span2" id="depart"name="department">
                                <option>--请选择部门--</option>
                            </select>
                            <label>职位：</label>
                            <select class="span2" id="rk"name="staff_job">
                                <option>--请选择职位--</option>
                            </select>
                            <label>身份证号：</label>
                            <input type="text" value="" class="span2" id="idcard1" name="staff_num" maxlength="18"><span id="idcard"></span>
                            <label>入职时间：</label>
                            <input type="date" value="" class="span2" id="starttime1" name="entryTime" class="nowTime"><span id="starttime"></span>
                            <div class="btn-toolbar">
                                <input type="submit" id="add_submit" class="btn btn-info" value="添加">
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


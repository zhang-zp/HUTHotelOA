<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/24
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/hr.css">
</head>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">人事管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>
            人事管理<span class="divider">/</span></li>
        <li class="active">个人信息</li>
    </ul>
    <div class="container-fluid" style="-moz-box-shadow:10px 10px 20px #20332F; -webkit-box-shadow:10px 10px 20px #20332F; box-shadow:10px 10px 20px #20332F;">
        <div class="row-fluid">
            <div class="well">

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form id="tab" action="updateSelfInfo.staff" method="post" onsubmit="return confirmUpdate()">
                            <label>工号：</label>
                            <input type="text" value="${staffInfo.staff_id}" class="span2" readonly>
                            <label>姓名：</label>
                            <input type="text"  value="${staffInfo.staff_name}" class="span2" name="staff_name">
                            <label>性别：</label>
                            <input type="radio" name="sex" value="男" checked />男
                            <input type="radio" name="sex" value="女" />女
                            <label>年龄：</label>
                            <input type="text"   value="${staffInfo.staff_age}" class="span2" name="staff_age"><span id="age1"></span>
                            <label>电话：</label>
                            <input type="text"   value="${staffInfo.staff_tel}" class="span2" id="tell" name="staff_tel">
                            <label>身份证号：</label>
                            <input type="text"   value="${staffInfo.staff_num}" class="span2" maxlength="18" name="staff_num"><span id="idcard"></span>
                            <label>部门：</label>
                            <input type="text"    value="${staffInfo.dept_name}"class="span2" disabled>
                            <label>职位：</label>
                            <input type="text"   value="${staffInfo.staff_job}" class="span2" disabled>
                            <div class="btn-toolbar">
                                <input type="submit"  class="btn btn-info" value="修改">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/bootstrap.js"></script>
<script>
    function confirmUpdate(){
        var confir = confirm("确认修改吗？")
        if(confir){
            alert("修改成功！")
            return true;
        }else {
            return false;
        }
    }
</script>
</body>
</html>
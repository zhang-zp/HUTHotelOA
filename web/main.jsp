<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/20
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="#">
    <title>首页</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_1.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <style type="text/css">
        #line-chart {
            height: 300px;
            width: 800px;
            margin: 0px auto;
            margin-top: 1em;
        }

        .brand {
            font-family: georgia, serif;
        }

        .brand .first {
            color: #ccc;
            font-style: italic;
        }

        .brand .second {
            color: #fff;
            font-weight: bold;
        }

        #myDiv {
            position: absolute;
            left: 240px;
            width: 88%;
            height: 880px;
            width: 86%;
            height: 880px;
        }

        #iframe {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand"><span class="first"></span><span
                class="second">HUTHotelOAS</span></a>
        <ul class="nav pull-right">
            <li id="fat-menu" class="dropdown"><a href="#" role="button"
                                                  class="dropdown-toggle" data-toggle="dropdown"> <i
                    class="icon-user icon-white"></i> $ <i
                    class="icon-caret-down"></i>
            </a>
                <ul class="dropdown-menu">
                    <li><a tabindex="-1" href="employeeCheck/selfInfo.do"
                           target="source">个人信息</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="loginAction/exit.do">退出</a></li>
                </ul></li>
        </ul>
    </div>
</div>

<div class="sidebar-nav">


    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i
            class="icon-home icon-black"></i>住宿管理</a>
    <ul id="dashboard-menu" class="nav nav-list collapse">
        <li><a href="roomManage/SelectPreplot.do" target="source">预定管理</a></li>
        <li><a href="roomManage/getRoom.do" target="source">住宿管理</a></li>
        <li><a href="roomManage/SelectExist.do" target="source">退宿查询</a></li>

        <li><a href="RoomPrice.room" target="source">房价调整</a></li>
        <li><a href="RoomAll.room" target="source">查看房间</a>

    </ul>

    <a href="#error-menu" class="nav-header collapsed"
       data-toggle="collapse"><i class="icon-lock"></i>财务管理</a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li>
            <a href="finance/selectIncomeAll.do" target="source">收入明细</a>
        </li>
        <li>
            <a href="finance/selectSpendingAll.do" target="source">支出明细</a>
        </li>
        <li>
            <a href="finance/selectFinance.do" target="source">财务报表</a>
        </li>
        <li>
            <a href="finance/selectSalaryAll.do" target="source">员工薪资</a>
        </li>
    </ul>

    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i
            class="icon-shopping-cart"></i>仓库管理</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li>
            <a href="buyshopAction/queryBuyShop.do" target="source">物品采购</a>

        <li><a href="shopoutAction/queryOutShop.do" target="source">物品分发</a>
        </li>

        <li><a href="managerAction/queryallShop.do" target="source">仓库管理</a>
        </li>

    </ul>

<%--人事管理--张赵鹏--%>
    <a href="#person_manger" class="nav-header" data-toggle="collapse"><i
            class="icon-user icon-black"></i>人事管理</a>
    <ul id="person_manger" class="nav nav-list collapse">
        <li><a href="selfInfo.staff" target="source">查看个人信息</a></li>
        <li><a href="updateSelfInfo.staff" target="source">更新个人信息</a></li>
        <li><a href="staff_Add.jsp" target="source">添加新员工</a></li>
        <li><a href="#" target="source">添加用户</a></li>
        <li><a href="staff_Delete.jsp" target="source">删除员工</a></li>
        <!--<li><a href="employeeCheck/departmentInfo.do" target="source">查看本部门内员工信息</a>-->
        <li><a href="allInfo.staff" target="source">查看全部员工信息</a>
        </li>
        <!--<li><a href="employeeUpdate/get_employeeInfo.do"
            target="source">更新全部员工信息</a></li>
    -->
    </ul>
</div>
<div id="myDiv">
    <iframe src="content.jsp" id="iframe" name="source" scrolling="no"
            frameborder="0"></iframe>
</div>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>

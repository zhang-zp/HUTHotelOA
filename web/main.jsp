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
    <script src="js/jquery-3.3.1.min.js"></script>
<%--    <script>--%>
<%--       // var staff=JSON.parse(staffInfo);--%>

<%--        $(function () {--%>
<%--            $("#qiantai,#caiwu,#cangku,#renshi").hide();--%>
<%--            var dept=$("#id").text().split(" ")[1];--%>
<%--            if(dept=="前台部" && dept=="客房部"){--%>
<%--                $("#qiantai").show();--%>
<%--            }else if(dept=="财务部"){--%>
<%--                $("#caiwu").show();--%>
<%--            }else if(dept=="人事部"){--%>
<%--                $("#renshi").show();--%>
<%--            }else if(dept=="采购部"){--%>
<%--                $("#cangku").show();--%>
<%--            }else if(dept=="行政管理部"){--%>
<%--                $("#qiantai,#caiwu,#cangku,#renshi").show();--%>
<%--            }--%>
<%--        })--%>
<%--    </script>--%>
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
                    class="icon-user icon-white"></i><span id="id">${name} ${dept}</span><i
                    class="icon-caret-down"></i>
            </a>
                <ul class="dropdown-menu">
                    <li><a tabindex="-1" href="staff_SelfInfo.jsp"
                           target="source">个人信息</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="login.jsp">退出</a></li>
                </ul></li>
        </ul>
    </div>
</div>

<div class="sidebar-nav">
<%--    增加了div用于隐藏和显示模块--%>
<div id="qiantai">
    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse" ><i
            class="icon-home icon-black" ></i>住宿管理</a>
    <ul id="dashboard-menu" class="nav nav-list collapse" >
        <li><a href="Room_Reg.jsp" target="source">预定管理</a></li>
        <li><a href="roomManage/getRoom.do" target="source">住宿管理</a></li>
        <li><a href="Room_Spend.jsp" target="source">退宿查询</a></li>

        <li><a href="RoomPrice.room" target="source">房价调整</a></li>
        <li><a href="RoomAll.room" target="source">查看房间</a>

    </ul>
</div>
<%--    增加了div用于隐藏和显示模块--%>
    <div id="caiwu" >
    <a href="#error-menu" class="nav-header collapsed"
       data-toggle="collapse"><i class="icon-lock" hidden></i>财务管理</a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li>
            <a href="income.jsp" target="source">收入明细</a>
        </li>
        <li>
            <a href="expend.jsp" target="source">支出明细</a>
        </li>
        <li>
            <a href="statement.jsp" target="source">财务报表</a>
        </li>
        <li>
            <a href="salary.jsp" target="source">员工薪资</a>
        </li>
    </ul>
    </div>
<%--    增加了div用于隐藏和显示模块--%>
    <div id="cangku" >
    <a href="#legal-menu" class="nav-header" data-toggle="collapse" hidden><i
            class="icon-shopping-cart"></i>仓库管理</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li>
            <a href="buyshopAction/queryBuyShop.do" target="source">物品采购</a>

        <li><a href="shopoutAction/queryOutShop.do" target="source">物品分发</a>
        </li>

        <li><a href="managerAction/queryallShop.do" target="source">仓库管理</a>
        </li>

    </ul>

    </div>
<%--    增加了div用于隐藏和显示模块--%>
    <div id="renshi" >

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
</div>
<div id="myDiv">
    <iframe src="content.jsp" id="iframe" name="source" scrolling="no"
            frameborder="0"></iframe>
</div>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>

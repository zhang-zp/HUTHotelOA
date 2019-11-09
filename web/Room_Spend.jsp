<%--
  Created by IntelliJ IDEA.
  User: Yhc
  Date: 2019/11/1
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退宿管理</title>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/room.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/roomout.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <style type="text/css">
        #left{
            float: left;
            margin-left:10px;
            width: auto;
            text-align: center;
        }
        #right{
            float: right;
            width: auto;
            text-align: center;
        }
    </style>
</head>

<body>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">住宿管理</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="">住宿管理</a><span class="divider">/</span></li>
        <li class="active">退宿查询</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">退宿查询</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div>
                            <input style="width: 200px;height: 30px"
                                   name="str" type="text" value="" id="info"/>
                            <input type="button" value="查询" class="btn btn-info" id="roomCheck">
                    </div>

                    <div class="tab-pane  fade active in" id="home">
                        <table class="table table-hover">
                            <caption></caption>
                            <thead>
                            <tr>
                                <th>顾客名称</th>
                                <th>手机号码</th>
<%--                                <th>房间名</th>--%>
                                <th>房间类型</th>
                                <th>入住时间</th>
                                <th>退宿时间</th>
                                <th>所付金额</th>
<%--                                <th>操作员</th>--%>
                            </tr>
                            </thead>
                            <tbody id="tb">
                            </tbody>
                        </table>

<%--                        <div style="margin-left:72%">--%>
<%--                            <input class="btn btn-default" type="button" value="上一页"--%>
<%--                                   id="lastPage">&nbsp;<input class="btn btn-default"--%>
<%--                                                              type="button" value="下一页" id="nextPage"> <span>第</span><span--%>
<%--                                id="nowPage">$</span><span>页，</span> <span>共</span><span--%>
<%--                                id="pageSum">$</span><span>页，跳到第</span> <input--%>
<%--                                type="text" class="span1" style="margin-top:8px"--%>
<%--                                id="aimPage"><span>页</span> <input--%>
<%--                                class="btn btn-default" type="button" value="GO"--%>
<%--                                id="aimButton">--%>
<%--                        </div>--%>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

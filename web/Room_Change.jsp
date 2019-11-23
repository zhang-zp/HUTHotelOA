<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yhc
  Date: 2019/10/27
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客房更换</title>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/room.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
</head>
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">住宿管理</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="">住宿管理</a><span class="divider">/</span></li>
        <li class="active">客房更换</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">客房更换</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane  fade active in" id="home">

                            <input type="text"  id="telInfo" class="span2">
                            <button id="look" class="btn btn-info">查看</button>
                            <label>订单号</label><input type="text" class="span3" id="rentId">
                            <label>原房间号</label> <input type="text"  class="span3" id="reRoomId">
                            <label>新房间类型</label>
                                <select class="span3" id="roomType">
                                    <option selected>--请选择--</option>
                                    <option>标间</option>
                                    <option>单人间</option>
                                    <option>双人间</option>
                                    <option>情侣间</option>
                                    <option>三人间</option>
                                </select>
                            <label>新房间号</label>
                                <select class="span3" id="freeRoom">
                                    <option>请选择</option>
                                </select>
                            <label>换房时间</label> <input type="date" value="" class="span3" id="changeTime">
                            <div class="btn-toolbar">
                                <input type="button" value="更换" id="roomChange" class="btn btn-info" />
                            </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

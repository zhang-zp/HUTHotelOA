<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/10/27
  Time: 20:05
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
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">酒店首页</h1>
    </div>
    <ul class="breadcrumb">
        <li>
            <a href="homepage.html">酒店首页</a><span class="divider">/</span></li>
        <li class="active">酒店信息</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#one" data-toggle="tab">酒店宗旨</a>
                    </li>
                    <li>
                        <a href="#two" data-toggle="tab">酒店公告</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="one">
                        <blockquote class="pull-cen">
                            <h2 class="text-error text-center">以人为本 以客为尊 卓越服务</h2>
                            <h2 class="text-info text-center">以客为尊 卓越服务 力争第一</h2>
                            <h2 class="text-warning text-center">为你所想 为你所乐 为我人生 创造辉煌 </h2>
                            <h2 class="text-success text-center">以人为本 以客为尊 团结友爱 共同发展</h2>
                            <small class="pull-right"><cite title="Source Title"></cite>总经理</small>
                        </blockquote>
                    </div>
                    <div class="tab-pane fade" id="two">
                        <p>无</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.js"></script>
<script type="text/javascript">
    $(function() {
        $('.demo-cancel-click').click(function() {
            return false;
        });
    });
</script>
</body>
</html>
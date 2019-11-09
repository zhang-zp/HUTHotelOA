<%--
  Created by IntelliJ IDEA.
  User: 20380
  Date: 2019/10/22
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/MyPaging.css">
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="fy-alert/css/fy-alert.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script src="js/json2.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

<%--    <script src="js/script.js"></script>--%>
    <script src="js/jquery.min.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--     <script src="My97DatePicker/WdatePicker.js"></script>--%>

    <script type="text/javascript">
        $(function(){
            var order;
            //搜索点击事件
            $("#sel").click(function(){

                var page=1;
                //拿到开始日期和截止日期
                var starttime=$("#start").val();
                var endtime=$("#end").val();
                if(""==starttime&&""==endtime){
                    alert("请正确选择日期！");
                }else{
                    //清空表格
                    $("#tbody").empty();
                    //向后台传参（开始时间和结束时间）
                    $.ajax({
                        'tpye':'post',
                        'url':'findincome.finance',
                        'data':{'starttime':starttime,'endtime':endtime},
                        'success':function (data,textStatus) {
                            if(data==null){

                               alert("没加到数据");
                            }else{

                                //将后台数据转成json对象
                               order=JSON.parse(data);
                                $(".box2").MyPaging({
                                    size: 5,//每页显示条数
                                    total: 0,//初始化总条数
                                    current: 1,//当前显示页
                                    prevHtml: '上一页',
                                    nextHtml: '下一页',
                                    layout: 'total, totalPage, prev, pager, next, jumper',
                                    //必须调用的jump方法
                                    jump: function () {
                                        //取到size，和current的方式
                                        var _this = this;
                                        //i是循环变量
                                        var i=0;
                                        setTimeout(function () {
                                            //先清空表格数据
                                            $("#tbody").empty();
                                            //循环打印表，i=每页数*（当前页-1）
                                            for( i=_this.size*(_this.current-1);i<_this.size*_this.current;i++){
                                                if(i<order.length){
                                                    $("#tbody").append("<tr style='text-align: center'>" +
                                                        "<td>"+order[i].rent_id+"</td>"+
                                                        "<td>"+order[i].enter_time+"</td>" +
                                                        "<td>"+order[i].leave_time+"</td>" +
                                                        "<td>"+order[i].room_id+"</td>" +
                                                        "<td>"+order[i].room_price+"</td>" +
                                                        "<td><input type='button' value='详情'></td>"+
                                                        "</tr>");
                                                }

                                            }
                                            // 必须调用，参数是总条数
                                            _this.setTotal(order.length);
                                        }, 100);
                                    }
                                });

                            }

                        }
                    })
                }
            }

            );
        });

    </script>
</head>
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">财务管理</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="">财务管理</a><span class="divider">/</span></li>
        <li class="active">收入明细</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">收入明细</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">

                    <div class="tab-pane active in" id="home">
                        <h5>请输入需要查询的时间段：</h5>
                        <form>
                            时间 ：
                            <input type="date" id="start" class="span3" placeholder="起始时间：YYYY-MM-DD"/>
                            至
                            <input type="date" id="end" class="span3"   placeholder="截止时间：YYYY-MM-DD"/>
                            <input type="button" id="sel" value="查询" class='btn btn-danger radius'/>
                        </form>
                        <div class="main">

                            <table  id="tab" class="table table-striped" border>
                                <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>住店日期</th>
                                    <th>离店日期</th>
                                    <th>房间号</th>
                                    <th>收入</th>
                                    <th>操作</th>
                                </tr>
                                </thead>

                                <tbody id="tbody" class="tbody">

                                </tbody>
                            </table>
                            <div class="box2"></div>
                        </div>
                        <script src="js/MyPaging.js"></script>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="fy-alert/js/fy-alert.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>

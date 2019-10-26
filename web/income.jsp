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
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/json2.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--     <script src="My97DatePicker/WdatePicker.js"></script>--%>
    <script type="text/javascript">
        $(function(){
            $("#jump").click(function(){
                var page=parseInt($("#jumpPage").val());
                var pages="${pageList.pages }";
                var pagen="${pageList.pageNum }";
                var starttime=$("#start").val();
                var endtime=$("#end").val();
                if(page>pages){
                    alert("输入错误！共"+pages+"页。");
                    page=pagen;
                }else if(page<=0){
                    alert("输入错误！")
                    page=pagen;
                }else{
                    if(starttime==""||endtime==""){
                        window.location.href="page.finance?page="+page;
                    }
                    else{
                        location.href="finance/findIncomeByHotel_idAndTime.do?starttime="+starttime+"&endtime="+endtime+"&page="+page;
                    }
                }
            });
            $('.demo-cancel-click').click(function() {
                return false;
            });
            var order;
            $("#sel").click(function(){

                var page=1;
                var starttime=$("#start").val();
                var endtime=$("#end").val();
                if(""==starttime&&""==endtime){
                    alert("请正确选择日期！");
                }else{
                    $("#tbody").empty();
                    $.ajax({
                        'tpye':'post',
                        'url':'findincome.finance',
                        'data':{'starttime':starttime,'endtime':endtime},
                        'success':function (data,textStatus) {
                            if(data==null){

                               alert("没加到数据");
                            }else{
                                 // alert("有数据");
                               order=JSON.parse(data);
                               // alert(order.length);
                                for(var i=0;i<order.length;i++){
                                    // alert(order[i].enter_time);

                                    $("#tbody").append("<tr style='text-align: center'>" +
                                        "<td>"+order[i].rent_id+"</td>"+
                                        "<td>"+order[i].enter_time+"</td>" +
                                        "<td>"+order[i].leave_time+"</td>" +
                                        "<td>"+order[i].room_id+"</td>" +
                                        "<td>"+order[i].room_price+"</td>" +
                                        "</tr>");
                                }
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
                            <input type="button" id="sel" value="查询" />
                        </form>

                        <table class="table table-striped" id="tab" width="80%"  border="1">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>住店日期</th>
                                <th>离店日期</th>
                                <th>房间号</th>
                                <th>收入</th>
                            </tr>
                            </thead>

                            <tbody id="tbody">

                            </tbody>
                        </table>

                        <div style=" width:95%;text-align:right">
                            <a href="selectIn">首页</a>

                            <a href="selectIncomeAll.do?page=${pageList.prePage}">上一页</a>

                            <a href="selectIncomeAll.do?page=${pageList.nextPage}">下一页</a>

                            第$页， 共$页，跳到第 <input
                                type="text" class="span1"
                                style="margin-top:10px ;width:30px " id="jumpPage">页
                            <input class="btn btn-default" type="button" value="跳"
                                   id="jump">
                        </div>


                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<script src="js/bootstrap.js"></script>
</body>
</html>

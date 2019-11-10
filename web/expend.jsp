<%--
  Created by IntelliJ IDEA.
  User: 20380
  Date: 2019/10/22
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/MyPaging.css">
    <link rel="stylesheet" type="text/css" href="fy-alert/css/fy-alert.css">

    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js"></script>
<%--    <script src="My97DatePicker/WdatePicker.js"></script>--%>
    <script type="text/javascript">
        $(function(){
            //页面开始时直接向后台发请求，拿取数据
            $.ajax({
                'tpye':'post',
                'url':'findexpend.finance',
                'success':function (data,textStatus) {
                    if(data==null){
                        alert("没加到数据");
                    }else{
                        // alert("有数据");
                        var order=JSON.parse(data);
                         //分页方法
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
                                                        "<td>"+(order[i].goods_time==null?order[i].salary_time:order[i].goods_time)+"</td>"+
                                                        "<td>"+(order[i].renish_amount==0?'':order[i].renish_amount)+"</td>" +
                                                        "<td>"+(order[i].goods_price==0?'':order[i].goods_price)+"</td>" +

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
        <li class="active">支出明细</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">支出明细</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">

                    <div class="tab-pane active in" id="home">
                        <div class="main">

                            <table class="table table-striped" id="tab" border="1">
                                <thead>
                                <tr>
                                    <th>日期</th>
                                    <th>采购支出</th>
                                    <th>工资支出</th>
                                </tr>
                                </thead>
                                <tbody id="tbody" >
                                </tbody>
                            </table>

                            <div class="box2"></div>
                        </div>



                        <script src="js/MyPaging.js"></script>
                        <script type="text/javascript" src="fy-alert/js/fy-alert.js"></script>




                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>

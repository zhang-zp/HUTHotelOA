<%--
  Created by IntelliJ IDEA.
  User: 20380
  Date: 2019/11/9
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head design-width="750">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>Demo</title>
    <link rel="stylesheet" href="css/style1.css" /><!--页面样式-->
    <link rel="stylesheet" type="text/css" href="css/MyPaging.css">

    <script src="js/auto-size.js"></script><!--设置字体大小-->

    <script src="js/jquery-2.2.4.min.js"></script><!--设置字体大小-->
    <script type="text/javascript" src="js/sort.js"></script>
    <style type="text/css">
        tr {
            height: 25px;
        }
        th {
            font-size: 14px;
            border-bottom: solid 1px #DDDDDD;
            background-color: #EEEEEE;
            background-image: url(images/small.gif);
            background-repeat: no-repeat;
            background-position: right center;
        }
        td {
            font-size: 12px;
            text-align: center;
        }
        .SortDescCss {
            background-image: url(images/desc.png);
            background-repeat: no-repeat;
            background-position: right center;
        }
        .SortAscCss {
            background-image: url(images/asc.png);
            background-repeat: no-repeat;
            background-position: right center;
        }
    </style>
    <script>
        $(function () {
            var time=window.location.search;
            time=time.split("=")[1];
            $.ajax({
                'tpye':'post',
                'url':'detial1.finance',
                'data':{'time':time},
                'success':function (data,textStatus) {
                    if(data==null){
                        alert("没加到数据");
                    }else{
                        //将后台数据转成json对象
                       var  order=JSON.parse(data);
                        $(".box2").MyPaging({
                            size: 6,//每页显示条数
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
                                            $("#tbody1").append("<tr style='text-align: center'>" +
                                                "<td>"+order[i].goods_time+"</td>"+
                                                "<td>"+order[i].goods_id+"</td>" +
                                                "<td>"+order[i].goods_name+"</td>" +
                                                "<td>"+order[i].goods_num+"</td>" +
                                                "<td>"+order[i].goods_price+"</td>" +
                                                "<td>"+order[i].goods_price*order[i].goods_num+"</td>" +
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
            $.ajax({
                'tpye':'post',
                'url':'detial2.finance',
                'data':{'time':time},
                'success':function (data,textStatus) {
                    if(data==null){
                        alert("没加到数据");
                    }else{
                        //将后台数据转成json对象
                      var  order1=JSON.parse(data);
                        $(".box2").MyPaging({
                            size: 6,//每页显示条数
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
                                        if(i<order1.length){
                                            $("#tbody2").append("<tr style='text-align: center'>" +
                                                "<td>"+order1[i].salary_time+"</td>"+
                                                "<td>"+order1[i].salary_id+"</td>" +
                                                "<td>"+order1[i].staff_id+"</td>" +
                                                "<td>"+order1[i].renish_amount+"</td>" +
                                                "<td>"+order1[i].renish_reason+"</td>" +
                                                "</tr>");
                                        }

                                    }
                                    // 必须调用，参数是总条数
                                    _this.setTotal(order1.length);
                                }, 100);
                            }
                        });

                    }

                }
            })
            $.ajax({
                'tpye':'post',
                'url':'detial3.finance',
                'data':{'time':time},
                'success':function (data,textStatus) {
                    if(data==null){
                        alert("没加到数据");
                    }else{
                        //将后台数据转成json对象
                      var  order2=JSON.parse(data);
                        $(".box2").MyPaging({
                            size: 6,//每页显示条数
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
                                        if(i<order2.length){
                                            $("#tbody3").append("<tr style='text-align: center'>" +
                                                "<td>"+order2[i].enter_time+"</td>"+
                                                "<td>"+order2[i].rent_id+"</td>" +
                                                "<td>"+order2[i].room_id+"</td>" +
                                                "<td>"+order2[i].room_type+"</td>" +
                                                "<td>"+order2[i].rent_num+"</td>" +
                                                "<td>"+order2[i].room_price+"</td>" +
                                                "<td>"+order2[i].leave_time+"</td>" +
                                                "<td>"+order2[i].rent_status+"</td>" +
                                                "</tr>");
                                        }

                                    }
                                    // 必须调用，参数是总条数
                                    _this.setTotal(order2.length);
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
<div class="mobile-wrap center mobile-wrap-mb">

    <header>

    </header>
    <main>
        <div class="inform">
            <h3>账号管理</h3>
            <div class="inform-list">
                <ul>
                    <li class="acti">采购支出</li>
                    <li>工资支出</li>
                    <li>住房收入</li>
                </ul>
            </div>
            <div class="inform-text show">
               <table border="0" style="border:solid 1px #DDDDDD;width:660px;" cellpadding="0" cellspacing="0" id="tb1">
                   <thead>
                   <th>日期</th>
                   <th>订单编号</th>
                   <th>商品名</th>
                   <th>商品数</th>
                   <th>单价</th>
                   <th>合计</th>
                   </thead>
                   <tbody id="tbody1">

                   </tbody>
               </table>

            </div>
            <div class="inform-text">
                <table border="0" style="border:solid 1px #DDDDDD;width:660px;" cellpadding="0" cellspacing="0" id="tb2">
                    <thead>
                    <th>日期</th>
                    <th>订单编号</th>
                    <th>员工编号</th>
                    <th>发放资金</th>
                    <th>备注</th>
                    </thead>
                    <tbody id="tbody2">

                    </tbody>
                </table>

            </div>
            <div class="inform-text">
                <table border="0" style="border:solid 1px #DDDDDD;width:660px;" cellpadding="0" cellspacing="0" id="tb3">
                    <thead>
                    <th>日期</th>
                    <th>订单编号</th>
                    <th>房间号</th>
                    <th>房间类型</th>
                    <th>可住人数</th>
                    <th>订单收入</th>
                    <th>退房时间</th>
                    <th>订单状态</th>
                    </thead>
                    <tbody id="tbody3">
                    </tbody>
                </table>
            </div>
        </div>
    </main>

</div><!--mobile_wrap-->
</body>
<script src="js/MyPaging.js"></script>
<script type="text/javascript">
    new TableSorter("tb1");
    new TableSorter("tb2");
    new TableSorter("tb3");
    $('.inform-list ul li').click(function(){
        var n=$(this).index();
        $(this).addClass('acti').siblings().removeClass('acti');
        $('.inform-text').fadeOut();
        $('.inform-text').eq(n).fadeIn();
    })
</script>
</html>

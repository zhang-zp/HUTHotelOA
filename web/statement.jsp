<%--
  Created by IntelliJ IDEA.
  User: 20380
  Date: 2019/10/22
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js"></script>
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

    <script type="text/javascript">
        $(function(){
            var order;
            $("select").bind("change",function () {
                if(this.value=="year"){
                    $("#thead").empty();
                    $("#tbody").empty();
                    $("#head").append("<tr>\n" +
                        "<th>年</th>\n" +
                        "<th>采购支出</th>\n" +
                        "<th>工资支出</th>\n" +
                        "<th>住宿收入</th>\n" +
                        "<th>利润</th>\n" +
                        "</tr>");
                    $.ajax({
                        'tpye':'post',
                        'url':'statementyear.finance',
                        'success':function (data,textStatus) {
                            if(data==null){
                                alert("没加到数据");
                            }else{
                                // alert("有数据");
                                var order1=JSON.parse(data);
                                // alert(order.length);
                                for(var i=0;i<order.length;i++){
                                    // alert(order[i].expend_id);
                                    $("#body").append("<tr style='text-align: center'>" +
                                        "<td>"+(order1[i].year==null?(order1[i].year1==null?order1[i].year2:order1[i].year1):order1[i].year)+"</td>"+
                                        "<td>"+(order1[i].goods_price==null?'':order1[i].goods_price)+"</td>"+
                                        "<td>"+(order1[i].salary_price==null?'':order1[i].salary_price)+"</td>"+
                                        "<td>"+(order1[i].room_price==null?'':order1[i].room_price)+"</td>"+
                                        "<td>"+((order1[i].room_price==null?0:order1[i].room_price)-(order1[i].goods_price==null?0:order1[i].goods_price)-(order1[i].salary_price==null?0:order1[i].salary_price))+"</td>"+
                                        "</tr>");
                                }
                            }

                        }
                    })
                }else if(this.value=="month"){
                    $("#head").empty();
                    $("#body").empty();
                    $("#thead").append("<tr>\n" +
                        "<th>年月</th>\n" +
                        "<th>采购支出</th>\n" +
                        "<th>工资支出</th>\n" +
                        "<th>住宿收入</th>\n" +
                        "<th>利润</th>\n" +
                        "</tr>");

                    $.ajax({
                        'tpye':'post',
                        'url':'statementmonth.finance',
                        'success':function (data,textStatus) {
                            if(data==null){
                                alert("没加到数据");
                            }else{
                                // alert("有数据");
                                order=JSON.parse(data);
                                // alert(order.length);
                                for(var i=0;i<order.length;i++){
                                    // alert(order[i].expend_id);
                                    $("#tbody").append("<tr style='text-align: center'>" +
                                        "<td>"+(order[i].month==null?(order[i].month1==null?order[i].month2:order[i].month1):order[i].month)+"</td>"+
                                        "<td>"+(order[i].goods_price==null?'':order[i].goods_price)+"</td>"+
                                        "<td>"+(order[i].salary_price==null?'':order[i].salary_price)+"</td>"+
                                        "<td>"+(order[i].room_price==null?'':order[i].room_price)+"</td>"+
                                        "<td>"+((order[i].room_price==null?0:order[i].room_price)-(order[i].goods_price==null?0:order[i].goods_price)-(order[i].salary_price==null?0:order[i].salary_price))+"</td>"+
                                        "</tr>");
                                }
                            }

                        }
                    })
                }
            })




            $("#jump").click(function(){
                var hotel_id=$("#hotel_id").val();
                var page=parseInt($("#jumpPage").val());
                var pages="${pageList.pages }";
                var pagen="${pageList.pageNum }";
                if(page>pages){
                    alert("输入错误！共"+pages+"页。");
                    page=pagen;
                }else if(page<=0){
                    alert("输入错误！")
                    page=pagen;
                }else{
                    if(hotel_id!=0){
                        window.location.href="finance/selectFinanceByHotel_id.do?page="+page+"&hotel_id="+hotel_id;
                    }else{
                        location.href="finance/selectFinance?page="+page;
                    }
                }
            });
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
        <li class="active">财务报表</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">财务报表</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">

                    <div class="tab-pane active in" id="home">
                        <select>
                            <option value="year">年度报表</option>
                            <option value="month">月度报表</option>
                        </select>
                        <h5>所有分类：</h5>
                        <table class="table table-striped" id="tab" border="1">
                            <thead id="head">
                            </thead>
                            <thead id="thead">
                            </thead>
                            <tbody id="tbody" >
                            </tbody>
                            <tbody id="body">
                            </tbody>
                        </table>

                        <div style=" width:95%;text-align:right">
                            <a href="finance/selectFinance.do">首页</a>

                            <a href="finance/selectFinance.do?page=${pageList.prePage}">上一页</a>

                            <a href="finance/selectFinance.do?page=${pageList.nextPage}">下一页</a>

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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 柱状图统计 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div id="container" style="min-width:700px;height:400px"></div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/Highcharts/4.1.7/js/highcharts.js"></script>
<script type="text/javascript" src="lib/Highcharts/4.1.7/js/modules/exporting.js"></script>
<script type="text/javascript">
    $(function () {
        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Monthly Average Rainfall'
            },
            subtitle: {
                text: 'Source: WorldClimate.com'
            },
            xAxis: {
                categories: [
                    '一月',
                    '二月',
                    '三月',
                    '四月',
                    '五月',
                    '六月',
                    '七月',
                    '八月',
                    '九月',
                    '十月',
                    '十一月',
                    '十二月'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rainfall (mm)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: '采购支出',
                data: [$(), 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

            }, {
                name: '工资支出',
                data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

            }, {
                name: '住宿收入',
                data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

            }, {
                name: '利润',
                data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

            }]
        });
    });
</script>
</body>
</html>

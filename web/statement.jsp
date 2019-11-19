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
    <link rel="stylesheet" type="text/css" href="css/selectFilter.css" />
    <link rel="stylesheet" type="text/css" href="css/MyPaging.css">
    <link rel="stylesheet" type="text/css" href="fy-alert/css/fy-alert.css">
    <link href="css/style2.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/json2.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/selectFilter.js"></script>
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
    <script type="text/javascript" src="js/sort.js"></script>
    <script type="text/javascript">
        var order;
        $(function(){
            //通过下拉框触发
            $("#select").bind("change",function () {
                //选择年则向后台发请求
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
                                            $("#body").empty();
                                            //循环打印表，i=每页数*（当前页-1）
                                            for( i=_this.size*(_this.current-1);i<_this.size*_this.current;i++){
                                                if(i<order1.length){
                                                    $("#body").append("<tr style='text-align: center'>" +
                                                        "<td>"+(order1[i].year==null?(order1[i].year1==null?order1[i].year2:order1[i].year1):order1[i].year)+"</td>"+
                                                        "<td>"+(order1[i].goods_price==null?'':order1[i].goods_price)+"</td>"+
                                                        "<td>"+(order1[i].salary_price==null?'':order1[i].salary_price)+"</td>"+
                                                        "<td>"+(order1[i].room_price==null?'':order1[i].room_price)+"</td>"+
                                                        "<td>"+((order1[i].room_price==null?0:order1[i].room_price)-(order1[i].goods_price==null?0:order1[i].goods_price)-(order1[i].salary_price==null?0:order1[i].salary_price))+"</td>"+
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
                    //向后台发月请求
                }else if(this.value=="month"){
                    $("#head").empty();
                    $("#body").empty();
                    $("#thead").append("<tr>\n" +
                        "<th>年月</th>\n" +
                        "<th>采购支出</th>\n" +
                        "<th>工资支出</th>\n" +
                        "<th>住宿收入</th>\n" +
                        "<th>利润</th>\n" +
                        "<th>操作</th>\n"+
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
                                                        "<td >"+(order[i].month==null?(order[i].month1==null?order[i].month2:order[i].month1):order[i].month)+"</td>"+
                                                        "<td>"+(order[i].goods_price==null?'':order[i].goods_price)+"</td>"+
                                                        "<td>"+(order[i].salary_price==null?'':order[i].salary_price)+"</td>"+
                                                        "<td>"+(order[i].room_price==null?'':order[i].room_price)+"</td>"+
                                                        "<td>"+((order[i].room_price==null?0:order[i].room_price)-(order[i].goods_price==null?0:order[i].goods_price)-(order[i].salary_price==null?0:order[i].salary_price))+"</td>"+
                                                        "<td><button  id='q"+i+"' >详情</button></td>" +
                                                        "</tr>");
                                                }
                                                $("#q"+i).click(function () {
                                                    var tid=$(this).attr('id');
                                                    tid=tid.split("q")[1];
                                                    var time=(order[tid].month==null?(order[tid].month1==null?order[tid].month2:order[tid].month1):order[tid].month);
                                                    fyAlert.alert({
                                                        title   : "详情",
                                                        type     : 2,
                                                        animateType : 1,
                                                        area : ['700px','800px'],
                                                        content :'message.jsp?time='+time,
                                                    })
                                                });

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
            })
        });
    </script>
    <script type="text/javascript" src="js/script1.js"></script>
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
                        <select id="select">
                            <option value="year">年度报表</option>
                            <option value="month">月度报表</option>
                        </select>
                        <h5>所有分类：</h5>
                        <div class="main">

                            <table class="table table-striped" id="tab" border="1">
                                <thead id="head">
                                </thead>
                                <thead id="thead">
                                </thead>
                                <tbody id="tbody" >
                                </tbody>
                                <tbody id="body">
                                </tbody>
                                <tbody id="histo" hidden></tbody>
                            </table>

                            <div class="box2"></div>
                        </div>






                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<select id="his">
</select>
<div class="pd-20">
    <div id="container" style="min-width:700px;height:400px"></div>
</div>
<script src="js/MyPaging.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/Highcharts/4.1.7/js/highcharts.js"></script>
<script type="text/javascript" src="lib/Highcharts/4.1.7/js/modules/exporting.js"></script>
<script type="text/javascript" src="fy-alert/js/fy-alert.js"></script>

<script type="text/javascript">
    //柱状图
    $(function () {
        //下拉框
        for(var i=1995;i<2020;i++){
            $("#his").append("<option class='year'>"+i+"</option>");
        }
        var histogram;
        //根据下拉框的值向后台发请求
        $("#his").bind("change",function () {
            var selectyear=$("#his option:selected").text();
            $.ajax({
                'tpye':'post',
                'url':'histogrammonth.finance',
                'data':{'selectyear':selectyear},
                'success':function (data,textStatus) {
                    if(data==null){
                        alert("没加到数据");
                    }else{


                        histogram=JSON.parse(data);
                        //向隐藏表格内插入数据以
                        for(var i=0;i<histogram.length;i++){
                                //向隐藏表格内插入数据，为之后取值方便
                            $("#histo").append("<tr style='text-align: center'>" +
                                "<td class='time'>"+(histogram[i].month==null?(histogram[i].month1==null?histogram[i].month2:histogram[i].month1):histogram[i].month)+"</td>"+
                                "<td>"+(histogram[i].goods_price==null?'':histogram[i].goods_price)+"</td>"+
                                "<td>"+(histogram[i].salary_price==null?'':histogram[i].salary_price)+"</td>"+
                                "<td>"+(histogram[i].room_price==null?'':histogram[i].room_price)+"</td>"+
                                "<td>"+((histogram[i].room_price==null?0:histogram[i].room_price)-(histogram[i].goods_price==null?0:histogram[i].goods_price)-(histogram[i].salary_price==null?0:histogram[i].salary_price))+"</td>"+
                                "</tr>");
                        }
                        //创建一个空的json对象，初始化12长度，用于替换从histogram
                        var obj=[];
                        for(var i=0;i<12;i++){
                            var o={
                                goods_price:null,
                                salary_price:null,
                                room_price:null
                            };
                            obj.push(o);
                        }
                        //将histogram的数据填入obj对象
                        for(var i=0;i<histogram.length;i++){
                            if(histogram[i].goods_price!=null){
                                obj[i].goods_price=histogram[i].goods_price;
                            }
                            if(histogram[i].salary_price!=null){
                               obj[i].salary_price= histogram[i].salary_price;
                            }
                            if(histogram[i].room_price!=null){
                               obj[i].room_price= histogram[i].room_price;
                            }
                        }
                        //替换
                        histogram=obj;
                        //将数据按月排序
                        for(var i=0;i<histogram.length;i++){
                            var t=$(".time:eq("+i+")").text().split('-');
                            //alert(t[1]);
                            for(var j=i;j<histogram.length;j++){
                                var p=$(".time:eq("+j+")").text().split('-');
                                if(t[1]-p[1]>0){
                                    var temp=histogram[i];
                                    histogram[i]=histogram[j];
                                    histogram[j]=temp;
                                }
                            }
                        }

                        $('#container').highcharts({
                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: ''
                            },
                            subtitle: {
                                text: ''
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
                                    text: '人民币(元)'
                                }
                            },
                            tooltip: {
                                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                    '<td style="padding:0"><b>{point.y:.1f}元</b></td></tr>',
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
                                data: [parseInt(histogram[0].goods_price),parseInt(histogram[1].goods_price),parseInt(histogram[2].goods_price) ,parseInt(histogram[3].goods_price) ,parseInt(histogram[4].goods_price) ,parseInt(histogram[5].goods_price) ,parseInt(histogram[6].goods_price),parseInt(histogram[7].goods_price),parseInt(histogram[8].goods_price),parseInt(histogram[9].goods_price),parseInt(histogram[10].goods_price),parseInt(histogram[11].goods_price)]

                            }, {
                                name: '工资支出',
                                data: [parseInt(histogram[0].salary_price),parseInt(histogram[1].salary_price),parseInt(histogram[2].salary_price),parseInt(histogram[3].salary_price),parseInt(histogram[4].salary_price),parseInt(histogram[5].salary_price),parseInt(histogram[6].salary_price),parseInt(histogram[7].salary_price),parseInt(histogram[8].salary_price),parseInt(histogram[9].salary_price),parseInt(histogram[10].salary_price),parseInt(histogram[11].salary_price)]

                            }, {
                                name: '住宿收入',
                                data: [parseInt(histogram[0].room_price),parseInt(histogram[1].room_price),parseInt(histogram[2].room_price),parseInt(histogram[3].room_price),parseInt(histogram[4].room_price),parseInt(histogram[5].room_price),parseInt(histogram[6].room_price),parseInt(histogram[7].room_price),parseInt(histogram[8].room_price),parseInt(histogram[9].room_price),parseInt(histogram[10].room_price),parseInt(histogram[11].room_price)]

                            }, {
                                name: '利润',
                                data: [parseInt(histogram[0].room_price-histogram[0].goods_price-histogram[0].salary_price),parseInt(histogram[1].room_price-histogram[1].goods_price-histogram[1].salary_price),parseInt(histogram[2].room_price-histogram[2].goods_price-histogram[2].salary_price),parseInt(histogram[3].room_price-histogram[3].goods_price-histogram[3].salary_price),parseInt(histogram[4].room_price-histogram[4].goods_price-histogram[4].salary_price),parseInt(histogram[5].room_price-histogram[5].goods_price-histogram[5].salary_price),parseInt(histogram[6].room_price-histogram[6].goods_price-histogram[6].salary_price),parseInt(histogram[7].room_price-histogram[7].goods_price-histogram[7].salary_price),parseInt(histogram[8].room_price-histogram[8].goods_price-histogram[8].salary_price),parseInt(histogram[9].room_price-histogram[9].goods_price-histogram[9].salary_price),parseInt(histogram[10].room_price-histogram[10].goods_price-histogram[10].salary_price),parseInt(histogram[11].room_price-histogram[11].goods_price-histogram[11].salary_price)]

                            }]
                        });
                    }

                }
            })

        });
        })

</script>

</body>
</html>

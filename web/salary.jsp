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
    <script type="text/javascript">
            $(function(){
                //向后台发请求·，拿取数据
                $.ajax({
                    'tpye':'post',
                    'url':'findsalary.finance',
                    'success':function (data,textStatus) {
                        if(data==null){
                            alert("没加到数据");
                        }else{
                            var order=JSON.parse(data);
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
                                                    "<td>"+order[i].salary_id+"</td>"+
                                                    "<td>"+order[i].salary_time+"</td>"+
                                                    "<td>"+order[i].staff_id+"</td>" +
                                                    "<td>"+order[i].staff_name+"</td>"+
                                                    "<td>"+order[i].dept_name+"</td>"+
                                                    "<td>"+order[i].staff_job+"</td>"+
                                                    "<td>"+order[i].staff_salary+"</td>"+
                                                    "<td>"+order[i].renish_amount+"</td>"+
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
                $("#payof").click(
                    function () {
                        fyAlert.alert({
                            type:2,
                            title:'文本提示框',
                            animateType : 1,
                            skin     : 'fyAlert-blue',
                            // area : ['380px','90%'],
                            content: 'payof.jsp',
                        })

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
        <li class="active">员工薪资记录</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">员工薪资</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        </select>
                        <div class="main">

                            <table class="table table-striped" border="1">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>发放时间</th>
                                    <th>员工编号</th>
                                    <th>员工姓名</th>
                                    <th>部门</th>
                                    <th>职位</th>
                                    <th>月薪</th>
                                    <th>本次发放薪资</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">

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
</body>
</html>

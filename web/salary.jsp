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
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/theme.css">
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#hotel_id").empty();
            $("#hotel_id").html("<option value=0>酒店名称</option>");
            var url="hotel/selectAll.do";
            $.post(url,function(data){
                for(var i=0;i<data.length;i++){
                    var $option =$("<option value="+data[i].hotel_id+"></option>");
                    $option.text(data[i].hotel_name);
                    $("#hotel_id").append($option);
                }
                $("#hotel_id").val("${hotel_id}");
            },"json");

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
                        window.location.href="finance/selectSalaryByHotel_id.do?page="+page+"&hotel_id="+hotel_id;
                    }else{
                        window.location.href="finance/selectSalaryAll.do?page="+page;
                    }
                }
            });
            $('.demo-cancel-click').click(function() {
                return false;
            });
            $("#hotel_id").change(function(){
                var hotel_id=$(this).val();;
                var url="finance/selectSalaryByHotel_id.do?page=1&hotel_id="+hotel_id;
                window.location.href=url;
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
        <li class="active">员工薪资</li>
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
                        <select class="span2" id="hotel_id">
                        </select>

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>发放时间</th>
                                <th>员工编号</th>
                                <th>员工姓名</th>
                                <th>酒店</th>
                                <th>部门</th>
                                <th>职位</th>
                                <th>本月薪资</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td>$</td>
                                <td>$</td>
                                <td>$</td>
                                <td>$</td>
                                <td>$</td>
                                <td>$</td>
                                <td>$</td>
                                <td>

                                </td>
                            </tr>

                            </tbody>
                        </table>

                        <div style=" width:95%;text-align:right">
                            <a href="finance/selectSalaryAll.do">首页</a>

                            <a href="finance/selectSalaryAll.do?page=${pageList.prePage}">上一页</a>

                            <a href="finance/selectSalaryAll.do?page=${pageList.nextPage}">下一页</a>

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
</body>
</html>

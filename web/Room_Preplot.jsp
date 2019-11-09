<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yhc
  Date: 2019/10/26
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客房登记</title>
    <script src="js/ajax.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/preplot.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <style type="text/css">
        #left{
            float: left;
            margin-left:10px;
            width: auto;
            text-align: center;
        }
        #right{
            float: right;
            width: auto;
            text-align: center;
        }
    </style>

</head>
<body>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">客房管理</h1>
    </div>
    <ul class="breadcrumb">
        <%--        <li><a href="">客房管理</a><span class="divider">/</span></li>--%>
        <li class="active">开房登记</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <table class="table table-striped">
                            <tr>
                                <td>姓名：</td>
                                <td><input type="text" id="pName"></td>
                            </tr>
                            <tr>
                                <td>身份证号：</td>
                                <td><input type="text" id="pID"></td>
                            </tr>
                            <tr>
                                <td>联系电话：</td>
                                <td><input type="text" id="pTel"></td>
                            </tr>
                            <tr>
                                <td>房间类型：</td>
                                <td>
                                    <select id="pType">
                                        <option selected>--请选择--</option>
                                        <option>单人间</option>
                                        <option>双人间</option>
                                        <option>标间</option>
                                        <option>情侣间</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>房间数量：</td>
                                <td><input type="text" id="pNum"></td>
                            </tr>
                            <tr>
                                <td>入住时间：</td>
                                <td><input type="date" id="pEnter"></td>
                            </tr>
                            <tr>
                                <td>离开时间：</td>
                                <td><input type="date" id="pLeave"></td>
                            </tr>
                        </table>
                        <button onclick="javascript:add()">开房</button>
                        <script>
                            function  add(type){
                                $ajax({
                                    url:"RoomPre.room",
                                    type:"post",
                                    data:{
                                        name:$('#Name').val(),
                                        ID:$('#pID').val(),
                                        tel:$('#pTel').val(),
                                        type:$('#pType').val(),
                                        num:$('#pNum').val(),
                                        enter:$('#pEnter').val(),
                                        leave:$('#pLeave').val()
                                    },
                                    success:function (data) {
                                        var info = data.substring(3,data.length);
                                        alert(info)
                                        window.location.href='Room_Preplot.jsp';
                                    },
                                    error:function (error) {
                                        alert("信息不完整，请补全信息")
                                    }
                                });
                            }
                        </script>
                        <%--                        <div style=" width:95%;text-align:right">--%>
                        <%--                            <a href="roomtype/selectRoomType_All.do?page=1">首页</a>--%>

                        <%--                            <a--%>
                        <%--                                    href="roomtype/selectRoomType_All.do?page=${pageList.prePage}">上一页</a>--%>

                        <%--                            <a--%>
                        <%--                                    href="roomtype/selectRoomType_All.do?page=${pageList.nextPage}">下一页</a>--%>

                        <%--                            第$页， 共$页，跳到第 <input--%>
                        <%--                                type="text" class="span1"--%>
                        <%--                                style="margin-top:10px ;width:30px " id="jumpPage">页--%>
                        <%--                            <input class="btn btn-default" type="button" value="跳"--%>
                        <%--                                   id="jump">--%>
                        <%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yhc
  Date: 2019/10/23
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js"></script>
    <script src="ajax.js"></script>
<%--    <script type="text/javascript">--%>
<%--        $(function() {--%>

<%--            $("#jump").click(function() {--%>
<%--                var page=parseInt($("#jumpPage").val());--%>
<%--                var pages="${pageList.pages }";--%>
<%--                var pagen="${pageList.pageNum }";--%>
<%--                if(page>pages){--%>
<%--                    alert("输入错误！共"+pages+"页。");--%>
<%--                    page=pagen;--%>
<%--                }else if(page<=0){--%>
<%--                    alert("输入错误！")--%>
<%--                    page=pagen;--%>
<%--                }else{--%>
<%--                    var url = "roomtype/selectRoomType_All.do?page=" + page;--%>
<%--                    window.location.href = url;--%>
<%--                }--%>
<%--            });--%>
<%--            $("button[name='sub']")--%>
<%--                .click(--%>
<%--                    function() {--%>
<%--                        var roomtype_name = $(this).parent("td").parent(--%>
<%--                            "tr").find("td").eq(0).text();--%>
<%--                        var price = $(this).parent("td").parent("tr").find(--%>
<%--                            "td").find("input").val();--%>
<%--                        var url = "roomtype/updateRoomTypePrice.do?roomtype_name="--%>
<%--                            + roomtype_name + "&price=" + price;--%>
<%--                        $--%>
<%--                            .post(--%>
<%--                                url,--%>
<%--                                function(data) {--%>
<%--                                    if (data > 0) {--%>
<%--                                        alert("修改成功！");--%>
<%--                                    } else {--%>
<%--                                        alert("修改失败！");--%>
<%--                                    }--%>
<%--                                    var page = "${pageList.pageNum }";--%>
<%--                                    var url = "roomtype/selectRoomType_All.do?page="--%>
<%--                                        + page;--%>
<%--                                    window.location.href = url;--%>
<%--                                });--%>
<%--                    });--%>
<%--        });--%>
<%--    </script>--%>
</head>
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">客房管理</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="">客房管理</a><span class="divider">/</span></li>
        <li class="active">房价调整</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">房价调整</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">

                        <
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>房间类型</th>
                                <th>价格</th>
                                <th>修改价格</th>
                                <th>提交</th>
                            </tr>
                            </thead>
                            <tbody>
                        <c:forEach items="${RoomPrice}" var="i">
                            <tr>
                                <td>${i.room_type}</td>
                                <td>${i.room_price}</td>
                                <td><input type="text" class="span2" id="price"></td>
                                <td><button class="btn btn-info" name="sub" onclick="javascript:alter('${i.room_type}')">提交</button></td>
                                <script type="text/javascript">
                                    function  alter(type){
                                        $ajax({
                                            url:"update.room",
                                            type:"post",
                                            data:{
                                                type:type,
                                                price:$('#price').val()
                                            },
                                            success:function (data) {
                                                alert(data)
                                            },
                                            error:function (data) {
                                                alert("不行");
                                            }
                                        });
                                    }
                                </script>
                            </tr>
                        </c:forEach>
                            </tbody>
                        </table>
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

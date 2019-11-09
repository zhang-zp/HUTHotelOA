<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.RoomInfo" %><%--
  Created by IntelliJ IDEA.
  User: Yhc
  Date: 2019/10/22
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="js/ajax.js" type="text/javascript"></script>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <script type="text/javascript" src="js/bootstrap.js"></script>


<%--    <script type="text/javascript">--%>
<%--        $(function() {--%>

<%--            $("#hotelName").empty();--%>
<%--            $("#hotelName").html("<option>酒店名称</option>");--%>
<%--            var url = "hotel/selectAll.do";--%>
<%--            $.post(url, function(data) {--%>
<%--                for ( var i = 0; i < data.length; i++) {--%>
<%--                    var $option = $("<option ></option>");--%>
<%--                    $option.text(data[i].hotel_name);--%>
<%--                    $("#hotelName").append($option);--%>
<%--                }--%>
<%--                var hotel_name="${hotel_name}";--%>
<%--                if(hotel_name!=""){--%>
<%--                    $("#hotelName").val("${hotel_name}");--%>
<%--                }--%>
<%--                else{--%>
<%--                    $("#hotelName").val("酒店名称");--%>
<%--                }--%>
<%--            }, "json");--%>
<%--            $("#jump").click(--%>
<%--                function() {--%>
<%--                    var page =parseInt($("#jumpPage").val());--%>
<%--                    var hotel_name = "${hotel_name}";--%>
<%--                    var url;--%>
<%--                    var pages="${pageList.pages }";--%>
<%--                    var pagen="${pageList.pageNum }";--%>
<%--                    if(page>pages){--%>
<%--                        alert("输入错误！共"+pages+"页。");--%>
<%--                        page=pagen;--%>
<%--                    }else if(page<=0){--%>
<%--                        alert("输入错误！")--%>
<%--                        page=pagen;--%>
<%--                    }else{--%>
<%--                        if(hotel_name=="酒店名称"){--%>
<%--                            url = "room/getRoom_All.do?page=" + page;--%>
<%--                        }else{--%>
<%--                            url = "room/getRoomByRoomName.do?page="+page+"&hotel_name=" + hotel_name;--%>
<%--                        }--%>
<%--                        window.location.href = url;--%>
<%--                    }--%>

<%--                });--%>

<%--            $("#hotelName").change(--%>
<%--                function() {--%>
<%--                    var hotel_name = $(this).val();--%>
<%--                    var url ;--%>
<%--                    if(hotel_name=="酒店名称"){--%>
<%--                        url="room/getRoom_All.do";--%>
<%--                    }else{--%>
<%--                        url = "room/getRoomByRoomName.do?page=1&hotel_name=" + hotel_name;--%>
<%--                    }--%>
<%--                    window.location.href = url;--%>
<%--                });--%>
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
        <li class="active">房间</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">查看房间</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">

                    <div class="tab-pane active in" id="home">
                        <select class="span2" id="hotelName" onchange="selectTwo(this.value)">
                            <script>
                                function selectTwo(choice) {
                                    var s2 = document.getElementById('s2');
                                    if(choice=='房间类型'){
                                        s2.innerHTML="";
                                        var json = {"标间":"标间","单人间":"单人间","双人间":"双人间",
                                            "情侣间":"情侣间","三人间":"三人间"};
                                        var i = 0;
                                        for(var key in json){
                                            s2.options[i++] = new Option(json[key],key)
                                        }
                                    }else if(choice == '楼层'){
                                        s2.innerHTML="";
                                        var json = {"1":"1","2":"2","3":"3"};
                                        var i = 0;
                                        for(var key in json){
                                            s2.options[i++] = new Option(json[key],key);
                                        }
                                    }else{
                                        s2.innerHTML="";
                                        s2.options[0] = new Option("请选择","");
                                    }
                                }
                            </script>
                            <option selected>请选择</option>
                            <option>房间类型</option>
                            <option>楼层</option>
                        </select>
                        <select class="span2" id="s2"></select>
                        <input type="button" value="搜索" class="btn btn-info" onclick="search()">
                        <script>
                            function search() {
                                $.ajax({
                                    url:'Search.room',
                                    type:'post',
                                    async:false,
                                    cache:false,
                                    data:{
                                        data1:$('#hotelName').val(),
                                        data2:$('#s2').val()
                                    },
                                    success:function(data) {
                                        var show = JSON.parse(data);
                                        $('#tab1 tr').html('')
                                        for(var i in show){
                                            $('#tab1').append('<tr><td>'+show[i].room_id
                                                +'<td>'+show[i].room_type+'</td>'
                                                +'<td>'+show[i].room_price+'</td>'
                                                +'<td>' +show[i].room_num+'</td>'
                                                +'<td>' +show[i].room_floor+'</td>'
                                                +'<td>' +show[i].room_status+'</td>'
                                                +'<td>' +show[i].room_dse+'</td>' +'</tr>')
                                        }
                                    },
                                    error:function(error) {
                                        alert('选择错误');
                                    }
                                })
                            }
                        </script>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>房间号</th>
                                <th>房间类型</th>
                                <th>价格</th>
                                <th>可住人数</th>
                                <th>楼层</th>
                                <th>状态</th>
                                <th>房价描述</th>
                            </tr>
                            </thead>
                            <tbody  id="tab1">
            <c:forEach items="${RoomAll}" var="i">
                            <tr>
                                <td>${i.room_id}</td>
                                <td>${i.room_type}</td>
                                <td>${i.room_price}</td>
                                <td>${i.room_num}</td>
                                <td>${i.room_floor}</td>
                                <td>${i.room_status}</td>
                                <td>${i.room_dse}</td>
                            </tr>
            </c:forEach>
                            </tbody>
                        </table>
<%--                        <div style=" width:95%;text-align:right">--%>

<%--                            <a href="room/getRoom_All.do?page=1">首页</a>--%>

<%--                            <a href="room/getRoom_All.do?page=${pageList.prePage}">上一页</a>--%>


<%--                            <a href="room/getRoom_All.do?page=${pageList.nextPage}">下一页</a>--%>

<%--                            第 页， 共$ 页，跳到第--%>
<%--                            <input type="text" class="span1" style="margin-top:10px ;width:30px " id="jumpPage">页--%>
<%--                            <input class="btn btn-default" type="button" value="跳" id="jump">--%>

<%--                            <a href="room/getRoomByRoomName.do?page=1&hotel_name=${hotel_name}">首页</a>--%>

<%--                            <a href="room/getRoomByRoomName.do?page=${pageList.prePage}&hotel_name=${hotel_name}">上一页</a>--%>

<%--                            <a href="room/getRoomByRoomName.do?page=${pageList.nextPage}&hotel_name=${hotel_name}">下一页</a>--%>

<%--                            第 页， 共 页，跳到第--%>
<%--                            <input type="text" class="span1" style="margin-top:10px ;width:30px " id="jumpPage">页--%>
<%--                            <input class="btn btn-default" type="button" value="跳" id="jump">--%>

<%--                        </div>--%>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

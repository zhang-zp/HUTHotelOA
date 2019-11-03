<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yhc
  Date: 2019/10/27
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客房更换</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <script src="js/ajax.js" type="text/javascript"></script>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
</head>
<body>

<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">住宿管理</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="">住宿管理</a><span class="divider">/</span></li>
        <li class="active">客房更换</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">客房更换</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane  fade active in" id="home">
                        <form id="tab">
                            <label>原房间名</label> <input type="text" value="" class="span2">
                            <label>新房间类型</label>
                                <select class="span2" id="roomType" onchange="newType()">
                                    <script>
                                        function newType() {
                                          $.ajax({
                                              async:false,
                                              cache:false,
                                              url:"RoomType.room",
                                              type:"post",
                                              data:{
                                                  newType:$('#roomType').val()
                                              },
                                              success:function (data) {
                                                  var newData = JSON.parse(data);
                                                  $("#freeRoom").empty();
                                                  for(var i in newData){
                                                      $("#freeRoom").append("<option>"+newData[i].room_id+"</option>");
                                        }
                                              },
                                              error:function (error) {
                                                  alert("该类型房间已没有剩余")
                                              }
                                          });
                                        }
                                    </script>
                                    <option selected>--请选择--</option>
                                    <option>标间</option>
                                    <option>单人间</option>
                                    <option>双人间</option>
                                    <option>情侣间</option>
                                    <option>三人间</option>
                                    <option>大床房</option>
                                </select>
                            <label>新房间名</label>
                                <select class="span2" id="freeRoom">
                                    <option>请选择</option>
                                </select>
                            <label>换房时间</label> <input type="text" value="" class="span2">
                            <div class="btn-toolbar">
                                <input type="button" value="更换" onclick="$ajax({
                                url:'ChangeRoom.room',
                                type:'post',
                                data:{
                                    roomId:$('#freeRoom').val()
                                },
                                success:function(data) {
                                  $('#roomType').empty();
                                  $('#freeRoom').empty();
                                  alert(data.substring(3,data.length));
                                },
                                error:function(error) {
                                  alert(error);
                                }
                                })" class="btn btn-info" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

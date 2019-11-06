<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/11/1
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>仓库采购</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" href="css/buy.css" />
    <script src="js/jquery-2.0.0.min.js" type="text/javascript" ></script>
    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>
<div class="navbar-inner">
    <div class="header">
        <h1 class="page-title">仓库管理</h1>
    </div>
    <ul class="breadcrumb">
        <li>仓库管理<span class="divider">/</span></li>
        <li class="active">物品采购</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <form action="buyshopAction/queryBuyShop.do" method="post">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#home" data-toggle="tab">商品采购记录：</a>
                    </li>
                    <li>
                        <input type="text" value="" name="goodsname" placeholder=" 请输入商品名称" id="spinp12">
                        <input type="submit" value="GO" id="spinp22">
                    </li>
                </ul>
            </form>
            <div id="bcre">
                <div class="bgsright5">
                    <div class="shopno">商品编号</div>
                    <div class="shopname">商品名称</div>
                    <div>商品单价</div>
                    <div>商品数量</div>
                    <div>商品总价</div>
                    <div>采购时间</div>
                    <div class="shopprice">采购人</div>
                </div>
                <c:forEach items="${goodsRecord}" var="list" varStatus="next">
                    <br>
                    <div class="bgsright5" id="${next.count}">
                        <div class="shopno">${list.goods_id}</div>
                        <div class="shopname">${list.goods_name}</div>
                        <div>${list.goods_price}</div>
                        <div>${list.goods_num}</div>
                        <div>${list.goods_price*list.goods_num}</div>
                        <div>${list.goods_time}</div>
                        <div class="shopprice">${list.purchaseAgent}</div>
                    </div>
                </c:forEach>
                <div id="buybut">
                    <input type="button" value="首页" id="shouye"> <input
                        type="button" value="上一页" id="pageup"> <input
                        type="button" value="下一页" id="pagedown"> 第 <span
                        id="dqpage">1</span> 页 共 <span id="maxpage">${fn:length(goodsRecord)/5}</span> 页
                    跳到 <input type="text" id="ye"> 页 <input
                        type="button" value="确定" id="tz">
                </div>

                <script type="text/javascript">
                    $(function() {
                        $("#shouye").click(function() {
                            var page = parseInt($("#dqpage").html());
                            if (page == 1) {
                                alert("已经是首页了！");
                            } else {
                                location.href = "buyshopAction/queryBuyShop.do?page=1&goodsname="+ $('#spinp12').val();
                            }
                        });
                        $("#pageup").click(function() {
                            var page = parseInt($("#dqpage").html()) - 1;
                            if (page < 1) {
                                alert("已经是第一页！");
                            } else {
                                location.href = "buyshopAction/queryBuyShop.do?page="+ page+ "&goodsname="+ $('#spinp12').val();
                            }
                        });
                        $("#pagedown").click(function() {
                            var page = parseInt($("#dqpage").html()) + 1;
                            var maxpage = parseInt($("#maxpage").html());
                            if (page > maxpage) {
                                alert("已经是最后一页！");
                            } else {
                                location.href = "buyshopAction/queryBuyShop.do?page="+ page+ "&goodsname="+ $('#spinp12').val();
                            }
                        });
                        $("#tz").click(function() {
                            var page = $("#ye").val();
                            var reg = /\d/;
                            var maxpage = parseInt($("#maxpage").html());
                            if (reg.exec(page)) {
                                if (page<1||page>maxpage) {
                                    alert("输入页数超出范围");
                                    $("#ye").val("");
                                } else {
                                    location.href = "buyshopAction/queryBuyShop.do?page="+ page+ "&goodsname="+ $('#spinp12').val();
                                }
                            } else {
                                alert("请输入数字");
                                $("#ye").val("");
                            }
                        });
                    });
                </script>
            </div>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab">商品采购：</a></li>
            </ul>
            <div id="bgr">
                <form action="buyShopAction.goods" method="post">
                    <div id="spn">商品名称：</div>
                    <div id="spn1">
                        <input type="text" name="goods_name" id="shopname"
                               placeholder="请输入采购商品名称">
                    </div>
                    <div id="spn2"></div>

                    <div id="spp">商品单价：</div>
                    <div id="spp1">
                        <input type="text" name="goods_price" id="shopprice"
                               placeholder="请输入采购商品价格（10.00）">
                    </div>
                    <div id="spp2"></div>

                    <div id="sps">商品数量：</div>
                    <div id="sps1">
                        <input type="text" name="goods_count" id="sum"
                               placeholder="请输入采购商品数量">
                    </div>
                    <div id="sps2"></div>

                    <div id="sptp">商品总价：</div>
                    <div id="sptp1">
                        <input type="text" name="total_price" id="totalprice"
                               placeholder="商品总价（88.00）" readonly="readonly">
                    </div>
                    <div id="sptp2"></div>

                    <div id="sptime">采购时间：</div>
                    <div>
                        <input type="date"  class="nowTime" name="goods_time">
                    </div>
                    <div id="sptime1"></div>

                    <div id="spman">采购人：</div>
                    <div>
                        <input type="text"  name="goods_man">
                    </div>
                    <div id="spman1"></div>
                    <div id="buymit">
                        <input type="submit" value="购买并更新仓库商品信息">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
    $(function() {
        $('.demo-cancel-click').click(function() {
            return false;
        });
    });
</script>
</body>
</html>
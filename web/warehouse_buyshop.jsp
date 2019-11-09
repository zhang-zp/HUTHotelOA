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
            <div id="bgr">
                <form action="buyShopAction.goods" method="post" onsubmit="return buyConfirm()">
                    <div id="spn">商品名称：</div>
                    <div id="spn1">
                        <select name="buyGoods_name" id="shopname">
                            <option>请选择采购商品名称</option>
                            <option>吹风机</option>
                            <option>洗漱套装</option>
                            <option>衣柜</option>
                            <option>笔记本</option>
                            <option>浴缸</option>
                            <option>小型冰箱</option>
                            <option>安全出口灯牌</option>
                        </select>
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
</body>
</html>
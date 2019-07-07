<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bs.css"/>
    <link rel="stylesheet" href="css/cart.css"/>

    <script type="text/javascript">

        /**
         * 解决ajax异步带来的问题
         * @param d
         */
        function sleep(d) {
            var t = Date.now();
            while (Date.now - t <= d) ;
        }

        function checkOrNot(productId, unitPrice, obj) {
            $.post(
                "cart/checkOne",
                {"productId": productId},
                function (data) {
                    if (data.code == 200) {
                        //当前购物项
                        var $cartItem = $("#cart_item" + productId);

                        var $buy_num = $cartItem.find(".buy_num");
                        var num = parseInt($buy_num.val());
                        var $subTotal = $cartItem.find(".subTotal");
                        var $shopTotal = $(".shop_total");
                        var shop_total_text = $shopTotal.text().trim();

                        if ($(obj).is(":checked")) {
                            var subTotal = unitPrice * num;
                            $subTotal.text(subTotal);

                            var shop_total = (parseFloat(shop_total_text.substring(shop_total_text.indexOf("￥") + 1)) + subTotal).toFixed(2);
                            $shopTotal.text("￥" + shop_total);
                        } else {
                            var subTotal = (unitPrice * num).toFixed(2);
                            var shop_total = (parseFloat(shop_total_text.substring(shop_total_text.indexOf("￥") + 1)) - subTotal).toFixed(2);
                            $subTotal.text("0.00");
                            $shopTotal.text("￥" + shop_total);
                        }
                    }
                },
                "json"
            );
        }


        //unitPrice单价
        function add(productId, unitPrice) {

            //当前购物项
            var $cartItem = $("#cart_item" + productId);
            var $checkbox = $($cartItem).find(".shop_checkbox");
            if (!$checkbox.prop("checked")) {
                $($cartItem).find(".shop_checkbox").prop("checked", true);
                checkOrNot(productId, unitPrice, $("#cart_item" + productId).find(".shop_checkbox"));
                sleep(100);
            }

            //设置当前书籍购买数量
            var $buy_num = $cartItem.find(".buy_num");
            var num = parseInt($buy_num.val()) + 1;

            $.post(
                "cart/buy/num/update",
                {"productId": productId, "newNum": num},
                function (data) {
                    if (data.code == 200) {
                        $buy_num.val(num);
                        //刷新当前购物项小计
                        var $subTotal = $cartItem.find(".subTotal");
                        var subTotal = (num * unitPrice).toFixed(2);
                        $subTotal.text(subTotal);

                        var $shopTotal = $(".shop_total");
                        var shop_total_text = $shopTotal.text().trim();
                        var shop_total = (parseFloat(shop_total_text.substring(shop_total_text.indexOf("￥") + 1)) + unitPrice).toFixed(2);
                        $shopTotal.text("￥" + shop_total);
                    }
                },
                "json"
            );
        }

        function sub(productId, unitPrice) {
            var $cartItem = $("#cart_item" + productId);
            var $buy_num = $cartItem.find(".buy_num");
            //复选框
            var $checkbox = $($cartItem).find(".shop_checkbox");
            var num = parseInt($buy_num.val()) - 1;

            if (num >= 0) {

                if (!$checkbox.prop("checked")) {
                    $checkbox.prop("checked", true);
                    checkOrNot(productId, unitPrice, $("#cart_item" + productId).find(".shop_checkbox"));
                    sleep(100);
                }

                $.post(
                    "cart/buy/num/update",
                    {"productId": productId, "newNum": num},
                    function (data) {
                        if (data.code == 200) {
                            $buy_num.val(num);

                            var $subTotal = $cartItem.find(".subTotal");
                            //parseFloat($subTotal.text().trim())
                            var subTotal = (num * unitPrice).toFixed(2);
                            $subTotal.text(subTotal);

                            var $shopTotal = $(".shop_total");
                            var shop_total_text = $shopTotal.text().trim();
                            var shop_total = (parseFloat(shop_total_text.substring(shop_total_text.indexOf("￥") + 1)) - unitPrice).toFixed(2);
                            $shopTotal.text("￥" + shop_total);
                        }
                    },
                    "json"
                );
            }
        }

        function deleteCartItem(productId) {
            var isDelete = confirm("真的要删除?");
            if (isDelete) {
                location.href = "<%=basePath%>cart/deletion/" + productId;
            }
        }

        function checkTotal() {
            var allTotal = parseFloat($("#all_total").text().trim()).toFixed(2);
            if (allTotal <= 0) {
                alert("亲，请至少购买一件商品!");
            } else {
                location.href = "<%=basePath%>order/info";
            }
        }

    </script>
</head>
<body>

<jsp:include page="cart_header.jsp"/>

<div class="container">

    <!--
        购物车主体
    -->
    <c:if test="${cart == null || empty cart.cartItems}">
        <div class="row">
            <h1 class="h1">亲，您的购物车为空，<a href="">再逛一逛吧!</a></h1>
            <img src="img/empty.png" alt="您的购物车为空">
        </div>
    </c:if>

    <c:if test="${cart != null && !empty cart.cartItems}">
        <div class="row" id="cart_table_div">
            <table id="cart_table" border="0" cellpadding="0" cellspacing="0">
                <thead>
                <tr id="table_head">
                    <th width="10%">
                        <input type="checkbox" class="select_all" checked/>店铺全选
                    </th>
                    <th width="30%">商品信息</th>
                    <th width="10%">单价（元）</th>
                    <th width="10%">数量</th>
                    <th width="10%">小计（元）</th>
                    <th width="10%">操作</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${cart.cartItems}" var="cartItem">
                    <tr class="shop_intro">
                        <td class="tcol1">
                            <input type="checkbox" class="select_all_oneShop" checked/>
                            <span>全选</span>
                        </td>
                        <td>
                            <span>${cartItem.key}</span>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                <c:forEach items="${cartItem.value}" var="item">
                    <tr class="cart_item" id="cart_item${item.productInfo.productId}">
                        <td class="tcol1">
                            <input type="checkbox" ${item.checked?'checked':''}
                                   onchange="checkOrNot(${item.productInfo.productId},${item.productInfo.price},this)"
                                   class="shop_checkbox"/>
                        </td>
                        <td>
                            <a href="#"><img src="${item.productInfo.imageUrl}" width="20%"/></a>
                            <span>${item.productInfo.name}</span>
                        </td>
                        <td>
                            <span class="red">￥<fmt:formatNumber type="number" value="${item.productInfo.price}"
                                                                 pattern="0.00"/></span>
                        </td>
                        <td>
                            <div class="num">
                                <input type="text" disabled class="buy_num" value="${item.buyNum}"/>
                                <a href="javascript:void(0);" class="num_add"
                                   onclick="add(${item.productInfo.productId},${item.productInfo.price})"></a>
                                <a href="javascript:void(0);" class="num_sub"
                                   onclick="sub(${item.productInfo.productId},${item.productInfo.price})"></a>
                            </div>
                        </td>
                        <td>
                            <span class="red">￥</span>
                            <span class="red subTotal">
										<fmt:formatNumber type="number" value="${item.subTotal}"
                                                          pattern="0.00"/>
									</span>
                        </td>
                        <td>
                            <a href="javascript:void(0);"
                               onclick="deleteCartItem(${item.productInfo.productId})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </c:forEach>
                <tr class="tfoot">
                    <td class="tcol1">
                        <span>店铺合计	</span>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="shop_total">
                        ￥<fmt:formatNumber type="number" value="${cart.total}" pattern="0.00"/>
                    </td>
                </tr>

                </tbody>

            </table>
        </div>

        <!--
        去结算div
        -->
        <div class="row account_div">
            <div id="batch">
                <a href="cart/clear">清空购物车</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="font-size: 20px;color: #000000">继续购物</a>
            </div>
            <div id="shopping_total">
                <p class="total_p">
                    <span>总计：</span>
                    <span class="shop_total" style="font-size: 20px;">
                        ￥<span id="all_total"><fmt:formatNumber type="number" value="${cart.total}"
                                                                pattern="0.00"/></span>
                    </span>
                </p>
                <a href="javascript:void(0);" class="total_btn" onclick="checkTotal()">填写订单</a>
            </div>
        </div>
    </c:if>

</div>
<div class="clear"></div>
</body>
</html>


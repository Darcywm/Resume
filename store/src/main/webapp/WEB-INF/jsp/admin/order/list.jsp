<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单列表</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bs.css"/>
</head>
<script type="text/javascript">

    $(function (){
        $('[data-toggle="popover"]').each(function () {
            var element = $(this);
            var buyerId = element.attr('value');
            $.ajax({
                type:"GET",
                url:"admin/order/buyer/"+buyerId,
                success : function(result){
                    if(result.code == 200){
                        element.popover({
                            trigger: 'manual',
                            placement: 'right', //top, bottom, left or right
                            title: "买家:"+result.data.username,
                            html: 'true',
                            content: "来自:"+result.data.location
                        }).on("mouseenter", function () {
                            var _this = this;
                            $(this).popover("show");
                            $(this).siblings(".popover").on("mouseleave", function () {
                                $(_this).popover('hide');
                            });
                        }).on("mouseleave", function () {
                            var _this = this;
                            setTimeout(function () {
                                if (!$(".popover:hover").length) {
                                    $(_this).popover("hide")
                                }
                            }, 100);
                        });
                    }
                },
                dataType : "json"
            });

        });
    });

    function deleteOrder(orderId) {
        if (confirm("确认删除订单吗?")) {
            location.href = "<%=basePath%>admin/order/deletion/" + orderId;
        }
    }
    function lookShipping() {
        alert("暂无物流信息!");
    }

    function confirmOrder(orderId) {
        if (confirm("确认已付款吗?")) {
            location.href = "<%=basePath%>admin/order/confirm/" + orderId;
        }
    }
    
    function toEditOrder(orderId) {
        location.href = "<%=basePath%>admin/order/toUpdate/" + orderId;
    }

    function downloadOrder(orderId){
        location.href = "<%=basePath%>admin/order/download/" + orderId;
    }

</script>
<body style="overflow: scroll;overflow-y:hidden">
<div style="border: 1px solid #CCCCCC;padding-left:10px;">

    <table class="table table-hover">
        <caption>订单列表</caption>
        <thead>
        <tr>
            <th style="width: 45px">序号</th>
            <th>订单编号</th>
            <th>买家</th>
            <th>下单时间</th>
            <th>订单状态</th>
            <th>付款时间</th>
            <th style="width: 80px">确认状态</th>
            <th style="width: 70px">金额</th>
            <th style="width: 150px">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderCustoms.list}" var="orderCustom" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${orderCustom.order.orderId}</td>
                <td><button type="button" id="buyerInfo" class="btn btn-xs btn-warning buyerInfo"
                            data-container="body" data-toggle="popover" value="${orderCustom.order.userId}" <%--onclick="findBuyerInfo(${orderCustom.order.userId})"--%>>
                    买家信息
                </button>
                </td>
                <td><fmt:formatDate value="${orderCustom.order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${orderCustom.order.statusString}</td>
                <td><fmt:formatDate value="${orderCustom.order.paymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${orderCustom.order.confirmStatusString}</td>
                <td class="red">￥${orderCustom.order.payment}</td>
                <td>
                    <button type="button" class="btn btn-xs btn-info" onclick="toEditOrder('${orderCustom.order.orderId}')" >
                        订单详情
                    </button>
                    <c:if test="${orderCustom.order.status == 0}">
                        <button type="button" class="btn btn-xs btn-danger" onclick="deleteOrder('${orderCustom.order.orderId}')">
                            取消订单
                        </button>
                    </c:if>
                    <c:if test="${orderCustom.order.status != 0}">

                        <c:if test="${orderCustom.order.confirmStatus == 0}">
                            <button type="button" class="btn btn-xs btn-info" onclick="confirmOrder('${orderCustom.order.orderId}')" >
                                确认付款
                            </button>
                        </c:if>
                        <button type="button" class="btn btn-xs btn-danger" onclick="deleteOrder('${orderCustom.order.orderId}')">
                            删除订单
                        </button>
                    </c:if>
                    <button type="button" class="btn btn-xs btn-info" onclick="downloadOrder('${orderCustom.order.orderId}')" >
                        下载订单
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination pagination-lg">

        <c:if test="${orderCustoms.isFirstPage}">
            <li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
        </c:if>

        <c:if test="${orderCustoms.isFirstPage}">
            <li>
                <a href="admin/order/list?page=${orderCustoms.prePage}">&laquo;</a>
            </li>
        </c:if>
        <c:forEach
                begin="${orderCustoms.pageNum < 6 ? 1 :orderCustoms.pageNum-5}"
                end="${orderCustoms.pages<6?orderCustoms.pages:(orderCustoms.pageNum < 6 ? 6 :orderCustoms.pageNum) }"
                var="current">
            <li
                    class="${(current == orderCustoms.pageNum) ? 'active':''}">
                <a href="admin/order/list?page=${current}">
                        ${current}
                </a>
            </li>
        </c:forEach>

        <c:if test="${orderCustoms.isLastPage}">
            <li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
        </c:if>

        <c:if test="${!orderCustoms.isLastPage}">
            <li><a href="admin/order/list?page=${orderCustoms.nextPage}">&raquo;</a>
            </li>
        </c:if>

        <li>
            <a href="admin/order/list?page=${orderCustoms.pages}">末页</a>
        </li>

        <li><a href="javascript:void(0);">共${orderCustoms.pages}页</a></li>
        <li><a href="javascript:void(0);">共${orderCustoms.total}种</a></li>
    </ul>
</div>

</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="css/bs.css"/>
    <script src="js/base-loading.js"></script>

    <style type="text/css">
        td {
            max-width: 70px;
            overflow: hidden;
        }
        #searchBook {
            padding-top: 30px;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $("#sDate").datetimepicker({
                format:'yyyymmdd',  //格式  如果只有yyyy-mm-dd那就是0000-00-00
                autoclose:true,//选择后是否自动关闭
                minView:2,//最精准的时间选择为日期  0-分 1-时 2-日 3-月
                language:  'zh-CN', //中文
                weekStart: 1, //一周从星期几开始
                todayBtn:  1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                // daysOfWeekDisabled:"1,2,3", //一周的周几不能选 格式为"1,2,3"  数组格式也行
                todayBtn : true,  //在底部是否显示今天
                todayHighlight :false, //今天是否高亮显示
                keyboardNavigation:true, //方向图标改变日期  必须要有img文件夹 里面存放图标
                showMeridian:false,  //是否出现 上下午
                initialDate:new Date()
                //startDate: "2017-01-01" //日期开始时间 也可以是new Date()只能选择以后的时间
            }).on("changeDate",function(){
                var start = $("#sDate").val();
                $("#eDate").datetimepicker("setStartDate",start);
            });
            $("#eDate").datetimepicker({
                format:'yyyymmdd',  //格式  如果只有yyyy-mm-dd那就是0000-00-00
                autoclose:true,//选择后是否自动关闭
                minView:2,//最精准的时间选择为日期  0-分 1-时 2-日 3-月
                language:  'zh-CN', //中文
                weekStart: 1, //一周从星期几开始
                todayBtn:  1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                //daysOfWeekDisabled:"1,2,3", //一周的周几不能选
                todayBtn : true,  //在底部是否显示今天
                todayHighlight :false, //今天是否高亮显示
                keyboardNavigation:true, //方向图标改变日期  必须要有img文件夹 里面存放图标
                showMeridian:false  //是否出现 上下午
                // startDate: "2017-01-01"  //开始时间  ENdDate 结束时间
            }).on("changeDate",function(){
                var end = $("#eDate").val();
                $("#sDate").datetimepicker("setEndDate",end);
            });


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

        function toEditOrder(orderId) {
            location.href = "<%=basePath%>admin/order/toUpdate/"+orderId;
        }


    </script>
</head>

<body style="overflow: scroll;overflow:hidden">
<div style="border: 1px solid #CCCCCC;padding-left:10px;">
    <div id="searchBook" style="height:100px;border-bottom: 1px solid #CCCCCC;">
        <form action="admin/order/accounts" class="form-inline" role="form" method="get">
            <div class="form-group">
                <select name="confirmStatus" value="${confirmStatus}" style="width: 80px;height: 30px;font-size: 15px">
                    <option value="0">未付款</option>
                    <option value="1">已付款</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="sDate" name="sDate" value="${sDate}" placeholder="开始日期">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="eDate" name="eDate" value="${eDate}" placeholder="结束日期">
            </div>
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> 账目检索
            </button>
        </form>
        <p></p>
    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th>已付款：</th>
            <th><span class="red">${sumPay}</span></th>
            <th>未付款</th>
            <th><span class="red">${sumNoPay}</span></th>
        </tr>
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
                <td class="red">$${orderCustom.order.payment}</td>
                <td>
                    <button type="button" class="btn btn-xs btn-info" onclick="toEditOrder('${orderCustom.order.orderId}')" >
                        订单详情
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
                <a href="admin/order/accounts?page=${orderCustoms.prePage}&confirmStatus=${confirmStatus}&sDate=${sDate}&eDate=${eDate}">&laquo;</a>
            </li>
        </c:if>
        <c:forEach
                begin="${orderCustoms.pageNum < 6 ? 1 :orderCustoms.pageNum-5}"
                end="${orderCustoms.pages<6?orderCustoms.pages:(orderCustoms.pageNum < 6 ? 6 :orderCustoms.pageNum) }"
                var="current">
            <li
                    class="${(current == orderCustoms.pageNum) ? 'active':''}">
                <a href="admin/order/accounts?page=${current}&confirmStatus=${confirmStatus}&sDate=${sDate}&eDate=${eDate}">
                        ${current}
                </a>
            </li>
        </c:forEach>

        <c:if test="${orderCustoms.isLastPage}">
            <li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
        </c:if>

        <c:if test="${!orderCustoms.isLastPage}">
            <li><a href="admin/order/accounts?page=${orderCustoms.nextPage}&confirmStatus=${confirmStatus}&sDate=${sDate}&eDate=${eDate}">&raquo;</a>
            </li>
        </c:if>

        <li>
            <a href="admin/order/accounts?page=${orderCustoms.pages}">末页</a>
        </li>

        <li><a href="javascript:void(0);">共${orderCustoms.pages}页</a></li>
        <li><a href="javascript:void(0);">共${orderCustoms.total}种</a></li>
    </ul>
</div>

</body>
</html>


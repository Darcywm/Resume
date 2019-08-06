<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>库存信息</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bs.css"/>

    <style type="text/css">
        td {
            max-width: 70px;
            overflow: hidden;
        }
    </style>
</head>

<script type="text/javascript">
 function  _edit(productId) {
        if($("#edit_"+productId).val()=="确定"){
            var goods={};
            goods["storeMount"]=$(this).parents("tr").children("#storeMount_"+productId).children('input').val();
            goods["dealMount"]=$(this).parents("tr").children("#dealMount_"+productId).children('input').val();
            goods["badMount"]=$(this).parents("tr").children("#badMount_"+productId).children('input').val();
            goods["inventRemark"]=$(this).parents("tr").children("#inventRemark_"+productId).children('input').val();

            $.ajax({
                type : "post",
                url :"<%=path%>/invent/edit?productId="+productId,
                data :goods,
                dataType : "json",
                success : function(res) {
                    if(res=="success")
                        alert("修改成功");
                }
            });
        }


        str = $(this).val()=="编辑"?"确定":"编辑";
        $(this).val(str);   // 按钮被点击后，在“编辑”和“确定”之间切换
        $(this).parent().siblings("td").each(function() {  // 获取当前行的其他单元格
            var obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
            if(!obj_text.length)   // 如果没有文本框，则添加文本框使之可以编辑
                $(this).html("<input type='text' value='"+$(this).text()+"'>");
            else
                $(this).html(obj_text.val());
        });

    };

</script>
<body style="overflow: scroll;overflow-y:hidden">
<div style="border: 1px solid #CCCCCC;padding-left:10px;">
    <table class="table table-hover" id="content">
        <caption>库存管理</caption>
        <thead>
        <tr>
            <th>序号</th>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>图片</th>
            <th>库存数量</th>
            <th>销售数量</th>
            <th>损坏数量</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productPageInfo.list}" var="product" varStatus="vs">
            <tr onclick ="_edit(this)">
                <td>${productPageInfo.startRow + vs.count-1}</td>
                <td>${product.productNum}</td>
                <td>${product.name}</td>
                <td>
                    <img src="${product.imageUrl}" style="width: 50%">
                </td>
                <td id="storeMount_${product.productId}">${product.storeMount}</td>
                <td id="dealMount_${product.productId}">${product.dealMount}</td>
                <td id="badMount_${product.productId}">${product.badMount}</td>
                <td id="inventRemark_${product.productId}">${product.inventRemark}</td>
                <td style="width: 100px">
                    <input type="button" class="btn btn-xs btn-info" id="edit_${product.productId}" onclick ="_edit('${product.productId}')">
                        <span class="glyphicon glyphicon-pencil"></span> 编辑
                    </input>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination pagination-lg">

        <c:if test="${productPageInfo.isFirstPage}">
            <li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
        </c:if>

        <c:if test="${!productPageInfo.isFirstPage}">
            <li>
                <a href="admin/product/invent?keywords=${keywords}&page=${productPageInfo.prePage}">&laquo;</a>
            </li>
        </c:if>
        <c:forEach
                begin="${productPageInfo.pageNum < 6 ? 1 :productPageInfo.pageNum-5}"
                end="${productPageInfo.pages<6?productPageInfo.pages:(productPageInfo.pageNum < 6 ? 6 :productPageInfo.pageNum) }"
                var="current">
            <li
                    class="${(current == productPageInfo.pageNum) ? 'active':''}">
                <a href="admin/product/invent?keywords=${keywords}&page=${current}">
                        ${current}
                </a>
            </li>
        </c:forEach>

        <c:if test="${productPageInfo.isLastPage}">
            <li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
        </c:if>

        <c:if test="${!productPageInfo.isLastPage}">
            <li><a href="admin/product/invent?keywords=${keywords}&page=${productPageInfo.nextPage}">&raquo;</a>
            </li>
        </c:if>

        <li>
            <a href="admin/product/invent?keywords=${keywords}&page=${productPageInfo.pages}">末页</a>
        </li>

        <li><a href="javascript:void(0);">共${productPageInfo.pages}页</a></li>
        <li><a href="javascript:void(0);">共${productPageInfo.total}种</a></li>
    </ul>
</div>

</body>
</html>

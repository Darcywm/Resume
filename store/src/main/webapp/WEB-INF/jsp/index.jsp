<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${applicationScope.globalParameter.webName}</title>

    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="img/java.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bs.css"/>

</head>

<body>
<jsp:include page="header.jsp"/>
<div class="container" style="margin-top:10px ;">
    <div class="row" style="height: 800px;">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 sort" style="width: 17.5%;height: 100%;padding: 0;">
            <div id="sort_header">
                <span>生鲜分类</span>
            </div>
            <ul id="sort_ul">
                <li class="sort_li">
                    <a href="">特色食材</a>
                    <span class="sort_span">></span>
                </li>
                <c:forEach items="${productCategories}" var="productCat">
                    <li class="sort_li">
                        <a href="product/list?cateId=${productCat.cateId}">${productCat.name}</a>
                        <span class="sort_span">></span>
                    </li>
                </c:forEach>
                <li class="sort_li">
                    <span>所有店铺</span>
                </li>
                <c:forEach items="${stores}" var="store">
                    <li class="sort_li">
                        <a href="product/list?storeId=${store.storeId}">${store.storeName}</a>
                        <span class="sort_span">></span>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" style="width: 82.5%;height: 100%;">
            <!--
            <div id="myCarousel" class="carousel slide"> -->
                <!-- 轮播（Carousel）指标 -->
            <!--
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0"
                        class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                    <li data-target="#myCarousel" data-slide-to="4"></li>
                </ol> -->
                <!-- 轮播（Carousel）项目 -->
            <!--
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="img/lunbo1.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="img/lunbo2.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="img/lunbo3.jpg" alt="Third slide">
                    </div>
                    <div class="item">
                        <img src="img/lunbo4.jpg" alt="Third slide">
                    </div>
                    <div class="item">
                        <img src="img/lunbo5.jpg" alt="Third slide">
                    </div>
                </div>-->
                <!-- 轮播（Carousel）导航 -->
            <!--
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div> -->
            <div class="index_product_top">
                <span class="title">所有商品</span>
                <div class="div_hr"></div>
            </div>
            <div class="product_div">
                <ul class="product_ul">
                    <c:forEach items="${productPageInfo.list}"  var="productInfo">
                        <li class="product_li">
                            <a href="product/info/${productInfo.productId}" class="img" target="_blank">
                                <img src="${productInfo.imageUrl}"/>
                            </a>
                            <p class="name">
                                <a href="product/info/${productInfo.productId}">${productInfo.name}|${productInfo.remark}</a>
                            </p>
                            <p class="author">${productInfo.storeName}</p>
                            <p class="price">
                                <span class="rob">￥${productInfo.price}</span>
                                <span class="oprice">￥${productInfo.marketPrice}</span>
                            </p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <ul class="pagination pagination-lg">

                <c:if test="${productPageInfo.isFirstPage}">
                    <li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
                </c:if>

                <c:if test="${!productPageInfo.isFirstPage}">
                    <li>
                        <a href="admin/product/list?keywords=${keywords}&page=${productPageInfo.prePage}">&laquo;</a>
                    </li>
                </c:if>
                <c:forEach
                        begin="${productPageInfo.pageNum < 6 ? 1 :productPageInfo.pageNum-5}"
                        end="${productPageInfo.pages<6?productPageInfo.pages:(productPageInfo.pageNum < 6 ? 6 :productPageInfo.pageNum) }"
                        var="current">
                    <li
                            class="${(current == productPageInfo.pageNum) ? 'active':''}">
                        <a href="admin/product/list?keywords=${keywords}&page=${current}">
                                ${current}
                        </a>
                    </li>
                </c:forEach>

                <c:if test="${productPageInfo.isLastPage}">
                    <li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
                </c:if>

                <c:if test="${!productPageInfo.isLastPage}">
                    <li><a href="admin/product/list?keywords=${keywords}&page=${productPageInfo.nextPage}">&raquo;</a>
                    </li>
                </c:if>

                <li>
                    <a href="admin/product/list?keywords=${keywords}&page=${productPageInfo.pages}">末页</a>
                </li>

                <li><a href="javascript:void(0);">共${productPageInfo.pages}页</a></li>
                <li><a href="javascript:void(0);">共${productPageInfo.total}种</a></li>
            </ul>
        </div>
    </div>
</div>
</div>

<div style="height: 3px; background-color: #ff2832;margin-top: 80px"></div>

<jsp:include page="footer.jsp"/>
</body>

</html>
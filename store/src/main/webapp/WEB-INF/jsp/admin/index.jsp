<%--suppress ALL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>XX菜园后台管理系统</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bs.css"/>
</head>
<style>
    #left-menu {
        font-size: 13px;
        line-height: 18px;
        color: #fff;
    }

    #left-menu-main {
    }

    .left-menu-main-list {
        background-color: #0A0A0A;
    }

    .panel-body li:hover {
        background-color: #222222;
    }

    .panel-body a {
        display: inline-block;
        width: 218px;
        color: #fff;
        font-size: 20px;
        margin-top: 10px;
    }
</style>

<body>
<div id="header">
    <div id="header_inner">
        <ul id="header_ul">
            <li class="header_li">
                ${sessionScope.loginUser.username},欢迎您来到XX菜园后台管理系统
            </li>
            <li class="header_li">
                <a href="">返回首页</a>
            </li>
        </ul>
    </div>
</div>
<div id="center_header" style="height: 50px;border-bottom: 1px solid #CCCCCC;">
    <h2 class="h2" align="center">XX菜园后台管理系统</h2>
</div>
<div class="container" style="margin-top:10px ;">
    <div class="row" style="height: 800px;">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 sort" style="width: 17.5%;height: 100%;padding: 0;">
            <ul id="sort_ul">
                <li class="sort_li">
                    <shiro:hasPermission name="user-list">
                        <div class="panel panel-default left-menu-main-list">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseOne">
                                        <span class="glyphicon glyphicon-user"></span> 用户管理
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <a href="admin/user/list" target="centerFrame">用户列表</a>
                                        </li>
                                        <li>
                                            <a href="admin/user/toAddition" target="centerFrame">添加用户</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </shiro:hasPermission>
                </li>
                <li class="sort_li">
                    <shiro:hasAnyRoles name="admin,store-manager">
                        <div class="panel panel-default left-menu-main-list">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseTwo">
                                        <span class="glyphicon glyphicon-cloud"></span> 云店铺
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <a href="admin/store/list" target="centerFrame">店铺列表</a>
                                        </li>
                                        <li>
                                            <a href="admin/store/toAddition" target="centerFrame">添加店铺</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </shiro:hasAnyRoles>
                </li>
                <li class="sort_li">
                    <shiro:hasPermission name="privilege-manage">
                        <div class="panel panel-default left-menu-main-list">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseThree">
                                        <span class="glyphicon glyphicon-cog"></span> 角色权限
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <a href="admin/role/list" target="centerFrame">角色列表</a>
                                        </li>
                                        <li>
                                            <a href="admin/role/toAddition" target="centerFrame">添加角色</a>
                                        </li>
                                        <li>
                                            <a href="admin/privilege/list" target="centerFrame">权限管理</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </shiro:hasPermission>
                </li>
                <c:if test="${sessionScope.loginStore != null }">
                    <li class="sort_li">
                        <shiro:hasPermission name="store-manage">
                            <div class="panel panel-default left-menu-main-list">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseFour">
                                            <span class="glyphicon glyphicon-asterisk"></span> 我的店铺
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>

                                            <li>
                                                <a href="admin/store/${sessionScope.loginStore.storeId}" target="centerFrame">店铺信息</a>
                                            </li>
                                            <li>
                                                <a href="admin/product/list?page=1" target="centerFrame">我的商品</a>
                                            </li>
                                            <li>
                                                <a href="admin/product/toAddition" target="centerFrame">商品上新</a>
                                            </li>
                                            <li>
                                                <a href="admin/order/list" target="centerFrame">订单管理</a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default left-menu-main-list">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseFive">
                                            <span class="glyphicon glyphicon-list-alt"></span> 报表统计
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li>
                                                <a href="admin/report/views" target="centerFrame">访问量</a>
                                            </li>
                                            <li>
                                                <a href="admin/report/sales" target="centerFrame">销售量</a>
                                            </li>
                                            <li>
                                                <a href="admin/product/invent" target="centerFrame">库存</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </shiro:hasPermission>
                    </li>
                </c:if>
                <li class="sort_li">
                    <shiro:hasPermission name="personal-center">
                        <div class="panel panel-default left-menu-main-list">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseSix">
                                        <span class="glyphicon glyphicon-user"></span> 个人中心
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseSix" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <a href="admin/user/echo/${sessionScope.loginUser.userId}" target="centerFrame">我的信息</a>
                                        </li>
                                            <%--<li>
                                                <a href="admin/user/password" target="centerFrame">修改密码</a>
                                            </li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </shiro:hasPermission>
                </li>
                <li class="sort_li">
                    <div class="panel panel-default left-menu-main-list">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseSeven">
                                    <span class="glyphicon glyphicon-home"></span> 前往
                                </a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul>
                                    <li>
                                        <a href="index" target="_blank">前台首页</a>
                                    </li>
                                    <li>
                                        <a href="admin/center" target="centerFrame">后台首页</a>
                                    </li>
                                    <li>
                                        <a href="admin/user/logout" target="_top">注销</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" style=" width: 82.5%; height: 100%;">
            <iframe name="centerFrame" src="" border frameborder="no" scrolling="yes" style="width: 100%;height: 100%;"></iframe>
        </div>
    </div>
</div>
</div>
</body>
</html>

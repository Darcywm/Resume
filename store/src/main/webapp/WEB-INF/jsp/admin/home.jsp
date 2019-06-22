<%--suppress ALL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>XX菜园后台管理系统</title>
    <base href="<%=basePath%>">
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
<frameset cols="13%,*,12%" border frameborder="no">
    <frame name="leftFrame" src="admin/left"/>
    <frame name="centerFrame" src="admin/center"/>
    <frame name="rightFrame" src="admin/right" scrolling="no"/>
</frameset>

<noframes>
    <body>您的浏览器不支持框架！</body>
</noframes>
</html>

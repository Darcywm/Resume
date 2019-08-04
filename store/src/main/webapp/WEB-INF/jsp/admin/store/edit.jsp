<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑店铺</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="css/bs.css"/>
    <script type="text/javascript">

        $(function () {
            jQuery.validator.addMethod("isMobile", function(value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写手机号码");

            $("#storeForm").validate({
                //一失去焦点就校验
                onfocusout: function (element) {
                    $(element).valid();
                },
                errorPlacement: function (error, element) {	//错误信息位置设置方法
                    error.appendTo(element.parent().next());//这里的error是生成的错误对象，element是录入数据的对象,parent父元素，next()下一个
                },
                errorClass: "red",
                rules: {
                    storeName: {
                        required: true
                    },
                    storePhoneNum: {
                        required: true,
                        rangelength:[11,11],
                        isMobile:true
                    },
                    storeTelephone: {
                        number:true
                    },
                    storePosition: {
                        required: true
                    }
                },
                messages: {
                    storeName: {
                        required: "请输入店铺名字"
                    },
                    storePhoneNum: {
                        required: "请输入手机号码",
                        rangelength:"请输入{0}位的手机号码"
                    },
                    storeTelephone: {
                        number:"请输入正确的号码"
                    },
                    storePosition: {
                        required: "请输入地址"
                    }
                }
            });
        });
        function changImg(e){
            for (var i = 0; i < e.target.files.length; i++) {
                var file = e.target.files.item(i);
                if (!(/^image\/.*$/i.test(file.type))) {
                    continue; //不是图片 就跳出这一次循环
                }
                //实例化FileReader API
                var freader = new FileReader();
                freader.readAsDataURL(file);
                freader.onload = function(e) {
                    $("#weixinImg").attr("src",e.target.result);
                }
            }
        }
    </script>
</head>
<body style="overflow: scroll;overflow:hidden">
<div style="border: 1px solid #CCCCCC;padding-left:10px;">
    <div style="height:80px;border-bottom: 1px solid #CCCCCC;padding-top:10px;">
        <h3 class="h3">编辑店铺信息</h3>
    </div>
    <form class="form-horizontal" role="form" id="storeForm" method="post" action="admin/store/edit" enctype="multipart/form-data">
        <input type="hidden" name="storeId" value="${store.storeId}">
        <input type="hidden" name="storeManagerName" value="${store.storeManagerName}">
        <div class="form-group" style="padding-top:10px;">
            <label for="storeManagerName" class="col-sm-2 control-label">店主：</label>
            <div class="col-sm-5">
                <span id="storeManagerName">${store.storeManagerName}</span>
            </div>
        </div>
        <div class="form-group">
            <label for="storeName" class="col-sm-2 control-label">商店名称：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="storeName" name="storeName" value="${store.storeName}" placeholder="商店名称">
            </div>
            <span></span>
        </div>
        <div class="form-group">
            <label for="storePhoneNum" class="col-sm-2 control-label">手机号码：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="storePhoneNum" name="storePhoneNum" value="${store.storePhoneNum}" placeholder="手机号码">
            </div>
            <span></span>
        </div>
        <div class="form-group">
            <label for="storeTelephone" class="col-sm-2 control-label">固定电话：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="storeTelephone" name="storeTelephone" value="${store.storeTelephone}" placeholder="固定电话(选填)">
            </div>
            <span></span>
        </div>

        <div class="form-group">
            <label for="storePosition" class="col-sm-2 control-label">地址：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="storePosition" name="storePosition" value="${store.storePosition}" placeholder="地址">
            </div>
            <span></span>
        </div>

        <div class="form-group">
            <label for="created" class="col-sm-2 control-label" style="padding-left: 0">开店日期：</label>
            <div class="col-sm-5">
                <span id="created"><fmt:formatDate value='${store.created}' pattern='yyyy-MM-dd'/></span>
            </div>
            <span></span>
        </div>

        <div class="form-group">
            <label for="pictureFile" class="col-sm-2 control-label" style="padding-left: 0">微信收款码：</label>
            <div class="col-sm-5">
                <input type="file" id="pictureFile" name="pictureFile" onchange="changImg(event)">
                图片预览:<img alt="暂无图片" id="weixinImg" src="${store.weixinUrl}" height="100px",width="100px">
            </div>
            <span></span>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-5">
                <button type="submit" class="btn btn-lg btn-default">
                    保存修改
                </button>
                <span class="red">${saveMsg}</span>
            </div>

        </div>
    </form>
</div>
</body>
</html>

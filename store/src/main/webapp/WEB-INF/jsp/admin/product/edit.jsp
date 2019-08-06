<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="css/bs.css"/>
    <script type="text/javascript">

        $(function () {
            $("#bookForm").validate({
                //一失去焦点就校验
                onfocusout: function (element) {
                    $(element).valid();
                },
                errorPlacement: function (error, element) {	//错误信息位置设置方法
                    error.appendTo(element.parent().next());//这里的error是生成的错误对象，element是录入数据的对象,parent父元素，next()下一个
                },
                errorClass: "red",
                rules: {
                    productNum:{
                        required: true
                    },
                    name: {
                        required: true
                    },
                    price: {
                        required: true,
                        number:true
                    },
                    marketPrice: {
                        required: true,
                        number:true
                    },
                    storeMount: {
                        required: true,
                        number: true
                    },
                    productCategoryId: {
                        required: true
                    },
                    outline: {
                        required: true
                    },
                    productDesc: {
                        required: true
                    }
                },
                messages: {
                    productNum:{
                        required: "请输入编码"
                    },
                    name: {
                        required: "请输入名"
                    },
                    price: {
                        required: "请输入价格",
                        number: "必须是数字"
                    },
                    marketPrice: {
                        required: "请输入定价",
                        number: "必须是数字"
                    },
                    storeMount: {
                        required: "请输入定价",
                        number: "必须是数字"
                    },
                    productCategoryId: {
                        required: "请选择类别"
                    },
                    outline: {
                        required: "请填写商品概要"
                    },
                    productDesc: {
                        required: "请添加商品详情"
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
                    $("#myImg").attr("src",e.target.result);
                }
            }
        }
    </script>
</head>
<body style="overflow: scroll; overflow-x:hidden">
<div style="border: 1px solid #CCCCCC;padding-left:10px;">
    <div style="height:80px;border-bottom: 1px solid #CCCCCC;padding-top:10px;">
        <h3 class="h3">编辑商品</h3>
    </div>

    <form class="form-horizontal" role="form" id="bookForm" method="post" action="admin/product/update"
          enctype="multipart/form-data"  style="margin-top: 10px">
        <input type="hidden" name="storeId" value="${productInfo.storeId}">
        <input type="hidden" name="productId" value="${productInfo.productId}">
        <div class="form-group">
            <label for="productNum" class="col-sm-1 control-label">编码：</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="productNum" name="productNum" value="${productInfo.productNum}" placeholder="请输入编码">
            </div>
            <span class="col-sm-2"></span>
            <label for="price" class="col-sm-1 control-label">价格：</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="price" name="price" value="${productInfo.price}" placeholder="请输入价格">
            </div>
            <span class="col-sm-2"></span>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-1 control-label">菜名：</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="name" name="name" value="${productInfo.name}" placeholder="请输入菜名">
            </div>
            <span class="col-sm-2"></span>
            <label for="marketPrice" class="col-sm-1 control-label">定价：</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="marketPrice" value="${productInfo.marketPrice}" name="marketPrice" placeholder="请输入定价">
            </div>
            <span class="col-sm-2"></span>
        </div>

        <div class="form-group">
            <label for="storeMount" class="col-sm-1 control-label">库存：</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="storeMount" name="storeMount" value="${productInfo.storeMount}" placeholder="库存">
            </div>
            <span class="col-sm-2"></span>
            <label for="productCategoryId" class="col-sm-1 control-label" >分类：</label>
            <div class="col-sm-2">
                <select name="productCategoryId" id="productCategoryId" class="form-control">
                    <c:forEach items="${applicationScope.productCategories}" var="cate">
                        <option value="${cate.cateId}" ${cate.cateId == productInfo.productCategoryId?"selected":""}>${cate.name}</option>
                    </c:forEach>
                </select>
            </div>
            <span class="col-sm-2"></span>
        </div>
        <div class="form-group">
            <label for="pictureFile" class="col-sm-1 control-label" >图片：</label>
            <div class="col-sm-4">
                <input type="file" id="pictureFile" name="pictureFile" onchange="changImg(event)">
                图片预览:<img alt="暂无图片" id="myImg" src="${productInfo.imageUrl}" height="100px",width="100px">
            </div>
            <span class="col-sm-2"></span>
            <label for="remark" class="col-sm-1 control-label">备注：</label>
            <div class="col-sm-4">
                <textarea class="form-control" id="remark" name="remark"  placeholder="备注">${productInfo.remark}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="outline" class="col-sm-1 control-label">概述：</label>
            <div class="col-sm-5">
                 <textarea class="form-control" id="outline" name="outline" rows="4"
                           style="padding:0px">${productInfo.outline}</textarea>
            </div>
            <span></span>
        </div>
        <div class="form-group">
            <label for="productDesc" class="col-sm-1 control-label" style="padding: 0">商品详情：</label>
        </div>
        <!-- 加载编辑器的容器 -->
        <script id="productDesc" name="productDesc"  type="text/plain">
        </script>
        <div class="form-group">
            <div class="col-sm-5">
                <button type="submit" class="btn btn-lg btn-default" style="margin-top: 20px;">
                    保存修改
                </button>
            </div>
        </div>
    </form>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">

        /*UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function(action) {
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {
                return 'book/image/upload';
                    } else {
                        return this._bkGetActionUrl.call(this, action);
                    }
                }*/
        var ue = UE.getEditor('productDesc');

        //对编辑器的操作最好在编辑器ready之后再做
        ue.ready(function () {
            //设置编辑器的内容
            ue.setContent('${productDesc.productDesc}');
            ue.setHeight("180");
            //获取html内容，返回: <p>hello</p>
            var html = ue.getContent();
            //获取纯文本内容，返回: hello
            var txt = ue.getContentTxt();
        });
    </script>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>${goods.goods_name}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/objectDetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/object_nav.css" type="text/css">
</head>
<body>
<jsp:include page="object_nav.jsp"></jsp:include>
<div class="buyticket">
    <form action="${pageContext.request.contextPath}/order">
        <input type="text" name="id" style="display: none" value="${goods.id}">
        <div class="whole-detail-info-wrapper">
            <img class="detail-img-icon no_pic" src="${goods.pic}">

            <div class="detail-info-wrapper">
                <div class="product-info-name">
                    <span class="title1">${goods.goods_name}</span>
                </div>
                <div class="product-info-time-wrapper">
                    <div class="product-info-time-title">时间：</div>
                    <div class="product-info-time">${goods.date}</div>
                </div>
                <div class="vuene-wrapper">
                    <div class="title">场馆：</div>
                    <div class="vuene-info-content">
                        <div class="vuene-name">${goods.details}</div>
                        <div class="address-icon"></div>
                    </div>
                </div>
                <!---->
                <div class="login-show-wrapper">
                    <ul class="clearfix">
                        <li class="title">价格：</li>
                        <li class="tickets">
                            <div class="selectable-option ">
                                ¥${goods.price}
                            </div>
                        </li>
                    </ul>
                    <ul class="clearfix">
                        <li class="title">数量：</li>
                        <li class="num-content">
                            <div class="ticket-count">
                                <div class="count-reduce  "></div>
                                <div class="count-number">
                                    <input id="number" name="number" type="text" style="border: 0" value="1" readonly="readonly" class="count-number">
                                    <input style="display: none" id="stock" value="${goods.stock}">
                                </div>
                                <div class="count-plus "></div>
                            </div>
                        </li>
                    </ul>
                    <!---->
                    <div class="product-buy-wrapper">
                        <div class="product-buy enable">
                            <div id="submit">立即购票</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $(".order").mouseover(function() {
            $(".order-icon").css("background-image", "url(images/order1.png)");
        });
        $(".order").mouseout(function() {
            $(".order-icon").css("background-image", "url(images/order.png)");
        });
    });
    $("#submit").click(function () {
        if(${user==null}){
            alert("请先登录");
        }
        else {

            $("form").submit();
        }
    });
    $(".count-reduce").click(function () {
        var number = $("#number").val();
        var stock = $("#stock").val();
        if(number==1){
            $(this).prepend("<style>.count-reduce::before{background-image: url('images/0.png')}</style>");
        }else {
            number=parseInt(number);
            $("#number").val(number-1);
        }
    });
    $(".count-plus").click(function () {
        var stock = $("#stock").val();
        var number = $("#number").val();
        number=parseInt(number);
        if(stock==number){
            $(this).prepend("<style>.count-reduce::before{background-image: url('images/2.png')}</style>");
        }else {
            $("#number").val(number+1);
        }
    });
</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/object_nav.css" type="text/css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="object_nav.jsp"></jsp:include>
<!--cart-items-->
<div class="cart-items" style="position: relative;top: 69px;">
    <div class="container">
        <h2>我的订单</h2>
        <table>
            <tr>
                <th width="8%">商品单号</th>
                <th width="24%">商品详情</th>
                <th width="10%">总价</th>
                <th width="16%">收货信息</th>
                <th width="10%">订单状态</th>
                <th width="10%">支付方式</th>
                <th width="18%">下单时间</th>
                <th width="20%"></th>
            </tr>

            <c:forEach items="${orderList }" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>
                        <p>${order.goods.goods_name}(${order.goods.price }) x ${order.number}</p>
                    </td>
                    <td><p>${order.total }</p></td>
                    <td>
                        <p>${order.name}&nbsp&nbsp${order.phone}</p>
                    </td>
                    <td>
                        <p>
                            <c:if test="${order.status==2 }"><span style="color:red;">已付款</span></c:if>
                            <c:if test="${order.status==3 }"><span style="color:green;">已发货</span></c:if>
                            <c:if test="${order.status==4 }"><span style="color:black;">已完成</span></c:if>
                        </p>
                    </td>
                    <td>
                        <p>
                            <c:if test="${order.paytype==2 }">微信</c:if>
                            <c:if test="${order.paytype==1 }">支付宝</c:if>
                        </p>
                    </td>
                    <td><p>${order.timeForm }</p></td>
                    <td> <button class="comfirm btn btn-danger" <c:if test="${order.status==4}">style="visibility: hidden" </c:if>>确定收货</button></td>
                </tr>
            </c:forEach>

        </table>

    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<script>
    $(function () {
        $(".comfirm").click(function () {
            var data={"id":$(this).parent().parent().children().eq(0).text(),"status":4};
            $.post("/orderComfirm",data,function(data){
                if(data.code==100){
                    alert("收货成功");
                    window.location.reload();
                }else{
                    alert(data.message)
                }
            });
        });
    });
</script>
</body>
</html>

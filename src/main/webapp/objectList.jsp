<%@ page import="lombok.val" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>会员购</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/objectList.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/object_nav.css" type="text/css">
</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/object_nav.jsp"></jsp:include>

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="images/1980x300cv1602656243143.jpeg" alt="First slide">
        </div>
        <div class="item">
            <img src="images/2banner21602674858341.jpeg" alt="Second slide">
        </div>
    </div>
</div>

<c:if test="${goods!=null}">
    <div class="project-list-wrapper">
    <c:forEach items="${goods}" var="item">
        <form action="${pageContext.request.contextPath}/detail/${item.id}">
            <div class="project-list">
                <div class="item-list">
                    <img class="item-list-img" style="display: block" src="${item.pic}">
                    <div class="item-list-detail">
                        <div class="item-list-title" style="-webkit-box-orient: vertical;" >
                               ${item.goods_name}
                        </div>
                        <div class="item-list-time">
                            <span class="icon time-icon"></span>
                               ${item.date}
                        </div>
                        <div class="project-list-item-address">
                            <span class="icon address-icon"></span>
                            <span class="venue-name-and-address">${item.details}</span>
                        </div>
                        <div class="project-list-item-price">
							<span class="price">
                                    ${item.price}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </c:forEach>
    </div>
</c:if>
<jsp:include page="${pageContext.request.contextPath}/foot.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script>
    $("#myCarousel").carousel({interval: 2000});
    $(document).ready(function(){
        $(".item-list").mouseover(function(){
            $(this).children(":first").css("transform", "translate(0, -5px)");

        });
        $(".item-list").mouseout(function(){
            $(this).children(":first").css("transform", "translate(0, 1px)");

        });
    });
    $(".project-list").click(function () {
        $(this).parent().submit();
    });
</script>
</body>
</html>

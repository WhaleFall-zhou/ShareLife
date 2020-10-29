<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/artileTotal.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css" type="text/css">
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div class="tab-content">
    <div class="nav-tab-bar scroll">
        <a href="${pageContext.request.contextPath}/home/video/0" target="_self" class="tab-item " data-tab-id="0">
            <span>推荐</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/video/1" target="_self" class="tab-item  " data-tab-id="1">
            <span>生活</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/video/2" target="_self" class="tab-item  " data-tab-id="2">
            <span>兴趣</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/video/3" target="_self" class="tab-item  " data-tab-id="3">
            <span>影视</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/video/4" target="_self" class="tab-item  " data-tab-id="4">
            <span>游戏</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/video/5" target="_self" class="tab-item  " data-tab-id="5">
            <span>动画</span>
        </a>
    </div>
    <div class="page-content">
        <c:forEach items="${works}" var="item">
            <div class="rank-video-card">
                <div class="video-card">
                    <div class="video-card__content">
                        <a href="${pageContext.request.contextPath}/read/video/${item.id}" target="_blank" class="cover-picture">
                            <img src="${item.cover_pic}" alt="${item.title}" class="cover-picture__image">
                        </a>
                        <div class="">
                            <span class="wl-tips" style="left: -21px; display: none;"></span>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/read/video/${item.id}" target="_blank" class="video-name">
                        ${item.title}
                    </a>
                    <div class="tags">
                        <span class="so-icon time">
                            <i class="icon-date"></i>
								${item.timeForm}
							</span>
                        <span class="so-icon">
                            <i class="icon-uper"></i>
								${item.user.username}
                        </span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $("a[ data-tab-id='${label}']").prepend("<style>.tab-item[data-tab-id='${label}']::before{background-image:url(${pageContext.request.contextPath}/images/abc${label}b.png)}</style>");
        $("a[ data-tab-id='${label}']").css("color","#00a1d6");
    });
    $(".like").click(function () {
        if(${user==null}){
            alert("请现登录");
        }else {
            var vid = $(this).next().val();
            var num1;

            $.ajax({
                url: "${pageContext.request.contextPath}/click",
                data: {"vid":vid,"type":1},
                dataType:"json",
                async: false,
                cache: false,
                success:function (result) {
                    num1=result.extend.num;
                }
            });
            console.log(num1);
            $(this).find("span").html(num1);
        }
    });
</script>
</body>
</html>

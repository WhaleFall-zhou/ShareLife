<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/result.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css" type="text/css">
</head>
<body>
    <jsp:include page="nav.jsp"></jsp:include>
    <div class="bodycontain">
        <c:forEach items="${work}" var="item">
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

    <jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
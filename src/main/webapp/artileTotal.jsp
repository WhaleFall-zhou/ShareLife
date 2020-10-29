<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>论坛</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/artileTotal.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css" type="text/css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/nav.jsp"></jsp:include>
<div class="tab-content">
    <div class="nav-tab-bar scroll">
        <a href="${pageContext.request.contextPath}/home/artile/0" target="_self" class="tab-item " data-tab-id="0">
            <span>推荐</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/artile/1" target="_self" class="tab-item  " data-tab-id="1">
            <span>生活</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/artile/2" target="_self" class="tab-item  " data-tab-id="2">
            <span>兴趣</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/artile/3" target="_self" class="tab-item  " data-tab-id="3">
            <span>影视</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/artile/4" target="_self" class="tab-item  " data-tab-id="4">
            <span>游戏</span>
        </a>
        <a href="${pageContext.request.contextPath}/home/artile/5" target="_self" class="tab-item  " data-tab-id="5">
        <span>动画</span>
        </a>
    </div>
    <div class="page-content">
        <div class="left-side">
            <div class="article-item item-tp-4" >
                    <c:forEach items="${works}" var="item">
                        <div class="item-holder">
                            <div class="article-content" id="${item.id}">
                                <div class="article-left-block">
                                    <a href="${pageContext.request.contextPath}/read/artile/${item.id}" target="_blank" class="article-title-holder">
                                        <span class="article-title">${item.title}</span>
                                    </a>
                                    <div class="article-desc">${item.introduction}</div>
                                    <div class="article-info-bar">
                                        <a href="#" target="_blank" class="up-content">
										<span class="face-holder">
											<img src="${item.user.pic}" class="face-img">
										</span>
                                            <span class="nick-name">${item.user.username}</span>
                                        </a>

                                        <span class="like">
                                            <span>${item.focus}</span>
                                        </span>
                                        <input type="text" value="${item.id}" style="display: none">
                                        <a href="${pageContext.request.contextPath}/read/artile/${item.id}" target="_blank">
                                            <span class="reply">${item.commentNum}</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="cover-img">
                                    <a href="${pageContext.request.contextPath}/read/artile/${item.id}" target="_blank">
                                        <div class="cover-image loaded" style="background-image: url(${item.cover_pic});">
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
            </div>
        </div>
        <div class="right-side scroll" style="position: fixed;">
            <div class="search-module">
                <div class="search-block">
                    <input placeholder="搜索专栏文章">
                    <div class="search-icon"></div>
                </div>
            </div>
            <div class="rank-module">
                <div class="rank-tabs-bar">
                    <label>排行榜</label>
                </div>
                <ul class="rank-list">
                    <c:if test="${Ranking!=null}">
                        <c:forEach items="${Ranking}" var="item" varStatus="num" >
                            <li class="item">
                                <span class="rank-index">${num.count}</span>
                                <a href="${pageContext.request.contextPath}/read/artile/${item.id}" target="_blank">${item.title}</a>
                            </li>
                        </c:forEach>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="${pageContext.request.contextPath}/foot.jsp"></jsp:include>
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

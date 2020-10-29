<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>${work.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/videDetail.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css" type="text/css">
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div class="tab-content" style="padding-left: 59px;">
    <div class="page-content" style="padding-top: 0;">
        <div class="l-con">
            <div id="viewbox_report" class="video-info report-wrap-module report-scroll-module" scrollshow="true">
                <h1 class="video-title">
                    <span class="tit tr-fix">${work.title}</span>
                </h1>
                <div class="video-data">
                    <span>${work.timeForm}</span>
                </div>
            </div>
            <div class="player-video">
                <video controls="controls" style="width: 810px;height:447px;">
                    <source src="${work.content}" type="video/mp4" style="width: 100%;">
                </video>
            </div>
            <div id="v_desc" class="video-desc report-wrap-module report-scroll-module" scrollshow="true">
                <div class="tip-info">
                    <span class="copyright">
                        ${work.introduction}
                    </span>
                </div>
            </div>
        </div>
        <div class="r-con">
            <div class="up-info-block">
                <a class="up-face-holder " href="#" target="_blank">
                    <img class="up-face-image" src="${work.user.pic}">
                </a>
                <div class="up-info-right-block">
                    <div class="row">
                        <a class="up-name" href="#" target="_blank">${work.user.username}</a>
                        <div class="row-2">
                            <span class="like" data-type="1">
                                <i></i>
                                <span class="view-num">${work.focus}</span>
                            </span>
                            <input type="text" value="${work.id}" style="display: none">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bb-comment" style="width: 660px;">
        <c:if test="${user==null}">
            <div style="color: #99a2aa;font-size: 34px;">评论不可见，请先登录</div>
        </c:if>
        <c:if test="${user!=null}">
            <div class="b-head comment-title-block">
                <span class="b-head-t comment-results" style="display: inline;"></span>
                <span class="b-head-t">评论</span>
            </div>
            <div class="comment-holder" style="position: relative;">
                <div class="bb-comment" style="border-top: 1px solid #e5e9ef;">
                    <div class="comment-send " id="boder" data-work-mid="${work.id}">
                        <div class="user-face">
                            <img class="user-head" src="${user.pic}">
                        </div>
                        <div class="textarea-container">
                            <textarea cols="80" name="msg" rows="5" placeholder="发条友善的评论" class="ipt-txt"></textarea>
                            <button type="submit" class="comment-submit">发表评论</button>
                        </div>
                    </div>
                    <div class="comment-list ">
                        <c:if test="${commentList!=null}">
                            <c:forEach items="${commentList}" var="item">
                                <div class="list-item reply-wrap " data-index="0" scrollshow="true">
                                    <div class="user-face">
                                        <a href="#" target="_blank">
                                            <img src="${item.user.pic}" alt=""></a></div>
                                    <div class="con ">
                                        <div class="user">
                                            <a  href="#" target="_blank" class="name ">${item.user.username}</a>
                                        </div>
                                        <p class="text">${item.content}</p>
                                        <div class="info">
                                            <span class="time">${item.timeForm}</span>
                                            <span class="like" data-type="2">
                                                    <i></i>
                                                <span>${item.focus}</span>
                                            </span>
                                            <input type="text" value="${item.id}" style="display: none">
                                            <span class="reply btn-hover" name="0">回复</span>
                                        </div>
                                        <div class="reply-box"></div>
                                        <div class="paging-box" style="margin-bottom: 4px;"></div>
                                        <c:if test="${item.replyList!=null}">
                                            <c:forEach items="${item.replyList}" var="replay">
                                                <div class="list-item reply-wrap " data-index="0" scrollshow="true">
                                                    <div class="user-face">
                                                        <a href="#" target="_blank">
                                                            <img src="${replay.user.pic}" alt="">
                                                        </a>
                                                    </div>
                                                    <div class="user">
                                                        <a  href="#" target="_blank" class="name ">${replay.user.username}</a>
                                                    </div>
                                                    <p class="text">${replay.content}</p>
                                                    <div class="info">
                                                        <span class="time">${replay.timeForm}</span>
                                                        <span class="like" data-type="3">
                                                                <i></i>
                                                                <span>${replay.focus}</span>
                                                            </span>
                                                        <input type="text" value="${replay.id}" style="display: none">
                                                    </div>
                                                    <div class="reply-box"></div>
                                                    <div class="paging-box" style="margin-bottom: 4px;"></div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                 </div>
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $("a[ data-tab-id='${label}']").prepend("<style>.tab-item[data-tab-id='${label}']::before{background-image:url(${pageContext.request.contextPath}/images/abc${label}b.png)}</style>");
        $("a[ data-tab-id='${label}']").css("color","#00a1d6");
    });
    $(".like").click(function () {
        if(${user==null}){
            alert("请现登录");
        }else{
            var type = $(this).attr("data-type");
            var vid = $(this).next().val();
            var html = $(this).find("span").html();
            var num1;
            $.ajax({
                url: "${pageContext.request.contextPath}/click",
                data: {"vid":vid,"type":type},
                dataType:"json",
                async: false,
                cache: false,
                success:function (result) {
                    num1=result.extend.num;
                }
            });
            html=parseInt(html);
            num1=parseInt(num1);
            if(html<num1){
                $(this).find("i").css("background-position"," -154px -89px");
            }else{
                $(this).find("i").css("background-position"," -153px -25px");
            }
            $(this).find("span").html(num1);
        }
    });

    $(".reply").click(function(){
        var is=$(this).attr("name");
        var id = $(this).prev().val();
        if(is=="0"){
            var e = document.getElementById("boder");
            var div = document.createElement("div");
            div.className = "comment-send ";
            $(div).attr("data-work-mid",id);
            div.innerHTML = e.innerHTML;
            $(div).find("button").attr("onclick","reply(this)");
            var f=$(this).parent().next();
            f.after(div);
            $(this).attr("name","1");
        }else{
            $(this).parent().next().next().remove();
            $(this).attr("name","0");
        }
    });
    var button = $("#boder").find("button");
    $(button).click(function () {
        var content = $(this).prev().val();
        $.ajax({
            url: "${pageContext.request.contextPath}/comment/comment",
            data: {"content":content,"id":${work.id}},
            dataType:"json",
            async: false,
            cache: false,
            success:function (result) {
                if(result.code==100){
                    alert("评论成功");
                    window.location.reload();
                }
            },
            error:function (result) {
                alert("评论失败");
            }
        });
    });
    function reply (event){
        var content = $(event).prev().val();
        var comment_id = $(event).parent().parent().attr("data-work-mid");
        $.ajax({
            url: "${pageContext.request.contextPath}/comment/replay",
            data: {"content":content,"id":comment_id},
            dataType:"json",
            async: false,
            cache: false,
            success:function (result) {
                if(result.code==100){
                    alert("评论成功");
                    window.location.reload();
                }
            },
            error:function (result) {
                alert("评论失败");
            }
        });
    }


</script>
</body>
</html>

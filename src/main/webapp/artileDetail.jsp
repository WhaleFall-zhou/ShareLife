<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>${work.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/artuleDetail.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.preview.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css" type="text/css">
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
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
            <div class="head-container">
                <div class="banner-img-holder" style="background-image: url(${work.cover_pic});"></div>
                <div class="bangumi-rating-container"></div>
                <div class="title-container">
                    <h1 class="title">${work.title}</h1>
                    <div class="info">
                        <span class="create-time">${work.timeForm}</span>
                    </div>
                </div>
            </div>
            <div class="content editormd-preview-theme" id="test-editormd">
                <textarea style="display:none;" >${content}</textarea>
            </div>
        </div>
        <div class="right-side scroll" style="position: fixed;">
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
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/editormd.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/jquery.flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/editormd.js"></script>
<script>
    $(document).ready(function () {
        $("a[ data-tab-id='${label}']").prepend("<style>.tab-item[data-tab-id='${label}']::before{background-image:url(${pageContext.request.contextPath}/images/abc${label}b.png)}</style>");
        $("a[ data-tab-id='${label}']").css("color","#00a1d6");
    });
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("test-editormd", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true,
        });});
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

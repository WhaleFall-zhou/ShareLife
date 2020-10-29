<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <title>发表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editor_page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"></jsp:include>

    <div class="total">
        <div class="confirmorder-container">
            <div>
                <ul class="breadcrumb ">
                    <li><a href="${pageContext.request.contextPath}/show" class="nav1">专栏投稿</a></li>
                    <li><a href="${pageContext.request.contextPath}/showViedo" class="nav1">视频投稿</a></li>
                </ul>
            </div>
            <form method="post" enctype="multipart/form-data" >
                <div>
                    <div class="input-group default-title">
                        <span class="input-group-addon title">标题</span>
                        <input type="text" class="form-control" id="title-input" name="title">
                    </div>
                </div>
                <div id="test-editormd">
                    <textarea id="content" name="content" style="display:none;"></textarea>
                </div>

                <div style="display: flex;padding-bottom: 35px;">
                    <textarea class="text" placeholder="描述" name="introduction" id="describe"></textarea>
                    <div class="image">
                        <input type="file" name="pic" id="pic"/>
                        <img src="" style="visibility: hidden;width: 151px;height: 151px;object-fit: contain;" id="show-pic">
                    </div>
                </div>
                <div class="type">
                    <c:if test="${label!=null}">
                        <c:forEach items="${label}" var="item">
                            <div class="labelt">
                                <input type="radio" value="${item.id}" name="label_id"/><span class="tip">${item.label_name}</span>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div class="button">
                    <input class="btn btn-success submit" type="button" value="返回" onclick="window.history.go(-1)"/>
                    <input class="btn btn-danger submit" type="button" id="submit" value="发布"/>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/foot.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/editormd.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        var testEditor;
        $(function() {
            testEditor = editormd("test-editormd", {
                width: "100%",
                height: 500,
                syncScrolling: "single",
                path: "${pageContext.request.contextPath}/static/lib/", //依赖lib文件夹路径
                emoji: true,
                taskList: true,
                tocm: true,
                imageUpload: true,
                toolbarAutoFixed:true,//工具栏自动固定定位的开启与禁用
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "${pageContext.request.contextPath}/uploadfile",
            });
        });
        $("#pic").change(function () {
            var file = document.getElementById("pic").files[0];
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function(e){
                var pic = document.getElementById("show-pic");
                $("#show-pic").css("visibility","visible");
                pic.src=this.result;
            }
        });
        $("#submit").click(function () {
            var content = $("#content").val();
            var pic = document.getElementById("pic").files[0];
            var title = $("input[name='title']").val();
            var label_id=$("input[name='label_id']:checked").val();
            var introduction = $("#describe").val();
            var formData = new FormData();
            formData.append("content",content);
            formData.append("pic",pic);
            formData.append("title",title);
            formData.append("label_id",label_id);
            formData.append("introduction",introduction);
            $.ajax({
                url: '${pageContext.request.contextPath}/artile',
                type: 'POST',
                data: formData,
                async: true,
                cache: false,
                contentType: false,
                processData: false,
                success:function (result) {
                    if(result.code==100){
                        alert("上传成功");
                    }else {
                        alert("上传失败")
                    }
                    formData.delete("content");
                    formData.delete("pic");
                    formData.delete("title");
                    formData.delete("label_id");
                    formData.delete("introduction");
                    window.location.reload();
                },
                error: function (returndata) {
                    alert('上传失败!')  //可以替换为自己的方法
                }
            });
        });


    </script>
</body>
</html>


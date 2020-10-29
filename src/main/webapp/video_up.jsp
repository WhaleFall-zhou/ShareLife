<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>视频投稿</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
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

        <div>
            <div class="input-group default-title">
                <span class="input-group-addon title">标题</span>
                <input type="text" class="form-control" id="title-input" name="title">
            </div>
        </div>
        <div class="video">
            <a href='#' onclick='clearAll()' style='position:absolute;bottom:10px;right:30px;'>清空所有</a>
            <div id="tip">需要一张图片做视频的封面，拖拽到此处上传</div>
            <div name= "image"  id= "dropbox"  style= "min-width:300px;min-height:100px;border:2px dashed silver;" >
                <table class="table">
                    <tbody class="tbody"></tbody>
                </table>
            </div>
        </div>
        <div style="display: flex;padding-bottom: 35px;">
            <textarea class="text" style="width: 100%;height: 162px;" placeholder="描述描述作品吧" name="introduction"></textarea>
            <!-- <div class="image">
                <input type="file" />
            </div> -->
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
            <button class="btn btn-danger submit" onclick="upload()">上传</button>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    //利用html5 FormData() API,创建一个接收文件的对象，因为可以多次拖拽，这里采用单例模式创建对象Dragfiles
    var Dragfiles=(function (){
        var instance;
        return function(){
            if(!instance){
                instance = new FormData();
            }
            return instance;
        }
    }());
    FormData.prototype.deleteAll=function () {
        var _this=this;
        this.forEach(function(value,key){
            _this.delete(key);
        })
    }
    //添加拖拽事件
    var dz = document.getElementById('dropbox');
    dz.ondragover = function (ev) {

        $("#tip").css("display","none");


        //阻止浏览器默认打开文件的操作
        ev.preventDefault();
        //拖入文件后边框颜色变红
        this.style.borderColor = 'red';
    }

    dz.ondragleave = function () {
        //恢复边框颜色
        this.style.borderColor = '#c0c0c0';
    }
    dz.ondrop = function (ev) {
        //恢复边框颜色
        this.style.borderColor = '#c0c0c0';
        //阻止浏览器默认打开文件的操作
        ev.preventDefault();
        var files = ev.dataTransfer.files;
        var len=files.length,
            i=0;
        var frag=document.createDocumentFragment();  //为了减少js修改dom树的频度，先创建一个fragment，然后在fragment里操作
        var tr,time,size;
        var newForm=Dragfiles(); //获取单例
        var it=newForm.entries(); //创建一个迭代器，测试用

        while(i<len){
            tr=document.createElement('tr');
            //获取文件大小
            size=Math.round(files[i].size * 100 / 1024) / 100 + 'KB';
            //获取格式化的修改时间
            time = files[i].lastModifiedDate.toLocaleDateString() + ' '+files[i].lastModifiedDate.toTimeString().split(' ')[0];
            tr.innerHTML='<td>'+files[i].name+'</td><td>'+time+'</td><td>'+size+'</td><td>删除</td>';
            console.log(size+' '+time);
            frag.appendChild(tr);
            //添加文件到newForm
            newForm.append("files",files[i]);
            //console.log(it.next());
            i++;
        }


        this.childNodes[1].childNodes[1].appendChild(frag);
        //为什么是‘1’？文档里几乎每一样东西都是一个节点，甚至连空格和换行符都会被解释成节点。而且都包含在childNodes属性所返回的数组中.不同于jade模板
    }
    function blink()
    {
        document.getElementById('dropbox').style.borderColor = '#c0c0c0';
    }
    // 用事件委托的方法为‘删除’添加点击事件，使用jquery中的on方法
    $(".tbody").on('click','tr td:last-child',function(){
        //删除拖拽框已有的文件
        var temp=Dragfiles();
        var key=$(this).prev().prev().prev().text();
        console.log(key);
        temp.delete(key);
        temp.delete("introduction");
        temp.delete("title");
        temp.delete("label_id")
        $(this).parent().remove();
        var t=$(this).val();
        if(t==""){
            $("#tip").css("display","block");
        }
    });
    function clean() {
        var temp=Dragfiles();
        temp.delete("introduction");
        temp.delete("title");
        temp.delete("label_id")
    }
    //清空所有内容
    function clearAll(){
        if(document.getElementsByTagName('tbody')[0].hasChildNodes()==false){
            document.getElementById('content').style.borderColor = 'red';
            setTimeout(blink,300);
            return false;
        }
        var data=Dragfiles();
        data.deleteAll(); //清空formData
        //$('.tbody').empty(); 等同于以下方法
        document.getElementsByTagName('tbody')[0].innerHTML='';
        $("#tip").css("display","block");
    }
    //ajax上传文件
    function upload(){
        if(document.getElementsByTagName('tbody')[0].hasChildNodes()==false){
            document.getElementById('content').style.borderColor = 'red';
            setTimeout(blink,200);
            return false;
        }
        var data=Dragfiles(); //获取formData
        var introduction=$("textarea").val();
        var title=$("input[name='title']").val();
        var label_id=$("input[name='label_id']:checked").val();
        data.append("title",title);
        data.append("label_id",label_id);
        data.append("introduction",introduction);
        $.ajax({
            url: '${pageContext.request.contextPath}/vedio',
            type: 'POST',
            data: data,
            async: true,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
               if(data.code==100){
                   alert("上传成功");
               }else {
                   alert("上传失败")
               }
                clean();//清空formData
                window.location.reload();
                $('.tbody').empty(); //清空列表
            },
            error: function (returndata) {
                alert('上传失败!')  //可以替换为自己的方法
            }
        });
    }
</script>
</body>
</html>

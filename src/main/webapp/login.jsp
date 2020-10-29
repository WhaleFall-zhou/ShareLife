<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
</head>

<body>
    <div class="content">
        <div class="form sign-in">
            <h2>欢迎回来</h2>
            <form  method="post" action="${pageContext.request.contextPath}/login">
                <label>
                    <input type="text" name="username" placeholder="用户名"/>
                </label>
                <label>
                    <input type="password"  name="password" placeholder="密码"/>
                </label>
                <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
                <button id="submit-btn"type="submit" class="submit">登 录</button>
            </form>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，发现大量机会！</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p>有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <div class="form sign-up">
                <h2>立即注册</h2>
                <form>
                    <label>
                        <input type="text" name="username" placeholder="用户名"/>
                    </label>
                    <label>
                        <input type="email" name="email"placeholder="邮箱"/>
                    </label>
                    <label>
                        <input type="password" name="password"placeholder="密码"/>
                    </label>
                    <label>
                        <input type="text" placeholder="验证码" class="code" name="code" id="code"/>
                        <input type="button" value="获取验证码" class="submit default_btn" style="margin: 0;" id="buttons-send"/>
                    </label>
                    <button type="submit" class="submit" id="submit">注 册</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.querySelector('.img__btn').addEventListener('click', function() {
            document.querySelector('.content').classList.toggle('s--signup')
        })
        $("#buttons-send").click(function () {
            var email = $("input[name='email']").val();
            $.ajax({
                async:false,
                cache:false,
                url:"${pageContext.request.contextPath}/sendCode?email="+email,
                type:"GET",
                success:function (result) {
                    if(result.code==100){
                        alert("验证码发送成功，请注意查收");
                    }else
                    {
                        alert("错误");
                    }
                },
            });
        });
        $("#submit").click(function () {
            var username=[];
            $("input[name='username']").each(function () {
                username.push($(this).val());
            });
            var email = $("input[name='email']").val();
            var password=[]
            $("input[name='password']").each(function () {
                password.push($(this).val());
            });
            var code=$("#code").val();
            $.ajax({
                async: false,
                cache: false,
                url: "${pageContext.request.contextPath}/register/"+code,
                type:"GET",
                data:{
                    "username":username[1],"password":password[1],"email":email
                },
                dataType:"json",
                success:function (result) {
                    if(result.code==100){
                        alert("注册成功");
                    }else {
                        alert("注册失败,验证码错误");
                    }
                }
            });
        });
    </script>
</body>
</html>

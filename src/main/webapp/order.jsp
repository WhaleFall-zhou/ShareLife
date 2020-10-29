<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/object_nav.css" type="text/css">
</head>
<body>
    <jsp:include page="object_nav.jsp"></jsp:include>
        <div class="detail-content-wrapper">
            <div class="confirmorder-container">
                <h1>订单信息</h1>
                <div class="project-info">
                    <table>
                        <tbody>
                        <tr>
                            <th>商品</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>合计</th>
                        </tr>
                        <tr>
                            <td>
                                <div class="project-conten">
                                    <div class="content-left">
                                        <img src="${order.goods.pic}" />
                                    </div>
                                    <div class="content-right">
                                        <h1>${order.goods.goods_name}</h1>
                                        <p>${order.goods.details}</p>
                                        <p class="ticket-name">
                                            <span>${order.goods.date}</span>
                                        </p>
                                    </div>

                                </div>
                            </td>
                            <td>
                                <div>￥${order.goods.price}</div>
                            </td>
                            <td>
                                <div>${order.number}张</div>
                            </td>
                            <td class="total">
                                <p>￥${order.total}</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <form>
                <section class="contact-block">
                    <div class="info-title">
                        <span class="title-text">联系人</span>
                        <span class="title-tip">用于接受项目重要通知</span>
                    </div>
                    <div class="info-content">
                        <div class="content-prop">
                            <span class="input-prop">姓名</span>
                            <div class="input-value-wrapper">
                                <input type="text" placeholder="请输入联系人姓名" class="input-value" name="name"/>
                            </div>
                        </div>

                    </div>
                    <div class="content-prop" style="    margin-top: 16px;">
                        <span class="input-prop">手机号码</span>
                        <div class="input-value-wrapper">
                            <input type="text" placeholder="请输入联系人手机号" class="input-value" name="phone"/>
                        </div>
                    </div>
                </section>
                </form>
                <div class="total-container clearfix">
                    <div>
                        商品总额
                        <span>￥${order.total}</span>
                    </div>
                    <div>
                        应付金额
                        <span class="total" style="color: #ff66a2;">￥${order.total}</span>
                    </div>
                </div>
                <div class="channel-wrapper">
                    <div class="channel-tip">选择平台</div>
                    <div class="channels">
                        <div class="pay-channel" id="alipay">
                            <div class="channel-content">
                                <div class="channel-logo" style="background-image:url(images/02d1b0d0121a485a975264358b4b7d4e.png);"></div>
                                <div class="channel-name">支付宝</div>
                            </div>
                            <div class="selet-icon"></div>
                            <div class="coupon-img"></div>
                        </div>
                    </div>
                    <div class="channels">
                        <div class="pay-channel" id="weChat">
                            <div class="channel-content">
                                <div class="channel-logo" style="background-image:url(images/6e27f61e97f6d6a14a257d8613989d7e.png);"></div>
                                <div class="channel-name">微信</div>
                            </div>
                            <div class="selet-icon"></div>
                            <div class="coupon-img"></div>
                        </div>
                    </div>
                </div>
                <div class="comfirm-bottom">
                    <div class="button" id="submit">下一步支付，￥${order.total}</div>
                </div>
            </div>
        </div>

    <jsp:include page="foot.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var name = $("input[name='name']").val();
            var phone = $("input[name='phone']").val();
            if(name==null){
                $("input[name='name']").append("<span style='color: red'>* 用户名不能为空</span>");
            }else{
                $("input[name='name']").find("span").remove();
            }
            if(phone==null){
                $("input[name='phone']").append("<span style='color: red'>* 用户名不能为空</span>");
            }else{
                $("input[name='phone']").find("span").remove();
            }
        });
        var paytype=0;
        $("#alipay").click(function () {
            if(paytype==0){
                $(this).css("border-color","#F44336");
                paytype=1;
            }
            else if(paytype==1) {
                $(this).css("border-color","#cbd0d8");
                paytype=0;
            }else{
                $("#weChat").css("border-color","#cbd0d8");
                $(this).css("border-color","#F44336");
                paytype=1;
            }

        });
        $("#weChat").click(function () {
            if(paytype==0){
                $(this).css("border-color","#F44336");
                paytype=2;
            }
            else if(paytype==2) {
                $(this).css("border-color","#cbd0d8");
                paytype=0;
            }else{
                $("#alipay").css("border-color","#cbd0d8");
                $(this).css("border-color","#F44336");
                paytype=2;
            }

        });

        $("#submit").click(function () {
            if(paytype==1){
                $("form").attr("action","${pageContext.request.contextPath}/ailpay");
                $("form").submit();
            }else if(paytype==2){
                $("form").attr("action","${pageContext.request.contextPath}/weChat");
                $("form").submit();
            }else {
                alert("请选择支付方式");
            }
        });
        $("input[name='name']").blur(function(){
            var name=$(this).val();
            console.log(name);
            if(name!=""){
                $(this).next().remove();
            }else{
                $("<span style='width: 134px;padding-left: 10px;color: red;'>* 用户名不能为空</span>").appendTo($(this).parent());
                console.log("success");
            }
        });
        $("input[name='phone']").blur(function(){
            var phone=$(this).val();
            console.log(phone);

            if(phone!=""){
                $(this).next().remove();
            }else{
                $("<span style='width: 134px;padding-left: 10px;color: red;'>* 用户名不能为空</span>").appendTo($(this).parent());
                console.log("success");
            }
        });


    </script>
</body>
</html>

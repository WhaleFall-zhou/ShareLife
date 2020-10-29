<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<nav class="navbar navbar-default navbar-fixed-top default_top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">爱分享</a>
        </div>
        <div>
            <ul class="nav nav-pills navbar-left">
                <li ><a href="${pageContext.request.contextPath}/home/artile/0">论坛</a></li>
                <li><a href="${pageContext.request.contextPath}/home/video/0">视频</a></li>
                <li><a href="${pageContext.request.contextPath}/goods">会员购</a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/search">
                <div class="form-group">
                    <input type="search" class="form-control default-search" name="title">
                </div>
                <button type="submit" class="btn btn-default default-search-btn"><span class="glyphicon glyphicon-search"></span></button>
            </form>
            <!--向右对齐-->
            <ul class="nav nav-pills navbar-right">
                <c:if test="${user==null}">
                    <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
                </c:if>
                <c:if test="${user!=null}">
                    <li class="pic-li"><a href="#" style="padding: 0;"><div><img src="${pageContext.request.contextPath}${user.pic}" style="height: 53px;margin: 8px;width: 48px;border-radius: 50%;" ></div></a></li>
                    <li><a href="${pageContext.request.contextPath}/leave">退出</a></li>
<%--                    <li><a href="#">消息</a></li>--%>
                    <li><a href="${pageContext.request.contextPath}/show" style="padding: 0;"> <span class="btn btn-default default_btn">投稿</span> </a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
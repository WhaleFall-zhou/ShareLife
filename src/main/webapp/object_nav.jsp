<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-default navbar-fixed-top default_top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/shareindex.jsp">爱分享</a>
        </div>
        <div>
            <ul class="nav nav-pills navbar-left">
                <li ><a href="${pageContext.request.contextPath}/index">首页</a></li>
            </ul>
            <ul class="nav nav-pills navbar-right" style="width: 22%;">
                <c:if test="${user==null}">
                    <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
                </c:if>
                <c:if test="${user!=null}">
                    <li class="pic-li"><a href="#" style="padding: 0;"><div><img src="${pageContext.request.contextPath}${user.pic}" style="height: 53px;margin: 8px;width: 48px;border-radius: 50%;object-fit: contain;" ></div></a></li>
                    <li><a href="${pageContext.request.contextPath}/AllOrder" class="order"><span class="order-icon">&nbsp;&nbsp;&nbsp;&nbsp;</span>订单</a></li>
                </c:if>

            </ul>
<%--            <form class="navbar-form navbar-right" role="search" style="width: 30%;" action="${pageContext.request.contextPath}/goodsSearch">--%>
<%--                <div class="form-group" style="width: 81%">--%>
<%--                    <input type="search" class="form-control default-search" style=" width: 100%" placeholder="搜索..." name="goods_name">--%>
<%--                </div>--%>
<%--                <span type="submit" class="btn btn-default default-search-btn"><span class="glyphicon glyphicon-search"></span></span>--%>
<%--            </form>--%>
            <!--向右对齐-->
        </div>
    </div>
</div>

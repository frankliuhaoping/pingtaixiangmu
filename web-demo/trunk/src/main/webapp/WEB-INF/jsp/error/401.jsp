<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="/common/template/head_basic.jsp" />
</head>

<body class="gray-bg">
    <div class="middle-box text-center animated fadeInDown">
        <h1>401</h1>
        <h3 class="font-bold">您需要登录后才能访问此页面！</h3>

        <div class="error-desc">
            <a href="javascript:void(0)" onclick="goHome()" class="btn btn-primary m-t">前往登录</a>
        </div>
    </div>
    
    <jsp:include page="/common/template/script_basic.jsp" />
</body>
</html>
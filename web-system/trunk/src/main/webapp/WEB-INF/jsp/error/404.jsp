<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="/common/template/head_basic.jsp" />
	<style type="text/css">
		.errorimg{width:922px;height:522px;position:relative;margin:0 auto;}
		.errortxt{position:absolute;top:350px;width:100%; text-align:center;}
	</style>
</head>

<body class="gray-bg" style="background:#fff;">
    <div class="text-center animated fadeInDown">
        <div class="errorimg">
        	<img src="<c:url value='/common/static/img/img404.png' />">
	        <div class="errortxt">
		        <h3 class="font-bold">页面未找到！</h3>
		        <div class="error-desc">抱歉，页面好像去火星了~~~您可以返回主页看看
		        	<br/><a href="javascript:void(0)" onclick="goHome()" class="btn btn-primary m-t">前往主页</a>
		        </div>
	        </div>
        </div>
    </div>
    
    <jsp:include page="/common/template/script_basic.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/css/frame/animate.min.css?v=3.5.1' />" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/common/static/css/frame/login.min.css?v=1.0' />" rel="stylesheet" type="text/css" />
</head>

<body class="Loginbody">
	<div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  

    <div class="loginbody">
    	<span class="systemlogo"></span> 
    	<div class="loginbox">
    	<form  action="" method="post">
		    <ul>
			    <li><input id="username" name="username" type="text" class="loginuser" placeholder="用户名" ></li>
			    <li><input id="password" name="password" type="password" class="loginpwd" placeholder="密码" ></li>
			    <li><button id="loginBtn" type="submit" class="loginbtn">登    录</button>&nbsp;<input name="" type="button" class="loginbtn2" value="PKI登录" /></li>
			    <c:if test="${not empty error}">
                    <li><span style="color:red; font-size:10px;">${error}</span></li>
                </c:if>
		    </ul>
		</form>
    	</div>
    </div>
    
    <!-- 
	<div class="logo">
        <h2><img class="logoimg" src="<c:url value='/common/static/img/logo.png' />"><spring:message code="appName" /></h2>
    </div>
    <div class="content">
        <div class="loginform signinpanel">
            <h2 class="logintitle">请登录 <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h2>
            <form>
                <p><input id="username" name="username" type="text" class="form-control uname" placeholder="用户名" required></p>
                <p><input id="password" name="password" type="password" class="form-control pword" placeholder="密码" required></p>
                <p style="margin-top: 15px;">
                	<label><input type="checkbox" id="remember" name="remember" value="1"> 记住用户名</label>
                	<a href="<c:url value='/forgetPassword' />" style="margin-left:30px;">忘记密码了？</a>
                </p>
                <button id="loginBtn" type="button" class="btn btn-primary btn-block">登    录</button>
            </form>
        </div>
    </div> -->
   
    
<jsp:include page="/common/template/script_basic.jsp" />
<jsp:include page="/common/template/script_validate.jsp" />
<script type="text/javascript">
$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
    $('.loginbody').css({'position':'absolute','top':($(window).height()-655)/2});
	$(window).resize(function(){  
    $('.loginbody').css({'position':'absolute','top':($(window).height()-655)/2});
    })  
});  

//Cloud Float...
var $main = $cloud = mainwidth = null;
var offset1 = 450;
var offset2 = 0;

var offsetbg = 0;

$(document).ready(
    function () {
        $main = $("#mainBody");
		$body = $("body");
        $cloud1 = $("#cloud1");
		$cloud2 = $("#cloud2");
		
        mainwidth = $main.outerWidth();
     
    }
);

/// 飘动
setInterval(function flutter() {
    if (offset1 >= mainwidth) {
        offset1 =  -580;
    }

    if (offset2 >= mainwidth) {
		 offset2 =  -580;
    }
	
    offset1 += 1.1;
	offset2 += 1;
    $cloud1.css("background-position", offset1 + "px 200px")
	
	$cloud2.css("background-position", offset2 + "px 530px")
}, 70);


setInterval(function bg() {
    if (offsetbg >= mainwidth) {
        offsetbg =  -580;
    }

    offsetbg += 0.9;
    $body.css("background-position", -offsetbg + "px 0")
}, 90 );

    if(window.top !== window.self){
        window.top.location = window.location;
    }
    /* var flag = ${jumpToIndex};
    var jumpUrl = '${fallbackUrl}';
    if (flag == true) {
    	if (jumpUrl == '') {
    		window.location.href = '<c:url value="/index" />';
    	} else {
    		window.location.href = jumpUrl;
    	}
    } */
</script>
</body>
</html>
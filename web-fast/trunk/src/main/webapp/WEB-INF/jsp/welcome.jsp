<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_home.jsp" />
    <link href="<c:url value='/common/static/css/index.css?v=1.0' />" rel="stylesheet" type="text/css" />
</head>

<body>
    <div style="width:100%;background-size:100%;background:#066dc5; ">
    	<div >
    		<div class="indexlogo clearfix">
    			<img class="navbar-logoimg" src="/web-system/common/static/img/logo.png">
    			<p class="logotxt">公安指挥与控制系统</p>
    			<div class="pull-right">
    				<a href="/web-system/logout" class="headclose"><i class="fa fa fa-sign-out" style="margin-right:2px;"></i>&nbsp;退出</a>
    			</div>
    		</div>
    	</div>
    </div>
    <div style="background:#0059a5;height:25px;width:100%;"></div>
    <div style="width:100%;min-width:1280px;overflow:auto;background:url(<c:url value='/common/static/img/content_bg.png' />) no-repeat;position:relative;" class="index-center">
    	<div class="indexcontent">
	       <div class="first_screen clearfix">
	          <div class="time clearfix"> <span id="h1"></span> <span id="h2"></span><strong>:</strong> <span id="m1"></span> <span id="m2"></span><strong>:</strong> <span id="s1"></span> <span id="s2"></span> </div>
	          <div class="date" id="currentime"></div>
	          <div class="welcome_wz"><img src="/web-system/common/static/img/welcome_wz.png" width="400" height="112" /></div>
	        </div>
	    </div>
    	<div class="main_desktop clearfix">
    		<div class="desktopbtn toleft pull-left" onclick="scrollSection(0, true)"><i class="fa fa-angle-left"></i></div>
    		<c:set var="pageNumber" value="${(fn:length(pubAppList) - 1)/5 + 1}" />
    		<input id="pageIndex" value="1" type="hidden" />
    		<input id="pageNumber" value="${pageNumber}" type="hidden" />
			<ul class="desktop_wrap clearfix pull-left">
			  <c:forEach items="${pubAppList}" var="pubApp" varStatus="status">
			  	<li name="<fmt:parseNumber integerOnly='true' value='${(status.index)/5 + 1}' />Li">
			  	<p>${pubApp.yymc}</p>
		        <a href="#"><img title="${pubApp.yymc}" src="<c:url value='/common/static/img/welcome-ico/${pubApp.yydm}.png' />" height="64" width="64" onclick="openSystem('${pubApp.fwlj}', '${pubApp.yydm}')"></a></li>
		      	</li>
		      </c:forEach>
			</ul>
			<div class="desktopbtn toright pull-right" onclick="scrollSection(0, false)"><i class="fa fa-angle-right"></i></div>
		  	<div id="switch">
			   <div id="switch-content">
			      <ul id="toolbar" class="navigation">
			         <c:forEach var="i" begin="1" end="${pageNumber}" varStatus="status">
			             <li id="tab-${status.index}" 
			                 <c:if test="${status.index != 1}" >class="inactive"</c:if>
			                 <c:if test="${status.index == 1}" >class="active"</c:if>>
			             <a href="#" onclick="scrollSection(${status.index})"></a></li>
			         </c:forEach>
			     </ul>
			    </div>
	      	</div>
	      	
	    </div>
    
    
        <!-- <div style="width:1280px;padding-top:40px;margin:0 auto;" class="clearfix">
        <c:forEach items="${pubAppList}" var="pubApp">
            <div class="form-group col-sm-2">
	            <div class="form-group col-sm-12" style="text-align:center;">
	               <img title="${pubApp.yymc}" src="<c:url value='/common/static/img/index/64px/${pubApp.yydm}.png' />" height="64" width="64" onclick="openSystem('${pubApp.fwlj}')">

	            </div>
	            <div class="form-group col-sm-12">
	            <div style="text-align:center;">
	               ${pubApp.yymc}
	            </div>
	            </div>
            </div>
        </c:forEach>
        </div> -->
    </div>
    <div style="background:#0059a5;background-size:100%;height:45px;line-height:45px;width:100%;text-align:center;color:#ddd">北京航天长峰科技工业集团有限公司&nbsp;@2017</div>
    
<jsp:include page="/common/template/script_basic_home.jsp" />
<script src="<c:url value='/common/static/js/index.js?v=1.0' />" type="text/javascript"></script>
<script type="text/javascript">
window.onload = tick;
function tick()
{
var weekDayLabels = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
var now = new Date();
var year=now.getFullYear();
var month=now.getMonth()+1;
var day=now.getDate()
var Hours=now.getHours().toString(); 
var Minutes=now.getMinutes().toString(); 
var Second=now.getSeconds().toString();
var h1="0",m1="0",s1="0";
var h2,m2,s2;
if (Hours > 9)
{
	h1=Hours.substring(0,1); 
	h2=Hours.substring(1,2); 
}
else
{
	h1="0";
	h2=Hours;
}
if (Minutes>9)
{
	m1=Minutes.substring(0,1); 
	m2=Minutes.substring(1,2);
}
else
{
	m1="0";
	m2=Minutes;
}
if (Second>9)
{
	s1=Second.substring(0,1); 
	s2=Second.substring(1,2);
}
else
{ 
	s1="0";
	s2=Second;
}
var currentime = year+"年"+month+"月"+day+"日 "+weekDayLabels[now.getDay()];

$("#h1").html(h1);
$("#h2").html(h2);
$("#m1").html(m1);
$("#m2").html(m2);
$("#s1").html(s1);
$("#s2").html(s2);
$("#currentime").html(currentime);
//每隔0.1秒钟执行一次tick函数
window.setTimeout("tick()",1000);
}
// 根据配置的url跳转到对应的系统
function openSystem(url, name) {
    //window.open (url + "?sid=" + '${sid}');
    openPostWindow (url, '${sid}', name);
}

var pageNumber = parseInt($("#pageNumber").val());
// 切换应用app
function scrollSection (liIndex, leftFlag) {
	var pageIndex = parseInt($("#pageIndex").val());
	var changePageIndex = liIndex;
	var showPubApp;
	if (liIndex == 0) {
		if (leftFlag) {
			changePageIndex = pageIndex - 1;
		} else {
			changePageIndex = pageIndex + 1;
		}
		// 处理页面边界值
		if (changePageIndex == 0 ) {
			changePageIndex = pageNumber;
		} else if (changePageIndex > pageNumber) {
			changePageIndex = 1;
		}
	}
	// 处理需要显示和隐藏那些app图标
	showPubApp = $($("li[name='" + changePageIndex + "Li']")[0]);
	showPubApp.show ();
	$.each (showPubApp.siblings("li"), function(index, value){
		if ($(value).attr("name") == changePageIndex + "Li") {
			$(value).show ();
		} else {
			$(value).hide ();
		}
    });
	// 定位tab，修改样式
	$("#pageIndex").val(changePageIndex);
	var selectedTab = $("#tab-" + changePageIndex);
	selectedTab.removeClass("");
	selectedTab.addClass("active");
	$.each (selectedTab.siblings("li"), function(index, value){
		$(value).removeClass();
		$(value).addClass("inactive");
    });
}
</script>
</body>
</html>
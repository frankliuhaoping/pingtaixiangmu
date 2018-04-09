<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_home.jsp" />
    <link href="<c:url value='/common/static/css/index.css?v=1.0' />" rel="stylesheet" type="text/css" />
</head>

<body class="fixed-sidebar full-height-layout gray-bg">
    <div id="visitSystem" style="display:none;">
        <div style="margin:15px; overflow:auto;">
        <c:forEach items="${pubAppList}" var="pubApp">
            <div class="form-group col-sm-3">
                <div class="form-group col-sm-12" style="text-align:center;">
                   <img title="${pubApp.yymc}" height="50" width="50" src="${commonResUrl}/common/static/img/index/64px/${pubApp.yydm}.png" onclick="openSystem('${pubApp.fwlj}', '${pubApp.yydm}')">
                </div>
                <div class="form-group col-sm-12" style="padding:0;">
                <div style="text-align:center; margin:0 auto;">
                   ${pubApp.yymc}
                </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
    <div id="passwordInfo" style="display:none;">
        <div class="ibox-content">
            <form id="fm-password" class="form-horizontal formW80p">
                <div class="form-group">
                    <label for="oldPwd" class="col-sm-4 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="password.oldPwd" /> :</label>
                    <div class="col-sm-8">
                        <input id="oldPwd" name="oldPwd" type="password" class="form-control" placeholder="<spring:message code="password.oldPwd" />" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="newPwd" class="col-sm-4 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="password.newPwd" /> :</label>
                    <div class="col-sm-8">
                        <input id="newPwd" name="newPwd" type="password" class="form-control" placeholder="<spring:message code="password.newPwd" />" minlength="6" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmNewPwd" class="col-sm-4 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="password.newPwdConfirm" /> :</label>
                    <div class="col-sm-8">
                        <input id="confirmNewPwd" name="confirmNewPwd" type="password" class="form-control" placeholder="<spring:message code="password.newPwdConfirm" />" minlength="6" equalTo="#newPwd" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="button" class="btn btn-primary" id="saveBtn"><spring:message code="save" /></button>&nbsp;&nbsp;
                        <button type="reset" class="btn btn-default" id="cancelBtn"><spring:message code="reset" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="wrapper">
        <!-- 上部banner开始 -->
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
            <div class="navbar-header">
                <img class="navbar-logoimg" src="<c:url value='/common/static/img/logo.png' />">
                <p class="logotxt"><spring:message code="appName" /></p>
                <!-- <div class="navbar-brand"><spring:message code="appName" /></div> -->
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <!-- <a class="navbar-minimalize" href="#" title="<spring:message code="index.expandCollapse" />" data-toggle="tooltip" data-placement="right">
                        <i class="fa fa-bars"></i>
                    </a> -->
                    
                    <a class="dropdown-toggle" onclick="showSystems()" title="<spring:message code="index.changeSystem" />">
                       <i class="fa fa-windows" style="margin:0;font-size:18px;"></i>
                    </a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle profile" data-toggle="dropdown" href="javascript:void(0);">
                        <img class="img-circle" src="<c:url value='/common/static/img/touxiang.jpg'/>">
                        <strong style="font-weight:normal">${userName}</strong> <span class="caret"></span>
                    </a>
                    <%-- 东莞版本不需要修改密码，用户统一由第三方进行管理--%>
                    <ul class="dropdown-menu animated fadeInRight">
                        <li><a class="J_menuItem" onclick="showChangePassword()"><spring:message code="index.changePassword" /></a></li>
                    </ul> 
                </li>
                <li class="dropdown">
                    <a href="<c:url value='/logout' />" class=""><i class="fa fa fa-sign-out" style="margin-right:2px;"></i>&nbsp;<spring:message code="logout" /></a>
                </li>
            </ul>
        </nav>
        <!-- 上部banner结束 -->
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i></div>
            <div class="sidebar-collapse">
            	<!--<div style="padding:10px 10px 5px;position:relative;">
                	<input type="text" id="" name=""  class="navsearch">
                    <span class="glyphicon glyphicon-search searchico" aria-hidden="true"></span>
                </div>-->
                <div class="navzk"><a class="navzkico navbar-minimalize"  title="<spring:message code="index.expandCollapse" />" data-toggle="tooltip" data-placement="right"></a></div>
                <ul class="nav" id="side-menu" style="margin-top:17px;">
                    <c:if test="${not empty navMenus}">
                        <c:forEach var="nav" items="${navMenus}">
                            <c:if test="${nav.active eq true}">
                                <li class="active">
                                    <c:if test="${not empty nav.url}">
                                        <a class="J_menuItem" href="<c:url value='${nav.url}'/>" title="${nav.title}">
                                            <i class="${nav.iconClass}"></i> <span class="nav-label">${nav.title}</span>
                                        </a>
                                    </c:if>
                                    <c:if test="${empty nav.url}">
                                        <a title="${nav.title}">
                                            <i class="${nav.iconClass}"></i> <span class="nav-label">${nav.title}</span> <span class="fa arrow"></span>
                                        </a>
                                    </c:if>
                                    <c:if test="${not empty nav.children}">
                                        <ul class="nav nav-second-level">
                                        <c:forEach var="childNav" items="${nav.children}">
                                            <li class="clearfix"><span class="pull-left">----</span><a class="J_menuItem pull-left" href="<c:url value='${childNav.url}'/>">${childNav.title}</a></li>
                                        </c:forEach>
                                        </ul>
                                    </c:if>
                                </li>
                            </c:if>
                            <c:if test="${nav.active eq false}">
                                <li>
                                    <c:if test="${not empty nav.url}">
                                        <a class="J_menuItem" href="<c:url value='${nav.url}'/>" title="${nav.title}">
                                            <i class="${nav.iconClass}"></i> <span class="nav-label">${nav.title}</span>
                                        </a>
                                    </c:if>
                                    <c:if test="${empty nav.url}">
                                        <a title="${nav.title}">
                                            <i class="${nav.iconClass}"></i> <span class="nav-label">${nav.title}</span> <span class="fa arrow"></span>
                                        </a>
                                    </c:if>
                                    <c:if test="${not empty nav.children}">
                                        <ul class="nav nav-second-level">
                                        <c:forEach var="childNav" items="${nav.children}">
                                            <li class="clearfix"><span class="pull-left">----</span><a class="J_menuItem pull-left" href="<c:url value='${childNav.url}'/>">${childNav.title}</a></li>
                                        </c:forEach>
                                        </ul>
                                    </c:if>
                                </li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </ul>
                
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <c:if test="${not empty navMenus}">
                            <c:set var="hasHome" value="false" />
                            <c:forEach var="nav" items="${navMenus}">
                                <c:if test="${not empty nav.url}">
                                    <c:if test="${nav.active}">
                                        <a href="javascript:void(0);" class="active J_menuTab" data-id="<c:url value='${nav.url}'/>">${nav.title}</a>
                                    </c:if>
                                </c:if>
                                <c:if test="${empty nav.url}">
                                    <c:if test="${hasHome eq false}">
                                        <c:if test="${nav.active}">
                                            <c:set var="hasHome" value="true" />
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <c:if test="${hasHome eq true}">
                                <c:set var="nav" value="${navMenus[0].children[0]}" />
                                <a href="javascript:void(0);" class="active J_menuTab" data-id="<c:url value='${nav.url}'/>">${nav.title}</a>
                            </c:if>
                        </c:if>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight">
                    <i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">
                        <spring:message code="index.closeOperate" /> <span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <%-- <li class="J_tabShowActive"><a><spring:message code="index.positionCurrentTab" /></a></li>
                        <li class="divider"></li> --%>
                        <li class="J_tabCloseAll"><a><spring:message code="index.closeAllTabs" /></a></li>
                        <li class="J_tabCloseOther"><a><spring:message code="index.closeOtherTabs" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="row J_mainContent" id="content-main">
                <c:if test="${not empty navMenus}">
                    <c:set var="hasHome" value="false" />
                    <c:forEach var="nav" items="${navMenus}">
                        <c:if test="${not empty nav.url}">
                            <c:if test="${nav.active}">
                                <iframe class="J_iframe" name="iframe0" width="100%" height="100%"
                                    src="<c:url value='${nav.url}'/>" frameborder="0" data-id="<c:url value='${nav.url}'/>" seamless></iframe>
                            </c:if>
                        </c:if>
                        <c:if test="${empty nav.url}">
                            <c:if test="${hasHome eq false}">
                                <c:if test="${nav.active}">
                                    <c:set var="hasHome" value="true" />
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <c:if test="${hasHome eq true}">
                        <c:set var="nav" value="${navMenus[0].children[0]}" />
                        <iframe class="J_iframe" name="iframe0" width="100%" height="100%"
                            src="<c:url value='${nav.url}'/>" frameborder="0" data-id="<c:url value='${nav.url}'/>" seamless></iframe>
                    </c:if>
                </c:if>
                <c:if test="${empty navMenus}">
                    
                    <div class="middle-box text-center animated fadeInDown">
				        <h3 class="font-bold"><spring:message code="index.noRes" /></h3>
				    </div>
                </c:if>
            </div>
            <!-- <div class="footer">
                <div class="pull-right">
                    &copy; ${footer}
                </div>
            </div> -->
        </div>
        <!--右侧部分结束-->
    </div>
    
<jsp:include page="/common/template/script_basic_home.jsp" />
<script src="<c:url value='/common/static/plugins/validate/jquery.validate.min.js?v=1.15.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/validate/additional-methods.js?v=1.15.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/validate/localization/messages_zh.min.js?v=1.15.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/index.js?v=1.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/sockjs.min.js?v=1.0' />" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
    Manage.validate();
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), '<c:url value="/updatePassword"/>', {
            submitFun:function(){
                Layer.confirm('修改密码后，请重新登录', function(){
                    window.location.href = '<c:url value="/logout"/>';
                });
            }}, {'600':'旧密码不正确！', '601':'新密码和旧密码不能相同！'});
    });
});

function showSystems() {
	$("#visitSystem").show ();
	// 设置弹窗的大小为：宽度650px，高度330px
	Layer.openHtml("可访问系统", $("#visitSystem"), null, ['650px', '360px']);
}

//根据配置的url跳转到对应的系统
function openSystem(url, name) {
	window.open (url);
	//openPostWindow (url, '${sid}', name);
}

function showChangePassword () {
	$("#passwordInfo").show ();
    // 设置弹窗的大小为：宽度650px，高度330px
    Layer.openHtml("修改密码", $("#passwordInfo"), null, ['600px', '320px']);
}

// 控制单个菜单可以进行选择的样式
$("li a").on("click",changeStyle);

function changeStyle () {
    var thisObject = $(this);
    if (thisObject.context.className == "J_menuItem") {
    	$.each (thisObject.parent().siblings("li"), function(index, value){
            $(value).removeClass();
        });
        thisObject.parent().addClass("active");
    }
}

//${socketAddress}
var echo_websocket;
var val;
//判断当前浏览器是否支持webSocket
if ("WebSocket" in window) {
    echo_websocket = new WebSocket("ws://${socketAddress}/web-system/websocket");
} else if ("MozWebSocket" in window) {
    echo_websocket = new MozWebSocket("ws://${socketAddress}/web-system/websocket");
} else {
	//当前浏览器不支持webSocket
    echo_websocket = new SockJS("http://${socketAddress}/web-system/websocket/sockjs");
}

//webSocket打开连接
echo_websocket.onopen = function(event) {
    console.log('websocket 连接成功!');
};
//接收到消息的回调方法
echo_websocket.onmessage = function(event) {
	//服务端返回的消息
    var webSocketMsg = JSON.parse(event.data);
    console.log('收到的消息: ' + JSON.parse(event.data)); //处理服务端返回消息
    var dataId = webSocketMsg.url;
    var iframeObject = $('.J_iframe[data-id="' + dataId + '"]');
    if (iframeObject != undefined && iframeObject[0] != undefined) {
    	window.frames[iframeObject[0].name].update(webSocketMsg.msg);
    }
};

//关闭连接
echo_websocket.onclose = function(event) {
    console.log('webwocket关闭连接: websocket connection closed.');
    console.log(event);
    //layer.alert("重复或他人登录系统，当前websocket连接关闭");
};

//发生错误
echo_websocket.error=function(event)
{
	console.log("当前websocket发生错误,连接关闭!");
}
</script>
</body>
</html>
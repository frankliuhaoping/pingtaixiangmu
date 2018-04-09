<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    ${cacheName}---<spring:message code="cacheManagerDetail.single" />
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label for="objectKey" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.objectKey" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="objectKey" name="objectKey" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="objectValue" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.objectValue" />:
                        </label>
                        <div class="col-sm-9">
                            <textarea id="objectValue" name="objectValue" class="form-control" readonly="readonly"  rows="4"></textarea>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="hitCount" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.hitCount" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="hitCount" name="hitCount" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="size" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.size" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="size" name="size" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="latestOfCreationAndUpdateTime" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.latestOfCreationAndUpdateTime" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="latestOfCreationAndUpdateTime" name="latestOfCreationAndUpdateTime" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="size" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.lastAccessTime" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="lastAccessTime" name="lastAccessTime" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="size" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.expirationTime" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="expirationTime" name="expirationTime" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="timeToIdle" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.timeToIdle" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="timeToIdle" name="timeToIdle" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="timeToLive" class="col-sm-3 control-label">
                            <spring:message code="cacheManagerDetail.timeToLive" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="timeToLive" name="timeToLive" class="form-control" readonly="readonly" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="backBtn"><i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" /></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
<jsp:include page="/common/template/script_basic.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
$(function () {
    $('#backBtn').click(function(){
    	//父类(index主页)关闭刷新
    	parent.closeLayer();
    	parent.refreshTable();
        //window.location.href = "<c:url value='/cacheManager/view/' />" + '${cacheName}';
    });
    
    // 加载表单数据
    var cacheManagerDetail = ${cacheManagerDetail};
    ManageForm.loadForm($('form'), cacheManagerDetail);
    
    var latestOfCreationAndUpdateTime = cacheManagerDetail.latestOfCreationAndUpdateTime;
    if(latestOfCreationAndUpdateTime != null && latestOfCreationAndUpdateTime != ''){
    	$('#latestOfCreationAndUpdateTime').val(moment(latestOfCreationAndUpdateTime).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var lastAccessTime = cacheManagerDetail.lastAccessTime;	
    if(lastAccessTime != null && lastAccessTime != ''){
    	$('#lastAccessTime').val(moment(lastAccessTime).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var expirationTime = cacheManagerDetail.expirationTime; 
    if(expirationTime != null && expirationTime != ''){
    	expirationTime = expirationTime.toString();
    	expirationTime = expirationTime.substring(0,expirationTime.length-4);
        $('#expirationTime').val(moment(parseInt(expirationTime)).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var timeToIdle = $('#timeToIdle').val(); 
    if(timeToIdle != null && timeToIdle != ''){
        $('#timeToIdle').val(moment(parseInt(timeToIdle)).format('YYYY-MM-DD HH:mm:ss'));
    }
    
});

</script>
</body>
</html>
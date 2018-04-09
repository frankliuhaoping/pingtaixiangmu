<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/template/head_basic.jsp" />
	<link href="<c:url value='/common/static/css/myWorkspace.css?=1.0' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
		    <div class="col-md-4">
		        <div class="ibox float-e-margins" id="myRecord">
					<div class="ibox-title">
						<h5><span class="glyphicon glyphicon-pushpin"></span>&nbsp;我的未提交报告&nbsp;<span id="count" class="badge label-primary">0</span>&nbsp;&nbsp;<small id="more" class="pull-right pmHidden"><a href="<c:url value='/record/index' />" data-tab-title="我的监测报告">更多>></a></small></h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
						</div>
					</div>
					<div class="ibox-content">
			            <ul class="list-group"><li class="list-group-item noResultText">没有您的未提交报告</li></ul>
					</div>
				</div>
		    </div>
			<div class="col-md-4">
				<div class="ibox float-e-margins" id="myRecordApproval">
					<div class="ibox-title">
						<h5><span class="glyphicon glyphicon-pushpin"></span>&nbsp;我的待审批报告&nbsp;<span id="count" class="badge label-primary">0</span>&nbsp;&nbsp;<small id="more" class="pull-right pmHidden"><a href="<c:url value='/recordApproval/index' />" data-tab-title="我的审批报告">更多>></a></small></h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
						</div>
					</div>
					<div class="ibox-content">
			            <ul class="list-group"><li class="list-group-item noResultText">没有您的待审批报告</li></ul>
					</div>
				</div>
		    </div>
			<div class="col-md-4">
				<div class="ibox float-e-margins" id="myRecordIdentify">
					<div class="ibox-title">
						<h5><span class="glyphicon glyphicon-pushpin"></span>&nbsp;我的待鉴定报告&nbsp;<span id="count" class="badge label-primary">0</span>&nbsp;&nbsp;<small id="more" class="pull-right pmHidden"><a href="<c:url value='/recordIdentify/index' />" data-tab-title="实验室鉴定">更多>></a></small></h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
						</div>
					</div>
					<div class="ibox-content">
			            <ul class="list-group"><li class="list-group-item noResultText">没有您的待鉴定报告</li></ul>
					</div>
				</div>
		    </div>
		</div>
	</div>

<jsp:include page="/common/template/script_basic.jsp" />
<script type="text/javascript">
	
</script>
</body>
</html>
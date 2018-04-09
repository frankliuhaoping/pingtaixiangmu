<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/template/head_basic.jsp" />
<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/bootstrap-icon-picker/css/icon-picker.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
	
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<!-- 标题div -->
			<div class="ibox-title">
				<!-- 标题 -->
				<h5> 批量导入设备信息 </h5>
				<!--必填提示  -->
				<span class="ibox-sub-title"><span class="fieldRequired">*</span>
				<spring:message code="required" /></span>
			</div>
			<div class="ibox-content">
				<!-- form表单 -->
				<form id="uploadForm" class="form-horizontal formW60p" enctype="multipart/form-data" method="post" >
					<!-- 设备编号 -->
					<div class="form-group">
						<label for="sbbh" class="col-sm-3 control-label">
							<span class="fieldRequired">*</span>&nbsp;文件:
						</label>
						<div class="col-sm-9">
							<input type="file" id="file" name="file" class="form-control" placeholder="<spring:message code="pubGpssbxx.sbbh" />"   required maxLength="15">
						    <p class="help-block">支持xlsx格式</p>
						</div>
					</div>  
					<!-- 底部按钮组 -->
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="button" class="btn btn-primary" id="uploadBtn">
								<i class="fa fa-upload"></i>&nbsp;<spring:message code="pubGpssbxx.import" />
							</button>
							<button type="button" class="btn btn-default" id="backBtn">
								 <i class="fa fa-close"></i>&nbsp;<spring:message code="cancel" />
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
  	<script type="text/javascript">
	$(function () {
		//初始化表单验证
		Manage.validate();
	    //保存
	    $('#uploadBtn').click(function(){
	        //ManageForm.submitForm($('form'), "<c:url value='/pubGpssbxx/upload'/>", {submitFun:function(){$('#backBtn').click();}});
	    	 var formData = new FormData($( "#uploadForm" )[0]);  
	         $.ajax({  
	              url: "<c:url value='/pubGpssbxx/upload'/>" ,  
	              type: 'POST',  
	              data: formData,  
	              async: false,  
	              cache: false,  
	              contentType: false,  
	              processData: false,  
	              success: function (returndata) {  
	            	  $('#backBtn').click();
	              },  
	              error: function (returndata) {  
	                  alert(returndata);
	              }  
	         });  
		});
	    //返回
	    $('#backBtn').click(function(){
	    	parent.refreshTable();
	    	parent.closeLayer();
	    });
	});
	
	   
 
</script>
</body>
</html>
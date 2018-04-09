<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/template/head_basic_table.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>新增字典类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ibox-sub-title"><span class="fieldRequired">*</span> 表示必填<span></h5>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal formW60p" method="post">
					<input id="dictId" name="id" type="hidden">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzdlx.lxmc" />:</label>
						<div class="col-sm-9">
							<input id="lxmc" name="lxmc" class="form-control" placeholder="<spring:message code="pubXtzdlx.lxmc" />" required>
						</div>
					</div>
					<div class="form-group">
						<label for="lxdm" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzdlx.lxdm" />:</label>
						<div class="col-sm-9">
							<input id="lxdm" name="lxdm" class="form-control" placeholder="<spring:message code="pubXtzdlx.lxdm" />" required remote="<c:url value='/pubXtzdlx/validateLxdm' />">
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-md-3 control-label"><spring:message code="pubXtzdlx.lxms" />:</label>
						<div class="col-md-9">
							<textarea id="lxms" name="lxms" class="form-control" placeholder="<spring:message code="pubXtzdlx.lxms" />" rows="2"></textarea>
						</div>
					</div>
					<div class="form-group">
				    	<div class="col-sm-offset-3 col-sm-9">
				      		<button type="button" class="btn btn-primary" id="saveBtn"><spring:message code="determine" /></button>&nbsp;&nbsp;
				      		<button type="button" class="btn btn-default" id="cancelBtn"><spring:message code="cancel" /></button>
				    	</div>
				  	</div>
				</form>
			</div>
		</div>
	</div>

<jsp:include page="/common/template/script_basic_table.jsp" />
<jsp:include page="/common/template/script_validate.jsp" />
<script type="text/javascript">
$(function () {
	$("form").validate({
		errorElement: "em",
		errorPlacement: function(error, element) {
			// Add the `help-block` class to the error element
			error.addClass("help-block");

			// Add `has-feedback` class to the parent div.form-group
			// in order to add icons to inputs
			element.parents(".col-sm-9").addClass("has-feedback");

			if (element.prop("type") === "checkbox") {
				error.insertAfter(element.parent("label"));
			} else {
				error.insertAfter(element);
			}

			// Add the span element, if doesn't exists, and apply the icon classes to it.
			if (!element.next("span")[0]) {
				$("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
			}
		},
		success: function (label, element) {
			// Add the span element, if doesn't exists, and apply the icon classes to it.
			if (!$(element).next("span")[0]) {
				$("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
			}
		},
		highlight: function (element, errorClass, validClass) {
			$(element).parents(".col-sm-9").addClass("has-error").removeClass("has-success");
			$(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$(element).parents(".col-sm-9").addClass("has-success").removeClass("has-error");
			$(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
		}
	});
	$('#saveBtn').click(function(){
		ManageForm.submitForm($('form'), "<c:url value='/pubXtzdlx/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}}, 
			{'600':'添加数据字典类型失败:已经存在代码"'+ $('form #code').val() +'"'});
	});
	$('#cancelBtn').click(function(){
		window.location.href = "<c:url value='/pubXtzdlx/index' />";
	});
});
</script>
</body>
</html>
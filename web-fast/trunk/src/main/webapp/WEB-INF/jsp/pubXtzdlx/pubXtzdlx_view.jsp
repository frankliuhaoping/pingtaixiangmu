<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/template/head_basic.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>编辑字典类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ibox-sub-title"></h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal formW60p" method="post">
					<input id="dictId" name="id" type="hidden">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><spring:message code="pubXtzdlx.lxmc" />:</label>
						<div class="col-sm-9">
							<input id="lxmc" name="lxmc" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.lxmc" />" required>
						</div>
					</div>
					<div class="form-group">
						<label for="lxdm" class="col-sm-3 control-label"><spring:message code="pubXtzdlx.lxdm" />:</label>
						<div class="col-sm-9">
							<input id="lxdm" name="lxdm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.lxdm" />" required>
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-md-3 control-label"><spring:message code="pubXtzdlx.lxms" />:</label>
						<div class="col-md-9">
							<textarea id="lxms" name="lxms" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.lxms" />" rows="2"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="cjsj" class="col-sm-3 control-label"><spring:message code="pubXtzdlx.cjsj" />:</label>
						<div class="col-sm-9">
							<input id="cjsj" name="cjsj" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.cjsj" />" required>
						</div>
					</div>
					<div class="form-group">
						<label for="cjr" class="col-sm-3 control-label"><spring:message code="pubXtzdlx.cjr" />:</label>
						<div class="col-sm-9">
							<input id="cjr" name="cjr" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.cjr" />" required>
						</div>
					</div>
					<div class="form-group">
						<label for="gxsj" class="col-sm-3 control-label"><spring:message code="pubXtzdlx.gxsj" />:</label>
						<div class="col-sm-9">
							<input id="gxsj" name="gxsj" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.gxsj" />" required>
						</div>
					</div>
					<div class="form-group">
						<label for="gxr" class="col-sm-3 control-label"><spring:message code="pubXtzdlx.cjr" />:</label>
						<div class="col-sm-9">
							<input id="gxr" name="gxr" class="form-control" readonly="readonly" placeholder="<spring:message code="pubXtzdlx.gxr" />" required>
						</div>
					</div>
					<div class="form-group">
				    	<div class="col-sm-offset-3 col-sm-9">
				      		<button type="button" class="btn btn-default" id="cancelBtn"><spring:message code="back" /></button>
				    	</div>
				  	</div>
				</form>
			</div>
		</div>
	</div>

<jsp:include page="/common/template/script_basic.jsp" />
<jsp:include page="/common/template/script_validate.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>

<script type="text/javascript">
$(function () {
	//ManageOption.initOptionData($("form"));
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
	$('#cancelBtn').click(function(){
		 window.location.href = "<c:url value='/pubXtzdlx/index' />";
	});
	
	var pubXtzdlx = ${pubXtzdlx};
	ManageForm.loadForm($('form'), pubXtzdlx);
	
	 var cjsj = pubXtzdlx.cjsj;
     if(cjsj != null && cjsj != ''){
    	$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
     }
    
     var gxsj = pubXtzdlx.gxsj;	
     if(gxsj != null && gxsj != ''){
    	$('#gxsj').val(moment(gxsj).format('YYYY-MM-DD HH:mm:ss'));
     }
	    
});
</script>
</body>
</html>
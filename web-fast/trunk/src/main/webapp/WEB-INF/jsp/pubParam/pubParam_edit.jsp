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
                    <spring:message code="pubParam.edit" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input name="sjbb" type="hidden">
                    <div class="form-group">
                        <label for="csm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubParam.csm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="csm" name="csm" class="form-control" placeholder="<spring:message code="pubParam.csm" />" required maxLength="64">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="csz" class="col-sm-3 control-label">
                            <spring:message code="pubParam.csz" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="csz" name="csz" class="form-control" placeholder="<spring:message code="pubParam.csz" />" maxLength="512">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="csbz" class="col-sm-3 control-label"><spring:message code="pubParam.csbz" />:</label>
                        <div class="col-sm-9">
                            <input id="csbz" name="csbz" class="form-control" placeholder="<spring:message code="pubParam.csbz" />" maxLength="128">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubParam.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz">
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
    
<jsp:include page="/common/template/script_basic.jsp" />
<jsp:include page="/common/template/script_validate.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript">
$(function () {
	Manage.validate();
	
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubParam/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
        window.location.href = "<c:url value='/pubParam/index?selectId=' />" + $('#parentId').val();
    });
    
    var pubParam = ${pubParam};
    ManageForm.loadForm($('form'), pubParam);
    
    
    var sybztate = 'Y' == pubParam.sybz ? true : false;
    $("#sybz_checkbox").bootstrapSwitch({
    	state:sybztate,
        onText : '<spring:message code="enable" />',
        offText : '<spring:message code="disable" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#sybz').val(state ? 'Y' : 'N');
        }
    });
    
});

</script>
</body>
</html>
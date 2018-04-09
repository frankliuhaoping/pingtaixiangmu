<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
  	<link href="<c:url value='/common/static/plugins/bootstrap-icon-picker/css/icon-picker.css' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubXtzd.edit" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input id="bh" name="bh" type="hidden">
                    <input id="zdbh" name="zdbh" type="hidden">
                    <input id="zdfzdbh" name="zdfzdbh" type="hidden" value="${zdfzdbh}">
                    <input id="zdfbh" name="zdfbh" type="hidden">
                    <input name="sjbb" type="hidden">
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubXtzd.parentZy" />:</label>
                        <div class="col-sm-9">
                            <input id="zdfName" name="zdfName" class="form-control" placeholder="<spring:message code="pubXtzd.parentZy" />"  <c:if test="${not empty zdfName}">value="${zdfName}"</c:if> readOnly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdxz" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzd.zdxz" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" id="zdxz" name="zdxz" class="form-control" placeholder="<spring:message code="pubXtzd.zdxz" />" required maxlength="32" noChinese="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdxm" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzd.zdxm" />:</label>
                        <div class="col-sm-9">
                            <input id="zdxm" name="zdxm" class="form-control" placeholder="<spring:message code="pubXtzd.zdxm" />" required maxlength="16">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jhdm" class="col-sm-3 control-label"><spring:message code="pubXtzd.jhdm" />:</label>
                        <div class="col-sm-9">
                            <input id="jhdm" name="jhdm" class="form-control" placeholder="<spring:message code="pubXtzd.jhdm" />" maxlength="128" noChinese="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sjms" class="col-sm-3 control-label"><spring:message code="pubXtzd.sjms" />:</label>
                        <div class="col-sm-9">
                            <input id="sjms" name="sjms" class="form-control" placeholder="<spring:message code="pubXtzd.sjms" />" maxlength="64">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pxdm" />" value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0" digits="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubXtzd.sybz" />:</label>
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

<jsp:include page="/common/template/script_validate.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/bootstrap-icon-picker/js/iconPicker.js' />"></script>
<script type="text/javascript">
$(function () {
	var first = true;
    var pubXtzd = ${pubXtzd};
    
    ManageForm.loadForm($('form'), pubXtzd);
    
    var sybztate = 'Y' == pubXtzd.sybz ? true : false;
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
    
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubXtzd/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
        Manage.url("<c:url value='/pubXtzd/index' />", {yyid: pubXtzd.yyid});
    });
});
</script>
</body>
</html>
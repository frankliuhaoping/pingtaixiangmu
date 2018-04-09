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
                    <spring:message code="pubSchedule.add" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label for="fwdm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubSchedule.fwdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwdm" name="fwdm" class="form-control"  required maxLength="32">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rwmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubSchedule.rwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="rwmc" name="rwmc" class="form-control"  required maxLength="8">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="cron" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubSchedule.cron" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="cron" name="cron" class="form-control"  required maxLength="64" noChinese="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cronms" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.cronms" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="cronms" name="cronms" class="form-control"  maxLength="64">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="rwms" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.rwms" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="rwms" name="rwms" class="form-control"  maxLength="128">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubSchedule.lm"/>:
                        </label>
                        <div class="col-sm-9">
                            <input id="lm" name="lm" class="form-control"  required maxLength="256" noChinese="true">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="ffm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubSchedule.ffm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="ffm" name="ffm" class="form-control"  required maxLength="64" noChinese="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <spring:message code="pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pxdm" name="pxdm" class="form-control"  value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubSchedule.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
                    
                  <div class="form-group">
                        <label for="rwzt" class="col-sm-3 control-label"><spring:message code="pubSchedule.rwzt" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="rwzt_checkbox"/>
                        </div>
                        <input type="hidden" name="rwzt" id="rwzt" value="Y">
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-primary" id="saveBtn">
                            	 <i class="fa fa-check"></i>&nbsp;<spring:message code="determine" />
                            </button>
                            <button type="button" class="btn btn-default" id="cancelBtn">
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
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript">
$(function () {
	Manage.validate();
    
    $("#sybz_checkbox").bootstrapSwitch({
    	state:true,
        onText : '<spring:message code="enable" />',
        offText : '<spring:message code="disable" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#sybz').val(state ? 'Y' : 'N');
        }
    });
    
    $("#rwzt_checkbox").bootstrapSwitch({
    	state:true,
        onText : '<spring:message code="production" />',
        offText : '<spring:message code="debugging" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#rwzt').val(state ? 'Y' : 'N');
        }
    });
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubSchedule/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
    	//父类(index主页)先刷新子页在关闭，顺序不可变
    	parent.refreshTable();
    	parent.closeLayer();
    });
});

</script>
</body>
</html>
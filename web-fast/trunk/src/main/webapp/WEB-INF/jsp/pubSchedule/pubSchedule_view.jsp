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
                    <spring:message code="pubSchedule.view" />
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label for="fwdm" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.fwdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwdm" name="fwdm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.fwdm" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rwmc" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.rwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="rwmc" name="rwmc" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.rwmc" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="cron" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.cron" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="cron" name="cron" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.cron" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cronms" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.cronms" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="cronms" name="cronms" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.cronms" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="rwms" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.rwms" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="rwms" name="rwms" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.rwms" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lm" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.lm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="lm" name="lm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.lm" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="ffm" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.ffm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="ffm" name="ffm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.ffm" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <spring:message code="pubSchedule.pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchedule.pxdm" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubSchedule.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
                    
                     <div class="form-group">
                        <label for="rwzt" class="col-sm-3 control-label"><spring:message code="pubSchedule.rwzt" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="rwzt_checkbox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="rwzt" id="rwzt" value="Y">
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjrxm" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" name="cjrxm" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" id="cjsj" name="cjsj" readonly="readonly"/>
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="gxrxm" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" name="gxrxm" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="gxsj" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" id="gxsj"  name="gxsj" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="sjbb" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" name="sjbb" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="backBtn"><spring:message code="back" /></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
<jsp:include page="/common/template/script_basic.jsp" />
<jsp:include page="/common/template/script_validate.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
$(function () {
	Manage.validate();
    
    $('#backBtn').click(function(){
        window.location.href = "<c:url value='/pubSchedule/index?selectId=' />" + $('#parentId').val();
    });
    
    var pubSchedule = ${pubSchedule};
    ManageForm.loadForm($('form'), pubSchedule);
    
    var sybztate = 'Y' == pubSchedule.sybz ? true : false;
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
    
    var rwzttate = 'Y' == pubSchedule.rwzt ? true : false;
    
    
    $("#rwzt_checkbox").bootstrapSwitch({
    	state:rwzttate,
        onText : '<spring:message code="production" />',
        offText : '<spring:message code="debugging" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#rwzt').val(state ? 'Y' : 'N');
        }
    });
    
    var cjsj = pubSchedule.cjsj;
    if(cjsj != null && cjsj != ''){
    	$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var gxsj = pubSchedule.gxsj;	
    if(gxsj != null && gxsj != ''){
    	$('#gxsj').val(moment(gxsj).format('YYYY-MM-DD HH:mm:ss'));
    }
    
});

</script>
</body>
</html>
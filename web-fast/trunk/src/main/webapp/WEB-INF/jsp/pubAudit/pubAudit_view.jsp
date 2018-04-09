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
                    <spring:message code="pubAudit.view" />
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label for="xtm" class="col-sm-3 control-label">
                            <spring:message code="pubAudit.xtm" />:
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" readonly="readonly" value="${yymc }">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fwlj" class="col-sm-3 control-label">
                            <spring:message code="pubAudit.fwlj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwlj" name="fwlj" class="form-control" readonly="readonly" placeholder="<spring:message code="pubAudit.fwlj" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sjms" class="col-sm-3 control-label"><spring:message code="pubAudit.sjms" />:</label>
                        <div class="col-sm-9">
                            <textarea id="sjms" name="sjms" class="form-control" readonly="readonly" placeholder="<spring:message code="pubAudit.sjms" />" rows="2"></textarea>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubAudit.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
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
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
var yyid = '${param.yyid}';
$(function () {
	
    $('#backBtn').click(function(){
        window.location.href = "<c:url value='/pubAudit/index?selectId=' />" + $('#parentId').val() + "&yyid=" + yyid;
    });
    
    var pubAudit = ${pubAudit};
    ManageForm.loadForm($('form'), pubAudit);
    
    var sybztate = 'Y' == pubAudit.sybz ? true : false;
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
    
    var cjsj = pubAudit.cjsj;
    if(cjsj != null && cjsj != ''){
    	$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var gxsj = pubAudit.gxsj;	
    if(gxsj != null && gxsj != ''){
    	$('#gxsj').val(moment(gxsj).format('YYYY-MM-DD HH:mm:ss'));
    }
});

</script>
</body>
</html>
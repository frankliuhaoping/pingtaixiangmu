<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.css?v=1.0' />" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/common/static/plugins/bootstrap-select/css/bootstrap-select.min.css?v=1.0' />" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubRole.add" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                	<input type="hidden" id="jsid" name="jsid"/>
                	<input type="hidden" id="sjbb" name="sjbb"/>
                    <div class="form-group">
                        <label for="yyid" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRole.yymc" />:
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" readonly="readonly" value="${yymc }">
                            <input id="yyid" name="yyid" class="form-control" type="hidden" value="${yyid }">
                        </div>
                        <%-- 
                        <div class="col-sm-9">
                            <select id="yyid" name="yyid" class="selectpicker bla bla bl" data-live-search="true" required>
                            	<c:forEach items="${pubAppList }" var="pubApp">
                            		<option value="${pubApp.yyid }">${pubApp.yymc }</option>
                            	</c:forEach>
                           </select>
                        </div>
                        --%>
                    </div>
                    <div class="form-group">
                        <label for="jsmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRole.jsmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jsmc" name="jsmc" class="form-control" placeholder="<spring:message code="pubRole.jsmc" />" required maxLength="15"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pxdm" />" required digits="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRole.sybz" />:
                        </label>
                        <div class="col-sm-9">
                        	<div class="switch" data-on="primary" data-off="info">
	                       		<input type="checkbox" name="sybz_checkbox" checked>
	                        </div>
	                        <input type="hidden" name="sybz" id="sybz">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jsms" class="col-sm-3 control-label">
                            <spring:message code="pubRole.jsms" />:
                        </label>
                        <div class="col-sm-9">
                            <textarea id="jsms" name="jsms" class="form-control" rows="3" placeholder="<spring:message code="pubRole.jsms" />" maxLength="64"></textarea>
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
<jsp:include page="/common/template/script_validate.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.js?v=3.3.1' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/bootstrap-select/js/bootstrap-select.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript">
var yyidPicker = $('#yyid');
$(function () {
	 var pubRole = ${pubRole};
	 $("[name='sybz_checkbox']").bootstrapSwitch({
		state:pubRole.sybz=="Y"?true:false,
        onText : '<spring:message code="enable" />',
        offText : '<spring:message code="disable" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#sybz').val(state ? 'Y' : 'N');
        } 
    });
	 
	 yyidPicker.selectpicker({
    	'selectedText': 'cat',
    	noneSelectedText:'请选择',
    	noneResultsText:'未搜到结果 {0}'
    });
	 
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubRole/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
    	 Manage.url("<c:url value='/pubRole/index' />", {limit: '${param.limit}', offset: '${param.offset}', selectId: '${param.id}', yyid : $('#yyid').val()});
    });
    
    initSelectVal(pubRole);
    ManageForm.loadForm($('form'), pubRole);
    
});

function initSelectVal(pubRole){
	var oldnumber = new Array();
	if(null != pubRole.yyid && undefined != pubRole.yyid){
		oldnumber.push(pubRole.yyid);
	}
	yyidPicker.selectpicker('val',oldnumber);
	yyidPicker.selectpicker('render');
	yyidPicker.selectpicker('refresh');
}

</script>
</body>
</html>
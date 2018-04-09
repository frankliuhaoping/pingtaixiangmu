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
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label for="yyid" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRole.yymc" />:
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control timebox" readonly="readonly" value="${yymc }">
                            <input id="yyid" name="yyid" class="form-control" type="hidden" value="${yyid }">
                        </div>
                        <%--
                        <div class="col-sm-9">
                            <select id="yyid" name="yyid" class="selectpicker bla bla bl form-control" required disabled>
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
                            <input type="text" id="jsmc" name="jsmc" class="form-control " required  maxlength="15">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pxdm" name="pxdm" class="form-control"  value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRole.sybz" />:
                        </label>
                        <div class="col-sm-9">
                        	<div class="switch switch-sm" data-on="primary" data-off="info">
	                       		<input type="checkbox" name="sybz_checkbox" checked>
	                        </div>
	                        <input type="hidden" name="sybz" id="sybz" value="Y">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jsms" class="col-sm-3 control-label">
                            <spring:message code="pubRole.jsms" />:
                        </label>
                        <div class="col-sm-9">
                            <textarea id="jsms" name="jsms" class="form-control" rows="3" maxLength="64"></textarea>
                        </div>
                    </div>
                    <!--角色代码属性  -->
                    <div class="form-group">
                        <label for="dmsx" class="col-sm-3 control-label">
                            <spring:message code="pubRole.dmsx" />:
                        </label>
                        <div class="col-sm-9">
                            <textarea id="dmsx" name="dmsx" class="form-control" rows="3" maxLength="64"></textarea>
                        </div>
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
<jsp:include page="/common/template/script_validate.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script src="<c:url value='/common/static/plugins/bootstrap-suggest/js/bootstrap-suggest.min.js' />" type="text/javascript"></script>

<script type="text/javascript">
$(function () {
	Manage.validate();
	 $("[name='sybz_checkbox']").bootstrapSwitch({
		state:true,
        onText : '<spring:message code="enable" />',
        offText : '<spring:message code="disable" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#sybz').val(state ? 'Y' : 'N');
        } 
    });
	 
	/*  $('#yyid').selectpicker({
    	'selectedText': 'cat',
    	noneSelectedText:'请选择',
    	noneResultsText:'未搜到结果 {0}'
    }); */
	 
    $('#saveBtn').click(function(){
    	//$('#yyid').removeAttr("disabled");
        ManageForm.submitForm($('form'), "<c:url value='/pubRole/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}});
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
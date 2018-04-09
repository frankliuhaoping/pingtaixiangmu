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
                    <spring:message code="pubApp.edit" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input id="yyid" name="yyid" type="hidden">
                    <input name="sjbb" type="hidden">
                    <div class="form-group">
                        <label for="yymc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubApp.yymc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yymc" name="yymc" class="form-control" placeholder="<spring:message code="pubApp.yymc" />" required  maxlength="10" readonly="readonly">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="yydm" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yydm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yydm" name="yydm" class="form-control" placeholder="<spring:message code="pubApp.yydm" />" maxlength="16" noChinese="true">
                        </div>
                    </div>
                       <div class="form-group">
                        <label for="yylx" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubApp.yylx" />:
                        </label>
                        <div class="col-sm-9">
                        	<select class="form-control" id="yylx" name="yylx">
                           	</select>
                        </div>
                    </div>
                       <div class="form-group">
                        <label for="yyqc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubApp.yyqc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yyqc" name="yyqc" class="form-control" placeholder="<spring:message code="pubApp.yyqc" />" required maxlength="32">
                        </div>
                    </div>
                       <div class="form-group">
                        <label for="weblj" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubApp.weblj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="weblj" name="weblj" class="form-control" placeholder="<spring:message code="pubApp.weblj" />" required urlFormat="true" maxlength="64">
                        </div>
                    </div>
                       <div class="form-group">
                        <label for="fwlj" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubApp.fwlj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwlj" name="fwlj" class="form-control" placeholder="<spring:message code="pubApp.fwlj" />" required urlFormat="true" maxlength="256">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="yyaqm" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yyaqm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yyaqm" name="yyaqm" class="form-control" placeholder="<spring:message code="pubApp.yyaqm" />" maxLength="64" noChinese="true">
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pxdm" />" value="0" digits="true" onblur="if('' == this.value) this.value = 0" maxlength="8">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubApp.yyzt" />:</label>
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
        ManageForm.submitForm($('form'), "<c:url value='/pubApp/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
        window.location.href = "<c:url value='/pubApp/index?selectId=' />" + $('#parentId').val();
    });
    
    var pubApp = ${pubApp};
    ManageForm.loadForm($('form'), pubApp);
    
    var sybztate = 'Y' == pubApp.sybz ? true : false;
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
    
    //构建应用类型下拉框
    addSelect ("<c:url value='/getPubXtzdList' />", "yylx", "system_yylx", pubApp.yylx);
    
});

</script>
</body>
</html>
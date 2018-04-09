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
                    <spring:message code="pubJqxz.edit" />
                  
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            
            <div class="ibox-content">
            
                <form class="form-horizontal formW60p">
                    <input id="jqxzbh" name="jqxzbh" type="hidden">
                    <input name="sjbb" type="hidden">
                    <div class="form-group">
                        <label for="jqxzjc" class="col-sm-3 control-label">
                           <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzjc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jqxzjc" name="jqxzjc" class="form-control" placeholder="<spring:message code="pubJqxz.jqxzjc" />" required maxLength="32" >
                        </div>
                    </div>
            
                    <div class="form-group">
                        <label for="jqxzjcpym" class="col-sm-3 control-label">
                           <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzjcpym" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jqxzjcpym" name="jqxzjcpym" class="form-control" placeholder="<spring:message code="pubJqxz.jqxzjcpym" />"  required maxLength="128">
                        </div>
                    </div>
            
                    <div class="form-group">
                        <label for="jqxzqc" class="col-sm-3 control-label">
                           <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzqc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jqxzqc" name="jqxzqc" class="form-control" placeholder="<spring:message code="pubJqxz.jqxzqc" />"  required maxLength="32">
                        </div>
                    </div>
                    
                       <div class="form-group">
                        <label for="bzjqxzbh" class="col-sm-3 control-label">
                           <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.bzjqxzbh" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="bzjqxzbh" name="bzjqxzbh" class="form-control" placeholder="<spring:message code="pubJqxz.bzjqxzbh" />" required maxLength="12" digits="true">
                        </div>
                    </div>
            
                    <div class="form-group">
                        <label for="bzjqxzmc" class="col-sm-3 control-label">
                           <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.bzjqxzmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="bzjqxzmc" name="bzjqxzmc" class="form-control" placeholder="<spring:message code="pubJqxz.bzjqxzmc" />"  required maxLength="32">
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label for="yhsybz110" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.yhsybz110" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yhsybz110" name="yhsybz110" class="form-control" placeholder="<spring:message code="pubJqxz.yhsybz110" />" maxLength="1" useMark="true">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label for="yhsybz122" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.yhsybz122" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yhsybz122" name="yhsybz122" class="form-control" placeholder="<spring:message code="pubJqxz.yhsybz122" />" maxLength="1" useMark="true">
                        </div>
                    </div>
            
                    <div class="form-group">
                        <label for="yhsybz120" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.yhsybz120" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yhsybz120" name="yhsybz120" class="form-control" placeholder="<spring:message code="pubJqxz.yhsybz120" />" maxLength="1" useMark="true">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="yhsybz119" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.yhsybz119" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yhsybz119" name="yhsybz119" class="form-control" placeholder="<spring:message code="pubJqxz.yhsybz119" />" maxLength="1" useMark="true">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="qtyhsybz" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.qtyhsybz" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="qtyhsybz" name="qtyhsybz" class="form-control" placeholder="<spring:message code="pubJqxz.qtyhsybz" />" maxLength="1" useMark="true">
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="jqxzyaurl" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.jqxzyaurl" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jqxzyaurl" name="jqxzyaurl" class="form-control" placeholder="<spring:message code="pubJqxz.jqxzyaurl" />"  maxLength="64">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="jjqxzdm" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.jjqxzdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jjqxzdm" name="jjqxzdm" class="form-control" placeholder="<spring:message code="pubJqxz.jjqxzdm" />" maxLength="12" digits="true">
                        </div>
                    </div>
                    
                    
                      <div class="form-group">
                        <label for="jjqxzmc" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.jjqxzmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="jjqxzmc" name="jjqxzmc" class="form-control" placeholder="<spring:message code="pubJqxz.jjqxzmc" />"  maxLength="32">
                        </div>
                    </div>
                    
                      <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                           <spring:message code="pubJqxz.pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pubJqxz.pxdm" />" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubJqxz.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
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
        }
    });
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubJqxz/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
        window.location.href = "<c:url value='/pubJqxz/index' />";
    });
    
    var pubJqxz = ${pubJqxz};
    ManageForm.loadForm($('form'), pubJqxz);
    
    
    var sybztate = 'Y' == pubJqxz.sybz ? true : false;
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
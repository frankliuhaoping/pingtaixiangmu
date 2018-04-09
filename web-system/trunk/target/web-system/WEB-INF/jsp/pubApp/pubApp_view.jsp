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
                    <spring:message code="pubApp.view" />
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input id="yyid" name="yyid" type="hidden">
                    <div class="form-group">
                        <label for="yymc" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yymc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yymc" name="yymc" class="form-control" readonly="readonly" />
                        </div>
                    </div>
                      <div class="form-group">
                        <label for="yylx" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yylx" />:
                        </label>
                        <div class="col-sm-9">
                            
                        		<select class="form-control" name="yylx"  disabled="disabled">
                        			<option></option>                      
                           		<c:forEach var="pbuztzds" items="${ pbuztzds}" >
									<option value="${pbuztzds.zdxz }">${pbuztzds.zdxm }</option>                           			
                           		</c:forEach>
                           		</select>
                      
                        </div>
                    </div>  
                    <div class="form-group">
                        <label for="yyqc" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yyqc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yyqc" name="yyqc" class="form-control" readonly="readonly" />
                        </div>
                    </div>
                      <div class="form-group">
                        <label for="weblj" class="col-sm-3 control-label">
                            <spring:message code="pubApp.weblj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="weblj" name="weblj" class="form-control" readonly="readonly" />
                        </div>
                    </div>
                      <div class="form-group">
                        <label for="fwlj" class="col-sm-3 control-label">
                            <spring:message code="pubApp.fwlj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwlj" name="fwlj" class="form-control" readonly="readonly"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="yydm" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yydm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yydm" name="yydm" class="form-control" readonly="readonly" />
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label for="yyaqm" class="col-sm-3 control-label">
                            <spring:message code="pubApp.yyaqm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="yyaqm" name="yyaqm" class="form-control" readonly="readonly" />
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubApp.yyzt" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" readonly="readonly" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz">
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
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxrxm" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" name="gxrxm" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxsj" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" id="gxsj"  name="gxsj" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.sjbb" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" name="sjbb" readonly="readonly"/>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="backBtn">
                            	<i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" />
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
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
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
    
    $('#backBtn').click(function(){
    	//父类(index主页)关闭刷新
    	parent.closeLayer();
    	parent.refreshTable();
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
    
    var cjsj = pubApp.cjsj;
    if(cjsj != null && cjsj != ''){
    	$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var gxsj = pubApp.gxsj;	
    if(gxsj != null && gxsj != ''){
    	$('#gxsj').val(moment(gxsj).format('YYYY-MM-DD HH:mm:ss'));
    }
    
});

</script>
</body>
</html>
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
                    <spring:message code="pubPdtthzxx.view" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input name="sjbb" type="hidden">
                    <div class="form-group">
                        <label for="thzbh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubPdtthzxx.thzbh" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="thzbh" name="thzbh" class="form-control"  readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="thzmc" class="col-sm-3 control-label">
                            <spring:message code="pubPdtthzxx.thzmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="thzmc" name="thzmc" class="form-control"  maxLength="50"  readonly="readonly">
                        </div>
                    </div>
                     <!-- 组织机构名称 -->
                   <div class="form-group">
                         <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.zzjgmc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="zzjgmc" name="zzjgmc" readonly="readonly" class="form-control" >
                             <input type="hidden" id="zzjgdm" name="zzjgdm">
                         </div>
					 </div>
                    <!-- 通话组类型 -->
                    <div class="form-group">
                        <label for="thzlx" class="col-sm-3 control-label">
                            <spring:message code="pubPdtthzxx.thzlx" />:
                        </label>
                        <div class="col-sm-9">
                           <select class="form-control" id="thzlx" name="thzlx" disabled="disabled">
                                <option>请选择通话组</option>
                            	<option value="0">固定通话组</option>
                            	<option value="1">动态通话组</option>
                          	</select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.cjr" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" name="cjr" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" id="cjsj" name="cjsj" readonly="readonly" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.gxr" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" name="gxr" readonly="readonly" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.gxsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" id="gxsj"  name="gxsj" readonly="readonly" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="cancelBtn"><i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" /></button>
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
	 
    $('#cancelBtn').click(function(){
    	parent.refreshTable();
    	parent.closeLayer();
    });
    var pdtthzxx = ${pubPdtthzxx};
    ManageForm.loadForm($('form'), pdtthzxx);
    
    if(pdtthzxx.cjsj && pdtthzxx.cjsj != ''){
    	$('#cjsj').val(new Date(pdtthzxx.cjsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    if(pdtthzxx.gxsj && pdtthzxx.gxsj != ''){
    	$('#gxsj').val(new Date(pdtthzxx.gxsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    
    $("#thzlx").val(pdtthzxx.thzlx);
    var sybztate = 'Y' == pdtthzxx.sybz ? true : false;
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
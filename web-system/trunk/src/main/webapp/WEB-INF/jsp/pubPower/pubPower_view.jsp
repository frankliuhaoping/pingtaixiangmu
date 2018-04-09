<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubUser.view" />
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">	
                     <div class="form-group">
                        <label for="yhzh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.yhzh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="yhzh" name="yhzh" class="form-control" required maxlength="32" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="yhmc" class="col-sm-3 control-label">
                            <spring:message code="pubUser.yhmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="yhmc" name="yhmc" class="form-control"  maxlength="32" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pkiid" class="col-sm-3 control-label">
                            <spring:message code="pubUser.pkiid" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pkiid" name="pkiid" class="form-control" maxlength="32" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lxdh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.lxdh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="lxdh" name="lxdh" class="form-control" maxlength="64" contact="true" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="xzqh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.xzqh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="xzqh" name="xzqh" class="form-control" maxlength="8" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ssdwmc" class="col-sm-3 control-label">
                            <spring:message code="pubUser.ssdwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="ssdwmc" name="ssdwmc" class="form-control" maxlength="16" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dldwmc" class="col-sm-3 control-label">
                            <spring:message code="pubUser.dldwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="dldwmc" name="dldwmc" class="form-control" maxlength="16" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <spring:message code="pubUser.pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pxdm" name="pxdm" class="form-control" maxlength="8" digits="true" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubUser.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjrxm" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" name="cjrxm" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" id="cjsj" name="cjsj" readonly="readonly" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxrxm" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" name="gxrxm" readonly="readonly" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" id="gxsj"  name="gxsj" readonly="readonly" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.sjbb" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" class="form-control" name="sjbb" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="backBtn"><i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" /></button>
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
<script type="text/javascript">
$(function () {
	
	var pubUser = ${pubUser};
	var sybztate = 'Y' == pubUser.sybz ? true : false;
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
	
	ManageForm.loadForm($('form'), pubUser);
	
    if(pubUser.cjsj && pubUser.cjsj != ''){
    	$('#cjsj').val(new Date(pubUser.cjsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    if(pubUser.gxsj && pubUser.gxsj != ''){
    	$('#gxsj').val(new Date(pubUser.gxsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    
    $('#backBtn').click(function(){
    	//父类(index主页)关闭刷新
    	parent.closeLayer();
    	parent.refreshTable();
    }); 
});

</script>
</body>
</html>
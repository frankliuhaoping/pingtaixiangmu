<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/common/static/plugins/bootstrap-icon-picker/css/icon-picker.css' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubXtzd.add" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input id="bh" name="bh" type="hidden">
                    <input id="zdfbh" name="zdfbh" type="hidden" value="${zdfbh}">
                    <input id="yyid" name="yyid" type="hidden" value="${param.yyid}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubXtzd.parentZy" />:</label>
                        <div class="col-sm-9">
                            <input id="zdfName" name="zdfName" class="form-control timebox" <c:if test="${not empty zdfName}">value="${zdfName}"</c:if> readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdfzdbh" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzd.zdfzdbh" />:</label>
                        <div class="col-sm-9">
                            <input id="zdfzdbh" name="zdfzdbh" class="form-control" value="${yydm}" readonly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdxz" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzd.zdxz" />:</label>
                        <div class="col-sm-9">
                            <input id="zdxz" name="zdxz" class="form-control"  required maxlength="32" noChinese="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdxm" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubXtzd.zdxm" />:</label>
                        <div class="col-sm-9">
                            <input id="zdxm" name="zdxm" class="form-control"  required maxlength="16">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jhdm" class="col-sm-3 control-label"><spring:message code="pubXtzd.jhdm" />:</label>
                        <div class="col-sm-9">
                            <input id="jhdm" name="jhdm" class="form-control"  maxlength="128"  noChinese="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sjms" class="col-sm-3 control-label"><spring:message code="pubXtzd.sjms" />:</label>
                        <div class="col-sm-9">
                            <input id="sjms" name="sjms" class="form-control" maxlength="64">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control"  value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubXtzd.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
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
<script type="text/javascript" src="<c:url value='/common/static/plugins/bootstrap-icon-picker/js/iconPicker.js' />"></script>
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
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubXtzd/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
    	//父类(index主页)关闭刷新
    	parent.refreshTable();
    	parent.closeLayer();
    	
    });
    
    var dd;
    var dropdownResult;
    Manage.query ("<c:url value='/pubXtzd/getTree' />", {yyid:'${param.yyid}'}, function (result){
        if (result.statusCode == "200") {
            dropdownResult = result.data;
        }
    });
    // 树形下拉框加载标志，如果加载过就不要执行jstree构建
    var treeLoadFlag = false;
    $("#zdfName").focus(function() {
	    dd = Public.dropdown($("#zdfName"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
	    	if (!treeLoadFlag) {
                treeLoadFlag = true;
		    	var typeTree = $('#typeTree');
	   			if (dropdownResult != undefined) {
	                loadTree(typeTree);
	            } else {
	                dd.hide();
	            }
	    	}
	    }});
    });
    
    function loadTree(typeTree) {
    	typeTree.jstree({
            'checkbox': {
                'keep_selected_style': false
            },
            'core': {
                'multiple': false,
                'data': dropdownResult
            },
        });
        typeTree.on('select_node.jstree', function (e, data) {
            var nodeTxt = data.instance.get_node(data.selected[0]).text;
            $('#zdfName').val(nodeTxt.split(" : ")[0]);
            $('#zdfbh').val(data.selected[0]);
            $('#zdfzdbh').val(nodeTxt.split(" : ")[1] + "_");
            if (dd != undefined) {
            	dd.hide();
            }
        });
    }
});
</script>
</body>
</html>
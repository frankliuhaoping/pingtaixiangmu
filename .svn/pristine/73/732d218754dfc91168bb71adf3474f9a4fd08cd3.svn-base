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
                    <spring:message code="pubRes.add" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <input id="zyid" name="zyid" type="hidden">
                    <input id="zyfid" name="zyfid" type="hidden" value="${param.parentId}">
                    <input id="yyid" name="yyid" type="hidden" value="${param.yyid}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubRes.parentZy" />:</label>
                        <div class="col-sm-9 has-feedback">
                            <input id="zyfName" name="zyfName" class="form-control timebox" value="${param.parentName}" readonly>
                            <a id="empty" class="glyphicon glyphicon-remove btn form-control-feedback" style="pointer-events: auto;position:absolute;right:30px;z-index:10px"></a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zymc" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRes.zymc" />:</label>
                        <div class="col-sm-9">
                            <input id="zymc" name="zymc" class="form-control"  required maxlength="20">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zytb" class="col-sm-3 control-label"><spring:message code="pubRes.zytb" />:</label>
                        <div class="col-sm-9">
                            <input type="text" id="zytb" name="zytb" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zyurl" class="col-sm-3 control-label"><spring:message code="pubRes.zyurl" />:</label>
                        <div class="col-sm-9">
                            <input id="zyurl" name="zyurl" class="form-control"  maxlength="128" urlFormat="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qxdm" class="col-sm-3 control-label"><spring:message code="pubRes.qxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="qxdm" name="qxdm" class="form-control"  maxlength="32" noChinese="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRes.zylx" />:</label>
                        <div class="col-sm-9">
                            <select id="zylx" name="zylx" class="form-control" required>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubRes.sybz" />:</label>
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
    //ManageOption.initOptionData($("form"));
    Manage.validate({ignore:'#zytb'});
 	 //不起作用
 	 
    $("#zytb").iconPicker();
    
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
        ManageForm.submitForm($('form'), "<c:url value='/pubRes/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
    	//父类(index主页)先刷新子页在关闭，顺序不可变
    	parent.refreshTable();
    	parent.closeLayer();
    });
    $("#empty").click(function () {
    	$('#zyfName').val("");
        $('#zyfid').val("");
    });
    
    var dd;
    var dropdownResult;
    Manage.query ("<c:url value='/pubRes/getTree' />", {yyid:'${param.yyid}'}, function (result){
        if (result.statusCode == "200") {
            dropdownResult = result.data;
        }
    });
    // 树形下拉框加载标志，如果加载过就不要执行jstree构建
    var treeLoadFlag = false;
    $("#zyfName").click(function() {
	    dd = Public.dropdown($("#zyfName"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
	    	if (!treeLoadFlag) {
                treeLoadFlag = true;
		    	var typeTree = $('#typeTree');
	   			if (dropdownResult != undefined) {
	                loadTree(typeTree);
	            } else {
	            	if (dd != undefined) {
                       dd.hide();
                    }
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
            $('#zyfName').val(nodeTxt);
            $('#zyfid').val(data.selected[0]);
            if (dd != undefined) {
            	dd.hide();
            }
        });
    }
    
    //构建资源类型下拉框
    addSelect ("<c:url value='/getPubXtzdList' />", "zylx", "system_zylx", null);
   
});

</script>
</body>
</html>
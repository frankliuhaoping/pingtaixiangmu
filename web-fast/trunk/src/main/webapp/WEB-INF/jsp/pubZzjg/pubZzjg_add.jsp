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
                    <spring:message code="pubZzjg.add" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal row label-title">
                	<div class="form-group col-sm-4">
                        <label for="gxdwjc" class="col-sm-4 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubZzjg.gxdwjc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="gxdwjc" name="gxdwjc" class="form-control" placeholder="<spring:message code="pubZzjg.gxdwjc" />" required maxLength="32">
                        </div>
                    </div>
                    
                	<div class="form-group col-sm-4">
                        <label for="gxdwdm" class="col-sm-4 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubZzjg.gxdwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="gxdwdm" name="gxdwdm" class="form-control" placeholder="<spring:message code="pubZzjg.gxdwdm" />" readonly>
                        </div>
                    </div>
                    
                	<!-- 
                    <div class="form-group col-sm-4">
                        <label class="col-sm-4 control-label"><spring:message code="pubZzjg.parentJg" />:</label>
                        <div class="col-sm-8">
                            <input id="zyfName" name="zyfName" class="form-control timebox" placeholder="<spring:message code="pubZzjg.parentJg" />" readonly>
 						</div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="olddwdm" class="col-sm-4 control-label">
                           <spring:message code="pubZzjg.olddwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="olddwdm" name="olddwdm" class="form-control" placeholder="<spring:message code="pubZzjg.olddwdm" />" readonly >
                        </div>
                    </div>
                     -->
                    
                    <div class="form-group col-sm-4">
                        <label for="dwdm" class="col-sm-4 control-label">
                           <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubZzjg.dwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwdm" name="dwdm" class="form-control" placeholder="<spring:message code="pubZzjg.dwdm" />" required maxLength="12" digits="true">
                        </div>
                    </div>
                    
                    
                    
                    <div class="form-group col-sm-4">
                        <label for="dwmc" class="col-sm-4 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubZzjg.dwmc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwmc" name="dwmc" class="form-control" placeholder="<spring:message code="pubZzjg.dwmc" />" required maxLength="64">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dwjc" class="col-sm-4 control-label">
                           <spring:message code="pubZzjg.dwjc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwjc" name="dwjc" class="form-control" placeholder="<spring:message code="pubZzjg.dwjc" />" maxLength="32">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="jcpym" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.jcpym" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="jcpym" name="jcpym" class="form-control" placeholder="<spring:message code="pubZzjg.jcpym" />" maxLength="70" noChinese="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dhhm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dhhm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dhhm" name="dhhm" class="form-control" placeholder="<spring:message code="pubZzjg.dhhm" />" maxLength="256" manyMobiles="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="czhm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.czhm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="czhm" name="czhm" class="form-control" placeholder="<spring:message code="pubZzjg.czhm" />" maxLength="256" manyMobiles="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dthm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dthm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dthm" name="dthm" class="form-control" placeholder="<spring:message code="pubZzjg.dthm" />" maxLength="256" amount="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="yjdz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.yjdz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="yjdz" name="yjdz" class="form-control" placeholder="<spring:message code="pubZzjg.yjdz" />" maxLength="256" email="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="jhdwdm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.jhdwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="jhdwdm" name="jhdwdm" class="form-control" placeholder="<spring:message code="pubZzjg.jhdwdm" />" maxLength="32" digits="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="jhdwmc" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.jhdwmc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="jhdwmc" name="jhdwmc" class="form-control" placeholder="<spring:message code="pubZzjg.jhdwmc" />" maxLength="64">
                        </div>
                    </div>
                    
                     <div class="form-group col-sm-4">
                        <label for="dwlb" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dwlb" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwlb" name="dwlb" class="form-control" placeholder="<spring:message code="pubZzjg.dwlb" />" maxLength="2" noChinese="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dwlbms" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dwlbms" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwlbms" name="dwlbms" class="form-control" placeholder="<spring:message code="pubZzjg.dwlbms" />" maxLength="16">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dwjb" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dwjb" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwjb" name="dwjb" class="form-control" placeholder="<spring:message code="pubZzjg.dwjb" />" maxLength="8">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="tjbz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.tjbz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="tjbz" name="tjbz" class="form-control" placeholder="<spring:message code="pubZzjg.tjbz" />" >
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="zz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.zz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="zz" name="zz" class="form-control" placeholder="<spring:message code="pubZzjg.zz" />" >
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="slms" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.slms" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="slms" name="slms" class="form-control" placeholder="<spring:message code="pubZzjg.slms" />" maxLength="512">
                        </div>
                    </div>
                    
                    <!-- 
                    <div class="form-group col-sm-4">
                        <label for="yhsybz110" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.yhsybz110" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="yhsybz110" name="yhsybz110" class="form-control" placeholder="<spring:message code="pubZzjg.yhsybz110" />" useMark="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="yhsybz122" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.yhsybz122" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="yhsybz122" name="yhsybz122" class="form-control" placeholder="<spring:message code="pubZzjg.yhsybz122" />" useMark="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="yhsybz120" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.yhsybz120" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="yhsybz120" name="yhsybz120" class="form-control" placeholder="<spring:message code="pubZzjg.yhsybz120" />" useMark="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="yhsybz119" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.yhsybz119" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="yhsybz119" name="yhsybz119" class="form-control" placeholder="<spring:message code="pubZzjg.yhsybz119" />" useMark="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="qtyhsybz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.qtyhsybz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="qtyhsybz" name="qtyhsybz" class="form-control" placeholder="<spring:message code="pubZzjg.qtyhsybz" />" useMark="true">
                        </div>
                    </div>
                     -->
                    
                    <div class="form-group col-sm-4">
                        <label for="dcsc" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dcsc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dcsc" name="dcsc" class="form-control" placeholder="<spring:message code="pubZzjg.dcsc" />" maxLength="2" digits="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="kjjz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.kjjz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="kjjz" name="kjjz" class="form-control" placeholder="<spring:message code="pubZzjg.kjjz" />" maxLength="12" noChinese="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="jbdwbz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.jbdwbz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="jbdwbz" name="jbdwbz" class="form-control" placeholder="<spring:message code="pubZzjg.jbdwbz" />" maxLength="2" noChinese="true" >
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dwdz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dwdz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dwdz" name="dwdz" class="form-control" placeholder="<spring:message code="pubZzjg.dwdz" />" maxLength="64">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="jdwdm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.jdwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="jdwdm" name="jdwdm" class="form-control" placeholder="<spring:message code="pubZzjg.jdwdm" />" maxLength="12" digits="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="jdwmc" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.jdwmc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="jdwmc" name="jdwmc" class="form-control" placeholder="<spring:message code="pubZzjg.jdwmc" />" maxLength="32" >
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="zgdwdm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.zgdwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="zgdwdm" name="zgdwdm" class="form-control" placeholder="<spring:message code="pubZzjg.zgdwdm" />" maxLength="12" digits="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="zgdwmc" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.zgdwmc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="zgdwmc" name="zgdwmc" class="form-control" placeholder="<spring:message code="pubZzjg.zgdwmc" />" maxLength="64">
                        </div>
                    </div>
                    
                     <div class="form-group col-sm-4">
                        <label for="xgbz" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.xgbz" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="xgbz" name="xgbz" class="form-control" placeholder="<spring:message code="pubZzjg.xgbz" />" maxLength="64">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="dldwdm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dldwdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dldwdm" name="dldwdm" class="form-control" placeholder="<spring:message code="pubZzjg.dldwdm" />" maxLength="12" digits="true">
                        </div>
                    </div>
                    
                     <div class="form-group col-sm-4">
                        <label for="dldwmc" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.dldwmc" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="dldwmc" name="dldwmc" class="form-control" placeholder="<spring:message code="pubZzjg.dldwmc" />" maxLength="64">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="xzb" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.xzb" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="xzb" name="xzb" class="form-control" placeholder="<spring:message code="pubZzjg.xzb" />">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="yzb" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.yzb" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="yzb" name="yzb" class="form-control" placeholder="<spring:message code="pubZzjg.yzb" />">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="pxdm" class="col-sm-4 control-label">
                            <spring:message code="pubZzjg.pxdm" />:
                        </label>
                        <div class="col-sm-8">
                            <input id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pubZzjg.pxdm" />" maxLength="8" digits="true">
                        </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="sybz" class="col-sm-4 control-label"><spring:message code="pubZzjg.sybz" />:</label>
                        <div class="col-sm-8">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
                </form>   
                <form class="form-horizontal  clearfix"> 
                    <div class="form-group col-sm-12">
                        <div class="col-sm-offset-6 col-sm-6">
                            <button type="button" class="btn btn-primary" id="saveBtn"><i class="fa fa-check"></i>&nbsp;&nbsp;<spring:message code="determine" /></button>
                            <button type="button" class="btn btn-default" id="cancelBtn"><i class="fa fa-close"></i>&nbsp;&nbsp;<spring:message code="cancel" /></button>
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
    $("form").validate({
        errorElement: "em",
        errorPlacement: function(error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
            element.parents(".col-sm-8").addClass("has-feedback");

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
    
    $("#gxdwjc").focus(function() {
    	loadTree();
    });
    
    
    /** 树形结构数据:
	    [{
		  "id":1,"text":"Root node","children":[
		    {"id":2,"text":"Child node 1","children":true},
		    {"id":3,"text":"Child node 2"}
		  ]
		}]
    */
    
    var treeDiv;
    // 树形下拉框加载标志，如果加载过就不要执行jstree构建
    var treeLoadFlag = false;
    function loadTree() {
    treeDiv = Public.dropdown($("#gxdwjc"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
    	if (!treeLoadFlag) {
            treeLoadFlag = true;
   	    	$("#typeTree").jstree({
   	            'checkbox': {
   	                'keep_selected_style': false
   	            },
   	            'core' : {
   			        'data' : {
   			            "url" : "<c:url value='/pubZzjg/getTree?type=0' />",
   			            "data" : function (node) {
   			                return { "dwdm" : node.id };
   			            }
   			        }
   			    }
   	        });
   	    	
   	    	$("#typeTree").on('select_node.jstree', function (e, data) {
   	            var nodeTxt = data.instance.get_node(data.selected[0]).text;
   	            $('#gxdwjc').val(nodeTxt);
   	            treeDiv.hide();
   	            
   	             var dwdm = data.selected[0];
   	            // dwdm == -1  表示区分不限组织机构选择
   	            if(dwdm == '-1'){
   	            	$("#gxdwdm").val('');
   	            }else{
   	            	 $("#gxdwdm").val(dwdm);
   	            }
   	            
   	        });
    	}
    	   
    }});
    }
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubZzjg/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
        window.location.href = "<c:url value='/pubZzjg/index?selectId=' />" + $('#parentId').val();
    });
    
});

</script>
</body>
</html>
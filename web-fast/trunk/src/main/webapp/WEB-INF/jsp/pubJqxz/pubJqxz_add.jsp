<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                    <spring:message code="pubJqxz.add" />
                </h5>
                <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
	<div class="ibox-content">
	  <form class="form-horizontal formW60p">
	   <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubJqxz.parentJg" />:</label>
                        <div class="col-sm-9">
                            <input  type="text" id="zyfName" name="zyfName" class="form-control" placeholder="<spring:message code="pubJqxz.parentJg" />" readonly>
                        </div>
                    </div>
	   <div class="form-group">
                        <label for="olddjqxz" class="col-sm-3 control-label">
                           <spring:message code="pubZzjg.olddwdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="olddjqxz" name="olddjqxz" class="form-control" placeholder="<spring:message code="pubZzjg.olddwdm" />" readonly >
                        </div>
                    </div>
	  <div class="form-group">
                        <label for="jqxzbh" class="col-sm-3 control-label">
                             <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzbh" />:
                        </label>
                        <div class="col-sm-9">
                            <input  type="text" id="jqxzbh" name="jqxzbh" class="form-control" placeholder="<spring:message code="pubJqxz.jqxzbh" />" required maxLength="12" digits="true"> 
                        </div>
                    </div>
                    
                    <div class="form-group">
						<label for="jqxzjc" class="col-sm-3 control-label"> 
						
						<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzjc" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="jqxzjc" name="jqxzjc" class="form-control" placeholder="<spring:message code="pubJqxz.jqxzjc" /> " required maxLength="32">
						</div>
					</div>
                    <div class="form-group">
						<label for="jqxzjcpym" class="col-sm-3 control-label"> 		
								<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzjcpym" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="jqxzjcpym" name="jqxzjcpym" class="form-control"
								placeholder="<spring:message code="pubJqxz.jqxzjcpym" />" required maxLength="128">
						</div>
					</div>
<div class="form-group">
						<label for="jqxzqc" class="col-sm-3 control-label"> 
								
								<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.jqxzqc" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="jqxzqc" name="jqxzqc" class="form-control"
								placeholder="<spring:message code="pubJqxz.jqxzqc" />" required maxLength="32">
						</div>
					</div>

					<div class="form-group">
						<label for="bzjqxzbh" class="col-sm-3 control-label"> 
								<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.bzjqxzbh" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="bzjqxzbh" name="bzjqxzbh" class="form-control"
								placeholder="<spring:message code="pubJqxz.bzjqxzbh" />"required  maxLength="12" digits="true">
						</div>
					</div>

					<div class="form-group">
						<label for="bzjqxzmc" class="col-sm-3 control-label">
					<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubJqxz.bzjqxzmc" />:			
								
						</label>
						<div class="col-sm-9">
							<input type="text" id="bzjqxzmc" name="bzjqxzmc" class="form-control"
								placeholder="<spring:message code="pubJqxz.bzjqxzmc" />" required maxLength="32">
						</div>
					</div>

					<div class="form-group">
						<label for="yhsybz110" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.yhsybz110" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="yhsybz110" name="yhsybz110" class="form-control"
								placeholder="<spring:message code="pubJqxz.yhsybz110" />" maxLength="1" useMark="true">
						</div>
					</div>

					<div class="form-group">
						<label for="yhsybz122" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.yhsybz122" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="yhsybz122" name="yhsybz122" class="form-control"
								placeholder="<spring:message code="pubJqxz.yhsybz122" />" maxLength="1" useMark="true">
						</div>
					</div>

					<div class="form-group">
						<label for="yhsybz120" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.yhsybz120" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="yhsybz120" name="yhsybz120" class="form-control"
								placeholder="<spring:message code="pubJqxz.yhsybz120" />" maxLength="1" useMark="true">
						</div>
					</div>

					<div class="form-group">
						<label for="yhsybz119" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.yhsybz119" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="yhsybz119" name="yhsybz119" class="form-control"
								placeholder="<spring:message code="pubJqxz.yhsybz119" />" maxLength="1" useMark="true">
						</div>
					</div>

					<div class="form-group">
						<label for="qtyhsybz" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.qtyhsybz" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="qtyhsybz" name="qtyhsybz" class="form-control"
								placeholder="<spring:message code="pubJqxz.qtyhsybz" />" maxLength="1" useMark="true">
						</div>
					</div>

					<div class="form-group">
						<label for="jqxzyaurl" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.jqxzyaurl" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="jqxzyaurl" name="jqxzyaurl" class="form-control"
								placeholder="<spring:message code="pubJqxz.jqxzyaurl" />" maxLength="64">
						</div>
					</div>

					<div class="form-group">
						<label for="jjqxzdm" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.jjqxzdm" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="jjqxzdm" name="jjqxzdm" class="form-control"
								placeholder="<spring:message code="pubJqxz.jjqxzdm" />" maxLength="12" digits="true">
						</div>
					</div>

					<div class="form-group">
						<label for="jjqxzmc" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.jjqxzmc" />:
						</label>
						<div class="col-sm-9">
							<input  type="text" id="jjqxzmc" name="jjqxzmc" class="form-control"
								placeholder="<spring:message code="pubJqxz.jjqxzmc" />"  maxLength="32">
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
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
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
    
    
    $("#zyfName").click(function() {
    	
    	$("#typeTree").show();
    	loadTree();
    
   });
    
    var treeDiv;
    // 树形下拉框加载标志，如果加载过就不要执行jstree构建
    var treeLoadFlag = false;
    function loadTree() {
        treeDiv = Public.dropdown($("#zyfName"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
        	if (!treeLoadFlag) {
        		treeLoadFlag = true;
        		$("#typeTree").jstree({
                    'checkbox': {
                        'keep_selected_style': false
                    },
                    'core' : {
                        'data' : {
                            "url" : "<c:url value='/pubJqxz/getTree?type=0' />",
                            "data" : function (node) {
                                return { "jqxzbh" : node.id };
                            }
                        }
                    }
                });
                
                $("#typeTree").on('select_node.jstree', function (e, data) {
                    var nodeTxt = data.instance.get_node(data.selected[0]).text;
                    $('#zyfName').val(nodeTxt);
                    treeDiv.hide();
                    
                    var jqxzbh = data.selected[0];
                    // jqxzbh == -1  表示区分不限组织机构选择
                
                         $("#olddjqxz").val(jqxzbh);
                       
                    
                });
        	}
        }});
        }
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubJqxz/saveAdd'/>", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
        window.location.href = "<c:url value='/pubJqxz/index?selectId='/>" + $('#parentId').val();
    });
    
});

</script>




</body>
</html>
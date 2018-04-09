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
	<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<!-- 标题div -->
			<div class="ibox-title">
				<!-- 标题 -->
				<h5> <spring:message code="pubGpssbxx.edit" /> </h5>
				<!--必填提示  -->
				<span class="ibox-sub-title"><span class="fieldRequired">*</span>
				<spring:message code="required" /></span>
			</div>
			<div class="ibox-content">
				<!-- form表单 -->
				<form class="form-horizontal formW60p">
					<!-- 设备编号 -->
					<div class="form-group">
						<label for="sbbh" class="col-sm-3 control-label">
							<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sbbh" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="sbbh" name="sbbh" class="form-control"    readonly="readonly" maxLength="15">
						</div>
					</div>
					<!-- 设备名称 -->
					<div class="form-group">
						<label for="sbmc" class="col-sm-3 control-label"> 
						    <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sbmc" />:
						</label>
						<div class="col-sm-9">
							<input id="sbmc" name="sbmc" class="form-control"   required maxLength="15">
						</div>
					</div>
					  <!-- 组织机构名称 -->
					<div class="form-group">
                        <label for="zzjgmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.zzjgmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="zzjgmc" name="zzjgmc" readonly="readonly" required="required" class="form-control timebox" >
                            <input type="hidden" id="zzjgdm" name="zzjgdm">
                        </div>
                    </div>
                     <!--设备类型 -->
					<div class="form-group">
                        <label for="sblx" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sblx" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="sblx" name="sblx" required="required">
                                <option value="">请选择设备类型</option>
                            	<option value="1">手台</option>
                            	<option value="2">电台</option>
                          	</select>
                        </div>
                    </div>
                     <!--设备状态-->
					<div class="form-group">
                        <label for="sbzt" class="col-sm-3 control-label">
                             <spring:message code="pubGpssbxx.sbzt" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="sbzt" name="sbzt"  >
                                <option value="">请选择设备状态</option>
                            	<option value="1">在线</option>
                            	<option value="-1">离线</option>
                          	</select>
                        </div>
                    </div>
                     <!--设备状态更新时间-->
					<div class="form-group">
                        <label for="sbztgxsj" class="col-sm-3 control-label">
                             <spring:message code="pubGpssbxx.sbztgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="sbztgxsj" name="sbztgxsjs" class="form-control"  />
                        </div>
                    </div>
                    <!--联系电话-->
					<div class="form-group">
                        <label for="lxdh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.lxdh" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="lxdh" name="lxdh" class="form-control"  required maxLength="15"/>
                        </div>
                    </div>
                    <!--绑定人员编号-->
					<div class="form-group">
                        <label for="bdrybh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.bdrybh" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="bdrybh" name="bdrybh" class="form-control"  required maxLength="15"/>
                        </div>
                    </div>
                     <!--绑定人员名称-->
					<div class="form-group">
                        <label for="bdrymc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.bdrymc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="bdrymc" name="bdrymc" class="form-control"  required maxLength="15"/>
                        </div>
                    </div>
                     <!--所在通话组更新时间-->
					<div class="form-group">
                        <label for="szthzgxsj" class="col-sm-3 control-label">
                            <spring:message code="pubGpssbxx.szthzgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="szthzgxsj" name="szthzgxsjs" class="form-control" />
                        </div>
                    </div>
                      <!--工作状态-->
					<div class="form-group">
                        <label for="gzzt" class="col-sm-3 control-label">
                             <spring:message code="pubGpssbxx.gzzt" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="gzzt" name="gzzt">
                            	<option value="">请选择工作状态</option>
                            	<option value="30">按了0键</option>
                            	<option value="31">按了1键</option>
                            	<option value="32">按了2键</option>
                          	</select>
                        </div>
                    </div>
   					 <!--工作状态说明-->
					<div class="form-group">
                        <label for="gzztsm" class="col-sm-3 control-label">
                            <spring:message code="pubGpssbxx.gzztsm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="gzztsm" name="gzztsm" class="form-control"    maxLength="100"/>
                        </div>
                    </div>
                    <!--工作状态更新时间-->
					<div class="form-group">
                        <label for="gzztgxsj" class="col-sm-3 control-label">
                             <spring:message code="pubGpssbxx.gzztgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="gzztgxsj" name="gzztgxsjs" class="form-control"    maxLength="30"/>
                        </div>
                    </div>
                    <!--手台管理状态-->
					<div class="form-group">
                        <label for="stglzt" class="col-sm-3 control-label">
                          <spring:message code="pubGpssbxx.stglzt" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="stglzt" name="stglzt">
                                <option value="">手台管理状态</option>
                            	<option value="正常">正常</option>
                            	<option value="遥晕">遥晕</option>
                            	<option value="遥毙">遥毙</option>
                          	</select>
                        </div>
                    </div>
                    <!--手台管理状态说明-->
					<div class="form-group">
                        <label for="stglztsm" class="col-sm-3 control-label">
                            <spring:message code="pubGpssbxx.stglztsm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="stglztsm" name="stglztsm" class="form-control"    maxLength="100"/>
                        </div>
                    </div>
                    <!--手台管理状态更新时间-->
					<div class="form-group">
                        <label for="stglztgxsj" class="col-sm-3 control-label">
                            <spring:message code="pubGpssbxx.stglztgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="stglztgxsj" name="stglztgxsjs" class="form-control" />
                        </div>
                    </div>
                      <!--使用标志 -->
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubGpssbxx.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
					<!-- 底部按钮组 -->
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

	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
	<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
	<script src="<c:url value='/common/static/plugins/laydate/laydate.js' />" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
	<script type="text/javascript">

	$(function () {
		//初始化表单验证
		Manage.validate();
		 
		/* 时间格式设置 */
		laydate.skin('molv');
		laydate({
		       elem: '#sbztgxsj',
		       istime: true,
		       format: 'YYYY-MM-DD hh:mm:ss'
		  });
		laydate({
		       elem: '#szthzgxsj',
		       istime: true,
		       format: 'YYYY-MM-DD hh:mm:ss'
		  });
		laydate({
		       elem: '#gzztgxsj',
		       istime: true,
		       format: 'YYYY-MM-DD hh:mm:ss'
		  });
		laydate({
			elem : '#stglztgxsj',
			istime: true,
			format : 'YYYY-MM-DD hh:mm:ss'
		}); 
		
		var pubGpssbxx = ${pubGpssbxx};
		var sybztate = 'Y' == pubGpssbxx.sybz ? true : false;
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
		 
	    ManageForm.loadForm($('form'), pubGpssbxx);
	    //保存
	    $('#saveBtn').click(function(){
	        ManageForm.submitForm($('form'), "<c:url value='/pubGpssbxx/saveEdit'/>", {submitFun:function(){$('#cancelBtn').click();}});
	    });
	    //返回
	    $('#cancelBtn').click(function(){
	    	parent.refreshTable();
	    	parent.closeLayer();
	    });
	 
	    var treeDiv;
	    $("#zzjgmc").focus(function() {
	    	loadTree('zzjgmc','zzjgdm');
	    });
	    
	});
	
//树形下拉框加载标志，如果加载过就不要执行jstree构建
var treeLoadFlag = false;
//加载树形单位菜单
function loadTree(dwmc,dwdm){
    treeDiv = Public.dropdown($("#"+dwmc), '<div id="typeTree_'+dwmc+'" style="padding: 10px;"></div>', {onShow:function(){
    	if (!treeLoadFlag) {
            treeLoadFlag = true;
	    	$("#typeTree_"+dwmc).jstree({
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
	    	$("#typeTree_"+dwmc).on('select_node.jstree', function (e, data) {
	            var nodeTxt = data.instance.get_node(data.selected[0]).text;
	            var dwdmValue = data.selected[0];
	            if(nodeTxt == '不限'){
	            	 dwdmValue = '';
	            }
	            $('#'+dwmc).val(nodeTxt);
	            $('#'+dwdm).val(dwdmValue);
	            treeDiv.hide();
	        });
    	}
    	
    }});
}
</script>
</body>
</html>
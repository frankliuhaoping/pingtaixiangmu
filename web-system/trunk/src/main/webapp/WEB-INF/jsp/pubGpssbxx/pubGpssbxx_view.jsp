<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/template/head_basic.jsp" />
<link
	href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/common/static/plugins/bootstrap-icon-picker/css/icon-picker.css' />"
	rel="stylesheet" type="text/css" />
</head>
<body class="gray-bg">

    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubGpssbxx.view" />
                </h5>
            </div>
            <div class="ibox-content">
				<!-- form表单 -->
				<form class="form-horizontal formW60p">
					<!-- 设备编号 -->
					<div class="form-group">
						<label class="col-sm-3 control-label">
							<span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sbbh" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="sbbh" name="sbbh" class="form-control"   readonly="readonly" >
						</div>
					</div>
					<!-- 设备名称 -->
					<div class="form-group">
						<label for="bzjqxzfbh" class="col-sm-3 control-label"> 
						    <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sbmc" />:
						</label>
						<div class="col-sm-9">
							<input id="sbmc" name="sbmc" class="form-control"   readonly="readonly" >
						</div>
					</div>
					<!-- 组织机构代码 -->
					<div class="form-group">
                        <label for="zzjgdm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.zzjgdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="zzjgdm" name="zzjgdm" class="form-control"  readonly="readonly" />
                        </div>
                    </div>
                    <!-- 组织机构名称 -->
					<div class="form-group">
                        <label for="zzjgmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.zzjgmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="zzjgmc" name="zzjgmc" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                     <!--设备类型 -->
					<div class="form-group">
                        <label for="sblx" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sblx" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="sblx" name="sblx"></select>
                        </div>
                    </div>
                     <!--设备状态-->
					<div class="form-group">
                        <label for="sbzt" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sbzt" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="sbzt" name="sbzt">
                          	</select>
                        </div>
                    </div>
                     <!--设备状态更新时间-->
					<div class="form-group">
                        <label for="sbztgxsj" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.sbztgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="sbztgxsj" name="sbztgxsj" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                     <!--联系电话-->
					<div class="form-group">
                        <label for="lxdh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.lxdh" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="lxdh" name="lxdh" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                     <!--绑定人员编号-->
					<div class="form-group">
                        <label for="bdrybh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.bdrybh" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="bdrybh" name="bdrybh" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                     <!--绑定人员名称-->
					<div class="form-group">
                        <label for="bdrymc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.bdrymc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="bdrymc" name="bdrymc" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                     <!--所在通话组-->
					<div class="form-group">
                        <label for="szthz" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.szthz" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="szthz" name="szthz" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                     <!--所在通话组更新时间-->
					<div class="form-group">
                        <label for="szthzgxsj" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.szthzgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="szthzgxsj" name="szthzgxsj" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                      <!--工作状态-->
					<div class="form-group">
                        <label for="gzzt" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.gzzt" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="gzzt" name="gzzt">
                          	</select>
                        </div>
                    </div>
   					 <!--工作状态说明-->
					<div class="form-group">
                        <label for="gzztsm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.gzztsm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="gzztsm" name="gzztsm" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                    <!--工作状态更新时间-->
					<div class="form-group">
                        <label for="gzztgxsj" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.gzztgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="gzztgxsj" name="gzztgxsj" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                    <!--手台管理状态-->
					<div class="form-group">
                        <label for="stglzt" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.stglzt" />:
                        </label>
                        <div class="col-sm-9">
                            <select class="form-control" id="stglzt" name="stglzt">
                          	</select>
                        </div>
                    </div>
                    <!--手台管理状态说明-->
					<div class="form-group">
                        <label for="stglztsm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.stglztsm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="stglztsm" name="stglztsm" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                    <!--手台管理状态更新时间-->
					<div class="form-group">
                        <label for="stglztgxsj" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubGpssbxx.stglztgxsj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="stglztgxsj" name="stglztgxsj" class="form-control"  readonly="readonly"/>
                        </div>
                    </div>
                      <!--使用标志 -->
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubGpssbxx.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"  disabled="disabled"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz"  value="Y">
                    </div>
					<!-- 底部按钮组 -->
					<div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="backBtn"><i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" /></button>
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
	    $('#backBtn').click(function(){
	    	parent.refreshTable();
	    	parent.closeLayer();
	    });
	    
	    var pubGpssbxx = ${pubGpssbxx};
	    
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
	    
	    var cjsj = pubLog.cjsj;
	    if(cjsj != null && cjsj != ''){
	    	$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
	    }
	    
	    var zxztVal = '<spring:message code="pubLog.zxztSuccess" />';
	    if (pubLog.zxzt == 0) {
	    	zxztVal = '<spring:message code="pubLog.zxztFailure" />';
	    }
	    $('#zxzt').val(zxztVal);
	});
	
	   
	
</script>
</body>
</html>
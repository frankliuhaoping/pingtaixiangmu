<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubPdtthzxx.edit" />
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
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubPdtthzxx.thzmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="thzmc" name="thzmc" required="required" class="form-control"  maxLength="50">
                        </div>
                    </div>
                     <!-- 组织机构名称 -->
                   <div class="form-group">
                   		<label for="zzjgmc" class="col-sm-3 control-label">
                          <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubPdtthzxx.zzjgmc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="zzjgmc" name="zzjgmc" readonly="readonly" class="form-control timebox"  required="required">
                             <input type="hidden" id="zzjgdm" name="zzjgdm">
                         </div>
					 </div>
                    <!-- 通话组类型 -->
                    <div class="form-group">
                        <label for="thzlx" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubPdtthzxx.thzlx" />:
                        </label>
                        <div class="col-sm-9">
                           <select class="form-control" id="thzlx" name="thzlx" required>
                                <option></option>
                            	<option value="0">固定通话组</option>
                            	<option value="1">动态通话组</option>
                          	</select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz">
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
    
<jsp:include page="/common/template/script_basic.jsp" />
<jsp:include page="/common/template/script_validate.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript">
$(function () {
	Manage.validate();
	
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubPdtthzxx/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
    	parent.refreshTable();
    	parent.closeLayer();
    });
    var pdtthzxx = ${pubPdtthzxx};
    ManageForm.loadForm($('form'), pdtthzxx);
    
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
	            console.log(dwdmValue);
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
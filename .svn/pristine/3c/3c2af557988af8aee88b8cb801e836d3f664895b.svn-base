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
                    <spring:message code="pubUser.edit" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">	
                	 <input type="hidden" name="yhbh"/>
                	 <input type="hidden" name="sjbb"/>
                     <div class="form-group">
                        <label for="yhzh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubUser.yhzh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="yhzh" name="yhzh" class="form-control" placeholder="<spring:message code="pubUser.yhzh" />" maxlength="32" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="yhmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubUser.yhmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="yhmc" name="yhmc" class="form-control" placeholder="<spring:message code="pubUser.yhmc" />" required maxlength="8">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ssdwmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubUser.ssdwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="ssdwmc" name="ssdwmc" class="form-control" placeholder="<spring:message code="pubUser.ssdwmc" />" readonly="readonly" maxlength="16">
                        </div>
                        <input type="hidden" id="ssdwdm" name="ssdwdm">
                    </div>
                    <div class="form-group">
                        <label for="dldwmc" class="col-sm-3 control-label">
                            <spring:message code="pubUser.dldwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="dldwmc" name="dldwmc" class="form-control" placeholder="<spring:message code="pubUser.dldwmc" />" readonly="readonly" maxlength="16">
                        </div>
                        <input type="hidden" id="dldwdm" name="dldwdm">
                    </div>
                    <div class="form-group">
                        <label for="xzqh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.xzqh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="xzqh" name="xzqh" class="form-control" placeholder="<spring:message code="pubUser.xzqh" />" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pkiid" class="col-sm-3 control-label">
                            <spring:message code="pubUser.pkiid" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pkiid" name="pkiid" class="form-control" placeholder="<spring:message code="pubUser.pkiid" />" maxlength="32" noChinese="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lxdh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.lxdh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="lxdh" name="lxdh" class="form-control" placeholder="<spring:message code="pubUser.lxdh" />" maxlength="64" contact="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <spring:message code="pubUser.pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pubUser.pxdm" />" value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubUser.sybz" />:</label>
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
    
<jsp:include page="/common/template/script_validate.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script type="text/javascript">
$(function () {
	
	Manage.validate();
 	
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
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubUser/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    
    $('#cancelBtn').click(function(){
        Manage.url("<c:url value='/pubUser/index'/>", {limit: '${param.limit}', offset: '${param.offset}', selectId: '${param.id}'});
    }); 
    
    $("#ssdwmc").focus(function() {
    	loadTree('ssdwmc','ssdwdm');
    });
    
    $("#dldwmc").focus(function() {
    	loadTree('dldwmc','dldwdm');
    });
    
});

// 构建下拉框树
var treeDiv;
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
	            $('#'+dwmc).val(nodeTxt);
	            $('#'+dwdm).val(data.selected[0]);
	            treeDiv.hide();
	            // 所属单位选择自动生成行政区划
	            if (dwmc == "ssdwmc") {
	                // 根据所选的单位来生成行政代码
	                var parent = data.node.parent;
	                var xzqh = data.selected[0];
	                // 根节点
	                if (parent == "#") {
	                    //从数据库中获取截取位数
	                    var rootNumber = ${xzqh_root_number};
	                    if (xzqh.length >= rootNumber) {
	                        xzqh = xzqh.substring (0, rootNumber);
	                    }
	                } else {
	                    // 从数据库中获取截取位数
	                    var otherNumber = ${xzqh_other_number};
	                    if (xzqh.length >= otherNumber) {
	                        xzqh = xzqh.substring (0, otherNumber);
	                    }
	                }
	                $('#xzqh').val(xzqh);
	            }
	        });
	   }
        
    }});
}

</script>
</body>
</html>
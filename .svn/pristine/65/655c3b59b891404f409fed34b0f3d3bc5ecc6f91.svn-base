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
                    <spring:message code="pubRes.view" />
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubRes.parentZy" />:</label>
                        <div class="col-sm-9">
                            <input id="zyfName" name="zyfName" class="form-control" <c:if test="${not empty zyfName}">value="${zyfName}"</c:if> disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zymc" class="col-sm-3 control-label"><spring:message code="pubRes.zymc" />:</label>
                        <div class="col-sm-9">
                            <input id="zymc" name="zymc" class="form-control" required maxlength="32" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zytb" class="col-sm-3 control-label"><spring:message code="pubRes.zytb" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" id="zytb" name="zytb" class="form-control" disabled="disabled"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zyurl" class="col-sm-3 control-label"><spring:message code="pubRes.zyurl" />:</label>
                        <div class="col-sm-9">
                            <input id="zyurl" name="zyurl" class="form-control" maxlength="128" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qxdm" class="col-sm-3 control-label"><spring:message code="pubRes.qxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="qxdm" name="qxdm" class="form-control" maxlength="32" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubRes.zylx" />:</label>
                        <div class="col-sm-9">
                            <select name="zylx" class="form-control" required disabled="disabled">
                                <option value=""><spring:message code="pleaseSelect" /></option>
                                <option value="1"><spring:message code="pubRes.menu" /></option>
                                <option value="2"><spring:message code="pubRes.button" /></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubRes.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox" disabled="disabled"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjrxm" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" disabled="disabled" class="form-control" name="cjrxm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" disabled="disabled" class="form-control" id="cjsj" name="cjsj" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxrxm" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" disabled="disabled" class="form-control" name="gxrxm" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" disabled="disabled" class="form-control" id="gxsj"  name="gxsj" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.sjbb" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" disabled="disabled" class="form-control" name="sjbb"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
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
    //ManageOption.initOptionData($("form"));
    Manage.validate();
 
    var first = true;
    var pubRes = ${pubRes};
    /* var dd;
    var dropdownResult;
    
    Manage.query ("<c:url value='/pubRes/getTree' />", {yyid:pubRes.yyid}, function (result){
        if (result.statusCode == "200") {
        	dropdownResult = result.data;
        	if(pubRes.zyfid != 0) {
                for(var i = 0;i < dropdownResult.length;i++){
                    if(dropdownResult[i].id && dropdownResult[i].id == pubRes.zyfid){
                        $('#zyfName').val(result.data[i].text);
                        return false;
                    }
                }
            }
        }
    });
    
    $("#zyfName").focus(function() {
         dd = Public.dropdown($("#zyfName"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
            var typeTree = $('#typeTree');
            if (first) {
                if (dropdownResult != undefined) {
                	loadTree(typeTree);
                } else {
                    dd.hide();
                }
            } else {
            	loadTree(typeTree);
            }
            
        }});
    }); */
    
    ManageForm.loadForm($('form'), pubRes);
    
    if(pubRes.cjsj && pubRes.cjsj != ''){
    	$('#cjsj').val(new Date(pubRes.cjsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    if(pubRes.gxsj && pubRes.gxsj != ''){
    	$('#gxsj').val(new Date(pubRes.gxsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    
    var sybztate = 'Y' == pubRes.sybz ? true : false;
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
    
    $('#cancelBtn').click(function(){
        Manage.url("<c:url value='/pubRes/index' />?yyid="+pubRes.yyid);
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
        typeTree.on('ready.jstree', function(e, data){
            if(pubRes.zyfid != 0) {
                typeTree.jstree('select_node', pubRes.zyfid);
            }
        });
        typeTree.on('select_node.jstree', function (e, data) {
            var nodeTxt = data.instance.get_node(data.selected[0]).text;
            $('#zyfName').val(nodeTxt);
            $('#zyfid').val(data.selected[0]);
            if(!first) {
                if (dd != undefined) {
                    dd.hide();
                }
            }
            first = false;
        });
    }
    
});
</script>
</body>
</html>
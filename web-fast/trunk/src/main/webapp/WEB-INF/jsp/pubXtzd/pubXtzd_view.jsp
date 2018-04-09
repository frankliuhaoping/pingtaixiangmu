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
                    <spring:message code="pubXtzd.view" />
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubXtzd.parentZy" />:</label>
                        <div class="col-sm-9">
                            <input id="zdfName" name="zdfName" class="form-control" <c:if test="${not empty zdfName}">value="${zdfName}"</c:if> readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdxm" class="col-sm-3 control-label"><spring:message code="pubXtzd.zdxm" />:</label>
                        <div class="col-sm-9">
                            <input id="zdxm" name="zdxm" class="form-control" required maxlength="32" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zdxz" class="col-sm-3 control-label"><spring:message code="pubXtzd.zdxz" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" id="zdxz" name="zdxz" class="form-control" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jhdm" class="col-sm-3 control-label"><spring:message code="pubXtzd.jhdm" />:</label>
                        <div class="col-sm-9">
                            <input id="jhdm" name="jhdm" class="form-control" maxlength="128" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sjms" class="col-sm-3 control-label"><spring:message code="pubXtzd.sjms" />:</label>
                        <div class="col-sm-9">
                            <input id="sjms" name="sjms" class="form-control" maxlength="32" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label"><spring:message code="pxdm" />:</label>
                        <div class="col-sm-9">
                            <input id="pxdm" name="pxdm" class="form-control" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubXtzd.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjrxm" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" readonly="readonly" class="form-control" name="cjrxm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" readonly="readonly" class="form-control" id="cjsj" name="cjsj" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxrxm" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" readonly="readonly" class="form-control" name="gxrxm" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.gxsj" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" readonly="readonly" class="form-control" id="gxsj"  name="gxsj" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="pubUser.sjbb" />:</label>
                        <div class="col-sm-9">
                        	<input type="text" readonly="readonly" class="form-control" name="sjbb"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-default" id="backBtn"><spring:message code="back" /></button>
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
 
    var first = true;
    var pubXtzd = ${pubXtzd};
    
    ManageForm.loadForm($('form'), pubXtzd);
    
    if(pubXtzd.cjsj && pubXtzd.cjsj != ''){
    	$('#cjsj').val(new Date(pubXtzd.cjsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    if(pubXtzd.gxsj && pubXtzd.gxsj != ''){
    	$('#gxsj').val(new Date(pubXtzd.gxsj).format('yyyy-MM-dd hh:mm:ss'));
    }
    
    var sybztate = 'Y' == pubXtzd.sybz ? true : false;
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
    
    $('#backBtn').click(function(){
        Manage.url("<c:url value='/pubXtzd/index' />", {yyid: pubXtzd.yyid});
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
            if(pubXtzd.zyfid != 0) {
                typeTree.jstree('select_node', pubXtzd.zdfbh);
            }
        });
        typeTree.on('select_node.jstree', function (e, data) {
            var nodeTxt = data.instance.get_node(data.selected[0]).text;
            $('#zdfName').val(nodeTxt);
            $('#zdfbh').val(data.selected[0]);
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
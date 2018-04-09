<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubLog.view" />
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                    <div class="form-group">
                        <label for="xtm" class="col-sm-3 control-label">
                            <spring:message code="pubLog.xtm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="xtm" name="xtm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.xtm" />" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fwlj" class="col-sm-3 control-label">
                            <spring:message code="pubLog.fwlj" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwlj" name="fwlj" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.fwlj" />" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jscs" class="col-sm-3 control-label"><spring:message code="pubLog.jscs" />:</label>
                        <div class="col-sm-9">
                            <textarea id="jscs" name="jscs" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.jscs" />" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="khdip" class="col-sm-3 control-label">
                            <spring:message code="pubLog.khdip" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="khdip" name="khdip" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.khdip" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="zxzt" class="col-sm-3 control-label"><spring:message code="pubLog.zxzt" />:</label>
                        <div class="col-sm-9">
                            <input id="zxzt" name="zxzt" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.zxzt" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zxsj" class="col-sm-3 control-label"><spring:message code="pubLog.zxsj" />:</label>
                        <div class="col-sm-9">
                            <input id="zxsj" name="zxsj" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.zxsj" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjrxm" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" name="cjrxm" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" id="cjsj" name="cjsj" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="ycxx" class="col-sm-3 control-label"><spring:message code="pubLog.ycxx" />:</label>
                        <div class="col-sm-9">
                            <textarea id="ycxx" name="ycxx" class="form-control" readonly="readonly" placeholder="<spring:message code="pubLog.ycxx" />" rows="6"></textarea>
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
    
<jsp:include page="/common/template/script_basic.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
$(function () {
    $('#backBtn').click(function(){
        window.location.href = "<c:url value='/pubLog/index?selectId=' />" + $('#parentId').val();
    });
    
    var pubLog = ${pubLog};
    ManageForm.loadForm($('form'), pubLog);
    
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
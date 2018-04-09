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
                    <spring:message code="pubSchlog.view" />
                </h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                	<div class="form-group">
                        <label for="rwzxid" class="col-sm-3 control-label">
                            <spring:message code="pubSchlog.rwzxid" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="rwzxid" name="rwzxid" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.rwzxid" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fwdm" class="col-sm-3 control-label">
                            <spring:message code="pubSchlog.fwdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="fwdm" name="fwdm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.fwdm" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rwmc" class="col-sm-3 control-label">
                            <spring:message code="pubSchlog.rwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="rwmc" name="rwmc" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.rwmc" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="cron" class="col-sm-3 control-label">
                            <spring:message code="pubSchlog.cron" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="cron" name="cron" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.cron" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lm" class="col-sm-3 control-label">
                            <spring:message code="pubSchlog.lm" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="lm" name="lm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.lm" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ffm" class="col-sm-3 control-label"><spring:message code="pubSchlog.ffm" />:</label>
                        <div class="col-sm-9">
                            <textarea id="ffm" name="ffm" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.ffm" />" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zxip" class="col-sm-3 control-label">
                            <spring:message code="pubSchlog.zxip" />:
                        </label>
                        <div class="col-sm-9">
                            <input id="zxip" name="zxip" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.zxip" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="zxzt" class="col-sm-3 control-label"><spring:message code="pubSchlog.zxzt" />:</label>
                        <div class="col-sm-9">
                            <input id="zxzt" name="zxzt" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.zxzt" />">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="zxsj" class="col-sm-3 control-label"><spring:message code="pubSchlog.zxsj" />:</label>
                        <div class="col-sm-9">
                            <input id="zxsj" name="zxsj" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.zxsj" />">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="cjsj" />:</label>
                        <div class="col-sm-9">
                        	<input readonly="readonly" class="form-control" id="cjsj" name="cjsj" readonly="readonly"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="ycxx" class="col-sm-3 control-label"><spring:message code="pubSchlog.ycxx" />:</label>
                        <div class="col-sm-9">
                            <textarea id="ycxx" name="ycxx" class="form-control" readonly="readonly" placeholder="<spring:message code="pubSchlog.ycxx" />" rows="6"></textarea>
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
        window.location.href = "<c:url value='/pubSchlog/index?selectId=' />" + $('#parentId').val();
    });
    
    var pubSchlog = ${pubSchlog};
    ManageForm.loadForm($('form'), pubSchlog);
    
    var cjsj = pubSchlog.cjsj;
    if(cjsj != null && cjsj != ''){
    	$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
    }
    
    var zxztVal = '<spring:message code="pubSchlog.zxztSuccess" />';
    if (pubSchlog.zxzt == 0) {
    	zxztVal = '<spring:message code="pubSchlog.zxztFailure" />';
    }
    $('#zxzt').val(zxztVal);
});

</script>
</body>
</html>
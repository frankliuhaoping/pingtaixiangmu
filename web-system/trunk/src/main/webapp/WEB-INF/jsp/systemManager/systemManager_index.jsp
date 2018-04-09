<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
      <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        
        <%--右边数据显示 begin --%>
        <div class="col-sm-12" style="padding-left:10px;padding-right:0;">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>机器信息</h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                    	<button id="removeBtn" type="button" class="btn" title="<spring:message code="remove" />">
                          	<i class="fa fa-times-circle"></i>&nbsp;<spring:message code="batchRemove"/>
                      	</button>
	                    <button id="refreshBtn" type="button" class="btn">
                            <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                            
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped" data-mobile-responsive="true">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="userName" >用户名</th>
                                        <th data-field="osInfo" >操作系统</th>
                                        <th data-field="ipAddress" >ip地址</th>
                                        <th data-field="operate" data-formatter="actionFormatter"><spring:message code="operate" /></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--右边数据显示 end --%>
  </div>
<jsp:include page="/common/template/script_basic_table.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript">
//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
var indexPage;
//table对象
var table = $('.table');
//url定义
var systemManagerUrl = {
    index: "<c:url value='/systemManager/index' />",
    view: "<c:url value='/systemManager/view/' />",
    getData: "<c:url value='/systemManager/getData' />",
};
//初始化表格和按钮
$(function () {
	initTable();
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, systemManagerUrl.getData,null);
    });
     
});

//初始化表格
function initTable()
{
	    table.bootstrapTable({
	        url: systemManagerUrl.getData,
	        toolbar: '#tableToolbar',uniqueId:'userName', clickToSelect: true,pagination: true 
	    }); 
}

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

//ipaddress formatter
function addressFormatter (value) {
    var html = '';
    $.each (value, function(index,ipaddress){
        html += ipaddress + "/";
    }); 
    return html;
}

//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    html += '<a href="javascript:void(0);" onclick="view()" title="查看cpu"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    html += '</div>';
    return html;
}

//查看具体cpu
function view() {
	indexPage = Layer.openIframeByOptions(systemManagerUrl.view,{});
}

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	 $("#refreshBtn").click();
}
</script>
</body>
</html>
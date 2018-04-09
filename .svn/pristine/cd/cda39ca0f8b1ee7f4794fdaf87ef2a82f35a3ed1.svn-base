<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="cacheManager.list" /></h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
	                    <button id="refreshBtn" type="button" class="btn btn-default">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
	                    <button id="removeBtn" type="button" class="btn btn-default" title="<spring:message code="remove" />">
                          	<i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove"/>
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
                                        <th data-field="cacheName"><spring:message code="cacheManager.cacheName" /></th>
                                        <th data-field="objectCount"><spring:message code="cacheManager.objectCount" /></th>
                                        <th data-field="memorySize"><spring:message code="cacheManagerDetail.size" /></th>
                                        <th data-field="ipAddresses" data-formatter="addressFormatter"><spring:message code="cacheManager.ipAddresses" /></th>
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

<jsp:include page="/common/template/script_basic_table.jsp" />
<script type="text/javascript">
//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var cacheManagerUrl = {
    index: "<c:url value='/cacheManager/index' />",
    view: "<c:url value='/cacheManager/view/' />",
    getData: "<c:url value='/cacheManager/getData' />",
    remove: "<c:url value='/cacheManager/delete/' />",
    removeBatch: "<c:url value='/cacheManager/deleteBatch' />"
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: cacheManagerUrl.getData,
        toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, pagination: true
    });
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, cacheManagerUrl.getData);
    });
    // 批量删除缓存
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, cacheManagerUrl.removeBatch, function(){window.location.href = cacheManagerUrl.index + "?limit=" + limit + "&offset=" + offset;}, "cacheName");
    });
    $("#testBtn").click(function(){
        Manage.query ("<c:url value='/cacheManager/test' />");
    });
});

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
        html += ipaddress + "<br/>";
    }); 
    return html;
}

//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    html += '<a href="javascript:void(0);" onclick="view(\''+row.cacheName+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    html += '<a href="javascript:void(0);" onclick="del(\''+row.cacheName+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    html += '</div>';
    return html;
}

//查看缓存
function view(cacheName) {
    window.location.href = cacheManagerUrl.view + cacheName + "?limit=" + limit + "&offset=" + offset + "&id=" + cacheName;
}

//删除缓存
function del(rowId) {
    ManageGrid.deleteSingle(cacheManagerUrl.remove + rowId, function(){window.location.href = cacheManagerUrl.index + "?limit=" + limit + "&offset=" + offset;});
}
</script>
</body>
</html>
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
                <h5>${cacheName}-<spring:message code="cacheManagerDetail.list" /></h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                        <div class="btn-group hidden-xs" role="group">
                            <button id="refreshBtn" type="button" class="btn btn-default" title="<spring:message code="refresh" />">
                                <i class="glyphicon glyphicon-refresh" aria-hidden="true"></i>
                            </button>
                            <button id="removeBtn" type="button" class="btn btn-default" title="<spring:message code="remove" />">
                                <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-default" id="backBtn"><spring:message code="back" /></button>
                        </div>
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
                                        <th data-field="objectKey"><spring:message code="cacheManagerDetail.objectKey" /></th>
                                        <th data-field="hitCount"><spring:message code="cacheManagerDetail.hitCount" /></th>
                                        <th data-field="size"><spring:message code="cacheManagerDetail.size" /></th>
                                        <th data-field="creationTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.creationTime" /></th>
                                        <th data-field="latestOfCreationAndUpdateTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.latestOfCreationAndUpdateTime" /></th>
                                        <th data-field="lastAccessTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.lastAccessTime" /></th>
                                        <th data-field="expirationTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.expirationTime" /></th>
                                        <th data-field="timeToIdle"><spring:message code="cacheManagerDetail.timeToIdle" /></th>
                                        <th data-field="version"><spring:message code="cacheManagerDetail.version" /></th>
                                        <%-- <th data-field="objectValue" data-width="25%"><spring:message code="cacheManagerDetail.objectValue" /></th> --%>
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
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var cacheDetailsManagerUrl = {
    index: "<c:url value='/cacheManager/view/' />" + '${cacheName}',
    getDetails: "<c:url value='/cacheManager/getDetails/' />",
    getDataByPage: "<c:url value='/cacheManager/getDataByPage' />",
    remove: "<c:url value='/cacheManager/deleteDetails/' />" + '${cacheName}' + "/",
    view: "<c:url value='/cacheManager/viewDetail/' />" + '${cacheName}' + "/",
    removeBatch: "<c:url value='/cacheManager/deleteBatchDetails/' />" + '${cacheName}'
};

//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    /* table.bootstrapTable({//前端分页
        url: cacheDetailsManagerUrl.getDetails + '${cacheName}',
        toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, pagination: true
    }); */
    table.bootstrapTable({
        url: cacheDetailsManagerUrl.getDataByPage,
        queryParams: function (params) {
            params.searchProperty = searchFields;
            if (limit != "") {
                if (firstLoadFlag) {
                    params.limit = parseInt(limit);
                    params.offset = parseInt(offset);
                }
            }
            limit = params.limit;
            offset = params.offset;
            params.cacheName = '${cacheName}';
            return params;
        },
        onLoadSuccess: function () {
            if (firstLoadFlag && offset != 0) {
                table.bootstrapTable("selectPage", offset/limit + 1);
            }
            firstLoadFlag = false;
            setTimeout ("checkByTable()", 100);
            //console.log (table.bootstrapTable("getOptions"));
        },
        toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    $('#backBtn').click(function(){
        window.location.href = "<c:url value='/cacheManager/index' />";
    });
    // 批量删除缓存
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, cacheDetailsManagerUrl.removeBatch, function(){window.location.href = cacheDetailsManagerUrl.index + "?limit=" + limit + "&offset=" + offset;}, "objectKey");
    });
    $("#refreshBtn").click(function(){
        //ManageGrid.refreshTable(table, cacheDetailsManagerUrl.getDetails + '${cacheName}');
        ManageGrid.refreshTable(table, cacheDetailsManagerUrl.getDataByPage);
    });
});

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    html += '<a href="javascript:void(0);" onclick="view(\''+row.objectKey+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    html += '<a href="javascript:void(0);" onclick="del(\''+row.objectKey+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    html += '</div>';
    return html;
}

function dateFormatter (value, row) {
    var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
    return html;
}

//删除缓存
function del(rowId) {
    ManageGrid.deleteSingle(cacheDetailsManagerUrl.remove + rowId, function(){window.location.href = cacheDetailsManagerUrl.index + "?limit=" + limit + "&offset=" + offset;});
}

//查看细节
function view(rowId) {
	window.location.href = cacheDetailsManagerUrl.view + rowId + "?limit=" + limit + "&offset=" + offset + "&cacheName=" + '${cacheName}' + "&id=" + rowId;
}
</script>
</body>
</html>
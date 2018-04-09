<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
                <h5><spring:message code="pubSchedule.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
	                    <shiro:hasPermission name="sys:pubSchedule:add">
	                        <c:set var='addPer' value='true' />
	                        <button id="addBtn" type="button" class="btn btn-default">
	                            <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
	                        </button>
	                    </shiro:hasPermission>
	                    <shiro:hasPermission name="sys:pubSchedule:delete">
                			<c:set var='deletePer' value='true' />
                         	<button id="removeBtn" type="button" class="btn btn-default">
                             	<i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove" />
                         	</button>
                     	</shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn btn-default">
                   			<i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
	                  	</button>
	                  
                    </div>
                </div>
            </div>
            <div class="ibox-content">
				<form method="get" class="form-horizontal" id="searchUserForm">
	            	<div class="row labelpd0">
	            		<div class="form-group col-sm-4">
	                    	<label class="col-sm-3 control-label"><spring:message code="pubSchedule.fwdm" />:</label>
	                        <div class="col-sm-9">
	                            <input type="text" id="fwdm" name="fwdm" class="form-control">
	                        </div>
	                    </div>
	                    <div class="form-group col-sm-4">
	                        <label class="col-sm-3 control-label"><spring:message code="pubSchedule.rwmc" />:</label>
	                        <div class="col-sm-9">
	                            <input type="text" id="rwmc" name="rwmc" class="form-control">
	                        </div>
	                    </div>
	                    <div class="form-group col-sm-4">
	                    	<label class="col-sm-3 control-label"><spring:message code="pubSchedule.lm" />:</label>
	                        <div class="col-sm-9">
	                        	<input type="text" id="lm" name="lm" class="form-control">
	                    	</div>
	                    </div>
	                    <div class="form-group col-sm-4">
	                         <label class="col-sm-3 control-label"><spring:message code="pubSchedule.ffm" />:</label>
	                         <div class="col-sm-9">
	                             <input type="text" id="ffm" name="ffm" class="form-control">
	                         </div>
	                    </div>
	                    <div class="form-group col-sm-4">
	                   		<label class="col-sm-3 control-label"><spring:message code="pubSchedule.sybz" />:</label>
	                        <div class="col-sm-9">
                        		<select id="sybz_select" class="form-control">
                        			<option value ="">请选择</option>
									<option value ="Y">启用</option>
								  	<option value ="N">禁用</option>
								</select>
                        	</div>
	                    </div>
	                <div class="form-group col-sm-4">
	                     </div>
	                     <div class="form-group col-sm-4">
	                         <div class="col-sm-6">
	                         </div>
	                         <div class="col-sm-6">
	                             <div class="col-sm-4">
	                             </div>
		                         <div class="col-sm-4">
				                     <button type="button" id="searchBtn" class="btn btn-primary">
				                         <spring:message code="find" />
				                     </button>
			                     </div>
			                     <div class="col-sm-4">
				                     <button type="reset" id="resetBtn" class="btn btn-primary">
				                         <spring:message code="reset" />
			                         </button>
		                         </div>
	                         </div>
                        </div>
                     </div>
	            </form>
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                            <div class="form-inline" role="form">
                                <shiro:hasPermission name="sys:pubSchedule:edit">
                                    <c:set var='editPer' value='true' />
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:pubSchedule:view">
                                    <c:set var='viewPer' value='true' />
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped" height="auto">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="rwid" data-visible="false"><spring:message code="pubSchedule.rwid" /></th>
                                        <th data-field="fwdm" data-sortable="true" data-sort-name="fwdm"><spring:message code="pubSchedule.fwdm"/></th>
                                        <th data-field="rwmc" data-sortable="true" data-sort-name="rwmc"><spring:message code="pubSchedule.rwmc"/></th>
                                        <th data-field="cron" data-sortable="true" data-sort-name="cron"><spring:message code="pubSchedule.cron"/></th>
                                        <th data-field="lm" data-sortable="true" data-sort-name="lm"><spring:message code="pubSchedule.lm"/></th>
                                        <th data-field="ffm" data-sortable="true" data-sort-name="ffm"><spring:message code="pubSchedule.ffm"/></th>
                                        <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubSchedule.sybz"/></th>
                                        <th data-field="rwzt" data-sortable="true" data-sort-name="rwzt" data-formatter="rwztFormatter"><spring:message code="pubSchedule.rwzt"/></th>
                                        <%--<th data-field="cjsj" data-sortable="true" data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message code="pubSchedule.cjsj" /></th> --%>
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

//获取页面权限值
var addPer = ${addPer};
var editPer = ${editPer};
var deletePer = ${deletePer};
var viewPer = ${viewPer};

//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var pubScheduleUrl = {
    index: "<c:url value='/pubSchedule/index' />",
    view: "<c:url value='/pubSchedule/view/' />",
    add: "<c:url value='/pubSchedule/add' />",
    edit: "<c:url value='/pubSchedule/edit/' />",
    remove: "<c:url value='/pubSchedule/delete/' />",
    removeBatch: "<c:url value='/pubSchedule/deleteBatch' />",
    getDataByPage: "<c:url value='/pubSchedule/getDataByPage' />"
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: pubScheduleUrl.getDataByPage,
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
            
            params.fwdm = $.trim($("#fwdm").val());
            params.rwmc = $.trim($("#rwmc").val());
            params.lm = $.trim($("#lm").val());
            params.ffm = $.trim($("#ffm").val());
            params.sybz = $.trim($("#sybz_select option:selected").val());
            
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
        toolbar: '#tableToolbar', uniqueId: 'rwid', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    $("#addBtn").click(function(){
        window.location.href = pubScheduleUrl.add + "?limit=" + limit + "&offset=" + offset;
    });
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubScheduleUrl.removeBatch, function(){window.location.href = pubScheduleUrl.index + "?limit=" + limit + "&offset=" + offset;}, "rwid");
    });
    //查询
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubScheduleUrl.getDataByPage);
    });
    
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, pubScheduleUrl.getDataByPage);
    });
    
    $("#resetBtn").click(function(){
		$("#fwdm").val("");
		$("#rwmc").val("")
		$("#lm").val("")
		$("#ffm").val("")
		$("#sybz_select").val("")
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
    if (viewPer) {
        html += '<a href="javascript:void(0);" onclick="view(\''+row.rwid+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    
    if (editPer) {
        html += '<a href="javascript:void(0);" onclick="edit(\''+row.rwid+'\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    
    if (deletePer) {
        html += '<a href="javascript:void(0);" onclick="del(\''+row.rwid+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    
    html += '</div>';
    return html;
}

// 修改定时任务
function edit(rowId) {
    window.location.href = pubScheduleUrl.edit + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
}

// 删除定时任务
function del(rowId) {
    ManageGrid.deleteSingle(pubScheduleUrl.remove + rowId, function(){window.location.href = pubScheduleUrl.index + "?limit=" + limit + "&offset=" + offset;});
}

// 查看定时任务
function view(rowId) {
    window.location.href = pubScheduleUrl.view + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
}

//时间处理formatter
function dateFormatter (value, row) {
    var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
    return html;
}
function rwztFormatter(value, row) {
	if ('Y' == row.rwzt) {
		return '<span style="color:green">生产</span>';
	} else if ('N' == row.rwzt) {
		return '<span style="color:red">调试</span>';
	}
	return '';
}
</script>
</body>
</html>
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
                <h5><spring:message code="pubFile.list" /></h5>
                <div class="ibox-tools">
                	<c:set var='deletePer' value='false' />
                    <c:set var='downLoadPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
						<shiro:hasPermission name="sys:pubFile:delete">
              				<c:set var='deletePer' value='true' />
                        <button id="removeBtn" type="button" class="btn btn-default" title="<spring:message code="remove" />">
                        	<i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove"/>
                        </button>
		                </shiro:hasPermission>
		                <shiro:hasPermission name="sys:pubFile:downLoad">
                            <c:set var='downLoadPer' value='true' />
                        </shiro:hasPermission>
                         <button type="button" id="searchBtn" class="btn btn-default">
	                        <i class="glyphicon glyphicon glyphicon-search fz12" aria-hidden="true"></i><spring:message code="find"/>
 	                    </button>
                        <button id="refreshBtn" type="button" class="btn btn-default">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                        <button type="button" id="resetBtn" class="btn btn-default">
							<i class="glyphicon glyphicon-repeat fz12" aria-hidden="true"></i><spring:message code="reset" />
						</button>
					</div>
                </div>
            </div>
            <div class="ibox-content">
	            <form class="form-horizontal" style="margin-top:10px;">
                     <div class="row labelpd0">
                       <div class="form-group col-sm-4">
                          <label class="col-sm-3 control-label"><spring:message code="pubFile.wjm" />:</label>
                          <div class="col-sm-9">
                              <input type="text" id="wjm" name="wjm" class="form-control">
                          </div>
                       </div>
                       <div class="form-group col-sm-4">
                          <label class="col-sm-3 control-label"><spring:message code="pubFile.wjgs" />:</label>
                          <div class="col-sm-9">
                              <input type="text" id="wjgs" name="wjgs" digits="true" class="form-control">
                          </div>
                       </div>
                       <div class="form-group col-sm-4">
                          <label class="col-sm-3 control-label"><spring:message code="starttime"/>:</label>
                          <div class="col-sm-9">
                          	  <input type="text" id="starttime" name="starttime" readonly="readonly" class="form-control timebox" placeholder="开始时间">
                          </div>
                       </div>
                       <div class="form-group col-sm-4">
                          <label class="col-sm-3 control-label"><spring:message code="endtime"/>:</label>
                          <div class="col-sm-9">
                          	  <input type="text" id="endtime" name="endtime" readonly="readonly" class="form-control timebox" placeholder="结束时间">
                          </div>
                       </div>
                     </div>
                 </form>
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" data-mobile-responsive="true">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="wjm" data-sortable="true" data-sort-name="wjm"><spring:message code="pubFile.wjm" /></th>
                                        <%-- <th data-field="wjdx" data-sortable="true" data-sort-name="wjdx"><spring:message code="pubFile.wjdx" /></th> --%>
                                        <th data-field="size" data-sortable="true" data-sort-name="wjdx"><spring:message code="pubFile.wjdx" /></th>
                                        <th data-field="wjgs" data-sortable="true" data-sort-name="wjgs"><spring:message code="pubFile.wjgs" /></th>
                                        <th data-field="cjrxm" data-sortable="true" data-sort-name="cjrxm"><spring:message code="pubFile.cjrxm" /></th>
                                        <th data-field="sszb" data-sortable="true" data-sort-name="sszb"><spring:message code="pubFile.sszb" /></th>
                                        <th data-field="cclj" data-sortable="true" data-sort-name="cclj"><spring:message code="pubFile.cclj" /></th>
                                        <th data-field="cjsj" data-sortable="true" data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message code="cjsj" /></th>
                                        <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubFile.sybz" /></th>
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
<script src="<c:url value='/common/static/plugins/laydate/laydate.js' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
//获取页面权限值
var deletePer = ${deletePer};
var downLoadPer = ${downLoadPer};

//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var pubFileUrl = {
    index: "<c:url value='/pubFile/index' />",
    view: "<c:url value='/pubFile/view/' />",
    remove: "<c:url value='/pubFile/delete' />",
    removeBatch: "<c:url value='/pubFile/deleteBatch' />",
    getDataByPage: "<c:url value='/pubFile/getDataByPage' />"
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: pubFileUrl.getDataByPage,
        queryParams: function (params) {
            params.searchProperty = searchFields;
            if (limit != "") {
                if (firstLoadFlag) {
                    params.limit = parseInt(limit);
                    params.offset = parseInt(offset);
                }
            }
            if (params.search != "") {
            	params.wjm = params.search;
            }
            limit = params.limit;
            offset = params.offset;
            params.wjm = $.trim($('#wjm').val());
            params.wjgs = $.trim($('#wjgs').val());
            params.starttime = $.trim($('#starttime').val());
            params.endtime = $.trim($('#endtime').val());
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
    $("#addBtn").click(function(){
        window.location.href = pubFileUrl.add + "?limit=" + limit + "&offset=" + offset;
    });
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubFileUrl.removeBatch, function(){window.location.href = pubFileUrl.index + "?limit=" + limit + "&offset=" + offset;}, "cclj");
    });
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubFileUrl.getDataByPage);
    });
    $("#refreshBtn").click(function(){
    	ManageGrid.refreshTable(table, pubFileUrl.getDataByPage);
    });
    $("#resetBtn").click(function(){
    	$("#wjm").val("");
    	$("#wjgs").val("");
    	// 重置时间
    	$("#starttime").val("");
    	$("#endtime").val("");
    });
    
    // 时间控件设置
    laydate.skin('molv');
    laydate({
       elem: '#starttime',
       format: 'YYYY-MM-DD 00:00:00'
    });
 
    laydate({
       elem: '#endtime',
       format: 'YYYY-MM-DD 23:59:59'
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
    
    if (deletePer) {
        html += '<a href="javascript:void(0);" onclick="del(\''+row.cclj+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    
    if (downLoadPer) {
        html += '<a href="javascript:void(0);" onclick="downLoad(\''+row.cclj+'\')" title="<spring:message code="downLoad" />"><span class="glyphicon glyphicon-download" aria-hidden="true"></span></a>';
    }
    
    html += '</div>';
    return html;
}

//时间处理formatter
function dateFormatter (value, row) {
    var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
    return html;
}


// 删除文件
function del(rowId) {
    ManageGrid.deleteSingle(pubFileUrl.remove + "?id=" + rowId, function(){window.location.href = pubFileUrl.index + "?limit=" + limit + "&offset=" + offset;});
}

// 下载文件
function downLoad(cclj) {
	window.open("<c:url value="/uploadify/download" />?cclj=" + cclj);
}

</script>
</body>
</html>
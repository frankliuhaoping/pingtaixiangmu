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
                <h5><spring:message code="pubParam.list" /></h5>
            </div>
            <div class="ibox-content ">
            	<form method="get" class="form-horizontal labelpd0 clearfix" id="searchUserForm">
            		  <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubParam.csm" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="csm" name="csm" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubParam.csz" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="csz" name="csz" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubParam.csbz" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="csbz" name="csbz" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                   		 <label class="col-sm-3 control-label"><spring:message code="pubParam.sybz" />:</label>
                         <div class="col-sm-9">
                       		<select id="sybz_select" class="form-control">
                       			<option value ="">请选择</option>
								<option value ="Y">启用</option>
							  	<option value ="N">禁用</option>
							</select>
                         </div>
	                  </div>
	                  <div class="form-group col-sm-12">
		                  <div class="col-sm-12" style="text-align:right;">
		                     <button type="button" id="searchBtn" class="btn btn-primary">
		                        <i class="glyphicon glyphicon-search fz12" aria-hidden="true"></i>&nbsp;<spring:message code="find" />
		                     </button>
		                     <button type="reset" id="resetBtn" class="btn btn-primary">
		                        <i class="glyphicon glyphicon-repeat fz12" aria-hidden="true"></i>&nbsp;<spring:message code="reset" />
	                         </button>
	                      </div>
                      </div>
            	</form>
             </div>
        </div>
        
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><spring:message code="pubParam.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
	                    <shiro:hasPermission name="sys:pubParam:add">
	                        <c:set var='addPer' value='true' />
	                        <button id="addBtn" type="button" class="btn" title="<spring:message code="new" />">
	                            	 <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
	                        </button>
	                    </shiro:hasPermission>
	                    <shiro:hasPermission name="sys:pubParam:delete">
	                        <c:set var='deletePer' value='true' />
	                        <button id="removeBtn" type="button" class="btn" title="<spring:message code="remove" />">
	                            <i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove" />
	                        </button>
	                    </shiro:hasPermission>
	                         <button id="refreshBtn" type="button" class="btn">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content">  
                <div id="tableToolbar">
                    <div class="form-inline" role="form">
                        <shiro:hasPermission name="sys:pubParam:edit">
                            <c:set var='editPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubParam:view">
                            <c:set var='viewPer' value='true' />
                        </shiro:hasPermission>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" height="auto">
                        <thead>
                            <tr>
                                <th data-checkbox="true"></th>
                                <th data-field="csm" data-sortable="true" data-sort-name="csm"><spring:message code="pubParam.csm" /></th>
                                <th data-field="csz" data-sortable="true" data-sort-name="csz" data-formatter="cszFormatter"><spring:message code="pubParam.csz" /></th>
                                <th data-field="csbz" data-sortable="true" data-sort-name="csbz"><spring:message code="pubParam.csbz" /></th>
                                <th data-field="cjrxm" data-sortable="true" data-sort-name="cjrxm"><spring:message code="cjrxm" /></th>
                                <th data-field="gxrxm" data-sortable="true" data-sort-name="gxrxm"><spring:message code="gxrxm" /></th>
                                <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubParam.sybz" /></th>
                                <th data-field="operate" data-formatter="actionFormatter"><spring:message code="operate" /></th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/common/template/script_basic_table.jsp" />
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
var pubParamUrl = {
    index: "<c:url value='/pubParam/index' />",
    view: "<c:url value='/pubParam/view/' />",
    add: "<c:url value='/pubParam/add' />",
    edit: "<c:url value='/pubParam/edit/' />",
    remove: "<c:url value='/pubParam/delete/' />",
    removeBatch: "<c:url value='/pubParam/deleteBatch' />",
    getDataByPage: "<c:url value='/pubParam/getDataByPage' />"
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: pubParamUrl.getDataByPage,
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
            params.csm=$.trim($('#csm').val());
            params.csz=$.trim($("#csz").val());
            params.csbz=$("#csbz").val();
            params.sybz=$.trim($("#sybz_select option:selected").val());
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
        toolbar: '#tableToolbar', uniqueId: 'csm', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    $("#addBtn").click(function(){
        window.location.href = pubParamUrl.add + "?limit=" + limit + "&offset=" + offset;
    });
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubParamUrl.removeBatch, function(){window.location.href = pubParamUrl.index + "?limit=" + limit + "&offset=" + offset;}, "csm");
    });
    // 刷新
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, pubParamUrl.getDataByPage);
    });
    //查询按钮
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubParamUrl.getDataByPage);
    });
});

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

//参数值formatter
function cszFormatter(value, row) {
    if(value == null || value.trim() == ""){
        return "-";
    } else {
    	if (value.length > 20) {
    		return '<span title="' + value + '">' + value.substring(0, 20) + '...</span>';
    	} else {
    		return value;
    	}
    }
}

//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    if (viewPer) {
        html += '<a href="javascript:void(0);" onclick="view(\''+row.csm+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    
    if (editPer) {
        html += '<a href="javascript:void(0);" onclick="edit(\''+row.csm+'\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    
    if (deletePer) {
        html += '<a href="javascript:void(0);" onclick="del(\''+row.csm+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    
    html += '</div>';
    return html;
}

// 修改全局参数
function edit(rowId) {
    window.location.href = pubParamUrl.edit + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
}

// 删除全局参数
function del(rowId) {
    ManageGrid.deleteSingle(pubParamUrl.remove + rowId, function(){window.location.href = pubParamUrl.index + "?limit=" + limit + "&offset=" + offset;});
}

// 查看全局参数
function view(rowId) {
    window.location.href = pubParamUrl.view + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
}
</script>
</body>
</html>
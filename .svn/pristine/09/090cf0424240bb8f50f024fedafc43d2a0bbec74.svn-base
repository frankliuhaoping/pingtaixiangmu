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
                <h5><i class="fa fa-file-text-o mt2 mr5"></i><spring:message code="pubApp.list" /></h5>
            </div>
            <div class="ibox-content ">
            	<form method="get" class="form-horizontal" id="searchUserForm">
            		<div class="row labelpd0">
            		  <div class="form-group col-sm-4">
                         <label class="col-sm-3 control-label"><spring:message code="pubApp.yymc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="yymc" name="yymc" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-4">
                         <label class="col-sm-3 control-label"><spring:message code="pubApp.yydm" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="yydm" name="yydm" class="form-control">
                         </div>
                      </div>
                      <!-- 
                      <div class="form-group col-sm-4">
                         <label class="col-sm-3 control-label"><spring:message code="pubApp.yyaqm" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="yyaqm" name="yyaqm" class="form-control">
                         </div>
                      </div> -->
                      <div class="form-group col-sm-4">
	                   		<label class="col-sm-3 control-label"><spring:message code="pubApp.yyzt" />:</label>
	                        <div class="col-sm-9">
	                       		<select id="sybz_select" class="form-control">
	                       			<option value ="">请选择</option>
									<option value ="Y">启用</option>
								  	<option value ="N">禁用</option>
								</select>
	                       	</div>
	                  </div>
	                  <div class="form-group col-sm-4"></div>
	                  <div class="form-group col-sm-4"></div>
	                  <div class="form-group col-sm-4">
						<div class="col-sm-2"></div>
						<div class="col-sm-10" style="text-align:right;">
								<button type="button" id="searchBtn" class="btn btn-primary">
									<i class="glyphicon glyphicon-search fz12" aria-hidden="true"></i>&nbsp;<spring:message code="find" />
								</button>
								<button type="reset" id="resetBtn" class="btn btn-default">
									<i class="glyphicon glyphicon-repeat fz12" aria-hidden="true"></i>&nbsp;<spring:message code="reset" />
								</button>
						</div>
					</div>
				</div>
            	</form>
            </div>
        </div>
        
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><i class="fa fa-calculator mt2 mr5"></i><spring:message code="pubApp.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
                      	<shiro:hasPermission name="sys:pubApp:add">
                    		<c:set var='addPer' value='true' />
	                        <button id="addBtn" type="button" class="btn">
	                           	 <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
	                        </button>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubApp:delete">
                			<c:set var='deletePer' value='true' />
                            <button id="removeBtn" type="button" class="btn">
                                 <i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove" />
                            </button>
                        </shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content ">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                            <shiro:hasPermission name="sys:pubApp:edit">
                                <c:set var='editPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubApp:view">
                                <c:set var='viewPer' value='true' />
                            </shiro:hasPermission>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped"  treeGrid="true" height="auto">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="yyid" data-visible="false"><spring:message code="pubApp.yyid" /></th>
                                        <th data-field="yymc" data-sortable="true" data-sort-name="yymc"><spring:message code="pubApp.yymc" /></th>
                                        <th data-field="yydm" data-sortable="true" data-sort-name="yydm"><spring:message code="pubApp.yydm" /></th>
                                        <th data-field="yylx" data-sortable="true" data-sort-name="yylx"><spring:message code="pubApp.yylx" /></th>
                                        <th data-field="fwlj" data-sortable="true" data-sort-name="fwlj"><spring:message code="pubApp.fwlj" /></th>
                                        <th data-field="pxdm" data-sortable="true" data-sort-name="pxdm"><spring:message code="pxdm" /></th>
                                        <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubApp.yyzt" /></th>
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
var pubAppUrl = {
    index: "<c:url value='/pubApp/index' />",//应用管理主页面
    view: "<c:url value='/pubApp/view/' />",//查看应用页面
    add: "<c:url value='/pubApp/add' />",//新增应用页面
    edit: "<c:url value='/pubApp/edit/' />",//修改应用页面
    remove: "<c:url value='/pubApp/delete/' />",//删除应用操作
    removeBatch: "<c:url value='/pubApp/deleteBatch' />",//批量删除应用操作
    getDataByPage: "<c:url value='/pubApp/getDataByPage' />"//获取应用列表分页数据
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    // 调用bootstrapTable，生成表格数据
    table.bootstrapTable({
        url: pubAppUrl.getDataByPage,
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
            params.yymc=$.trim($('#yymc').val());
            params.yydm=$.trim($("#yydm").val());
            params.yyaqm=$("#yyaqm").val();
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
        toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    // 新增按钮
    $("#addBtn").click(function(){
        window.location.href = pubAppUrl.add + "?limit=" + limit + "&offset=" + offset;
    });
    // 删除按钮
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubAppUrl.removeBatch, function(){window.location.href = pubAppUrl.index + "?limit=" + limit + "&offset=" + offset;}, "yyid");
    });
    // 刷新
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, pubAppUrl.getDataByPage);
    });
    //查询按钮
    $("#searchBtn").click(function(){
    	
        ManageGrid.refreshTable(table, pubAppUrl.getDataByPage);
    });
   
});

// 选中上一操作选中的列
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
        html += '<a href="javascript:void(0);" onclick="view('+row.yyid+')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    
    if (editPer) {
        html += '<a href="javascript:void(0);" onclick="edit('+row.yyid+')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    
    /* if (deletePer) {
        html += '<a href="javascript:void(0);" onclick="del('+row.yyid+')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    } */
    
    html += '</div>';
    return html;
}

// 修改应用
function edit(rowId) {
    window.location.href = pubAppUrl.edit + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
}

// 删除应用
function del(rowId) {
    ManageGrid.deleteSingle(pubAppUrl.remove + rowId, function(){window.location.href = pubAppUrl.index + "?limit=" + limit + "&offset=" + offset;});
}

// 查看应用
function view(rowId) {
    window.location.href = pubAppUrl.view + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
}

/*
setInterval("synchronous()", 60000);

function synchronous() {
	$.ajax({
        url: '<c:url value="/pubApp/validateYymc?yymc=system"/>',
        dataType: 'json',
        success: function(data){
            console.log (data+ new Date());
        },
        error: function(){
        }
    });
}
*/
</script>
</body>
</html>
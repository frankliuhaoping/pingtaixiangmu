<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="pubAudit.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
	                    <shiro:hasPermission name="sys:pubAudit:add">
	                        <c:set var='addPer' value='true' />
	                        <button id="addBtn" type="button" class="btn btn-default">
                                <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
                            </button>
	                    </shiro:hasPermission>
	                    <shiro:hasPermission name="sys:pubAudit:delete">
                			<c:set var='deletePer' value='true' />
                         	<button id="removeBtn" type="button" class="btn btn-default" title="<spring:message code="remove" />">
                             	<i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove"/>
                         	</button>
                     	</shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn btn-default">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
	                  	<button type="button" id="searchBtn" class="btn btn-default">
	                        <i class="glyphicon glyphicon glyphicon-search fz12" aria-hidden="true"></i><spring:message code="find"/>
	                    </button>
	                  	<button type="button" id="resetBtn" class="btn btn-default">
                     	 	<i class="glyphicon glyphicon-repeat fz12" aria-hidden="true"></i><spring:message code="reset" />
                     	</button>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
            	<input type="hidden" id="yyid" name="yyid">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                            <div class="form-inline" role="form">
                                <shiro:hasPermission name="sys:pubAudit:view">
                                    <c:set var='viewPer' value='true' />
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:pubAudit:edit">
                                    <c:set var='editPer' value='true' />
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:pubAudit:delete">
                                    <c:set var='deletePer' value='true' />
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <div class="row">
                            <div id="appTree" class="col-sm-2" style="border: #ddd solid 1px;margin: 0 10px; padding: 10px 0;overflow:auto;"></div>
                            <div class="row table-responsive col-sm-10">
                                <form class="form-horizontal">
				                    <div class="row labelpd0">
				                    	<div class="form-group col-sm-4">
				                        	<label class="col-sm-3 control-label"><spring:message code="pubAudit.fwlj" />:</label>
				                         	<div class="col-sm-9">
				                            	<input type="text" id="fwlj" name="fwlj" class="form-control">
				                         	</div>
				                      	</div>
				                      	
				                    	<div class="form-group col-sm-4">
				                        	<label class="col-sm-3 control-label"><spring:message code="pubAudit.sjms" />:</label>
				                         	<div class="col-sm-9">
				                            	<input type="text" id="sjms" name="sjms" class="form-control">
				                         	</div>
				                      	</div>
				                      
				                      	<div class="form-group col-sm-4">
					                    	<label class="col-sm-3 control-label"><spring:message code="pubAudit.sybz" />:</label>
					                        <div class="col-sm-9">
				                        		<select id="sybz_select" class="form-control">
				                        			<option value ="">请选择</option>
													<option value ="Y">启用</option>
												  	<option value ="N">禁用</option>
												</select>
				                        	</div>
					                    </div>
				                    </div>
				                </form>
	                            <table class="table table-bordered table-striped" height="auto">
	                                <thead>
	                                    <tr>
	                                        <th data-checkbox="true"></th>
	                                        <th data-field="sjid" data-visible="false"><spring:message code="pubAudit.sjid" /></th>
	                                        <%--<th data-field="xtm" data-sortable="true" data-sort-name="xtm" data-width="10%"><spring:message code="pubAudit.xtm" /></th> --%>
	                                        <th data-field="fwlj" data-sortable="true" data-sort-name="fwlj"><spring:message code="pubAudit.fwlj" /></th>
	                                        <th data-field="sjms" data-sortable="true" data-sort-name="sjms"><spring:message code="pubAudit.sjms" /></th>
	                                        <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubAudit.sybz"/></th>
	                                        <th data-field="cjrxm" data-sortable="true" data-sort-name="cjrxm"><spring:message code="cjrxm" /></th>
	                                        <th data-field="cjsj" data-sortable="true" data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message code="cjsj" /></th>
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
    </div>

<jsp:include page="/common/template/script_basic.jsp" />
<jsp:include page="/common/template/script_basic_table.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
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
var yyid = '${param.yyid}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
var tableConfig;
var selectTreeId;
//url定义
var pubAuditUrl = {
    index: "<c:url value='/pubAudit/index' />",//审计配置主页面
    view: "<c:url value='/pubAudit/view/' />",//查看审计
    add: "<c:url value='/pubAudit/add' />",//增加审计
    edit: "<c:url value='/pubAudit/edit/' />",//修改
    remove: "<c:url value='/pubAudit/delete/' />",//删除
    removeBatch: "<c:url value='/pubAudit/deleteBatch' />",//批量删除
    getDataByPage: "<c:url value='/pubAudit/getDataByPage' />"//查看审计配置分页数据
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    // bootstrapTable 配置
    tableConfig = {
        url: '',
        queryParams: function (params) {
            params.searchProperty = searchFields;
            if (limit != "") {
                if (firstLoadFlag) {
                    params.limit = parseInt(limit);
                    params.offset = parseInt(offset);
                }
            }
            // 额外的查询条件
            params.fwlj = $.trim($('#fwlj').val());//服务路径
            params.sjms = $.trim($('#sjms').val());//审计描述
            params.sybz = $.trim($("#sybz_select option:selected").val());
            
            limit = params.limit;
            offset = params.offset;
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
        toolbar: '#tableToolbar', uniqueId: 'sjid', clickToSelect: true, sidePagination: 'server', pagination: true
    };
    $("#addBtn").click(function(){
    	var addYyid = getYyid();
    	if(addYyid == '' || addYyid == null){
    		 Layer.msg('请先选择应用', 'warning');
    		 return false;
    	}
        window.location.href = pubAuditUrl.add + "?limit=" + limit + "&offset=" + offset + "&yyid=" + getYyid();
    });
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubAuditUrl.removeBatch, function(){window.location.href = pubAuditUrl.index + "?limit=" + limit + "&offset=" + offset;}, "sjid");
    });
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, pubAuditUrl.getDataByPage+"?yyid="+selectTreeId);
    });
    // 查询按钮
    $("#searchBtn").click(function(){
        var param = {
       		fwlj:$.trim($('#fwlj').val()),
       		sjms:$.trim($("#sjms").val()),
       		sybz:$.trim($("#sybz_select option:selected").val())
        };
        ManageGrid.refreshTable(table, pubAuditUrl.getDataByPage+"?yyid="+selectTreeId, param);
    });
    
  //重置按钮
    $("#resetBtn").click(function(){
    	$("#fwlj").val("");
    	$("#sjms").val("");
    	$("#sybz_select").val("");
    });
  
    // 加载应用树
    $("#appTree").jstree({
        'checkbox': {
            'keep_selected_style': false
        },
        'core' : {
            'data' : {
                "url" : "<c:url value='/pubRole/getTree' />",
                "data" : function (node) {
                    //table.bootstrapTable(tableConfig);
                }
            }
        }
    }).on('loaded.jstree', function(e, data){// 默认选中根节点
        var inst = data.instance;//TODO 处理没有节点的情况
        var obj;
        if(yyid == ""){
        	obj = inst.get_node(e.target.firstChild.firstChild.lastChild);
        }else{
        	obj = inst.get_node(yyid);
        }
        inst.select_node(obj);
    });
    
    // 设置应用树的点击事件
    $("#appTree").on('select_node.jstree', function (e, data) {
    	//alert(data.instance.get_node(data.selected[0]).text); 获取中文值
    	selectTreeId = data.selected[0];
    	$("#yyid").val(selectTreeId);
        var refreshFlag = true;
        if (tableConfig.url == '') {
        	refreshFlag = false;
        }
        // 更新url请求
        if (refreshFlag) {
        	ManageGrid.refreshTable(table, pubAuditUrl.getDataByPage+"?yyid="+selectTreeId);
        } else {
        	tableConfig.url = pubAuditUrl.getDataByPage+"?yyid="+selectTreeId;
        	table.bootstrapTable(tableConfig);
        }
        
    });
    
});

function getYyid(){
	var yyid = $("#yyid").val();
	if(yyid == undefined){
		yyid = '';
	}
	return yyid;
}

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
        html += '<a href="javascript:void(0);" onclick="view(\''+row.sjid+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    if (editPer) {
        html += '<a href="javascript:void(0);" onclick="edit(\''+row.sjid+'\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    if (deletePer) {
        html += '<a href="javascript:void(0);" onclick="del(\''+row.sjid+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    html += '</div>';
    return html;
}

// 时间处理formatter
function dateFormatter (value, row) {
    var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
    return html;
}

// 查看日志
function view(rowId) {
    window.location.href = pubAuditUrl.view + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId + "&yyid=" + getYyid();
}

//修改
function edit(rowId) {
    window.location.href = pubAuditUrl.edit + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId + "&yyid=" + getYyid();
}

//删除
function del(rowId) {
    ManageGrid.deleteSingle(pubAuditUrl.remove + rowId, function(){window.location.href = pubAuditUrl.index + "?limit=" + limit + "&offset=" + offset;});
}
</script>
</body>
</html>
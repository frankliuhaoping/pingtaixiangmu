<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/template/head_basic_table.jsp" />
<link
	href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />"
	rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="col-sm-2" style="padding-left: 0; padding-right: 0;">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					<spring:message code="pubApp.list" />
				</h5>
			</div>
			<div class="ibox-content pb10">
				<div class="clearfix">
					<div id="appTree" style="border: #ddd solid 1px; padding: 10px 0; overflow: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-10" style="padding-left:10px; padding-right: 0;">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="pubAuditLog.select" /></h5>
			</div>
			<div class="ibox-content ">
				<form class="form-horizontal " id="searchUserForm">
					<div class="clearfix labelpd0">
						<div class="form-group col-sm-4">
							<label class="col-sm-3 control-label"><spring:message
									code="pubLog.czms" />:</label>
							<div class="col-sm-9">
								<input type="text" id="czms" name="czms" class="form-control">
							</div>
						</div>

						<div class="form-group col-sm-4">
							<label class="col-sm-3 control-label"><spring:message
									code="pubLog.khdip" />:</label>
							<div class="col-sm-9">
								<input type="text" id="khdip" name="khdip"
									class="form-control">
							</div>
						</div>

						<div class="form-group col-sm-4">
							<label class="col-sm-3 control-label"><spring:message
									code="pubLog.zxzt" />:</label>
							<div class="col-sm-9">
								<select id="zxzt_select" class="form-control">
									<option value=""></option>
									<option value="1">成功</option>
									<option value="0">失败</option>
								</select>
							</div>
						</div>

						<div class="form-group col-sm-4">
							<label class="col-sm-3 control-label"><spring:message
									code="starttime" />:</label>
							<div class="col-sm-9">
								<input type="text" id="starttime" name="starttime"
									readonly="readonly" class="form-control timebox">
							</div>
						</div>

						<div class="form-group col-sm-4">
							<label class="col-sm-3 control-label"><spring:message
									code="endtime" />:</label>
							<div class="col-sm-9">

								<input type="text" class="form-control timebox" id="endtime"
									readonly="readonly" name="endtime">
							</div>
						</div>

						<div class="form-group col-sm-4">
							<div class="col-sm-12" style="text-align: right;">
								<button type="button" id="searchBtn" class="btn btn-primary">
									<i class="glyphicon glyphicon-search"></i>&nbsp;<spring:message code="find" />
								</button>
								<button type="reset" id="resetBtn" class="btn btn-default">
									<i class="glyphicon glyphicon-repeat"></i>&nbsp;<spring:message code="reset" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="ibox float-e-margins mt10">
			<div class="ibox-title">
				<h5><spring:message code="pubAuditLog.list" /></h5>
				<div class="ibox-tools">
					<c:set var='viewPer' value='false' />
					<div class="btn-group hidden-xs mt8" role="group">
						<button id="refreshBtn" type="button" class="btn">
							<i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
						</button>
					</div>
				</div>
			</div>
			<div class="ibox-content ">
				<div class="row">
					<div class="col-sm-12">
						<div id="tableToolbar">
							<div class="form-inline" role="form">
								<shiro:hasPermission name="sys:pubAuditLog:view">
									<c:set var='viewPer' value='true' />
								</shiro:hasPermission>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table table-bordered" height="auto">
								<thead>
									<tr>
										<th data-checkbox="true"></th>
										<th data-field="rzid" data-visible="false"><spring:message
												code="pubLog.rzid" /></th>
										<th data-field="czms" data-sortable="true"
											data-sort-name="czms"><spring:message
												code="pubLog.czms" /></th>
										<th data-field="khdip" data-sortable="true"
											data-sort-name="khdip"><spring:message
												code="pubLog.khdip" /></th>
										<th data-field="zxzt" data-sortable="true"
											data-sort-name="zxzt" data-formatter="zxztFormatter"><spring:message
												code="pubLog.zxzt" /></th>
										<th data-field="cjrxm" data-sortable="true"
											data-sort-name="cjrxm"><spring:message code="cjrxm" /></th>
										<th data-field="cjsj" data-sortable="true"
											data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message
												code="cjsj" /></th>
										<th data-field="operate" data-formatter="actionFormatter"><spring:message
												code="operate" /></th>
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

<jsp:include page="/common/template/script_basic_table.jsp" />
<script
	src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script
	src="<c:url value='/common/static/plugins/laydate/laydate.js' />"
	type="text/javascript"></script>
<script type="text/javascript">
//获取页面权限值
var indexPage;

var viewPer = $
{
	viewPer
};

//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
var tableConfig;
var selectTreeId;
//url定义
var pubLogUrl = {
	index : "<c:url value='/pubAuditLog/index' />",//日志管理主页面
	view : "<c:url value='/pubAuditLog/view/' />",//查看日志页面
	getDataByPage : "<c:url value='/pubAuditLog/getDataByPage' />"//查看日志分页数据
};
//初始化表格和按钮
$(function() {
	var searchFields = ManageGrid.getSearchFields(table);
	// bootstrapTable 配置
	tableConfig = {
		url : '',
		queryParams : function(params) {
			params.searchProperty = searchFields;
			if (limit != "") {
				if (firstLoadFlag) {
					params.limit = parseInt(limit);
					params.offset = parseInt(offset);
				}
			}
			// 额外的查询条件
			params.czms = $.trim($('#czms').val());
			params.khdip = $.trim($('#khdip').val());//客户端ip
			params.zxzt = $.trim($("#zxzt_select option:selected")
					.val());
			params.zxsjS = $("#zxsjS").val(),
					params.zxsjE = $("#zxsjE").val(),
					params.starttime = $("#starttime").val();//创建时间大于
			params.endtime = $("#endtime").val();//创建时间小于
			limit = params.limit;
			offset = params.offset;
			return params;
		},
		onLoadSuccess : function() {
			if (firstLoadFlag && offset != 0) {
				table.bootstrapTable("selectPage", offset / limit + 1);
			}
			firstLoadFlag = false;
			setTimeout("checkByTable()", 100);
			//console.log (table.bootstrapTable("getOptions"));
		},
		toolbar : '#tableToolbar',
		uniqueId : 'csm',
		clickToSelect : true,
		sidePagination : 'server',
		pagination : true
	};
	// 查询按钮
	$("#searchBtn").click(
			function() {
				ManageGrid.refreshTable(table, pubLogUrl.getDataByPage
						+ "?sjzt=1&yyid=" + selectTreeId);
			});

	// 加载应用树
	$("#appTree")
			.jstree({
				'checkbox' : {
					'keep_selected_style' : false
				},
				'core' : {
					'data' : {
						"url" : "<c:url value='/pubRole/getTree' />",
						"data" : function(node) {
							//table.bootstrapTable(tableConfig);
						}
					}
				}
			})
			.on(
					'loaded.jstree',
					function(e, data) {// 默认选中根节点
						var inst = data.instance;//TODO 处理没有节点的情况
						var obj = inst
								.get_node(e.target.firstChild.firstChild.lastChild);
						inst.select_node(obj);
					});

	// 设置应用树的点击事件
	$("#appTree").on(
			'select_node.jstree',
			function(e, data) {
				selectTreeId = data.selected[0];
				var refreshFlag = true;
				if (tableConfig.url == '') {
					refreshFlag = false;
				}
				// 更新url请求
				if (refreshFlag) {
					ManageGrid.refreshTable(table,
							pubLogUrl.getDataByPage + "?sjzt=1&yyid="
									+ selectTreeId);
				} else {
					tableConfig.url = pubLogUrl.getDataByPage
							+ "?sjzt=1&yyid=" + selectTreeId;
					table.bootstrapTable(tableConfig);
				}

			});

	//刷新按钮,首先清空form表单的值
	$("#refreshBtn").click(function() {
				$('#searchUserForm')[0].reset();
				ManageGrid.refreshTable(table, pubLogUrl.getDataByPage
						+ "?sjzt=1&yyid=" + selectTreeId);
			});
	
	$(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });

	laydate.skin('molv');
	laydate({
		elem : '#starttime',
		istime : true,
		format : 'YYYY-MM-DD hh:mm:ss'
	});

	laydate({
		elem : '#endtime',
		istime : true,
		format : 'YYYY-MM-DD hh:mm:ss'
	});
});

function checkByTable() {
	if (selectId != "") {
		var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId)
				+ "']");
		selectedRow.removeClass().addClass("selected");
	}
}

//执行状态formatter
function zxztFormatter(value, row) {
	if (value == null || value.trim() == "") {
		return "-";
	} else {
		var zxztVal = '<font color="#006000"><spring:message code="pubLog.zxztSuccess" /></font> ';
		if (value == 0) {
			zxztVal = '<font color="#FF0000"><spring:message code="pubLog.zxztFailure" /></font>';
		}
		return zxztVal;
	}
}

//操作formatter
function actionFormatter(value, row) {
	var html = '<div class="action-buttons">';
	if (viewPer) {
		html += '<a href="javascript:void(0);" onclick="view(\''
				+ row.rzid
				+ '\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
	}

	html += '</div>';
	return html;
}

// 时间处理formatter
function dateFormatter(value, row) {
	var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
	return html;
}

// 查看日志
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubLogUrl.view + rowId, {});
}
//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, pubLogUrl.getDataByPage);
}
</script>
</body>
</html>
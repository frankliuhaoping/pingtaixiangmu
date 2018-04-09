<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/common/template/head_basic_table.jsp" />
<link
	href="<c:url value='/common/static/plugins/jqgrid/css/ui.jqgrid-bootstrap.css?v=5.1.1' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/css/manage.css?v=1.0' />"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.laydate_body .laydate_y .laydate_yms ul {
	overflow: auto;
}
</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<!-- 顶部查询div -->
		<div class="ibox float-e-margins">
			<!-- 标题 -->
			<div class="ibox-title">
				<h5><spring:message code="pubJqxz.select" /></h5>
			</div>
			<div class="ibox-content clearfix">
				<!-- 按钮权限 -->
				<div class="" role="form">
					<shiro:hasPermission name="sys:pubJqxz:view">
						<c:set var='viewPer' value='true' />
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:pubJqxz:edit">
						<c:set var='editPer' value='true' />
					</shiro:hasPermission>
				</div>
				<!-- 树形显示切换 -->
					<ul id="myResTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" value="11" onclick="queryRes('default',0);"><a href="javascript:void(0);"><spring:message code="pubJqxz.default" /></a></li>
						<li role="presentation" value="22" onclick="queryRes('tree',1);"><a href="javascript:void(0);"><spring:message code="pubJqxz.tree" /></a></li>
					</ul>
				<!-- 查询条件 -->
				<div class="table-responsive" id="tab">
					<!--form表单  -->
					<form method="get" class="clearfix form-horizontal" id="searchUserForm">
						<div class="clearfix labelpd0" style="padding-top: 7px;">
							<div class="form-group col-sm-4">
								<label class="col-sm-2 control-label" style="width: 20%"><spring:message
										code="pubJqxz.jqxzbh" />:</label>
								<div class="col-sm-10" style="width: 80%">
									<input type="text" id="jqxzbh" name="jqxzbh"
										class="form-control" >
								</div>
							</div>
							<div class="form-group col-sm-4">
								<label class="col-sm-2 control-label" style="width: 20%"><spring:message
										code="pubJqxz.jqxzjc" />:</label>
								<div class="col-sm-10" style="width: 80%">
									<input type="text" id="jqxzjc" name="jqxzjc"
										class="form-control" >
								</div>
							</div>
							<div class="form-group col-sm-4">
								<!--查询按钮组  -->
								<div class="col-sm-12" style="text-align: right;">
									<!-- 查询按钮 -->
									<button type="button" id="searchBtn" class="btn btn-primary">
										<i class="glyphicon glyphicon-search fz12"
											aria-hidden="true"></i>&nbsp;
										<spring:message code="find" />
									</button>
									<!-- 重置按钮 -->
									<button type="reset" id="resetBtn" class="btn btn-default">
										<i class="glyphicon glyphicon-repeat fz12"
											aria-hidden="true"></i>&nbsp;
										<spring:message code="reset" />
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 树形显示 -->
				<div id="treeTable" class="row J_mainContent" data-mobile-responsive="true" style="margin: 10px 0; display: none;">
					<table id="pubJqxzTable" class="table table-bordered"  treeGrid="true" expandColumn="jqxzjc" height="auto">
						<thead>
							<tr>
								<th name="jqxzjc" width="25%" data-sortable="true"
									data-sort-name="jqxzjc"><spring:message
										code="pubJqxz.jqxzjc" /></th>
								<th name="jqxzbh" width="10%" key="true"><spring:message
										code="pubJqxz.jqxzbh" /></th>
								<th name="bzjqxzmc" width="20%" data-sortable="true"
									data-sort-name="bzjqxzmc"><spring:message
										code="pubJqxz.bzjqxzmc" /></th>
								<th name="bzjqxzbh" width="20%" key="true"
									data-sortable="true" data-sort-name="bzjqxzbh"><spring:message
										code="pubJqxz.bzjqxzbh" /></th>
								<th name="bzjqxzfbh" hidden="true"><spring:message
										code="pubJqxz.bzjqxzfbh" /></th>
								<th name="sybz" width="10%" data-sortable="true"
									data-sort-name="sybz" formatter="sybzFormatter"><spring:message
										code="pubJqxz.sybz" /></th>
								<th name="operate" width="15%" formatter="actionFormatter"><spring:message
										code="operate" /></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<!-- 顶部查询div结束 -->
		<!--结果显示div  -->
		<div class="ibox float-e-margins mt10"> 
			<!-- 工具栏div -->
			<div class="ibox-title">
				<!-- 标题 -->
				<h5>
					<spring:message code="pubJqxz.list" />
				</h5>

				<div class="ibox-tools">
					<c:set var='addPer' value='false' />
					<c:set var='editPer' value='false' />
					<c:set var='deletePer' value='false' />
					<c:set var='viewPer' value='false' />
					<!-- 工具栏按钮组及权限设置 -->
					<div class="btn-group hidden-xs mt8" role="group">
						<shiro:hasPermission name="sys:pubJqxz:add">
							<c:set var='addPer' value='true' />
							<button id="addBtn" type="button" class="btn "
								title="<spring:message code="new" />">
								<i class="fa fa-plus-circle"></i>&nbsp;新增
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:pubJqxz:delete">
							<c:set var='deletePer' value='true' />
							<button id="removeBtn" type="button" class="btn "
								title="<spring:message code="remove" />">
								<i class="fa fa-times-circle"></i>&nbsp;批量删除
							</button>
						</shiro:hasPermission>
						<%-- <button id="refreshBtn" type="button" class="btn " title="<spring:message code="refresh" />">
               				<i class="fa fa-download"></i>&nbsp;导出
               	</button> --%>
						<button id="refreshBtn" type="button" class="btn "
							title="<spring:message code="refresh" />">
							<i class="fa fa-refresh"></i>&nbsp;刷新
						</button>
					</div>
				</div>
			</div>
			<!-- 工具栏div 结束-->
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<!-- table内部按钮 及权限设置 -->
						<div class="" role="form">
							<!-- 查看 -->
							<shiro:hasPermission name="sys:pubJqxz:view">
								<c:set var='viewPer' value='true' />
							</shiro:hasPermission>
							<!-- 修改 -->
							<shiro:hasPermission name="sys:pubJqxz:edit">
								<c:set var='editPer' value='true' />
							</shiro:hasPermission>
						</div>
						<!--默认显示  -->
						<div class="table-responsive" id="tab">
							<table id="defaultTab" class="table table-bordered table-striped"
								data-mobile-responsive="true">
								<thead>
									<tr>
										<th data-checkbox="true"></th>
										<th data-field="jqxzbh" data-sortable="true"
											data-sort-name="jqxzbh"><spring:message
												code="pubJqxz.jqxzbh" /></th>
										<th data-field="jqxzjc" data-sortable="true"
											data-sort-name="jqxzjc"><spring:message
												code="pubJqxz.jqxzjc" /></th>
										<th data-field="bzjqxzbh" data-sortable="true"
											data-sort-name="bzjqxzbh"><spring:message
												code="pubJqxz.bzjqxzbh" /></th>
										<th data-field="bzjqxzmc" data-sortable="true"
											data-sort-name="bzjqxzmc"><spring:message
												code="pubJqxz.bzjqxzmc" /></th>
										<th data-field="sybz" data-sortable="true"
											data-sort-name="sybz" data-formatter="defaultSybzFormatter"><spring:message
												code="pubJqxz.sybz" /></th>
										<th data-field="operate"
											data-formatter="defaultActionFormatter"><spring:message
												code="operate" /></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--结果显示div结束  -->
	</div>
	<jsp:include page="/common/template/script_basic_table.jsp" />
	<script
		src="<c:url value='/common/static/plugins/laydate/laydate.js' />"
		type="text/javascript"></script>
	<script
		src="<c:url value='/common/static/plugins/jqgrid/js/jquery.jqGrid.min.js?v=5.1.1' />"
		type="text/javascript"></script>
	<script
		src="<c:url value='/common/static/plugins/jqgrid/js/i18n/grid.locale-cn.js?v=5.1.1' />"
		type="text/javascript"></script>
	<script type="text/javascript">
//获取页面权限值
var indexPage;

var addPer = ${addPer};
var editPer = ${editPer};
var deletePer = ${deletePer};
var viewPer = ${viewPer};
var page = 0;
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
var refreshFlag = true;
//url
var pubJqxzUrl = {
	index : "<c:url value='/pubJqxz/index' />",
	view : "<c:url value='/pubJqxz/view/' />",
	add : "<c:url value='/pubJqxz/add' />",
	edit : "<c:url value='/pubJqxz/edit/' />",
	remove : "<c:url value='/pubJqxz/delete/' />",
	removeBatch : "<c:url value='/pubJqxz/deleteBatch' />",
	getTreeGrid : "<c:url value='/pubJqxz/getTreeGrid'/>",
	getDataByPage : "<c:url value='/pubJqxz/getDataByPage' />"
};

//table对象
var resTab = $('#myResTab'),resTabs = $(resTab).find('li');
var table = $('#defaultTab');
var gridTable = $("#pubJqxzTable");
var page = 0;
$(function() {
	var searchFields = ManageGrid.getSearchFields(table);
	table.bootstrapTable({
		url : pubJqxzUrl.getDataByPage,
		queryParams : function(params) {
			params.searchProperty = searchFields;
			if (limit != "") {
				if (firstLoadFlag) {
					params.limit = parseInt(limit);
					params.offset = parseInt(offset);
				}
			}
			limit = params.limit;
			offset = params.offset;
			params.jqxzbh=$.trim($('#jqxzbh').val());
			params.jqxzjc=$.trim($('#jqxzjc').val());
			return params;
		},
		onLoadSuccess : function() {
			if (firstLoadFlag && offset != 0) {
				table.bootstrapTable("selectPage", offset / limit + 1);
			}
			firstLoadFlag = false;
			setTimeout("checkByTable()", 100);
		},
		toolbar : '#tableToolbar',
		uniqueId : 'id',
		clickToSelect : true,
		sidePagination : 'server',
		pagination : true
	});

	if (resTabs.length > 0) {
		$(resTabs[0]).addClass('active');
	}
          //新增
	$("#addBtn").click(function() {
		  indexPage = Layer.openIframeByOptions(pubJqxzUrl.add,{});
	});
          //批量删除
	$("#removeBtn").click(function() {
		ManageGrid.deleteMultiple(table,pubJqxzUrl.removeBatch, function() {
			window.location.href = pubJqxzUrl.index+ "?limit=" + limit + "&offset="+ offset;
		}, "jqxzbh");
	});
          //查找
	$("#searchBtn").click(function() {
		ManageGrid.refreshTable(table,pubJqxzUrl.getDataByPage);
	});
	//刷新
	$("#refreshBtn").click(function() {
		$('#searchUserForm')[0].reset();
		ManageGrid.refreshTable(table, pubJqxzUrl.getDataByPage);
	});
	
	/* $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    }); */

});

function checkByTable() {
	if (selectId != "") {
		var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId)+ "']");
			selectedRow.removeClass().addClass("selected");
	}
}

//树形显示切换
function queryRes(type,tabIndex){
    $.each(resTabs,function(i,item){
        $(this).removeClass('active');
    });
    $(resTabs[tabIndex]).addClass('active');
    if(type == "tree"){
    	page = 1;
        // 加载数据
        if (refreshFlag) {
        	$(gridTable).attr('url',pubJqxzUrl.getTreeGrid+"?rand="+Math.random());
        	refreshFlag=false;
		} else {
			$(gridTable).jqGrid('clearGridData'); 
			$(gridTable).attr('url',pubJqxzUrl.getTreeGrid);
			$(gridTable).trigger("reloadGrid");
		}
        $(gridTable).attr('loadComplete', function(){
            gridTable.trigger("resize");
            $("#tab").hide();
            $("#treeTable").show();
            $(".mt10").hide();
        });
        JqGrid.initGrid(gridTable);
    }
    if(type == "default"){
    	page = 0;
        // 刷新数据
        ManageGrid.refreshTable(table, pubJqxzUrl.getDataByPage);
        $("#treeTable").hide();
        $("#tab").show();
        $(".mt10").show();
    }
}


//树型显示使用标志
function sybzFormatter(value, opts, row) {
	if ('Y' == row.sybz) {
		return '<span style="color:green"><spring:message code="enable" /></span>';
	} else if ('N' == row.sybz) {
		return '<span style="color:red"><spring:message code="disable" /></span>';
	}
	return '';
}
//默认显示使用标志
function defaultSybzFormatter(value, row) {
	if ('Y' == row.sybz) {
		return '<span style="color:green"><spring:message code="enable" /></span>';
	} else if ('N' == row.sybz) {
		return '<span style="color:red"><spring:message code="disable" /></span>';
	}
	return '';
}

function actionFormatter(value, opts, row) {
	var html = '<div class="action-buttons">';
	html += '<a href="javascript:void(0);" onclick="view(\''+ row.jqxzbh+ '\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
	html += '<a href="javascript:void(0);" onclick="edit(\''+ row.jqxzbh+ '\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
	html += '<a href="javascript:void(0);" onclick="del(\''+ row.jqxzbh+ '\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
	html += '</div>';
	return html;
}

function defaultActionFormatter(value, row) {
	var html = '<div class="action-buttons">';
	html += '<a href="javascript:void(0);" onclick="view(\''+ row.jqxzbh+ '\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
	html += '<a href="javascript:void(0);" onclick="edit(\''+ row.jqxzbh+ '\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
	html += '<a href="javascript:void(0);" onclick="del(\''+ row.jqxzbh+ '\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
	html += '</div>';
	return html;
}
//编辑
function edit(rowId) {
	indexPage = Layer.openIframeByOptions(pubJqxzUrl.edit + rowId,{});
}
//删除
function del(rowId) {
	ManageGrid.deleteSingle(pubJqxzUrl.remove + rowId, function() {
		window.location.href = pubJqxzUrl.index + "?limit=" + limit+ "&offset=" + offset;
	});
}
//查看
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubJqxzUrl.view + rowId,{});
}

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, pubJqxzUrl.getDataByPage);
}
</script>
</body>
</html>
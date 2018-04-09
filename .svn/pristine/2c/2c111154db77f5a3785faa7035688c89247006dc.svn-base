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
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				 <h5><spring:message code="pubZzjg.select" /></h5>
			</div>
			<div class="ibox-content clearfix">
				<div role="form">
					<shiro:hasPermission name="sys:pubZzjg:view">
						<c:set var='viewPer' value='true' />
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:pubZzjg:edit">
						<c:set var='editPer' value='true' />
					</shiro:hasPermission>
				</div>
				<ul id="myResTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" value="11" onclick="queryRes('default',0);">
						<a href="javascript:void(0);"><spring:message code="pubZzjg.default" /></a>
					</li>
					<li role="presentation" value="22" onclick="queryRes('tree',1);">
						<a href="javascript:void(0);"><spring:message code="pubZzjg.tree" /></a>
					</li>
				</ul>
				<div class="table-responsive" id="tab">
					<form method="get" class="clearfix form-horizontal"
						id="searchUserForm">
						<div class="clearfix labelpd0" style="padding-top: 7px;">
							<div class="form-group col-sm-3">
								<label class="col-sm-3 control-label"><spring:message
										code="pubZzjg.dwdm" />:</label>
								<div class="col-sm-9">
									<input type="text" id="dwdm" name="dwdm" class="form-control"
										>
								</div>
							</div>
							<div class="form-group col-sm-3">
								<label class="col-sm-3 control-label"><spring:message
										code="pubZzjg.dwmc" />:</label>
								<div class="col-sm-9">
									<input type="text" id="dwmc" name="dwmc" class="form-control"
										>
								</div>
							</div>
							<div class="form-group col-sm-3">
								<label class="col-sm-3 control-label"><spring:message
										code="pubZzjg.dhhm" />:</label>
								<div class="col-sm-9">
									<input type="text" id="dhhm" name="dhhm" class="form-control"
										>
								</div>
							</div>
							<%--<div class="form-group col-sm-4">
									<label class="col-sm-2 control-label"><spring:message code="starttime" />:</label>
									<div class="col-sm-10">
										<input type="text" id="starttime" name="starttime" readonly="readonly" class="form-control timebox" placeholder="开始时间">
									</div> 
							</div>--%>
							<%--<div class="form-group col-sm-4">
									<label class="col-sm-2 control-label"><spring:message code="endtime" />:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control timebox" id="endtime"
											readonly="readonly" name="endtime" placeholder="结束时间">
									</div> 
							</div>--%>
							<div class="form-group col-sm-3">
								<div class="col-sm-12" style="text-align: right;">
									<button type="button" id="searchBtn" class="btn btn-primary">
										<i class="glyphicon glyphicon-search fz12"
											aria-hidden="true"></i>&nbsp;
										<spring:message code="find" />
									</button>
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
				<div id="treeTable" class="row J_mainContent" data-mobile-responsive="true" style="margin: 10px 0; display: none;">
					<table id="pubZzjgTable" class="table table-bordered" treeGrid="true" expandColumn="dwmc" height="auto">
						<thead>
							<tr>
								<th name="dwmc" width="25%" data-sortable="true" data-sort-name="dwmc"><spring:message code="pubZzjg.dwmc" /></th>
								<th name="dwdm" width="20%" key="true"><spring:message code="pubZzjg.dwdm" /></th>
								<th name="dhhm" width="20%" data-sortable="true" data-sort-name="dhhm"><spring:message code="pubZzjg.dhhm" /></th>
								<th name="pxdm" width="10%" data-sortable="true" data-sort-name="pxdm"><spring:message code="pubZzjg.pxdm" /></th>
								<th name="sybz" width="10%" data-sortable="true" data-sort-name="sybz" formatter="sybzFormatter"><spring:message code="pubZzjg.sybz" /></th>
								<th name="operate" width="15%" formatter="actionFormatter"><spring:message code="operate" /></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	
	<div class="ibox float-e-margins mt10">
		<div class="ibox-title">
			<h5><spring:message code="pubZzjg.list" /></h5>
			<div class="ibox-tools">
				<c:set var='addPer' value='false' />
				<c:set var='editPer' value='false' />
				<c:set var='deletePer' value='false' />
				<c:set var='viewPer' value='false' />
				<!-- <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>  -->
				<div class="btn-group hidden-xs mt8" role="group">
					<shiro:hasPermission name="sys:pubZzjg:add">
						<c:set var='addPer' value='true' />
						<button id="addBtn" type="button" class="btn "
							title="<spring:message code="new" />">
							<i class="fa fa-plus-circle"></i>&nbsp;新增
						</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:pubZzjg:delete">
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
		<div class="ibox-content">
			<div class="row">
				<div class="col-sm-12">
					<div class="" role="form">
						<shiro:hasPermission name="sys:pubZzjg:view">
							<c:set var='viewPer' value='true' />
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:pubZzjg:edit">
							<c:set var='editPer' value='true' />
						</shiro:hasPermission>
					</div>
					<div class="table-responsive" id="tab">
						<table id="defaultTab" class="table table-bordered table-striped"
							data-mobile-responsive="true">
							<thead>
								<tr>
									<th data-checkbox="true"></th>
									<th data-field="dwmc" data-sortable="true"
										data-sort-name="dwmc"><spring:message
											code="pubZzjg.dwmc" /></th>
									<th data-field="dwdm" data-sortable="true"
										data-sort-name="dwdm"><spring:message
											code="pubZzjg.dwdm" /></th>
									<th data-field="dhhm" data-sortable="true"
										data-sort-name="dhhm"><spring:message
											code="pubZzjg.dhhm" /></th>
									<th data-field="pxdm" data-sortable="true"
										data-sort-name="pxdm"><spring:message
											code="pubZzjg.pxdm" /></th>
									<th data-field="sybz" data-sortable="true"
										data-sort-name="sybz" data-formatter="defaultSybzFormatter"><spring:message
											code="pubZzjg.sybz" /></th>
									<th data-field="operate"
										data-formatter="defaultActionFormatter"><spring:message
											code="operate" /></th>
								</tr>
							</thead>
						</table>
					</div>

					<div id="treeTable" class="row J_mainContent"
						data-mobile-responsive="true"
						style="margin-top: 20px; margin-left: 1px; margin-right: 1px; display: none;">
						<table id="pubZzjgTable" class="table table-bordered"
							treeGrid="true" expandColumn="dwmc" height="auto">
							<thead>
								<tr>
									<th name="dwmc" width="25%" data-sortable="true"
										data-sort-name="dwmc"><spring:message
											code="pubZzjg.dwmc" /></th>
									<th name="dwdm" width="20%" key="true"><spring:message
											code="pubZzjg.dwdm" /></th>
									<th name="dhhm" width="20%" data-sortable="true"
										data-sort-name="dhhm"><spring:message
											code="pubZzjg.dhhm" /></th>
									<th name="pxdm" width="10%" data-sortable="true"
										data-sort-name="pxdm"><spring:message
											code="pubZzjg.pxdm" /></th>
									<th name="sybz" width="10%" data-sortable="true"
										data-sort-name="sybz" formatter="sybzFormatter"><spring:message
											code="pubZzjg.sybz" /></th>
									<th name="operate" width="15%" formatter="actionFormatter"><spring:message
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
var treeFlag = true;
var table = $('#defaultTab');
var gridTable = $("#pubZzjgTable");
var pubZzjgUrl = {
    index: "<c:url value='/pubZzjg/index' />",
    view: "<c:url value='/pubZzjg/view/' />",
    add: "<c:url value='/pubZzjg/add' />",
    edit: "<c:url value='/pubZzjg/edit/' />",
    remove: "<c:url value='/pubZzjg/delete/' />",
    removeBatch: "<c:url value='/pubZzjg/deleteBatch' />",
    getNodesZzjgByDwdm: "<c:url value='/pubZzjg/getNodesZzjgByDwdm' />",
    getDataByPage: "<c:url value='/pubZzjg/getDataByPage' />"
};

//table对象
var resTab = $('#myResTab'),resTabs = $(resTab).find('li');

$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: pubZzjgUrl.getDataByPage,
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
            
            params.dwmc = $.trim($("#dwmc").val());
            params.dwdm = $.trim($("#dwdm").val());
            params.dhhm = $.trim($("#dhhm").val());
            //params.starttime = $("#starttime").val() != '' ? $("#starttime").val() + ' 00:00:00' : $("#endtime").val();
            //params.endtime = $("#endtime").val() != '' ? $("#endtime").val() + ' 23:59:59' : $("#endtime").val();
            return params;
        },
        onLoadSuccess: function () {
            if (firstLoadFlag && offset != 0) {
                table.bootstrapTable("selectPage", offset/limit + 1);
            }
            firstLoadFlag = false;
            setTimeout ("checkByTable()", 100);
        },
        toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    
    if(resTabs.length > 0){
        $(resTabs[0]).addClass('active');
    }
    
    $("#addBtn").click(function(){
    	indexPage = Layer.openIframeByOptions(pubZzjgUrl.add,{});
    });
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubZzjgUrl.removeBatch, function(){window.location.href = pubZzjgUrl.index + "?limit=" + limit + "&offset=" + offset;}, "dwdm");
    });
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubZzjgUrl.getDataByPage);
    });
    
    
    $("#refreshBtn").click(function(){
    	$('#searchUserForm')[0].reset();
        ManageGrid.refreshTable(table, pubZzjgUrl.getDataByPage);
    });
    
   /*  $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    }); */
    
    laydate.skin('molv');
/*     laydate({
       elem: '#starttime',
       format: 'YYYY-MM-DD'
    });
    
    laydate({
       elem: '#endtime',
       format: 'YYYY-MM-DD'
    }); */
    
    //重置按钮
    $("#resetBtn").click(function(){
		$("#dwmc").val("");
		$("#dwdm").val("");
		//$("#starttime").val("");
		//$("#endtime").val("");
		$("#dhhm").val("");
		laydate.reset();
    });
    
});

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

//查询权限
function queryRes(type,tabIndex){
    $.each(resTabs,function(i,item){
        $(this).removeClass('active');
    });
    $(resTabs[tabIndex]).addClass('active');
    
    if(type == "tree"){
    	page = 1;
    	if(treeFlag){
    		$(gridTable).attr('url',pubZzjgUrl.getNodesZzjgByDwdm);
    		treeFlag = false;
    	}else{
    		$(gridTable).jqGrid('clearGridData'); 
    		 $(gridTable).attr('url',pubZzjgUrl.getNodesZzjgByDwdm);
    		 $(gridTable).trigger("reloadGrid");
    	}
        // 加载数据
        $(gridTable).attr('loadComplete', function(){
            gridTable.trigger("resize");
            $("#tab").hide();
            $("#treeTable").show();
            $(".mt10").hide();
            $(".treeclick").click();
        });
        $(gridTable).attr("gridComplete",'openTree');
        JqGrid.initGrid(gridTable);
    }
    if(type == "default"){
    	page = 0;
        // 刷新数据
        ManageGrid.refreshTable(table, pubZzjgUrl.getDataByPage);
        $("#treeTable").hide();
        $("#tab").show();
        $(".mt10").show();
        
    }
}

//？？JqGrid框架 gridComplete 事件会触发多次，加一个全局变量作为标识
var treeLoadFlag = false;
function openTree(){
	if(!treeLoadFlag){
		setTimeout(function(){
			$(".treeclick").click();
		}, 500);
		treeLoadFlag = true;
	}
}

function sybzFormatter(value,opts, row) {
    if('Y' == row.sybz) {
        return '<span style="color:green"><spring:message code="enable" /></span>';
    }else if('N' == row.sybz){
         return '<span style="color:red"><spring:message code="disable" /></span>';
    }
    return '';
}

function defaultSybzFormatter(value, row) {
    if('Y' == row.sybz) {
        return '<span style="color:green"><spring:message code="enable" /></span>';
    }else if('N' == row.sybz){
         return '<span style="color:red"><spring:message code="disable" /></span>';
    }
    return '';
}

function actionFormatter(value,opts,row) {
    var html = '<div class="action-buttons">';
    if(viewPer){
        html += '<a href="javascript:void(0);" onclick="view(\''+row.dwdm+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    if(editPer){
        html += '<a href="javascript:void(0);" onclick="edit(\''+row.dwdm+'\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    if(deletePer){
        html += '<a href="javascript:void(0);" onclick="del(\''+row.dwdm+'\',\'1\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    html += '</div>';
    return html;
} 

function defaultActionFormatter(value,row) {
    var html = '<div class="action-buttons">';
    if(viewPer){
        html += '<a href="javascript:void(0);" onclick="view(\''+row.dwdm+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    if(editPer){
        html += '<a href="javascript:void(0);" onclick="edit(\''+row.dwdm+'\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    if(deletePer){
        html += '<a href="javascript:void(0);" onclick="del(\''+row.dwdm+'\',\'0\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    html += '</div>';
    return html;
} 

function edit(rowId) {
	indexPage = Layer.openIframeByOptions(pubZzjgUrl.edit  + rowId,{});
}
//删除时需要判断是默认还是树状，以便刷新对应的列表数据
function del(rowId,id) {
	if(id == 0)
	{
	   ManageGrid.deleteSingle(pubZzjgUrl.remove + rowId, function(){queryRes('default',0);});
	}if(id == 1)
	{
	   ManageGrid.deleteSingle(pubZzjgUrl.remove + rowId, function(){queryRes('tree',1);});
	}
   
}
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubZzjgUrl.view  + rowId,{});
}

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, pubZzjgUrl.getDataByPage);
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/template/head_basic_table.jsp" />
	<link href="<c:url value='/common/static/plugins/jqgrid/css/ui.jqgrid.css' />" rel="stylesheet" type="text/css" />
	
</head>

<body class="gray-bg">
	<div class="row">
		<div class="col-sm-6">
			<div class="wrapper wrapper-content" style="padding-right: 0px;">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>字典类型列表</h5>
						<div class="ibox-tools">
							<div class="btn-group hidden-xs mt8" role="group">
								<c:set var='addPer' value='false' />
							    <c:set var='deletePer' value='false' />
                            	<c:set var='editPer' value='false' />
		                        <c:set var='viewPer' value='false' />
		                        
								<shiro:hasPermission name="sys:pubXtzdlx:add">
	                            	<c:set var='addPer' value='true' />
	                            	<button id="addTypeBtn" type="button" class="btn btn-default" title="new">
										<i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i>新增
									</button>
	                            </shiro:hasPermission>
								<shiro:hasPermission name="sys:pubXtzdlx:delete">
									<c:set var='deletePer' value='true' />
								</shiro:hasPermission>
								
								<shiro:hasPermission name="sys:pubXtzdlx:edit">
	                            	<c:set var='editPer' value='true' />
	                            </shiro:hasPermission>
	                            <shiro:hasPermission name="sys:pubXtzdlx:view">
	                                <c:set var='viewPer' value='true' />
	                            </shiro:hasPermission>
                           		
								<button id="synTypeBtn" type="button" class="btn btn-default" title="<spring:message code='refresh' />">
									<i class="glyphicon glyphicon glyphicon-refresh fz12" aria-hidden="true"></i>刷新
								</button>
							</div>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-12">
								<div id="typeTableToolbar" role="group">
			                        <div class="col-sm-5">
			                             <input type="text" id="lxmc" name="lxmc" placeholder="<spring:message code="pubXtzdlx.lxmc" />" class="form-control">
			                        </div>
			                        <button type="button" id="searchBtn" class="btn btn-w-m btn-primary"><spring:message code="search" /></button>
								</div>
								<div class="table-responsive">
									<input type="hidden" name="xtzdlxId" id="xtzdlxId">
									<table id="typeTable" role="presentation" aria-multiselectable="false" 
									aria-labelledby="gbox_table_list_2" class="ui-jqgrid-btable ui-common-table table table-bordered table-striped" 
										 data-mobile-responsive="true">
										<thead>
											<tr>
												<th data-radio="true" data-formatter="stateFormatter"></th>
												<th data-field="id" data-visible="false">ID</th>
												<th data-field="lxmc"><spring:message code="pubXtzdlx.lxmc" /></th>
												<th data-field="lxdm"><spring:message code="pubXtzdlx.lxdm" /></th>
												<th data-field="lxms"><spring:message code="pubXtzdlx.lxms" /></th>
												<th data-field="operate" data-formatter="actionFormatterType">操作</th>
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
		<div class="col-sm-6">
			<div class="wrapper wrapper-content" style="padding-left: 0px;">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>字典明细列表</h5>
						<div class="ibox-tools">
							<div class="btn-group hidden-xs mt8" role="group">
								<shiro:hasPermission name="sys:pubXtzdlx:add">
	                            	<button id="addBtn" type="button" class="btn btn-default" title="new">
										<i class="glyphicon glyphicon glyphicon-search fz12" aria-hidden="true"></i>新增
									</button>
	                            </shiro:hasPermission>
	                            <shiro:hasPermission name="sys:pubXtzdlx:delete">
	                            	<button id="removeBtn" type="button" class="btn btn-default" title="delete">
										<i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i>删除
									</button>
	                            </shiro:hasPermission>
	                            
								<button id="synBtn" type="button" class="btn btn-default" title="<spring:message code='refresh' />">
									<i class="glyphicon glyphicon glyphicon-refresh fz12" aria-hidden="true"></i>刷新
								</button>
							</div>
						</div>
					</div>
					<div class="ibox-content  ibox-padding">
						<div class="row">
							<div class="col-sm-12">
								<div class="table-responsive">
									<input type="text" name="typeId" id="typeId"> 
									<table id="dictTable"  class="ui-jqgrid-btable ui-common-table table table-bordered table-striped">
										<thead>
											<tr>
												<th data-checkbox="true"></th>
												<th data-field="zdbh" data-visible="false">ID</th>
												<th data-field="zdxm"><spring:message code="pubXtzd.zdxm" /></th>
												<th data-field="lxdm" data-visible="false"><spring:message code="pubXtzd.lxdm" /></th>
												<!-- <th data-field="order">排序号</th> -->
												<th data-field="lxmc"><spring:message code="pubXtzdlx.lxmc" /></th>
												<th data-field="zdxz"><spring:message code="pubXtzd.zdxz" /></th>
												<th data-field="operate" data-formatter="actionFormatter">操作</th>
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
	</div>

<jsp:include page="/common/template/script_basic_table.jsp" />

<script type="text/javascript">

//获取页面权限值
var addPer = ${addPer};
var editPer = ${editPer};
var deletePer = ${deletePer};
var viewPer = ${viewPer};

var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var lxdm = '${param.lxdm}';

var firstLoadFlag = true;

	var pubXtzdlxUrl = {
	    index: "<c:url value='/pubXtzdlx/index' />",
	    viewType: "<c:url value='/pubXtzdlx/view/' />",
	    addType: "<c:url value='/pubXtzdlx/add' />",
	    editType: "<c:url value='/pubXtzdlx/edit/' />",
	    removeType: "<c:url value='/pubXtzdlx/delete/' />",
	    removeBatchType: "<c:url value='/pubXtzdlx/deleteBatchType' />",
	    add: "<c:url value='/pubXtzd/add' />",
	    view: "<c:url value='/pubXtzd/view/' />",
	    edit: "<c:url value='/pubXtzd/edit/' />",
	    remove: "<c:url value='/pubXtzd/delete/' />",
	    removeBatch: "<c:url value='/pubXtzd/deleteBatch' />",
	    getPubXtzdlxType: "<c:url value='/pubXtzdlx/getDataByPage' />",
	    getPubXtzdByPage: "<c:url value='/pubXtzd/getDataByPage' />"
	};
   	var typeTable = $('#typeTable');
   	var dictTable = $('#dictTable');
    $(function () {
    	
    	var searchFields = ManageGrid.getSearchFields(typeTable);
    	typeTable.bootstrapTable({
    		
    		url: pubXtzdlxUrl.getPubXtzdlxType,
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
                return params;
            },
            onLoadSuccess: function () {
                if (firstLoadFlag && offset != 0) {
                	typeTable.bootstrapTable("selectPage", offset/limit + 1);
                }
                firstLoadFlag = false;
                setTimeout ("checkByTable()", 100);
            },
            toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, sidePagination: 'server', pagination: true,onClickRow: onClickTypeRow
        });
    
    	
    	
    	if(lxdm != null && lxdm != ''){
    		$("#typeId").val(lxdm);
    	}
    	
    	
    	var searchFields = ManageGrid.getSearchFields(dictTable);
    	dictTable.bootstrapTable({
    		
    		url: pubXtzdlxUrl.getPubXtzdByPage,
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
                params.lxdm = $("#typeId").val();
                return params;
            },
            onLoadSuccess: function () {
                if (firstLoadFlag && offset != 0) {
                	typeTable.bootstrapTable("selectPage", offset/limit + 1);
                }
                firstLoadFlag = false;
                setTimeout ("checkByTable()", 100);
            },
            toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, sidePagination: 'server', pagination: true
        });
    	
    	$("#addTypeBtn").click(function(){
        	window.location.href = pubXtzdlxUrl.addType;
        });
        $("#removeTypeBtn").click(function(){
        	ManageGrid.deleteMultiple(typeTable, pubXtzdlxUrl.removeBatchType, function(){window.location.href = pubXtzdlxUrl.index;});
        });
        $("#synTypeBtn").click(function(){
        	alert(lxdm);
        	lxdm = '';
        	$("#typeId").val('');
        	ManageGrid.refreshTable(typeTable, pubXtzdlxUrl.getPubXtzdlxType);
        });
    	
        $("#addBtn").click(function(){
        	var rows = typeTable.bootstrapTable('getSelections');
        	var lxdm = $("#typeId").val();
        	window.location.href = pubXtzdlxUrl.add + '?lxdm=' + lxdm;
        });
        $("#removeBtn").click(function(){
        	ManageGrid.deleteMultiple(dictTable, pubXtzdlxUrl.removeBatch, function(){
            	Manage.url(pubXtzdlxUrl.index+"?lxdm="+$("#typeId").val(),limit,offset);
            }, "zdbh");
        });
        $("#synBtn").click(function(){
        	ManageGrid.refreshTable(dictTable, pubXtzdlxUrl.getPubXtzdByPage);
        });
        
        $("#searchBtn").click(function(){
        	var param = {lxmc:$.trim($('#lxmc').val())};
            ManageGrid.refreshTable(typeTable, pubXtzdlxUrl.getPubXtzdlxType,param);
        });
        
    
    });
    
    function checkByTable() {
        if (selectId != "") {
            var selectds = new Array();
            selectds.push (parseInt(selectId));
            table.bootstrapTable("checkBy", {field:"zdbh", values:selectds});
        }
    }
    
    function actionFormatterType(value, row) {
    	var html = '<div class="action-buttons">';
    	 if(addPer){ html += "<a href=\"javascript:void(0);\" onclick=\"viewType('"+row.lxbh+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";}   	 
    	 if(editPer){ html += "<a href=\"javascript:void(0);\" onclick=\"editType('"+row.lxbh+"')\" title=\"<spring:message code='edit' />\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>";}    	 
    	 if(deletePer){ html += "<a href=\"javascript:void(0);\" onclick=\"delType('"+row.lxbh+"')\" title=\"<spring:message code='remove' />\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>"; }	 
    	html += '</div>';
    	return html;
    }
    function actionFormatter(value, row) {
    	var html = '<div class="action-buttons">';
    	 if(viewPer){html += "<a href=\"javascript:void(0);\" onclick=\"view('"+row.zdbh+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";
    	 }
    	 if(editPer){ html += "<a href=\"javascript:void(0);\" onclick=\"edit('"+row.zdbh+"')\" title=\"<spring:message code='edit' />\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>";
    	 }
    	 if(deletePer){ html += "<a href=\"javascript:void(0);\" onclick=\"del('"+row.zdbh+"')\" title=\"<spring:message code='remove' />\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>";
    	 }
    	html += '</div>';
    	return html;
    }
    
    function viewType(rowId) {
        window.location.href = pubXtzdlxUrl.viewType + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
    }
    
    function editType(rowId) {
    	window.location.href = pubXtzdlxUrl.editType + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
    }
    function delType(rowId) {
    	ManageGrid.deleteSingle(pubXtzdlxUrl.removeType + rowId, function(){window.location.href = pubXtzdlxUrl.index;});
    }
    
    function view(rowId) {
        window.location.href = pubXtzdlxUrl.view + rowId + "?limit=" + limit + "&offset=" + offset + "&id=" + rowId;
    }
    
    function edit(rowId,lxdm) {
    	window.location.href = pubXtzdlxUrl.edit + rowId;
    }
    function del(rowId) {
    	var lxdm = $("#typeId").val();
    	ManageGrid.deleteSingle(pubXtzdlxUrl.remove + rowId, function(){window.location.href = pubXtzdlxUrl.index+"?lxdm="+lxdm;});
    }
    function onClickTypeRow(row, $element){
    	$("#typeId").val(row.lxdm);
    	ManageGrid.refreshTable(dictTable, pubXtzdlxUrl.getPubXtzdByPage, {lxdm: row.lxdm});
    }
    
   function stateFormatter(value, opts, row){  
		
    	if(opts.lxdm == lxdm){	
    	
    		$("#typeId").val(lxdm);
    		return {
    		    checked: true
    	    };
    	} 
    	return value;
    }
	
</script>
</body>
</html>
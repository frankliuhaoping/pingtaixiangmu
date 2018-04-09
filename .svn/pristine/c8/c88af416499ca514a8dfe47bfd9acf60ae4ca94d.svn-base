<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/common/template/head_basic_table.jsp" />
<link href="<c:url value='/common/static/plugins/jqgrid/css/ui.jqgrid-bootstrap.css?v=5.1.1' />"rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/css/manage.css?v=1.0' />"rel="stylesheet" type="text/css" />

<style type="text/css">
.form-controls {
	width: 400px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.btn-primary {
	margin-top: -5.5px
}



 
</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">

			<div class="ibox-title">
				<h5>
					<spring:message code="pubJqxz.list" />
				</h5>
				<div class="ibox-tools">
					<div class="btn-group hidden-xs mt8" role="group">
						<shiro:hasPermission name="sys:pubJqxz:add">
							<c:set var='addPer' value='true' />
							<button id="addBtn" type="button" class="btn btn-default"
								title="<spring:message code="new" />"><i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i>新增</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:pubJqxz:delete">
							<c:set var='deletePer' value='true' />
							<button id="removeBtn" type="button" class="btn btn-default"
								title="<spring:message code="remove" />"><i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i>批量删除</button>
						</shiro:hasPermission>
						<button id="refreshBtn" type="button" class="btn btn-default"
							title="<spring:message code="refresh" />"><i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i>刷新</button>
					</div>
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<div class="btn-group hidden-xs tableToolbar" role="form">
							<c:set var='addPer' value='false' />
							<c:set var='editPer' value='false' />
							<c:set var='deletePer' value='false' />
							<c:set var='viewPer' value='false' />
							

						</div>
						<div>
							<ul id="myResTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" value="11"
									onclick="queryRes('default',0);"><a
									href="javascript:void(0);"><spring:message
											code="pubJqxz.default" /></a></li>
								<li role="presentation" value="22" onclick="queryRes('tree',1);">
									<a href="javascript:void(0);"><spring:message
											code="pubJqxz.tree" /></a>
								</li>

							
							</ul>
						</div>
						<div class="table-responsive" id="tab">

							<form method="get" class="form-horizontal" style="width: 96%"
								id="searchUserForm">
								<div class="row labelpd0" style="padding-top: 10px;">
									<div class="form-group col-sm-4">
										<label class="col-sm-3 control-label"><spring:message
												code="pubJqxz.jqxzbh" />:</label>
										<div class="col-sm-9">
											<input type="text" id="jqxzbh" name="jqxzbh" class="form-control">
										</div>
									</div>
									<div class="form-group col-sm-4">
										<label class="col-sm-3 control-label"><spring:message
												code="pubJqxz.jqxzjc" />:</label>
										<div class="col-sm-9">
											<input type="text" id="jqxzjc" name="jqxzjc" class="form-control">
										</div>
									</div>
									

									<div class="form-group col-sm-4">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div class="col-sm-4"></div>
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
							<table id="defaultTab" class="table table-bordered table-striped" data-mobile-responsive="true">
								<thead>	
								 <tr>
		                              <th data-checkbox="true" ></th>
		                              <th data-field="jqxzbh" data-sortable="true"  data-sort-name="jqxzbh"><spring:message code="pubJqxz.jqxzbh" /></th>
		                              <th data-field="jqxzjc" data-sortable="true" data-sort-name="jqxzjc"><spring:message code="pubJqxz.jqxzjc" /></th>
		                              <th data-field="bzjqxzbh" data-sortable="true" data-sort-name="bzjqxzbh"><spring:message code="pubJqxz.bzjqxzbh" /></th>
		                              <th data-field="bzjqxzmc" data-sortable="true" data-sort-name="bzjqxzmc"><spring:message code="pubJqxz.bzjqxzmc" /></th>
		                              <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="defaultSybzFormatter"><spring:message code="pubJqxz.sybz" /></th>
		                              <th data-field="operate" data-formatter="defaultActionFormatter"><spring:message code="operate" /></th>
		                          </tr>		
								</thead>
							</table>
						</div>

						<div id="treeTable" class="row J_mainContent" data-mobile-responsive="true" 
							style="margin-top: 20px; margin-left: 1px; display: none;">
							<table id="pubJqxzTable" class="table" treeGrid="true" expandColumn="jqxzjc" height="auto">
								<thead>
									<tr>
										<th name="jqxzbh"  hidden="true"  key="false"><spring:message code="pubJqxz.jqxzbh" /></th>
										<th name="jqxzjc" width="300"><spring:message code="pubJqxz.jqxzjc" /></th>
										<th name="bzjqxzbh" width="210"><spring:message code="pubJqxz.bzjqxzbh" /></th>
										<th name="bzjqxzmc" width="180"><spring:message code="pubJqxz.bzjqxzmc" /></th>
										<th name="sybz" width="180" formatter="sybzFormatter"><spring:message code="pubJqxz.sybz" /></th>
										<th name="operate" width="190" formatter="actionFormatter"><spring:message code="operate" /></th>
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
	<script src="<c:url value='/common/static/plugins/jqgrid/js/jquery.jqGrid.min.js?v=5.1.1' />"type="text/javascript"></script>
	<script src="<c:url value='/common/static/plugins/jqgrid/js/i18n/grid.locale-cn.js?v=5.1.1' />"type="text/javascript"></script>
	

	<script type="text/javascript">
		//获取页面权限值
		var addPer = ${addPer};
		var editPer = ${editPer};
		var deletePer = ${deletePer};
		var viewPer = ${viewPer};

		var selectId = '${param.selectId}';
		var limit = '${param.limit}';
		var offset = '${param.offset}';
		var firstLoadFlag = true;
		
		var pubJqxzUrl = {
			index : "<c:url value='/pubJqxz/index' />",
			view : "<c:url value='/pubJqxz/view/' />",
			add : "<c:url value='/pubJqxz/add' />",
			edit : "<c:url value='/pubJqxz/edit/' />",
			remove : "<c:url value='/pubJqxz/delete/' />",
			removeBatch : "<c:url value='/pubJqxz/deleteBatch' />",
			getNodesJqxzByJqxzbh : "<c:url value='/pubJqxz/getNodesJqxzByJqxzbh'/>",
			getDataByPage : "<c:url value='/pubJqxz/getDataByPage' />?sort=bzjqxzbh"
		};

		//table对象
		var resTab = $('#myResTab'), resTabs = $(resTab).find('li');
		var table = $("#defaultTab");
		var gridTable = $("#pubJqxzTable");
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
					params.order = 'desc';
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

			$("#addBtn").click(
					function() {
						window.location.href = pubJqxzUrl.add + "?limit="+ limit + "&offset=" + offset;
					});
			$("#removeBtn").click(
					function() {
						ManageGrid.deleteMultiple(table,pubJqxzUrl.removeBatch, function() {
									window.location.href = pubJqxzUrl.index+ "?limit=" + limit + "&offset="+ offset;}, "jqxzbh");
					});
			$("#searchBtn").click(
					function() {
						ManageGrid.refreshTable(table,pubJqxzUrl.getDataByPage);
					});

			$("#refreshBtn").click(function() {
				ManageGrid.refreshTable(table, pubJqxzUrl.getDataByPage);
			});

		});

		function checkByTable() {
			if (selectId != "") {
				var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId)
						+ "']");
				selectedRow.removeClass().addClass("selected");
			}
		}

		//标签切换
		function queryRes(type, tabIndex) {
			$.each(resTabs, function(i, item) {
				$(this).removeClass('active');
			});
			$(resTabs[tabIndex]).addClass('active');

			if (type == "tree") {
				$(gridTable).attr('url',pubJqxzUrl.getNodesJqxzByJqxzbh);
		        $(gridTable).attr('loadComplete', function(){
		            gridTable.trigger("resize");
		            $("#tab").hide();
		            $("#treeTable").show();
		        });
		        JqGrid.initGrid(gridTable);
			}
			if (type == "default") {
				// 刷新数据
		        ManageGrid.refreshTable(table, pubJqxzUrl.getDataByPage);
		        $("#treeTable").hide();
		        $("#tab").show();
			}
		}

		function sybzFormatter(value, opts, row) {
			if ('Y' == row.sybz) {
				return '<span style="color:green"><spring:message code="enable" /></span>';
			} else if ('N' == row.sybz) {
				return '<span style="color:red"><spring:message code="disable" /></span>';
			}
			return '';
		}

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

		function edit(rowId) {
			window.location.href = pubJqxzUrl.edit + rowId + "?limit=" + limit
					+ "&offset=" + offset + "&id=" + rowId;
		}
		function del(rowId) {
			ManageGrid.deleteSingle(pubJqxzUrl.remove + rowId, function() {
				window.location.href = pubJqxzUrl.index + "?limit=" + limit
						+ "&offset=" + offset;
			});
		}
		function view(rowId) {
			window.location.href = pubJqxzUrl.view + rowId + "?limit=" + limit
					+ "&offset=" + offset + "&id=" + rowId;
		}
		
		$('#phName').bind('keyup',function(){
			
			$('#xianshi').show();
			
			
		});
		
		

	</script>
</body>
</html>
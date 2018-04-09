<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<!-- 头部 -->
<head>
	<!--引入基础css样式库  -->
	<jsp:include page="/common/template/head_basic_table.jsp" />
	<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<!-- 标题栏div开始 -->
		<div class="ibox float-e-margins">
		<!-- 标题 -->
            <div class="ibox-title">
                <h5><i class="fa fa-file-text-o mt2 mr5"></i><spring:message code="pubGpssbxx.select" /></h5>
            </div>
            <!--查询 div-->
            <div class="ibox-content ">
				<form method="get" class="form-horizontal" id="searchUserForm">
            		<div class="row labelpd0">
            		 	<!-- 设备编号-->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message code="pubGpssbxx.sbbh" />:</label>
							<div class="col-sm-9">
							    <input type="text" id="sbbh" name="sbbh" class="form-control">
							</div>
						</div>
						<!-- 设备编号-->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message code="pubGpssbxx.sbmc" />:</label>
							<div class="col-sm-9">
							    <input type="text" id="sbmc" name="sbmc" class="form-control">
							</div>
						</div>
						<%-- <!-- 组织机构-->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message code="pubGpssbxx.zzjgmc" />:</label>
							<div class="col-sm-9">
							    <input type="text" id="zzjgmc" placeholder="请选择机构" name="zzjgmc" class="form-control">
							    <input type="hidden" id="zzjgdm" name="zzjgdm" class="form-control">
							</div>
						</div> --%>
						 <div class="form-group col-sm-3">
	                   		<label class="col-sm-3 control-label"><spring:message code="pubGpssbxx.sybz" />:</label>
	                        <div class="col-sm-9">
	                       		<select id="sybz_select" class="form-control">
	                       			<option value =""></option>
									<option value ="Y">启用</option>
								  	<option value ="N">禁用</option>
								</select>
	                       	</div>
	                  </div>
	                  <!-- 组织机构名称 -->
						<div class="form-group col-sm-3">
							<label class="col-sm-4 control-label"><spring:message code="pubPdtthzxx.zzjgmc" />:</label>
							<div class="col-sm-8">
							    <input type="text" id="zzjgmc" name="zzjgmc" class="form-control timebox" readonly>
							    <input type="hidden" id="zzjgdm"   name="zzjgdm" class="form-control timebox" readonly>
							</div>
						</div>
	                  	<!--按钮组div  -->
	                  	<div class="form-group col-sm-12">
							<div class="col-sm-12" style="text-align:right;">
								<!--查询按钮  -->
								<button type="button" id="searchBtn" class="btn btn-primary">
									<i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp;<spring:message code="find" />
								</button>
								<!-- 重置按钮 -->
								<button type="reset" id="resetBtn" class="btn btn-default">
									<i class="glyphicon glyphicon-repeat" aria-hidden="true"></i>&nbsp;<spring:message code="reset" />
								</button>
							</div>
						</div>
					</div>
				</form>
            </div>
            <!--查询结束  -->
		</div>
		<!-- 标题栏div结束 -->
		<!-- 内容div开始 -->
		<div class="ibox float-e-margins mt10">
			<!--内容栏按钮组div  -->
			<div class="ibox-title">
                <h5><i class="fa fa-calculator mt2 mr5"></i><spring:message code="pubGpssbxx.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
                      	<shiro:hasPermission name="sys:pubGpssbxx:add">
                    		<c:set var='addPer' value='true' />
                    		<!--新增按钮 -->
	                        <button id="addBtn" type="button" class="btn">
	                           	 <i class="fa fa-plus-circle"></i>&nbsp;<spring:message code="new" />
	                        </button>
	                        <button id="uploadBtn" type="button" class="btn">
                                <i class="fa fa-upload"></i>&nbsp;<spring:message code="pubGpssbxx.import" />
                            </button>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubGpssbxx:del">
                			<c:set var='deletePer' value='true' />
                			<!--批量删除按钮  -->
                            <button id="removeBtn" type="button" class="btn">
                                 <i class="fa fa-times-circle"></i>&nbsp;<spring:message code="batchRemove" />
                            </button>
                        </shiro:hasPermission>
                        <!-- 刷新按钮 -->
                        <button id="refreshBtn" type="button" class="btn">
                            <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
                        </button>
					</div>
                </div>
			</div>
			<!--内容栏按钮组div结束-->
			<!-- table显示div -->
			<div class="ibox-content ">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                        	<!-- 编辑权限 -->
                            <shiro:hasPermission name="sys:pubGpssbxx:edit">
                                <c:set var='editPer' value='true' />
                            </shiro:hasPermission>
                            <!--  查看权限-->
                            <shiro:hasPermission name="sys:pubGpssbxx:view">
                                <c:set var='viewPer' value='true' />
                            </shiro:hasPermission>
                        </div>
                        <!-- table -->
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped"    height="auto">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                     	<th data-field="sbbh" data-sortable="false"  data-sort-name="sbbh" ><spring:message code="pubGpssbxx.sbbh" /></th>
                                       	<th data-field="sbmc" data-sortable="false"  data-sort-name="sbmc"  ><spring:message code="pubGpssbxx.sbmc" /></th>
										<th data-field="zzjgmc" data-sortable="false" data-sort-name="zzjgmc" ><spring:message code="pubGpssbxx.zzjgmc" /></th>
										<th data-field="sblx" data-sortable="true" data-sort-name="sblx"><spring:message code="pubGpssbxx.sblx" /></th><!-- 人员性别列 -->
										<th data-field="sybz" data-sortable="true"  data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubGpssbxx.sybz" /></th><!-- 人员职务列 -->
 										<th data-field="cjr"  data-sortable="true" data-sort-name="cjr" ><spring:message code="pubGpssbxx.cjr" /></th><!--使用标志  -->
										<th data-field="cjsj"  data-sortable="true" data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message code="pubGpssbxx.cjsj" /></th><!--使用标志  -->
										<th data-field="operate" data-formatter="defaultActionFormatter"><spring:message code="operate" /></th><!-- 操作按钮组 -->
                                    </tr>
                                </thead>
                            </table> 
                        </div>
                    </div>
                </div>
			</div>
		</div>
		<!-- 内容栏div结束 -->
	</div>
	<!--引入js基础库  -->
	<jsp:include page="/common/template/script_basic_table.jsp" />
	<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
	<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script type="text/javascript">
	//获取页面权限值
	var addPer = ${addPer};
	var editPer = ${editPer};
	var deletePer = ${deletePer};
	var viewPer = ${viewPer};
	var indexPage;
	
	//操作id和分页信息记录
	var selectId = '${param.selectId}';
	var limit = '${param.limit}';
	var offset = '${param.offset}';
	var firstLoadFlag = true;
	//table对象
	var table = $('.table');
	//url定义
	var pubGpssbxxUrl = {
		index : "<c:url value='/pubGpssbxx/index' />",/* 主界面 */
		view : "<c:url value='/pubGpssbxx/view/' />",/* 查看 */
		add : "<c:url value='/pubGpssbxx/add' />",/* 新增 */
		importView : "<c:url value='/pubGpssbxx/importView' />",//导入
		edit : "<c:url value='/pubGpssbxx/edit/' />",/* 编辑 */
		remove : "<c:url value='/pubGpssbxx/delete/' />",/* 单个删除 */
		removeBatch : "<c:url value='/pubGpssbxx/deleteBatch' />",/* 批量删除 */
		getDataByPage : "<c:url value='/pubGpssbxx/getDataByPage' />"/* 分页查询 */
	};
	
	//初始化表格和按钮
	$(function () {
		var searchFields = ManageGrid.getSearchFields(table);
		table.bootstrapTable({
	        url: pubGpssbxxUrl.getDataByPage,
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
	            params.sbbh=$('#sbbh').val();
	            params.sbmc=$.trim($("#sbmc").val());
	            params.zzjgdm=$("#zzjgdm").val();
	            params.sybz=$.trim($("#sybz_select option:selected").val());
	            return params;
	        },
	        onLoadSuccess: function () {
	            if (firstLoadFlag && offset != 0) {
	                table.bootstrapTable("selectPage", offset/limit + 1);
	            }
	            firstLoadFlag = false;
	            setTimeout ("checkByTable()", 100);
	        },
	        toolbar: '#tableToolbar', uniqueId: 'rybh', clickToSelect: true, sidePagination: 'server', pagination: true
		});
		$("#resetBtn").click(function(){
			$("#zzjgdm").val("");
		    $('#searchUserForm')[0].reset();
		  });
		//新增
		$("#addBtn").click(function(){
			 indexPage = Layer.openIframeByOptions(pubGpssbxxUrl.add,{});
		});
		//导入模板
		$("#uploadBtn").click(function(){
			 indexPage = Layer.openIframeByOptions(pubGpssbxxUrl.importView,{}); 
		});
		// 删除 
		$("#removeBtn").click(function(){
			ManageGrid.deleteMultiple(table, pubGpssbxxUrl.removeBatch, function(){window.location.href = pubGpssbxxUrl.index + "?limit=" + limit + "&offset=" + offset;}, "sbbh");
		});
		// 刷新
		$("#refreshBtn").click(function(){
			$('#searchUserForm')[0].reset();
			ManageGrid.refreshTable(table, pubGpssbxxUrl.getDataByPage);
		});
		//查询按钮
		$("#searchBtn").click(function(){
			ManageGrid.refreshTable(table, pubGpssbxxUrl.getDataByPage);
		});
		//加载所属单位目录树
		$("#zzjgmc").focus(function() {
			loadTree();
		});
		 $(window).resize(function(){
		    	if(indexPage){
		    		layer.full(indexPage);
		    	}
		  });
	});
	
	//  给子页面调用，关闭层
	function closeLayer() {
		layer.close(indexPage);
	}

	// 给子页面调用，刷新
	function refreshTable() {
		firstLoadFlag = true;
		ManageGrid.refreshTable(table, pubGpssbxxUrl.getDataByPage);
	}
	
	/* teble点击事件 */
	function checkByTable() {
	    if (selectId != "") {
	        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
	        selectedRow.removeClass().addClass("selected");
	    }
	}
	
	//操作formatter
	function defaultActionFormatter(value, row) {
		var html = '<div class="action-buttons">';
		html += '<a href="javascript:void(0);" onclick="view(\''+ row.sbbh+ '\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
		html += '<a href="javascript:void(0);" onclick="edit(\''+ row.sbbh+ '\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
		html += '<a href="javascript:void(0);" onclick="del(\''+ row.sbbh+ '\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
		html += '</div>';
		return html;
	}
	
	function dateFormatter (value, row) {
		 if(value==null){
			 return "";
		 }
		 return new Date(value).format('yyyy-MM-dd hh:mm:ss');
	} 

	/*修改人员信息  */
	function edit(rowId) {
		indexPage = Layer.openIframeByOptions(pubGpssbxxUrl.edit + rowId,{});
	}
	/* 删除人员信息 */
	function del(rowId) {
		ManageGrid.deleteSingle(pubGpssbxxUrl.remove + rowId, function() {
			window.location.href = pubGpssbxxUrl.index + "?limit=" + limit+ "&offset=" + offset;
		});
	}
	/* 查看人员信息 */
	function view(rowId) {
		indexPage = Layer.openIframeByOptions(pubGpssbxxUrl.view + rowId,{});
	}
	
	 
	  	
	var treeDiv;//构建下拉框树
	//树形下拉框加载标志，如果加载过就不要执行jstree构建
	var treeLoadFlag = false;
	//获取所属单位目录树 
	function loadTree() {
		treeDiv = Public.dropdown($("#zzjgmc"), '<div id="typeTree" style="padding: 10px;"></div>', {
			onShow:function(){
				if (!treeLoadFlag) {
			        treeLoadFlag = true;
			    	$("#typeTree").jstree({
			            'checkbox': {
			                'keep_selected_style': false
			            },
			            'core' : {
					        'data' : {
					            "url" : "<c:url value='/pubZzjg/getTree?type=0' />",//url
					            "data" : function (node) {
					                return { "dwdm" : node.id };
					            }
					        }
					    }
			        });
					$("#typeTree").on('select_node.jstree', function (e, data) {
			            var nodeTxt = data.instance.get_node(data.selected[0]).text;
			            $('#zzjgmc').val(nodeTxt);
			            var dwdmValue = data.selected[0];
			            $('#zzjgdm').val(dwdmValue);
			            treeDiv.hide();
					});
				}
			}
		});
	}
	</script>
</body>
</html>
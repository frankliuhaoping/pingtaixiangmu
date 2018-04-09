<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
    
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
                <h5><i class="fa fa-file-text-o mt2 mr5"></i><spring:message code="pubPdtthzxx.select" /></h5>
            </div>
            <div class="ibox-content">
           		 <form method="get" class="form-horizontal" id="searchUserForm">
            		<div class="row labelpd0">
            		 	<!-- 组织机构名称 -->
						<div class="form-group col-sm-6">
                         <label class="col-sm-2 control-label"><spring:message code="pubPdtthzxx.zzjgmc" />:</label>
                         <div class="col-sm-9" >
                             <input type="text" id="zzjgmc"  name="zzjgmc" readonly="readonly" class="form-control timebox">
                             <input type="hidden" id="zzjgdm" name="zzjgdm">
                         </div>
					  </div>
						<!-- 通话组名称-->
						<div class="form-group col-sm-3">
						   <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.thzmc" />:</label>
						   <div class="col-sm-9">
						       <input type="text" id="thzmc" name="thzmc" class="form-control" >
						   </div>
						</div>
                      	<!-- 通话组类型 -->
						<div class="form-group col-sm-3">
						   <label class="col-sm-3 control-label"><spring:message code="pubPdtthzxx.thzlx" />:</label>
						   <div class="col-sm-9">
								<select class="form-control" id="thzlx_select" name="thzlx" required>
                              		<option value =""></option>
                           			<option value="0">固定通话组</option>
                           			<option value="1">动态通话组</option>
                         	   </select>
						   </div>
						</div>
	                  	<!--按钮组div  -->
	                  	<div class="form-group col-sm-12">
							<div class="col-sm-12" style="text-align:right;">
								<button type="button" id="searchBtn" class="btn btn-primary">
									<i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp;查询
								</button>
	                            <button type="reset" id="resetBtn" class="btn btn-default">
									<i class="glyphicon glyphicon-repeat" aria-hidden="true"></i>&nbsp;重置
								</button>
							</div>
						</div>
					</div>
				</form>
            </div>
        </div>
        
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><i class="fa fa-calculator mt2 mr5"></i><spring:message code="pubPdtthzxx.list" /></h5>
                <div class="ibox-tools">
                	<c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                	<div class="btn-group hidden-xs mt8" role="group">
                    	<shiro:hasPermission name="sys:pubPdtthzxx:add">
                    		<c:set var='addPer' value='true' />
                        	<button id="addBtn" type="button" class="btn">
                            	<i class="fa fa-plus-circle"></i>&nbsp;<spring:message code="new" />
                        	</button>
                    	</shiro:hasPermission>
                    	 
                        	<c:set var='deletePer' value='true' />
                        	<button id="removeBtn" type="button" class="btn">
                            	<i class="fa fa-times-circle"></i>&nbsp;<spring:message code="batchRemove" />
                        	</button>
                     	 
                     	<button id="refreshBtn" type="button" class="btn">
                            <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
                        </button>
                     </div>
                </div>
            </div>
           
            <div class="ibox-content">
                <div class="clearfix">
                    <div id="tableToolbar" role="group">
                        <shiro:hasPermission name="sys:pubPdtthzxx:view">
                            <c:set var='viewPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubPdtthzxx:edit">
                            <c:set var='editPer' value='true' />
                        </shiro:hasPermission>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped" data-mobile-responsive="true">
                            <thead>
                                <tr>
                                    <th data-checkbox="true"></th>
                                    <th data-field="thzbh" data-visible="false"><spring:message code="pubPdtthzxx.thzbh" /></th>
                                    <th data-field="thzmc" data-sortable="true" data-sort-name="thzmc"><spring:message code="pubPdtthzxx.thzmc" /></th>
                                    <th data-field="zzjgmc" data-sortable="true" data-sort-name="zzjgmc"><spring:message code="pubPdtthzxx.zzjgmc" /></th>
                                    <th data-field="thzlx" data-sortable="true" data-sort-name="thzlx" data-formatter="thzlxFormatter" ><spring:message code="pubPdtthzxx.thzlx"/></th>
                                    <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubPdtthzxx.sybz"/></th>
                                    <th data-field="cjr" data-sortable="true" data-sort-name="cjr"><spring:message code="pubPdtthzxx.cjr" /></th>
                                    <th data-field="cjsj" data-sortable="true" data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message code="pubPdtthzxx.cjsj" /></th>
                                    <th data-field="operate" data-formatter="actionFormatter"><spring:message code="operate" /></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/common/template/script_basic_table.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/laydate/laydate.js' />" type="text/javascript"></script>
<script type="text/javascript">
// 获取页面权限值

var addPer = ${addPer}; 
var editPer = ${editPer};
var deletePer = ${deletePer};
var viewPer = ${viewPer};
var indexPage;
// 操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
// table对象
var table = $('.table');
// url定义
var pubPdtthzxxUrl = {
    index: "<c:url value='/pubPdtthzxx/index' />",
    add: "<c:url value='/pubPdtthzxx/add' />",
    edit: "<c:url value='/pubPdtthzxx/edit/' />",
    remove: "<c:url value='/pubPdtthzxx/delete/' />",
    removeBatch: "<c:url value='/pubPdtthzxx/deleteBatch' />",
    getDataByPage: "<c:url value='/pubPdtthzxx/getDataByPage' />",
    view: "<c:url value='/pubPdtthzxx/view/' />"
};

// 记录当前操作选中的列
var checkedRows = [];

// 初始化表格和按钮
$(function () {
    table.bootstrapTable({
    	url:pubPdtthzxxUrl.getDataByPage+"?rand="+Math.random(),
        queryParams: function (params) {
            if (limit != "") {
                if (firstLoadFlag) {
                    params.limit = parseInt(limit);
                    params.offset = parseInt(offset);
                }
            }
            limit = params.limit;
            offset = params.offset;
            params.zzjgdm = $("#zzjgdm").val();
            params.thzmc = $.trim($("#thzmc").val());
            params.thzlx=$.trim($("#thzlx_select option:selected").val());
            return params;
        },
        onLoadSuccess: function () {
            if (firstLoadFlag && offset != 0) {
                table.bootstrapTable("selectPage", offset/limit + 1);
            }
            firstLoadFlag = false;
            // 必须延迟处理选中事件
           	setTimeout ("checkByTable()", 100);
        },
        // 处理单个选中事件
        onCheck : function (row) {
        	// 已经有的数据不需要再添加
        	if ($.inArray(row.thzbh, checkedRows) == -1) {
        		checkedRows.push (row.thzbh);
        	}
        },
        // 处理单个取消选中事件
        onUncheck : function (row) {
        	// 已经没有的数据不需要再删除
        	if ($.inArray(row.thzbh, checkedRows) != -1) {
        		checkedRows.splice($.inArray(row.thzbh, checkedRows),1);
        	}
        },
        // 处理所有选中事件
        onCheckAll: function (rows) {
        	// 遍历所有选中元素
        	$.each (rows, function (key, row){
        		// 已经有的数据不需要再添加
        		if ($.inArray(row.thzbh, checkedRows) == -1) {
        			  checkedRows.push (row.thzbh);
        		}
        	});
        },
        // 处理所有取消选中事件
        onUncheckAll: function (rows) {
        	// 遍历所有没选中元素
        	$.each (rows, function (key, row){
        		// 已经没有的数据不需要再删除
        		if ($.inArray(row.thzbh, checkedRows) != -1) {
        		    checkedRows.splice($.inArray(row.thzbh, checkedRows),1);
        		}
            });
        },
        toolbar: '#tableToolbar', uniqueId: 'id', sidePagination: 'server',
        pagination: true, clickToSelect: true, searchOnEnterKey: true
    });
    
    $("#addBtn").click(function(){
    	indexPage = Layer.openIframeByOptions(pubPdtthzxxUrl.add,{});
    });
    
    $("#removeBtn").click(function(){
        // 跨页面删除
        ManageGrid.deleteMultiple(table,pubPdtthzxxUrl.removeBatch, function() {
			window.location.href = pubPdtthzxxUrl.index+ "?limit=" + limit + "&offset="+ offset;
		}, "thzbh");
    });
    $("#refreshBtn").click(function(){
    	$('#searchUserForm')[0].reset();
        ManageGrid.refreshTable(table, pubPdtthzxxUrl.getDataByPage);
    });
    $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });
    $("#resetBtn").click(function(){
		$("#zzjgdm").val("");
	    $('#searchUserForm')[0].reset();
	  });
	
    var treeDiv;
    $("#zzjgmc").focus(function() {
    	loadTree('zzjgmc','zzjgdm');
    });
    //查询按钮
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubPdtthzxxUrl.getDataByPage);
    });
    
});
//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, pubPdtthzxxUrl.getDataByPage);
}

function checkByTable() {
    if (selectId != "") {
        var selectds = new Array();
        selectds.push (selectId);
        table.bootstrapTable("checkBy", {field:"thzbh", values:selectds});
    } else {
    	table.bootstrapTable("checkBy", {field:"thzbh", values:checkedRows});
    }
}

// 操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    if (viewPer) {
    	html += "<a href=\"javascript:void(0);\" onclick=\"view('"+row.thzbh+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";
    }
    if (editPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"edit('"+row.thzbh+"')\" title=\"<spring:message code='edit' />\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>";
    }
    if (deletePer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"del('"+row.thzbh+"')\" title=\"<spring:message code='remove' />\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>";
    }
    html += '</div>';
    return html;
}

function thzlxFormatter (value, row) {
	 if(value==0){
		 return "固定通话组";
	 }
	 if(value==1){
		 return "动态通话组";
	 }
	 return "";
} 

function dateFormatter (value, row) {
	 return new Date(value).format('yyyy-MM-dd hh:mm:ss');
} 
 
// 修改用户
function edit(rowId) {
	indexPage = Layer.openIframeByOptions(pubPdtthzxxUrl.edit+rowId,{});
}

// 详情用户
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubPdtthzxxUrl.view+rowId,{});
}

// 删除用户
function del(rowId) {
    ManageGrid.deleteSingle(pubPdtthzxxUrl.remove + rowId, function(){Manage.url(pubPdtthzxxUrl.index, {limit: limit, offset: offset});});
}

//树形下拉框加载标志，如果加载过就不要执行jstree构建
var treeLoadFlag = false;
//加载树形单位菜单
function loadTree(dwmc,dwdm){
    treeDiv = Public.dropdown($("#"+dwmc), '<div id="typeTree_'+dwmc+'" style="padding: 10px;"></div>', {onShow:function(){
    	if (!treeLoadFlag) {
            treeLoadFlag = true;
	    	$("#typeTree_"+dwmc).jstree({
	            'checkbox': {
	                'keep_selected_style': false
	            },
	            'core' : {
			        'data' : {
			            "url" : "<c:url value='/pubZzjg/getTree?type=0' />",
			            "data" : function (node) {
			                return { "dwdm" : node.id };
			            }
			        }
			    }
	        });
	    	
	    	$("#typeTree_"+dwmc).on('select_node.jstree', function (e, data) {
	            var nodeTxt = data.instance.get_node(data.selected[0]).text;
	            var dwdmValue = data.selected[0];
	            console.log(dwdmValue);
	            if(nodeTxt == '不限'){
	            	 dwdmValue = '';
	            }
	            $('#'+dwmc).val(nodeTxt);
	            $('#'+dwdm).val(dwdmValue);
	            treeDiv.hide();
	        });
    	}
    	
    }});
}

</script>
</body>
</html>
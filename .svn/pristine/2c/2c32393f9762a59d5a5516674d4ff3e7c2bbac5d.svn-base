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
                <h5><i class="fa fa-file-text-o mt2 mr5"></i><spring:message code="pubUser.list" /></h5>
            </div>
           
            <div class="ibox-content">
            	<form method="get" class="form-horizontal" id="searchUserForm">
            		<div class="row labelpd0">
            		  <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubUser.yhzh" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="yhzh" name="yhzh" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubUser.yhmc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="yhmc" name="yhmc" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubUser.lxdh" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="lxdh" name="lxdh" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubUser.ssdwmc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="ssdwmc" readonly="readonly" class="form-control" placeholder="所属单位名称">
                             <input type="hidden" id="ssdwdm" name="ssdwdm">
                         </div>
					  </div>
					  <div class="form-group col-sm-3">     
                         <label class="col-sm-3 control-label"><spring:message code="starttime" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="starttime" name="starttime" readonly="readonly" class="form-control" placeholder="开始时间">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="endtime" />:</label>
                         <div class="col-sm-9">
                             <input type="text" class="form-control" id="endtime" readonly="readonly" name="endtime" placeholder="结束时间">
                         </div>
                      </div>
                      <div class="form-group col-sm-6">
							<div class="col-sm-12" style="text-align:right;">
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
                <h5><i class="fa fa-calculator mt2 mr5"></i><spring:message code="pubUser.list" /></h5>
                <div class="ibox-tools">
                	<c:set var='addPer' value='false' />
                    <c:set var='resetPwdPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='authPer' value='false' />
                    <c:set var='viewPer' value='false' />
                	<div class="btn-group hidden-xs mt8" role="group">
                    	<shiro:hasPermission name="sys:pubUser:add">
                    		<c:set var='addPer' value='true' />
                        	<button id="addBtn" type="button" class="btn">
                            	<i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
                        	</button>
                    	</shiro:hasPermission>
                    	<shiro:hasPermission name="sys:pubUser:delete">
                        	<c:set var='deletePer' value='true' />
                        	<button id="removeBtn" type="button" class="btn">
                            	<i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove" />
                        	</button>
                     	</shiro:hasPermission>
                     	<button id="exportBtn" type="button" class="btn">
                            <i class="fa fa-download"></i>导出
                        </button>
                     	<button id="refreshBtn" type="button" class="btn">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                     </div>
                </div>
            </div>
           
            <div class="ibox-content">
                <div class="clearfix">
                    <div id="tableToolbar" role="group">
                        <shiro:hasPermission name="sys:pubUser:auth">
                            <c:set var='authPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubUser:view">
                            <c:set var='viewPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubUser:resetPwd">
                            <c:set var='resetPwdPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubUser:edit">
                            <c:set var='editPer' value='true' />
                        </shiro:hasPermission>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped" data-mobile-responsive="true">
                            <thead>
                                <tr>
                                    <th data-checkbox="true"></th>
                                    <th data-field="yhbh" data-visible="false"><spring:message code="pubUser.yhbh" /></th>
                                    <th data-field="yhzh" data-sortable="true" data-sort-name="yhzh"><spring:message code="pubUser.yhzh" /></th>
                                    <th data-field="yhmc" data-sortable="true" data-sort-name="yhmc"><spring:message code="pubUser.yhmc" /></th>
                                    <th data-field="lxdh" data-sortable="true" data-sort-name="lxdh"><spring:message code="pubUser.lxdh" /></th>
                                    <th data-field="ssdwmc" data-sortable="true" data-sort-name="ssdwmc"><spring:message code="pubUser.ssdwmc" /></th>
                                    <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubUser.sybz" /></th>
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
var resetPwdPer = ${resetPwdPer};
var editPer = ${editPer};
var deletePer = ${deletePer};
var authPer = ${authPer};
var viewPer = ${viewPer};

// 操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
// table对象
var table = $('.table');
// url定义
var pubUserUrl = {
    index: "<c:url value='/pubUser/index' />",
    add: "<c:url value='/pubUser/add' />",
    edit: "<c:url value='/pubUser/edit/' />",
    remove: "<c:url value='/pubUser/delete/' />",
    removeBatch: "<c:url value='/pubUser/deleteBatch' />",
    getDataByPage: "<c:url value='/pubUser/getDataByPage' />",
    resetPwd: "<c:url value='/pubUser/resetPwd/' />",
    auth: "<c:url value='/pubUser/auth' />",
    view: "<c:url value='/pubUser/view/' />"
};

// 记录当前操作选中的列
var checkedRows = [];

// 初始化表格和按钮
$(function () {
    table.bootstrapTable({
    	url:pubUserUrl.getDataByPage+"?rand="+Math.random(),
        queryParams: function (params) {
            if (limit != "") {
                if (firstLoadFlag) {
                    params.limit = parseInt(limit);
                    params.offset = parseInt(offset);
                }
            }
            params.yhmc = params.search;//查询yhmc
            limit = params.limit;
            offset = params.offset;
            params.ssdwdm = $("#ssdwdm").val();
            params.yhzh = $.trim($("#yhzh").val());
            params.yhmc = $.trim($("#yhmc").val());
            params.lxdh = $.trim($("#lxdh").val());
            params.starttime = $("#starttime").val() != '' ? $("#starttime").val() + ' 00:00:00' : $("#endtime").val();
            params.endtime = $("#endtime").val() != '' ? $("#endtime").val() + ' 23:59:59' : $("#endtime").val();
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
        	if ($.inArray(row.yhbh, checkedRows) == -1) {
        		checkedRows.push (row.yhbh);
        	}
        },
        // 处理单个取消选中事件
        onUncheck : function (row) {
        	// 已经没有的数据不需要再删除
        	if ($.inArray(row.yhbh, checkedRows) != -1) {
        		checkedRows.splice($.inArray(row.yhbh, checkedRows),1);
        	}
        },
        // 处理所有选中事件
        onCheckAll: function (rows) {
        	// 遍历所有选中元素
        	$.each (rows, function (key, row){
        		// 已经有的数据不需要再添加
        		if ($.inArray(row.yhbh, checkedRows) == -1) {
        			  checkedRows.push (row.yhbh);
        		}
        	});
        },
        // 处理所有取消选中事件
        onUncheckAll: function (rows) {
        	// 遍历所有没选中元素
        	$.each (rows, function (key, row){
        		// 已经没有的数据不需要再删除
        		if ($.inArray(row.yhbh, checkedRows) != -1) {
        		    checkedRows.splice($.inArray(row.yhbh, checkedRows),1);
        		}
            });
        },
        toolbar: '#tableToolbar', uniqueId: 'id', sidePagination: 'server',
        pagination: true, clickToSelect: true, searchOnEnterKey: true
    });
    
    $("#addBtn").click(function(){
        Manage.url(pubUserUrl.add, {limit: limit, offset: offset});
    });
    
    $("#removeBtn").click(function(){
    	// 当前页面删除
        /* ManageGrid.deleteMultiple(table, pubUserUrl.removeBatch, function(){
        	Manage.url(pubUserUrl.index,limit,offset);
        }, "yhbh"); */
        // 跨页面删除
    	ManageGrid.deleteMultipleAll(pubUserUrl.removeBatch, function(){
            Manage.url(pubUserUrl.index, {limit: limit, offset: offset});
        }, checkedRows);
    });
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, pubUserUrl.getDataByPage);
    });
    $("#exportBtn").click(function(){
        window.open ("<c:url value='/pubUser/exportReportData' />");
    });
    
    laydate.skin('molv');
    laydate({
   	   elem: '#starttime',
   	   format: 'YYYY-MM-DD'
    });
    
    laydate({
 	   elem: '#endtime',
 	   format: 'YYYY-MM-DD'
 	});
    
    var treeDiv;
    $("#ssdwmc").focus(function() {
    	loadTree('ssdwmc','ssdwdm');
    });
    //查询按钮
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubUserUrl.getDataByPage);
    });
    
});

function checkByTable() {
    if (selectId != "") {
        var selectds = new Array();
        selectds.push (selectId);
        table.bootstrapTable("checkBy", {field:"yhbh", values:selectds});
    } else {
    	table.bootstrapTable("checkBy", {field:"yhbh", values:checkedRows});
    }
}

// 操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    if (authPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"auth('"+row.yhbh+"')\" title=\"<spring:message code='orization' />\"><span class=\"iconfont icon-shouquan\" aria-hidden=\"true\"></span></a>";
    }
    if (viewPer) {
    	html += "<a href=\"javascript:void(0);\" onclick=\"view('"+row.yhbh+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";
    }
    if (resetPwdPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"resetPwd('"+row.yhbh+"')\" title=\"<spring:message code='loginForm.forgetPwdDlg.title' />\"><span class=\"glyphicon glyphicon-lock\" aria-hidden=\"true\"></span></a>";
    }
    if (editPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"edit('"+row.yhbh+"')\" title=\"<spring:message code='edit' />\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>";
    }
    if (deletePer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"del('"+row.yhbh+"')\" title=\"<spring:message code='remove' />\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>";
    }
    html += '</div>';
    return html;
}

// 重置用户密码
function resetPwd(rowId){
	var title = "重置密码确认";
	var msg = "确定要重置密码吗？";
	createConfirmDialog(title, msg, function(){
		Manage.save(pubUserUrl.resetPwd + rowId, null, null, {"200": "已重置为默认密码！"});
    }).modal('show');
}

// 用户授权
function auth(rowId){
	Manage.url(pubUserUrl.auth, {limit: limit, offset: offset, id: rowId});
}

// 修改用户
function edit(rowId) {
	Manage.url(pubUserUrl.edit + rowId, {limit: limit, offset: offset, id: rowId});
}

// 详情用户
function view(rowId) {
	Manage.url(pubUserUrl.view + rowId, {limit: limit, offset: offset, id: rowId});
}

// 删除用户
function del(rowId) {
    ManageGrid.deleteSingle(pubUserUrl.remove + rowId, function(){Manage.url(pubUserUrl.index, {limit: limit, offset: offset});});
}

// 查看用户
function view(rowId) {
	Manage.url(pubUserUrl.view + rowId, {limit: limit, offset: offset, id: rowId});
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
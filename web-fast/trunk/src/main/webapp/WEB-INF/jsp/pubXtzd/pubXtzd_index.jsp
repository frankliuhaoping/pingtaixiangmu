<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_treeTable.jsp" />
    <jsp:include page="/common/template/head_basic_table.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="pubXtzd.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
                        <shiro:hasPermission name="sys:pubXtzd:add">
                            <c:set var='addPer' value='true' />
                            <button id="addBtn" type="button" class="btn btn-default">
                                <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
                            </button>
                        </shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn btn-default">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content ">
                <div class="row">
                    <input type="hidden" id="yyid" name="yyid">
                    <div class="col-sm-12">
                        <div class="tableToolbar" role="group">
                            <shiro:hasPermission name="sys:pubXtzd:edit">
                                <c:set var='editPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubXtzd:delete">
                                <c:set var='deletePer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubXtzd:view">
                                <c:set var='viewPer' value='true' />
                            </shiro:hasPermission>
                        </div>
		                <div class="row">
		                	<div id="appTree" class="col-sm-2" style="border: #ddd solid 1px;margin: 0 10px; padding: 10px 0;overflow:auto;"></div>
	                        <div class="row J_mainContent col-sm-10">
		                        <table id="pubXtzdTable" class="table table-bordered table-striped" treeGrid="true" expandColumn="zdxm" height="auto">
		                            <thead>
		                                <tr>
		                                    <th name="bh" hidden="true" key="true"><spring:message code="pubXtzd.bh" /></th>
		                                    <th name="zdfbh" hidden="true"><spring:message code="pubXtzd.zdfbh" /></th>
		                                    <th name="zdxm"><spring:message code="pubXtzd.zdxm" /></th>
		                                    <th name="zdxz"><spring:message code="pubXtzd.zdxz" /></th>
		                                    <th name="zdbh"><spring:message code="pubXtzd.zdbh" /></th>
		                                    <th name="sjms"><spring:message code="pubXtzd.sjms" /></th>
		                                    <th name="pxdm"><spring:message code="pxdm" /></th>
		                                    <th name="sybz" formatter="sybzFormatter"><spring:message code="pubXtzd.sybz" /></th>
		                                    <th name="operate" formatter="actionFormatter"><spring:message code="operate" /></th>
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
<jsp:include page="/common/template/script_basic_treeTable.jsp" />
<script src="<c:url value='/common/static/js/frame/jquery.metisMenu.js' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/frame/jquery.slimscroll.min.js?v=1.3.6' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/frame/hplus.min.js?v=4.0.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>

<script type="text/javascript">
//获取页面权限值
var addPer = ${addPer};
var deletePer = ${deletePer};
var editPer = ${editPer};
var viewPer = ${viewPer};
var yyid = '${param.yyid}';
//url定义
var pubXtzdUrl = {
    index: '<c:url value="/pubXtzd/index" />',
    add: '<c:url value="/pubXtzd/add" />',
    edit: '<c:url value="/pubXtzd/edit/" />',
    remove: '<c:url value="/pubXtzd/delete/" />',
    getTreeGrid: '<c:url value="/pubXtzd/getTreeGrid" />',
    view: "<c:url value='/pubXtzd/view/' />"
};
//table对象
var table = $('.table'),resTab = $('#myResTab'),resTabs = $(resTab).find('a');
var selectTreeId;
//初始化表格和按钮
$(function () {
    $("#addBtn").click(function(){
        var rowId = table.getGridParam("selrow");
        if(rowId) {
        	// 有row的bh时才传给后台
            var row = table.getRowData(rowId);
            if (row.bh != undefined) {
            	Manage.url(pubXtzdUrl.add, {parentId: row.bh, parentName: row.name, yyid: getYyid()});
            } else {
            	Manage.url(pubXtzdUrl.add, {yyid: getYyid()});
            }
        } else {
        	Manage.url(pubXtzdUrl.add, {yyid: getYyid()});
        }
    });
    
    $("#refreshBtn").click(function(){
        table.trigger('reloadGrid');
    });
    
    $("#appTree").jstree({
        'checkbox': {
            'keep_selected_style': false
        },
        'core' : {
            'data' : {
                "url" : "<c:url value='/pubRole/getTree' />",
                "data" : function (node) {
                
                }
            }
        }
    // 默认选中根节点
    }).on('loaded.jstree', function(e, data){
        var inst = data.instance;//TODO 处理没有节点的情况
        var obj;
        if(yyid == ""){
        	obj = inst.get_node(e.target.firstChild.firstChild.lastChild);
        }else{
        	obj = inst.get_node(yyid);
        }
        inst.select_node(obj);
    });
    
    $("#appTree").on('select_node.jstree', function (e, data) {
    	selectTreeId = data.selected[0];
    	$("#yyid").val(selectTreeId);
        var refreshFlag = true;
        if ($(table).attr('url') == undefined) {
            refreshFlag = false;
        }
        // 更新url请求
        if (refreshFlag) {
        	$(table).jqGrid('setGridParam',{
                url:pubXtzdUrl.getTreeGrid+"?rand="+Math.random(),
                postData:{'yyid':selectTreeId}, 
            }).trigger("reloadGrid");
        } else {
        	$(table).attr('url',pubXtzdUrl.getTreeGrid+"?yyid="+selectTreeId);
        	JqGrid.initGrid(table);
        }
    });
});

// 获取yyid
function getYyid(){
	var yyid = $("#yyid").val();
	if(yyid == undefined){
		yyid = '';
	}
	return yyid;
}

//操作formatter
function actionFormatter(value, opts, row) {
    var html = '<div class="action-buttons">';
    if (viewPer) {
    	html += "<a href=\"javascript:void(0);\" onclick=\"view('"+row.bh+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";
    }
    if (editPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"edit('"+row.bh+"')\" title=\"<spring:message code='edit' />\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>";
    }
    if (deletePer) {
    	html += "<a href=\"javascript:void(0);\" onclick=\"del('"+row.bh+"')\" title=\"<spring:message code='remove' />\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>";
    }
    html += '</div>';
    return html;
}

//编辑权限
function edit(rowId) {
	Manage.url(pubXtzdUrl.edit + rowId, {yyid: getYyid()});
}

//权限详情
function view(rowId) {
	Manage.url(pubXtzdUrl.view + rowId, {yyid: getYyid()});
}

//删除权限
function del(rowId) {
    ManageGrid.deleteSingle(pubXtzdUrl.remove + rowId, function(){table.trigger('reloadGrid');}, {'601':'<spring:message code="pubXtzd.delError" />'});
}
</script>
</body>
</html>
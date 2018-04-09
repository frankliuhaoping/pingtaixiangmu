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
    <div class="col-sm-2" style="padding-left:0;padding-right:0;">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><i class="fa fa-file-text-o mt2"></i>&nbsp;<spring:message code="pubApp.list" /></h5>
            </div> 
            <div class="ibox-content pb10">
                <div class="clearfix">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <shiro:hasPermission name="sys:pubRes:edit">
                        <c:set var='editPer' value='true' />
                    </shiro:hasPermission>
                    <shiro:hasPermission name="sys:pubRes:delete">
                        <c:set var='deletePer' value='true' />
                    </shiro:hasPermission>
                    <shiro:hasPermission name="sys:pubRes:view">
                        <c:set var='viewPer' value='true' />
                    </shiro:hasPermission>
                    <input type="hidden" id="yyid" name="yyid">
                	<div id="appTree" style="border: #ddd solid 1px; padding: 10px 0;overflow:auto;"></div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-sm-10" style="padding-left:10px;padding-right:0px;">
        <div class="ibox float-e-margins clearfix">
            <div class="ibox-title">
                <h5><i class="fa fa-calculator mt2"></i>&nbsp;<spring:message code="pubRes.list" /></h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                        <shiro:hasPermission name="sys:pubRes:add">
                            <c:set var='addPer' value='true' />
                            <button id="addBtn" type="button" class="btn">
                               <i class="fa fa-plus-circle"></i>&nbsp;<spring:message code="new" />
                            </button>
                        </shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn">
                            <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content pb10">
                <input type="hidden" id="yyid" name="yyid">
                <div class="clearfix">
                    <div class="J_mainContent">
                     <table id="pubResTable" class="table table-bordered table-striped" treeGrid="true"  expandColumn="zymc" height="auto">
                         <thead>
                             <tr>
                                 <th name="zyid" hidden="true" key="true"><spring:message code="pubRes.zyid" /></th>
                                 <th name="zymc" width="220"><spring:message code="pubRes.zymc" /></th>
                                 <th name="zyurl"width="250" ><spring:message code="pubRes.zyurl" /></th>
                                 <th name="qxdm" width="220"><spring:message code="pubRes.qxdm" /></th>
                                 <th name="pxdm" width="100"><spring:message code="pxdm" /></th>
                                 <th name="zylx" width="100" formatter="typeFormatter"><spring:message code="pubRes.zylx" /></th>
                                 <th name="zytb" width="100" formatter="iconFormatter"><spring:message code="pubRes.zytb" /></th>
                                 <th name="sybz" width="100"formatter="sybzFormatter"><spring:message code="pubRes.sybz" /></th>
                                 <th name="operate" width="100"  formatter="actionFormatter"><spring:message code="operate" /></th>
                             </tr>
                         </thead>
                     </table>
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
var indexPage;

var addPer = ${addPer};
var deletePer = ${deletePer};
var editPer = ${editPer};
var viewPer = ${viewPer};

var yyid = '${param.yyid}';
//url定义
var pubResUrl = {
    index: '<c:url value="/pubRes/index" />',
    add: '<c:url value="/pubRes/add" />',
    edit: '<c:url value="/pubRes/edit/" />',
    remove: '<c:url value="/pubRes/delete/" />',
    getTreeGrid: '<c:url value="/pubRes/getTreeGrid" />',
    view: "<c:url value='/pubRes/view/' />",
    
};
//table对象
var table = $('.table');
var resTab = $('#myResTab');
var resTabs = $(resTab).find('a');
var selectTreeId;
//初始化表格和按钮
$(function () {
	console.log('应用');
    /* if(resTabs.length > 0){
    	var yyid = '${param.yyid}';
    	if(yyid){
    		$.each(resTabs,function(i,item){
    			if($(this).attr('value') == yyid){
    				$(this).addClass('active');
    				return;
    			}
    		});
    	}else{
    		$(resTabs[0]).addClass('active');
    	}	
    	
    } */
    
   /*  $("#addBtn").click(function(){
        var rowId = table.getGridParam("selrow");
        if(rowId) {
            var row = table.getRowData(rowId);
            indexPage = Layer.openIframeByOptions(pubResUrl.add+"?parentId="+ row.zyid+"&parentName="+row.zymc+"&yyid="+getYyid(),{});
        } else {
        	indexPage = Layer.openIframeByOptions(pubResUrl.add+"?yyid="+getYyid(),{});
        }
    }); */
    //修改后的addBtn 默认节点为无选择,需要用户自己选择
    $("#addBtn").click(function(){
       	indexPage = Layer.openIframeByOptions(pubResUrl.add+"?yyid="+getYyid(),{});
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
                url:pubResUrl.getTreeGrid+"?rand="+Math.random(),
                shrinkToFit:false ,
                postData:{'yyid':selectTreeId}, 
            }).trigger("reloadGrid");
        } else {
        	$(table).attr('url',pubResUrl.getTreeGrid+"?yyid="+selectTreeId);
        	JqGrid.initGrid(table);
        }
    });
    
    $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });
    
    $('#pubResTable').children('th[name=zymc]').css("width", "77");
    
});

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	table.trigger('reloadGrid');
}

// 获取yyid
function getYyid(){
	//return $(resTab).find('.active').attr('value');
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
    	html += "<a href=\"javascript:void(0);\" onclick=\"view('"+row.zyid+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";
    }
    if (editPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"edit('"+row.zyid+"')\" title=\"<spring:message code='edit' />\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>";
    }
    if (deletePer) {
    	html += "<a href=\"javascript:void(0);\" onclick=\"del('"+row.zyid+"')\" title=\"<spring:message code='remove' />\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>";
    }
    html += '</div>';
    return html;
}

//类型formatter
function typeFormatter(value, opts, row) {
    var html = '';
    if (value == '1') {
        html = '<span class="label label-primary"><spring:message code="pubRes.menuPrivilege" /></span>';
    } else if (value == '2') {
        html = '<span class="label label-default"><spring:message code="pubRes.buttonPrivilege" /></span>';
    }
    return html;
}

//图标formatter
function iconFormatter(value, opts, row) {
    if(value) {
        return '<span class="' + value + '" aria-hidden="true"></span>';
    }
    return '';
}

//编辑权限
function edit(rowId) {
	indexPage = Layer.openIframeByOptions(pubResUrl.edit + rowId,{});
}

//权限详情
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubResUrl.view + rowId,{});
}

//删除权限
function del(rowId) {
    ManageGrid.deleteSingle(pubResUrl.remove + rowId, function(){table.trigger('reloadGrid');}, {'601':'<spring:message code="pubRes.delError" />'});
}
//查询权限
function queryRes(yyid,tabIndex){
	$.each(resTabs,function(i,item){
		$(this).removeClass('active');
	});
	$(resTabs[tabIndex]).addClass('active');
	
	$(table).jqGrid('setGridParam',{
		url:pubResUrl.getTreeGrid+"?rand="+Math.random(),
		shrinkToFit:false ,
        postData:{'yyid':yyid}, 
    }).trigger("reloadGrid");
}


</script>
</body>
</html>
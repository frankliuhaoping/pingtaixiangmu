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
                	<input type="hidden" id="yyid" name="yyid">
                    <div role="group" >
                     	<shiro:hasPermission name="sys:pubRole:edit">
                            <c:set var='editPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubRole:delete">
                            <c:set var='deletePer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubRole:view">
                            <c:set var='viewPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubRole:orization">
                            <c:set var='orizationPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubRole:copy">
                            <c:set var='copyPer' value='true' />
                        </shiro:hasPermission>
                    </div>
					<div id="appTree" style="border: #ddd solid 1px;padding: 10px 0;overflow:auto;"></div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-sm-10" style="padding-left:10px;padding-right:0px;">  
        <div class="ibox float-e-margins clearfix">
            <div class="ibox-title">
                <h5><i class="fa fa-calculator mt2"></i>&nbsp;<spring:message code="pubRole.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <c:set var='orizationPer' value='false' />
                    <c:set var='copyPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
                        <shiro:hasPermission name="sys:pubRole:add">
                            <c:set var='addPer' value='true' />
                            <button id="addBtn" type="button" class="btn">
                               <i class="fa fa-plus-circle"></i>&nbsp;<spring:message code="new" />
                            </button>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubRole:delete">
                            <c:set var='deletePer' value='true' />
                            <button id="removeBtn" type="button" class="btn">
                                <i class="fa fa-times-circle"></i>&nbsp;<spring:message code="batchRemove" />
                            </button>
                        </shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn">
                            <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content pb10">
                <div class="clearfix">
                	<input type="hidden" id="yyid" name="yyid">
                    <div role="group" >
	                        <shiro:hasPermission name="sys:pubRole:edit">
                                <c:set var='editPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubRole:delete">
                                <c:set var='deletePer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubRole:view">
                                <c:set var='viewPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubRole:orization">
                                <c:set var='orizationPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubRole:copy">
                                <c:set var='copyPer' value='true' />
                            </shiro:hasPermission>
                        </div>
	  				<div class="table-responsive">
                        <table class="table table-bordered table-striped" data-mobile-responsive="true">
                            <thead>
                                <tr>
                                    <th data-checkbox="true"></th>
                                    <th data-field="jsid" data-visible="false"><spring:message code="pubRole.jsid" /></th>
                                    <th data-field="yyid" data-visible="false"><spring:message code="pubRole.yyid" /></th>
                                    <th data-field="zyids" data-visible="false"><spring:message code="pubRole.zyids" /></th>
                                    <th data-field="jsmc" data-sortable="true" data-sort-name="t.jsmc"><spring:message code="pubRole.jsmc" /></th>
                                    <th data-field="sybz" data-sortable="true" data-sort-name="t.sybz" data-formatter="sybzFormatter"><spring:message code="pubRole.sybz" /></th>
                                    <th data-field="jsms" data-sortable="true" data-sort-name="t.jsms"><spring:message code="pubRole.jsms" /></th>
                                    <th data-field="dmsx" data-sortable="true" data-sort-name="t.pxdm"><spring:message code="pubRole.dmsx" /></th>
                                    <th data-field="pxdm" data-sortable="true" data-sort-name="t.pxdm"><spring:message code="pxdm" /></th>
                                    <th data-field="yymc" data-visible="false"><spring:message code="pubRole.yymc" /></th>
                                    <th data-field="operate" data-formatter="actionFormatter"><spring:message code="operate" /></th>
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
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript">

//获取页面权限值
var indexPage;

var addPer = ${addPer};
var deletePer = ${deletePer};
var editPer = ${editPer};
var viewPer = ${viewPer};
var orizationPer = ${orizationPer};
var copyPer = ${copyPer};

var selectId = '${param.selectId}',limit = '${param.limit}',offset = '${param.offset}',firstLoadFlag = true
,table = $('.table'),appTab = $('#myAppTab'),appTabs = $(appTab).find('li');
var yyid = '${param.yyid}';
var tableConfig;
var selectTreeId;
var pubRoleUrl = {
    index: "<c:url value='/pubRole/index' />",
    add: "<c:url value='/pubRole/add' />",
    edit: "<c:url value='/pubRole/edit/' />",
    view: "<c:url value='/pubRole/view/' />",
    copy: "<c:url value='/pubRole/copy/' />",
    orization: "<c:url value='/pubRole/orization/' />",
    remove: "<c:url value='/pubRole/delete/' />",
    removeBatch: "<c:url value='/pubRole/deleteBatch' />",
    getDataByPage: "<c:url value='/pubRole/getDataByPage' />"
};
$(function () {
	
	/*  if(appTabs.length > 0){
    	var yyid = '${param.yyid}';
    	if(yyid){
    		$.each(appTabs,function(i,item){
    			if($(this).attr('value') == yyid){
    				$(this).addClass('active');
    				return;
    			}
    		});
    	}else{
    		$(appTabs[0]).addClass('active');
    	}	
    	initTable();
    } */
    tableConfig = {
        url: '',
        queryParams: function (params) {
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
                table.bootstrapTable("selectPage", offset/limit + 1);
            }
            firstLoadFlag = false;
            setTimeout ("checkByTable()", 100);
            //console.log (table.bootstrapTable("getOptions"));
        },
        toolbar: '#tableToolbar', uniqueId: 'jsid', clickToSelect: true, sidePagination: 'server', pagination: true
    };
	
    $("#addBtn").click(function(){
    	var addYyid = getYyid();
    	if(addYyid == '' || addYyid == null){
    		 Layer.msg('请先选择应用', 'warning');
    		 return false;
    	}
    	indexPage = Layer.openIframeByOptions(pubRoleUrl.add+"?yyid="+ getYyid(),{});
    });
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, pubRoleUrl.removeBatch, function(){$("#refreshBtn").click()}, "jsid");
    });
    $("#refreshBtn").click(function(){
        ManageGrid.refreshTable(table, pubRoleUrl.getDataByPage+"?yyid="+getYyid());
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
        if (tableConfig.url == '') {
            refreshFlag = false;
        }
        // 更新url请求
        if (refreshFlag) {
            ManageGrid.refreshTable(table, pubRoleUrl.getDataByPage+"?yyid="+selectTreeId);
        } else {
            tableConfig.url = pubRoleUrl.getDataByPage+"?rand="+Math.random()+"&yyid="+selectTreeId;
            table.bootstrapTable(tableConfig);
        }
    });
    
    $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });
    
});

function getYyid(){
	//return $(appTab).find('.active').attr('value');
	var yyid = $("#yyid").val();
	if(yyid == undefined){
		yyid = '';
	}
	return yyid;
}

function checkByTable() {
    if (selectId != "") {
    	var selectds = new Array();
    	// jsid 是String型，需要转换 
        selectds.push(selectId);
        table.bootstrapTable("checkBy", {field:"jsid", values:selectds});
    }
}

function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    if(orizationPer){
    	if('Y' == row.sybz){
    		html += '<a href="javascript:void(0);" onclick="orization(\''+row.jsid+'\')" title="<spring:message code="orization" />"><span class="iconfont icon-shouquan" aria-hidden="true"></span></a>';
    	}
    }
    
    if(viewPer){
        html += '<a href="javascript:void(0);" onclick="view(\''+row.jsid+'\',\''+row.yyid+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    if (editPer){
    	html += '<a href="javascript:void(0);" onclick="edit(\''+row.jsid+'\',\''+row.yyid+'\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    }
    if (deletePer) {
    	html += '<a href="javascript:void(0);" onclick="del(\''+row.jsid+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    }
    if (copyPer){
        html += '<a href="javascript:void(0);" onclick="copy(\''+row.jsid+'\',\''+row.jsmc+'\')" title="<spring:message code="copy" />"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span></a>';
    }
    html += '</div>';
    return html;
}

function sybzFormatter(value, opts, row) {
    if('Y' == value) {
        return '<span style="color:green"><spring:message code="enable" /></span>';
    }else if('N' == value){
    	 return '<span style="color:red"><spring:message code="disable" /></span>';
    }
    return '';
}

function edit(rowId,yyid) {
	indexPage = Layer.openIframeByOptions(pubRoleUrl.edit + rowId+"?yyid=" + yyid + "&id="+rowId,{});
}
function orization(rowId) {
	Manage.url(pubRoleUrl.orization + rowId, {limit: limit, offset: offset, id: rowId});
}
function del(rowId) {
    ManageGrid.deleteSingle(pubRoleUrl.remove + rowId, function(){$("#refreshBtn").click()});
}
function view(rowId,yyid) {
	indexPage = Layer.openIframeByOptions(pubRoleUrl.view + rowId+"?yyid=" + yyid + "&id="+rowId,{});
}
function copy(rowId,jsmc) {
	
	if(jsmc.length>=18){
		Layer.msg('角色名称过长，无法复制', 'error');
		return;
	}
	
	$.ajax({
	    url:pubRoleUrl.copy + rowId,
	    data:{
	    	limit:limit,
	    	offset:offset,
	    	id:rowId,
	    	yyid:yyid
	    },
	    success:function(data){
	      Layer.msg('复制角色成功', 'success');
	      ManageGrid.refreshTable(table, pubRoleUrl.getDataByPage+"?yyid="+getYyid());
	    }
	})
}

function queryRole(yyid,tabIndex){
	$.each(appTabs,function(i,item){
		$(this).removeClass('active');
	});
	$(appTabs[tabIndex]).addClass('active');
	ManageGrid.refreshTable(table, pubRoleUrl.getDataByPage+"?yyid="+getYyid());
}
//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, pubRoleUrl.getDataByPage+"?yyid="+getYyid());
}
</script>
</body>
</html>
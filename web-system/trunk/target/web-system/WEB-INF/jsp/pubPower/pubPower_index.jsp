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
                        <shiro:hasPermission name="sys:pubUser:view">
                            <c:set var='viewPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubUser:auth">
                            <c:set var='authPer' value='true' />
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:pubRole:orization">
                            <c:set var='orizationPer' value='true' />
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
                <h5><i class="fa fa-calculator mt2"></i>&nbsp;<spring:message code="pubUser.powerList" /></h5>
                <div class="ibox-tools">
                    <c:set var='viewPer' value='false' />
                    <c:set var='authPer' value='false' />
                    <c:set var='orizationPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
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
                            <shiro:hasPermission name="sys:pubUser:view">
                                <c:set var='viewPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubUser:auth">
                                <c:set var='authPer' value='true' />
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:pubRole:orization">
                                <c:set var='orizationPer' value='true' />
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
                                    <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubUser.sybz" /></th>
                                    <th data-field="jsmcs" data-sortable="true" data-sort-name="jsmcs"><spring:message code="pubRole.jsmc" /></th>
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

var viewPer = ${viewPer};

var authPer = ${authPer};

var orizationPer = ${orizationPer};

var selectId = '${param.selectId}',limit = '${param.limit}',offset = '${param.offset}',firstLoadFlag = true
,table = $('.table'),appTab = $('#myAppTab'),appTabs = $(appTab).find('li');

var yyid = '${param.yyid}';
//url定义
var pubPowerUrl = {
    getDataByPage: '<c:url value="/pubUser/getPowerData" />'
};
//table对象
var table = $('.table');

var selectTreeId;
//初始化表格和按钮
$(function () {
	console.log('应用');
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
            toolbar: '#tableToolbar', uniqueId: 'yhbh', sidePagination: 'server',
            pagination: true, clickToSelect: true, searchOnEnterKey: true
        };
    	
    
    $("#appTree").jstree({
        'checkbox': {
            'keep_selected_style': false
        },
        'core' : {
            'data' : {
                "url" : "<c:url value='/pubRole/getTree'/>",
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
            ManageGrid.refreshTable(table, pubPowerUrl.getDataByPage+"?yyid="+selectTreeId);
        } else {
            tableConfig.url = pubPowerUrl.getDataByPage+"?rand="+Math.random()+"&yyid="+selectTreeId;
            table.bootstrapTable(tableConfig);
            
        }
    });
    
    
    $("#refreshBtn").click(function(){
    	var yyid = $("#yyid").val();
    	var tabUrl = pubPowerUrl.getDataByPage+"?rand="+Math.random()+"&yyid="+ yyid;
        ManageGrid.refreshTable(table, tabUrl);
    });
    
    $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });
    
});

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 获取yyid
function getYyid(){
	var yyid = $("#yyid").val();
	if(yyid == undefined){
		yyid = '';
	}
	return yyid;
}

function checkByTable() {
    if (selectId != "") {
    	var selectds = new Array();
        selectds.push (selectId);
        table.bootstrapTable("checkBy", {field:"yhbh", values:selectds});
    }
}

var pubUserUrl = {
	    auth: "<c:url value='/pubUser/powerAuth' />",
	    view: "<c:url value='/pubUser/view/' />",
	    orization: "<c:url value='/pubUser/powerOrization' />"
	};
	
//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    if (authPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"auth('"+row.yhbh+"')\" title=\"<spring:message code='orization' />\"><span class=\"iconfont icon-shouquan\" aria-hidden=\"true\"></span></a>";
    }
    if (viewPer) {
    	html += "<a href=\"javascript:void(0);\" onclick=\"view('"+row.yhbh+"')\" title=\"<spring:message code='view' />\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>";
    }
    if(orizationPer){
    	html += "<a href=\"javascript:void(0);\" onclick=\"orization('"+row.yhbh+"')\" title=\"<spring:message code='orization' />\"><span class=\"iconfont icon-shouquan\" aria-hidden=\"true\"></span></a>";
    }
    
    html += '</div>';
    return html;
}


// 用户授权
function auth(rowId){
	Manage.url(pubUserUrl.auth+"?rand="+Math.random()+"&yyid="+ $("#yyid").val(), {limit: limit, offset: offset, id: rowId});
}


// 详情用户
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubUserUrl.view + rowId,{});
}

// 用户资源权限查看
function orization(rowId) {
	Manage.url(pubUserUrl.orization + "?yyid=" + $("#yyid").val(), {id: rowId});
}

</script>
</body>
</html>
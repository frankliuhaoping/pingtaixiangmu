<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
                <h5>【${pubRoleName}】&nbsp;<spring:message code="jssq" /></h5>
                <div class="ibox-tools">
                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div>
                        	<ul id="myRoleTab" class="nav nav-tabs" role="tablist">
                       			<li role="presentation" value="" onclick="queryQx(this)">
                       				<a href="javascript:void(0);"><spring:message code="pubRole.xzqx" /></a>
                       			</li>
                       			<li role="presentation" value="" onclick="queryRy(this)">
                       				<a href="javascript:void(0);"><spring:message code="pubRole.xzry" /></a>
                       			</li>
						  	</ul>
                        </div>
                        <div class="tab-content" style="margin-top: 20px;">
	                        <form id="orizationForm" class="form-horizontal formW60p">
	                        	<input type="hidden" id="jsid" name="jsid"/>
	                        	<input type="hidden" id="zyids" name="zyids"/>
	                        	<input type="hidden" id="yyid" name="yyid"/>
	                        	<div id="authTree" class="jstree jstree-1 jstree-default jstree-checkbox-no-clicked"></div>
	                        	<div class="pull-right">
						      		<button type="button" class="btn btn-primary" id="saveBtn"><spring:message code="determine" /></button>&nbsp;&nbsp;
                            		<button type="button" class="btn btn-default" onclick="cancel()"><spring:message code="cancel" /></button>
				      			</div>
	                        </form>
	                        
	                        <form id="ryForm" class="form-horizontal" style="padding-right: 20px; padding-bottom: 20px;">
	                        	<input type="hidden" id="ssdwdm" name="ssdwdm">
	                        	<input type="hidden" id="jsid" name="jsid"/>
	                        	<input type="hidden" id="yyid" name="yyid"/>
	                        	<input type="hidden" name="yhbhs"/>
	                        	<input type="hidden" name="yhbhs_new"/>
	                        	<div class="row">
		                        	<div id="typeTree" class="col-sm-2" style="border: #ddd solid 1px;margin: 0 10px; padding: 10px 0;overflow:auto;"></div>
		                        	<div class="table-responsive" class="col-sm-10">
		                        		<div class="col-sm-12" style="padding-bottom: 5px; float:right">
		                        		    <div class="col-sm-4">
			                        			<select name="yes_no" class="form-control" data-live-search="true" required>
				                            		<option value="" selected="selected">全部</option>
				                            		<option value="2" >未赋权</option>
				                            		<option value="1" >已赋权</option>
					                        	</select>
				                        	</div>
				                        	<div class="col-sm-4">
				                                <input type="text" id="yhmc" placeholder="<spring:message code="pubUser.yhmc" />" class="form-control" maxlength="32">
				                            </div>
				                            <div class="col-sm-4">
					                            <span class="input-group-btn">
				                                    <button type="button" class="btn btn btn-primary" id="searchbtn">
													<i class="fa fa-search"></i><spring:message code="search" /></button>
				                                </span>
			                                </div>
				                        </div>
			                            <table id="ryTable" class="table table-bordered table-striped" data-mobile-responsive="true">
			                                <thead>
			                                    <tr>
			                                        <th data-checkbox="true" data-formatter="stateFormatter"></th>
			                                        <th data-field="yhbh" data-visible="false" ><spring:message code="pubUser.yhbh" /></th>
			                                        <!-- <th data-field="jsid" data-visible="false"></th> -->
			                                        <th data-field="yhmc" data-sortable="true" data-sort-name="yhmc"><spring:message code="pubUser.yhmc" /></th>
			                                        <th data-field="yhzh" data-sortable="true" data-sort-name="yhzh"><spring:message code="pubUser.yhzh" /></th>
			                                        <th data-field="jsid" data-sortable="true" data-sort-name="jsid" data-formatter="authFormatter"><spring:message code="pubUser.permissionstatus" /></th>
			                                        <th data-field="sybz" data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubUser.sybz" /></th>
			                                    </tr>
			                                </thead>
			                            </table>
			                        </div>
		                        	<div class="pull-right">
							      		<button type="button" class="btn btn-primary" id="saveRyBtn"><spring:message code="determine" /></button>&nbsp;&nbsp;
		                           		<button type="button" class="btn btn-default" onclick="cancel()"><spring:message code="cancel" /></button>
					      			</div>
				      			</div>
	                        </form>
						</div>   
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/common/template/script_basic_table.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript">
var resTab = $('#myRoleTab'),resTabs = $(resTab).find('li'),authTree = $('#authTree');
var selectId = '${param.selectId}',limit = '${param.limit}',offset = '${param.offset}',firstLoadFlag = true,table = $('#ryTable');

var tableConfig;
var pubUserUrl = {
    index: "<c:url value='/pubUser/index' />",
    getDataByPage: "<c:url value='/pubUser/getDataByPageBo' />"
};

var pubRoleUrl = {
	orization: '<c:url value="/pubRole/saveEditOrization/" />',
	usersRole: '<c:url value="/pubRole/saveAndDelAuth/" />',
    getTree: '<c:url value="/pubRes/getAllTree" />'
};
var pubRole = ${pubRole};

$(function () {
	ManageForm.loadForm($('#orizationForm'), pubRole);
	ManageForm.loadForm($('#ryForm'), pubRole);
	queryQx();
	loadTree();
   	initTree(pubRoleUrl.getTree, ['checkbox']);
    $('#saveBtn').click(function(){
    	$("[name='zyids']").val(authTree.jstree('get_selected').join());
   		Manage.save(pubRoleUrl.orization, $('#orizationForm').serialize(), function(){cancel();});
    });
    
    // 保存选择人员信息
    $('#saveRyBtn').click(function(){
    	var allTableData = table.bootstrapTable('getSelections');
    	var yhbhs = $.map(allTableData, function (row) {
            return row.yhbh;
        });
    	$("[name='yhbhs_new']").val(yhbhs);
    	Manage.save(pubRoleUrl.usersRole, $('#ryForm').serialize(), function(){getUser();});
    });
    
    $("#searchbtn").click(function(){
    	getUser();
    });
    
    tableConfig = {
        url:"",
        table: table,
        uniqueId:'yhbh',
        queryParams:function(params){
             limit = params.limit;
             offset = params.offset;
             params.jsid = $("#ryForm").find("[name='jsid']:eq(0)").val();
             params.yes_no = $("#ryForm").find("[name='yes_no']:eq(0)").val();
             params.ssdwdm = $("#ssdwdm").val();
             return params;
        },
        clickToSelect:true,
        pagination:true, sidePagination: 'server',
        onLoadSuccess:function (data) {
            var allTableData = table.bootstrapTable('getSelections');
            var yhbhs = $.map(allTableData, function (row) {
                return row.yhbh;
            });
            $("[name='yhbhs']").val(yhbhs);
            setTimeout ("checkByTable()", 100);
        }
    };
});

// 刷新用户列表
function getUser(){
	ManageGrid.refreshTable(table, pubUserUrl.getDataByPage);
}

// 加载组字机构树
function loadTree() {
	$("#typeTree").jstree({
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
        
     // 默认选中根节点
    }).on('loaded.jstree', function(e, data){
        var inst = data.instance;//TODO 处理没有节点的情况
        var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);
        inst.select_node(obj);
    });
	
	$("#typeTree").on('select_node.jstree', function (e, data) {
		$('#ssdwdm').val(data.selected[0]);
		var refreshFlag = true;
        if (tableConfig.url == '') {
            refreshFlag = false;
        }
        
        // 更新url请求
        if (refreshFlag) {
            ManageGrid.refreshTable(table, pubUserUrl.getDataByPage+"?rand="+Math.random());
        } else {
            tableConfig.url = pubUserUrl.getDataByPage+"?rand="+Math.random();
            table.bootstrapTable(tableConfig);
        }
        
    });
}

function initTree(url, pluginArr){
	Manage.query (url, {yyid:pubRole.yyid}, function (result){
		authTree.jstree({
			'checkbox': {
				'keep_selected_style': false,
				'three_state':false
			},
			'core': {
				'multiple': true,
				'dblclick_toggle':false,
				'data': result.data
			},
			'plugins': pluginArr
		}).on('loaded.jstree', function(e, data){  
		    var inst = data.instance;  
		    if(undefined != pubRole.zyids && pubRole.zyids != ""){
		    	var zyids = new Array();
		    	if(pubRole.zyids.indexOf(",")>-1){
		    		zyids = pubRole.zyids.split(",");
		    	}else{
		    		zyids.push(pubRole.zyids);
		    	}
		    	if(zyids.length>0){
			  		for(var i=0;i<zyids.length;i++){
		  				inst.select_node(data.instance._model.data[zyids[i]]);
			  		}
			    }
		    }
		}).bind("activate_node.jstree", function (obj, e) {
			var pNode = e.node;
			
			//点击子节点,选中所有父节点
			checkParentNode(pNode);
			
			//点击节点,将该节点下的所有子节点选中
			checkNode(pNode);
			 
			 function checkNode(pNode){
				 
				 var childrens = pNode.children;
				 
				 if(childrens != 'undefined' && childrens != null && childrens.length > 0){
					 var parentIsChecked = authTree.jstree(true).is_selected(pNode);
					 for(var i = 0 ; i < childrens.length; i ++){
						 var node = childrens[i];
						 if(parentIsChecked){
							 authTree.jstree("check_node", node);
						 }else{
							 authTree.jstree("uncheck_node", node);
						 }
						 var childnode = authTree.jstree("get_node", node);
						
						 if(childnode.children!= 'undefined' && childnode.children != null &&childnode.children.length > 0){
							 checkNode(childnode);
						 }
					 }
				 }
			 } 
			  
			 function checkParentNode(currentNode){
				 var parentnodes =  currentNode.parents;
				 if(parentnodes != 'undefined' && parentnodes != null && parentnodes.length > 0){
					 for(var i = 0 ; i < parentnodes.length; i ++){
						 var node1 = parentnodes[i]; 
						 var parentnode = authTree.jstree("get_node", node1+"_anchor");
						 authTree.jstree("check_node",parentnode);
					 }
				 }
			 }
		});
	});
}

function queryQx(){
	$('#orizationForm').show();
	$('#ryForm').hide();
	$(resTabs[0]).addClass('active');
	$(resTabs[1]).removeClass('active');
	$("#typeTree").hide();
}

function queryRy(){
	$("#typeTree").show();
	$('#orizationForm').hide();
	$('#ryForm').show();
	$(resTabs[0]).removeClass('active');
	$(resTabs[1]).addClass('active');
}

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

function sybzFormatter(value, opts, row) {
    if('Y' == value) {
        return '<span style="color:green"><spring:message code="enable" /></span>';
    }else if('N' == value){
    	 return '<span style="color:red"><spring:message code="disable" /></span>';
    }
    return '';
}

function authFormatter(value, opts, row) {
    if(value != null) {
        return '<span style="color:green"><spring:message code="pubUser.orization" /></span>';
    }else {
    	 return '<span style="color:red"><spring:message code="pubUser.unorization" /></span>';
    }
    return '';
}

 function stateFormatter(value, opts, row){
	if(opts.jsid==$("#ryForm").find("[name='jsid']:eq(0)").val()){
		return {
		    checked: true
	    };
	} 
	return value;
} 

function cancel(){
	Manage.url("<c:url value='/pubRole/index' />", {limit: '${param.limit}', offset: '${param.offset}', selectId: '${param.id}', yyid : $("#ryForm").find("[name='yyid']:eq(0)").val()});
}

</script>
</body>
</html>
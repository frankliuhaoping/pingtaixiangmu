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
	                        	<div  class="pull-right" style="margin-bottom:10px">
						      		<button type="button" class="btn btn-primary" id="saveBtn"> <i class="fa fa-check"></i>&nbsp;<spring:message code="determine" /></button>&nbsp;&nbsp;
                            		<button type="button" class="btn btn-default" onclick="cancel()"> <i class="fa fa-close"></i>&nbsp;<spring:message code="cancel" /></button>
				      			</div>
	                        </form>
	                        
	                        <form id="ryForm" class="form-horizontal" style="display:none" >
	                        	<input type="hidden" id="ssdwdm" name="ssdwdm">
	                        	<input type="hidden" id="jsid" name="jsid"/>
	                        	<input type="hidden" id="yyid" name="yyid"/>
	                        	<input type="hidden" name="yhbhs"/>
	                        	<input type="hidden" name="yhbhs_new"/>
								<div class="col-sm-3" style="padding-left: 0; padding-right: 0;">
									<div class="ibox float-e-margins" style="margin-bottom:10px;">
										<div class="ibox-title">
											<h5>
												<spring:message code="pubRole.listo" />
											</h5>
										</div>
										<div class="ibox-content pb10" >
											<div class="clearfix" >
												<div id="typeTree"
													style="border: #ddd solid 1px; padding: 10px 0; overflow: auto; height:545px"></div>
											</div>
										</div>
									</div>
								</div>
                                <%-- 右边 begin --%>
								<div class="col-sm-9" style="padding-right:0">
										<div class="ibox float-e-margins" >
											<div class="ibox-title">
												<h5>
													<spring:message code="pubUser.select" />
												</h5>
											</div>
											<div class="ibox-content " style="padding:10px 0 10px 0px;">
												<form class="form-horizontal " id="searchUserForms">
													<div class="row labelpd0">
													   <div class="form-group col-sm-4">
														  <label class="col-sm-3 control-label"><spring:message
																code="pubUser.permissionstatus" />:</label>
														  <div class="col-sm-9">
															 <select name="yes_no" class="form-control"
																data-live-search="true" required>
																<option value="" selected="selected"></option>
																<option value="2">未赋权</option>
																<option value="1">已赋权</option>
															 </select>
														  </div>
													   </div>

													  <div class="form-group col-sm-4">
														  <label class="col-sm-3 control-label"><spring:message
																code="pubUser.yhmc" />:</label>
														  <div class="col-sm-9">
															 <input type="text" id="yhmc" name="yhmc"
																class="form-control" maxlength="32">
														  </div>
													   </div>

														 <div class=" col-sm-4" style="text-align:right">
															<div class="col-sm-12" >
																<button type="button" class="btn btn btn-primary"
																	id="searchbtn">
																	 <i class="glyphicon glyphicon-search"></i>&nbsp;
																	<spring:message code="find" />
																</button>
																
																<button type="reset" id="resetBtn"
																	class="btn btn-default">
																	  <i class="glyphicon glyphicon-repeat"></i>&nbsp;
																	<spring:message code="reset" />
																</button>
															</div>
														</div>
														
													</div>
												</form>
											</div>
										</div>

									<div class="col-sm-13" style="padding: 10px 0 10px 0px;">
										<div class="ibox float-e-margins">
											<div class="ibox-title">
												<h5>
													<spring:message code="pubUser.list" />
												</h5>
												<div class="ibox-tools">
													<div class="btn-group hidden-xs mt8" role="group">
														<button id="refreshBtn" type="button" class="btn">
															<i class="fa fa-refresh"></i>&nbsp;
															<spring:message code="refresh" />
														</button>
													</div>
												</div>
											</div>

											<div class="ibox-content ">
												<div class="row">
													<div class="col-sm-12">
														<div class="table-responsive">
															<table id="ryTable"
																class="table table-bordered table-striped"
																data-mobile-responsive="true">
																<thead>
																	<tr>
																		<th data-checkbox="true"
																			data-formatter="stateFormatter"></th>
																		<th data-field="yhbh" data-visible="false"><spring:message
																				code="pubUser.yhbh" /></th>
																		<!-- <th data-field="jsid" data-visible="false"></th> -->
																		<th data-field="yhmc" data-sortable="true"
																			data-sort-name="yhmc"><spring:message
																				code="pubUser.yhmc" /></th>
																		<th data-field="yhzh" data-sortable="true"
																			data-sort-name="yhzh"><spring:message
																				code="pubUser.yhzh" /></th>
																		<th data-field="jsid" data-sortable="true"
																			data-sort-name="jsid" data-formatter="authFormatter"><spring:message
																				code="pubUser.permissionstatus" /></th>
																		<th data-field="sybz" data-sortable="true"
																			data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message
																				code="pubUser.sybz" /></th>
																	</tr>
																</thead>
															</table>
															<div  style="text-align:center;margin-bottom:10px">
																<button type="button" class="btn btn-primary"
																	id="saveRyBtn">
																	 <i class="fa fa-check"></i>&nbsp;<spring:message code="determine" />
																</button>
																&nbsp;&nbsp;
																<button type="button" class="btn btn-default"
																	onclick="cancel()">
																	 <i class="fa fa-close"></i>&nbsp;<spring:message code="cancel" />
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
                                <%-- 右边end --%>
                             
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
var zyids=${zyids};
$(function () {
	ManageForm.loadForm($('#orizationForm'), pubRole);
	ManageForm.loadForm($('#ryForm'), pubRole);
	queryQx();
	loadTree();
	initTree(pubRoleUrl.getTree, ['checkbox']);
    $('#saveBtn').click(function(){
    	//把选中的zyid放到了zyids中 
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
             params.jsid = $.trim($("#ryForm").find("[name='jsid']:eq(0)").val());
             params.yes_no = $.trim($("#ryForm").find("[name='yes_no']:eq(0)").val());
             params.ssdwdm =$.trim($("#ssdwdm").val());
             params.yhmc = $.trim($("#yhmc").val());
             return params;
        },
        sortable: true,
        sortOrder: "desc",
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

$("#refreshBtn").click(function(){
	$('#resetBtn').click(); 
    ManageGrid.refreshTable(table, pubUserUrl.getDataByPage);
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
//待修改
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
			//默认选中
			//是不是可以把zyids 放入data中
			
		    var inst = data.instance;  
		    if(undefined != zyids && zyids != ""){
		    	if(zyids.length>0){
			  		for(var i=0;i<zyids.length;i++){
			  			//这里不懂
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
	$('#ryForm').hide();
	$('#orizationForm').show();
	$(resTabs[0]).addClass('active');
	$(resTabs[1]).removeClass('active');
	$("#typeTree").hide();
}

function queryRy(){
	$('#orizationForm').hide();
	$("#typeTree").show();
	$('#ryForm').show();
	$(resTabs[0]).removeClass('active');
	$(resTabs[1]).addClass('active');
}

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + selectId +"']");
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
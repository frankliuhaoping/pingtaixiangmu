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
                    <%-- <div class="btn-group hidden-xs mt8" role="group">
                        <shiro:hasPermission name="sys:pubXtzd:add">
                            <c:set var='addPer' value='true' />
                            <button id="addBtn" type="button" class="btn btn-default">
                                <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
                            </button>
                        </shiro:hasPermission>
                        <button id="refreshBtn" type="button" class="btn btn-default">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                    </div> --%>
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
		                        <div class="row">
								    <div class="col-md-4" style="margin-left: 50px;width: 85%;">
								        <div class="ibox float-e-margins" id="myRecord">
											<div class="ibox-title">
												<h5><span class="glyphicon glyphicon-pushpin"></span>&nbsp;可选择的机构&nbsp;&nbsp;&nbsp;<small id="more" class="pull-right pmHidden"></small></h5>
												<div class="ibox-tools">
													<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
												</div>
											</div>
											<div class="ibox-content">
									            <!-- <ul class="list-group"><li class="list-group-item noResultText">没有您的未提交报告</li></ul> -->
									            <div id="authTree" class="jstree jstree-1 jstree-default jstree-checkbox-no-clicked"></div>
									            <div style="margin: 0px auto;text-align: center;">
									           		<button type="button" class="btn btn-primary" id="saveBtn"><spring:message code="determine" /></button>
									           	</div>
											</div>
										</div>
								    </div>
								</div>
							</div> 
						</div>  
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <form action="" id="saveForm">
    	<input type="hidden" name="zdbh" id="zdbh" />
    	<input type="hidden" name="dwdm" id="dwdm" />
    </form>
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
//url定义
var pubXtzdUrl = {
    add: '<c:url value="/pubZzjgsy/saveAdd" />',
    loadSelectedTree: "<c:url value='/pubZzjgsy/getSelectedOrgTree/' />"
};
//table对象
var selectTreeId,authTree = $('#authTree'),selectedOrgTree = $("#selectedOrgTree");
//初始化表格和按钮
$(function () {
    
  	initTree();
    
  	registerActionEvent();
});

function registerActionEvent(){
	
	 $('#saveBtn').click(function(){
	   	 $("[name='dwdm']").val(authTree.jstree('get_selected').join());
	  	 Manage.save(pubXtzdUrl.add, $('#saveForm').serialize(), null);
	 });
	 
	 $("#appTree").on('select_node.jstree', function (e, data) {
    	selectTreeId = data.selected[0];
    	$("#zdbh").val(selectTreeId);
		loadSelectedTree();
    });
	 
}


function initTree(){
	//系统字典树
	 $("#appTree").jstree({
	        'checkbox': {
	            'keep_selected_style': false
	        },
	        'core' : {
	            'data' : {
	                "url" : "<c:url value='/pubZzjgsy/getOrgUseTree' />",
	                "data" : function (node) {
	                
	                }
	            }
	        }
	    // 默认选中根节点
	    }).on('loaded.jstree', function(e, data){
	        var inst = data.instance;//TODO 处理没有节点的情况
	        var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);
	        selectTreeId = obj.id;
	        $("#zdbh").val(obj.id);
	        inst.select_node(obj);
	    });
	 
	//组织机构数
	var pluginArr = ['checkbox'];
	var url = "<c:url value='/pubZzjgsy/getOrgTree' />";
	Manage.query (url, {}, function (result){
		authTree.jstree({
			'checkbox': {
				'keep_selected_style': false,
				'three_state':false
			},
			'core': {
				'multiple': true,
				'dblclick_toggle':false,
				'data': result
			},
			'plugins': pluginArr
		}).on('loaded.jstree', function(e, data){  
			loadSelectedTree();
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

function loadSelectedTree(){
	Manage.query (pubXtzdUrl.loadSelectedTree, {zdbh:selectTreeId}, function (result){
		if(!authTree){
			return ;
		}
		var selectedTreeId = result;
		authTree.jstree("deselect_all");
		var children = authTree.jstree("get_node", authTree).children_d;
		for(var id in children){
			id = children[id];
			for(var i=0;i< selectedTreeId.length;i++){
				var selectedId = selectedTreeId[i];
				if(id == selectedId){
					var curNode = authTree.jstree("get_node",selectedId);
					authTree.jstree("check_node",curNode);
					selectedTreeId.splice(i,1);
				}
			}
		}
	});
}

</script>
</body>
</html>
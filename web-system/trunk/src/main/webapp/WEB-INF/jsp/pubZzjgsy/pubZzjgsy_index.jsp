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
    <div class="col-sm-3" style="padding-left:0;padding-right:0;">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
               <h5><spring:message code="pubZzjgsy.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                </div>
            </div>
            <div class="ibox-content pb10">
	            <div class="clearfix">
	              <input type="hidden" id="yyid" name="yyid">
	                 <div class="" role="group">
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
				<!--管理树  -->	                 
	           <div id="appTree" class="form-group "  style="border: #ddd solid 1px; padding: 10px 0;overflow:auto;"></div>
	             </div>
	         
            </div>
        </div>
    </div>
    
    <div class="col-sm-9" style="padding-left:10px;padding-right:0;">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="pubZzjgsy.view" /></h5>
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
            <div class="ibox-content pb10 clearfix">
                 <input type="hidden" id="yyid" name="yyid">
                 <div role="group">
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
				 <div class=" J_mainContent">
				 	 <!-- 选择和查看tab选项卡  -->
				 	<ul id="myTab" class="nav nav-tabs" role="tablist">
				 		<li class="active">
							<a href="#toview" data-toggle="tab">查看</a>
						</li>
						<li >
							<a href="#choose" data-toggle="tab">管理</a>
						</li>
						
						<li >
							<a href="#copyPubZzjgsy" data-toggle="tab">导入</a>
						</li>
					</ul>
				 
				 
					<div id="myTabContent" class="tab-content">
						<div id="choose" class="tab-pane fade " style="border: #ddd solid 1px;margin:0; padding: 10px 0;overflow:auto;" >		
							<div id="authTree" class="jstree jstree-1 jstree-default jstree-checkbox-no-clicked"></div>
							<div style="margin: 0px auto;text-align: center;">
								<button type="button" class="btn btn-primary" id="saveBtn"><i class="fa fa-check"></i>&nbsp;<spring:message code="determine" /></button>
							</div>
						</div>
						
						<div id="toview" class="tab-pane fade in active" style="border: #ddd solid 1px;margin:0; padding: 10px 0;overflow:auto;" >		
							<div id="viewTree" class="jstree jstree-default" ></div>	
						</div>
						
						<div id="copyPubZzjgsy" class="tab-pane fade " style="border: #ddd solid 1px;margin:0; padding: 10px 0;overflow:auto;" >		
			                      <!-- 下拉选择 -->
				                 <div class="form-group " >
				               		      导入配置到:<input type="text" id="zdmc" readonly="readonly" class="form-control timebox " >
				                     <input type="hidden" id="bh" name="bh">
				                 </div>
			                 	<div style="margin: 0px auto;text-align: center;">
              					  <button type="button" class="btn btn-primary" id="copy"><i class="fa fa-check"></i>&nbsp;<spring:message code="determine" /></button>
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
<script src="<c:url value='/common/static/js/dropdown.js' />" type="text/javascript" ></script>

<script type="text/javascript">

//获取页面权限值
var addPer = ${addPer};
var deletePer = ${deletePer};
var editPer = ${editPer};
var viewPer = ${viewPer};
//url定义
var pubZzjgsy = {
    add: '<c:url value="/pubZzjgsy/saveAdd" />',
    copy:'<c:url value="/pubZzjgsy/copy" />',
    loadSelectedTree: "<c:url value='/pubZzjgsy/getSelectedOrgTree/' />",
    getOrgTreeView :"<c:url value='/pubZzjgsy/getOrgTreeView'/>"
};
//table对象
var selectTreeId,authTree = $('#authTree'),viewTree=$('#viewTree'),selectedOrgTree = $("#selectedOrgTree");
//初始化表格和按钮
$(function () {
    
  	initTree();
    
  	registerActionEvent();
  	
  
});

function registerActionEvent(){
	
	 $('#saveBtn').click(function(){
	   	 $("[name='dwdm']").val(authTree.jstree('get_selected').join());
	   	 Manage.save(pubZzjgsy.add, $('#saveForm').serialize(), function(){
	   		getViewTree();
	   	 });
	   	 
	 });
	 
	 $("#appTree").on('select_node.jstree', function (e, data) {
    	selectTreeId = data.selected[0];
    	$("#zdbh").val(selectTreeId);
		loadSelectedTree();
		getViewTree();
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
	if (selectTreeId == null) {
		return ;
	}
	Manage.query (pubZzjgsy.loadSelectedTree, {zdbh:selectTreeId}, function (result){
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
//组织机构数
function getViewTree(){
	 //清空树数据
	viewTree.jstree("destroy");
	Manage.query (pubZzjgsy.getOrgTreeView, {zdbh:selectTreeId}, function (result){
		viewTree.jstree({
			'core': {
				'multiple': true,
				'dblclick_toggle':false,
				'data': result
			}
		})
	});
}

$("#zdmc").focus(function() {
	loadTree('zdmc','bh');
});
//树形下拉框加载标志，如果加载过就不要执行jstree构建
var treeLoadFlag = false;
//加载树形单位菜单
function loadTree(zdmc,bh){
    treeDiv = Public.dropdown($("#"+zdmc), '<div id="typeTree_'+zdmc+'" "></div>', {onShow:function(){
    	if (!treeLoadFlag) {
            treeLoadFlag = true;
	    	$("#typeTree_"+zdmc).jstree({
	            'checkbox': {
	                'keep_selected_style': false
	            },
	            'core' : {
			        'data' : {
			            "url" : "<c:url value='/pubZzjgsy/getOrgUseTree' />",
			            "data" : function (node) {
			                return { "bh" : node.id };
			            }
			        }
			    }
	        });
	    	
	    	$("#typeTree_"+zdmc).on('select_node.jstree', function (e, data) {
	            var nodeTxt = data.instance.get_node(data.selected[0]).text;
	            var bhValue = data.selected[0];
	            console.log(bhValue);
	            if(nodeTxt == '不限'){
	            	bhValue = '';
	            }
	            $('#'+zdmc).val(nodeTxt);
	            $('#'+bh).val(bhValue);
	            treeDiv.hide();
	        });
    	}
    	
    }});
}

$('#copy').click(function(){
	var zdbh=$('#zdbh').val();
	var bh=$('#bh').val();
  	 Manage.save(pubZzjgsy.copy,{zdbh:zdbh,bh:bh});
  	 
});
</script>
</body>
</html>
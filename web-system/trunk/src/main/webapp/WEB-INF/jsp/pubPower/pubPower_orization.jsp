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
            	<div class="col-sm-5 pull-left">
            		<h5><spring:message code="pubUser.powerOrization" /></h5>
            	</div>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                        <button id="backBtn" type="button" class="btn">
                            <i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" />
                        </button>
                    </div>
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
						  	</ul>
                        </div>
                        <div class="tab-content" style="margin-top: 20px;">
	                        <form id="orizationForm" class="form-horizontal formW60p">
	                        	<input type="hidden" id="jsid" name="jsid"/>
	                        	<input type="hidden" id="zyids" name="zyids"/>
	                        	<input type="hidden" id="yyid" name="yyid"/>
	                        	<div id="authTree" class="jstree jstree-1 jstree-default jstree-checkbox-no-clicked"></div>
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


var tableConfig;

var pubRoleUrl = {
    getTree: '<c:url value="/pubRes/getAllTree" />'
};

var pubRole = ${pubRole};

$(function () {
	ManageForm.loadForm($('#orizationForm'), pubRole);
	queryQx();
	loadTree();
   	initTree(pubRoleUrl.getTree, ['checkbox']);

});

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
	$(resTabs[0]).addClass('active');
	$(resTabs[1]).removeClass('active');
	$("#typeTree").hide();
}

// 返回事件
$('#backBtn').click(function(){
	Manage.url("<c:url value='/pubUser/powerIndex' />", {limit: '${param.limit}', offset: '${param.offset}', selectId: '${param.id}', yyid : pubRole.yyid});

}); 

</script>
</body>
</html>
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
    <!-- 标题栏div开始 -->
		<div class="ibox float-e-margins">
			<!-- 标题 -->
			<div class="ibox-title">
				<h5>
					<i class="fa fa-file-text-o mt2 mr5"></i>
					<spring:message code="pubXtzd.select" />
				</h5>
			</div>
			<!--查询 div-->
			<div class="ibox-content ">
				<form method="get" class="form-horizontal" id="searchUserForm">
				    <input type="hidden" id="yyid" name="yyid">
					<div class="row labelpd0">
						<!-- 字典项名 -->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message
									code="pubXtzd.zdxm" />:</label>
							<div class="col-sm-9">
								<input type="text" id="zdxm" name="zdxm" class="form-control" >
							</div>
						</div>
						
						<%-- 字典项值 --%>
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message
									code="pubXtzd.zdxz" />:</label>
							<div class="col-sm-9">
								<input type="text" id="zdxz" class="form-control " >
							</div>
						</div>
						
						<!-- 字典编号 -->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message
									code="pubXtzd.zdbh" />:</label>
							<div class="col-sm-9">
								<input type="text" id="zdbh" class="form-control " >
							</div>
						</div>
						
						<!--按钮组div  -->
	                    <div class="form-group col-sm-3" style="float:right">
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
			<!--查询结束  -->
		</div>
		
	  <%-- 左边树形菜单  begin --%>	
	  <div class="col-sm-2" style="padding-left:0;padding-right:0;">
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><spring:message code="pubApp.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                </div>
            </div>
            <div class="ibox-content pb10">
                   <div class="clearfix">
                   
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
		                 <div id="appTree"style="border: #ddd solid 1px; padding: 10px 0;overflow:auto;"></div>            
                    </div>
                </div>
            </div>
        </div>
       <%--左边树形菜单end --%>
    
       <%-- 右边表格  beigin --%>
       <div class="col-sm-10" style="padding-left:10px;padding-right:0;">
         <div class="ibox float-e-margins mt10">
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
                <div class="row">
                    <input type="hidden" id="yyid" name="yyid">
                    <div class="col-sm-12">
                        <div class=" " role="group">
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
                        <div class="J_mainContent">
	                        <table id="pubXtzdTable" class="table table-bordered table-striped" treeGrid="true" expandColumn="zdxm" height="auto">
	                            <thead>
	                                <tr>
	                                    <th name="bh" hidden="true" key="true"><spring:message code="pubXtzd.bh" /></th>
	                                    <th name="zdfbh" hidden="true"><spring:message code="pubXtzd.zdfbh" /></th>
	                                    <th name="zdxm" width="220"><spring:message code="pubXtzd.zdxm" /></th>
	                                    <th name="zdxz" width="220"><spring:message code="pubXtzd.zdxz" /></th>
	                                    <th name="zdbh" width="220"><spring:message code="pubXtzd.zdbh" /></th>
	                                    <th name="sjms" width="100"><spring:message code="pubXtzd.sjms" /></th>
	                                    <th name="pxdm" width="100" ><spring:message code="pxdm" /></th>
	                                    <th name="sybz" width="100"formatter="sybzFormatter"><spring:message code="pubXtzd.sybz" /></th>
	                                    <th name="operate" width="100" formatter="actionFormatter"><spring:message code="operate" /></th>
	                                </tr>
	                            </thead>
	                        </table>
						</div> 
						 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- 右边表格  end --%>
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
var selectID;
//url定义
var pubXtzdUrl = {
    index: '<c:url value="/pubXtzd/index" />',
    add: '<c:url value="/pubXtzd/add" />',
    edit: '<c:url value="/pubXtzd/edit/" />',
    remove: '<c:url value="/pubXtzd/delete/" />',
    getTreeGrid: '<c:url value="/pubXtzd/getTreeGrid" />',
    view: "<c:url value='/pubXtzd/view/' />",
    selectGrid : '<c:url value="/pubXtzd/selectGrid" />',
};
//table对象
var table = $('.table');
var resTab = $('#myResTab');
var resTabs = $(resTab).find('a');
var selectTreeId;
//初始化表格和按钮
$(function () {

    $("#addBtn").click(function(){
        var rowId = table.getGridParam("selrow");
        if(rowId) {
        	// 有row的bh时才传给后台
            var row = table.getRowData(rowId);
            if (row.bh != undefined) {
            	indexPage = Layer.openIframeByOptions(pubXtzdUrl.add+"?parentId="+ row.bh +"&parentName="+ row.name+"&yyid="+ getYyid(),{});
            } else {
            	indexPage = Layer.openIframeByOptions(pubXtzdUrl.add+"?yyid="+ getYyid(),{});
            }
        } else {
        	  indexPage = Layer.openIframeByOptions(pubXtzdUrl.add+"?yyid="+ getYyid(),{});
        }
    });
    
    //刷新按钮
    $("#refreshBtn").click(function(){
    	$('#searchUserForm')[0].reset();
    	var yyid =  $("#yyid").val();
    	$(table).jqGrid('setGridParam',{
            url:pubXtzdUrl.getTreeGrid+"?rand="+Math.random(),
            postData:{'yyid':yyid}, 
        }).trigger("reloadGrid");
    });
    
    //重置
    $('#resetBtn').click(function(){
    	$('#searchUserForm')[0].reset();
    });
    
    //树加载
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
    
    //树的选择事件
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
        	//treegrid 初始化
        	$(table).attr('url',pubXtzdUrl.getTreeGrid+"?yyid="+selectTreeId);
        	JqGrid.initGrid(table);
        }
    });
    
    //查询按妞点击事件
   $('#searchBtn').click(function(){
	    selectTreeId = $('#yyid').val();
	   var zdxm=$.trim($("#zdxm").val());
	   var zdxz=$.trim($("#zdxz").val());
	   var zdbh=$.trim($("#zdbh").val());
	   if ('' == zdxm && '' == zdxz && '' == zdbh) {
		   $('#searchUserForm')[0].reset();
	    	var yyid =  $("#yyid").val();
	    	$(table).jqGrid('setGridParam',{
	            url:pubXtzdUrl.getTreeGrid+"?rand="+Math.random(),
	            postData:{'yyid':yyid}, 
	        }).trigger("reloadGrid");
	    	return;
	   }
	   //清除表的数据
	   $(table).jqGrid("clearGridData");
	   
	    $(table).jqGrid('setGridParam',{
          url:pubXtzdUrl.selectGrid+"?rand="+Math.random(),
          postData:{'yyid':selectTreeId,'zdxm':zdxm,'zdxz':zdxz,'zdbh':zdbh}, 
       }).trigger("reloadGrid");  
	    
	    //清除更新路径
	   $(table).jqGrid("clearGridData");
	   $(table).jqGrid('setGridParam',{
           url:pubXtzdUrl.getTreeGrid+"?rand="+Math.random(),
           postData:{'yyid':selectTreeId}, 
       }).trigger("reloadGrid");
   });
    
    
    
    $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
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
	indexPage = Layer.openIframeByOptions(pubXtzdUrl.edit + rowId+"?yyid="+getYyid(),{});
	//Manage.url(pubXtzdUrl.edit + rowId, {yyid: getYyid()});
}

//权限详情
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubXtzdUrl.view + rowId+"?yyid="+getYyid(),{});
	//Manage.url(pubXtzdUrl.view + rowId, {yyid: getYyid()});
}

//删除权限
function del(rowId) {
    ManageGrid.deleteSingle(pubXtzdUrl.remove + rowId, function(){table.trigger('reloadGrid');}, {'601':'<spring:message code="pubXtzd.delError" />'});
}

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	   table.trigger('reloadGrid');
	
}
</script>
</body>
</html>
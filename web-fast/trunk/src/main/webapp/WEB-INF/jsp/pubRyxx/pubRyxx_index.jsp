<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<!-- 头部 -->
<head>
<!--引入基础css样式库  -->
<jsp:include page="/common/template/head_basic_table.jsp" />
<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
</head>


<body class="gary-bg">
<!--外部div -->
<div class="wrapper wrapper-content">
<!--外部div -->
 <div class="ibox float-e-margins">
 <!--顶部按钮组  -->
  <div class="ibox-title">
                <!--标题  -->
                <h5><spring:message code="pubRyxx.list" /></h5>
                <div class="ibox-tools">
                <!-- 按钮权限 -->
                    <c:set var='addPer' value='false' />
                    <c:set var='editPer' value='false' />
                    <c:set var='deletePer' value='false' />
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
                    <!--新增按钮权限  -->
	                    <shiro:hasPermission name="sys:pubRyxx:add">
	                        <c:set var='addPer' value='true' />
	                        <!--新增按钮  -->
	                        <button id="addBtn" type="button" class="btn btn-default" title="<spring:message code="new" />">
	                            	 <i class="glyphicon glyphicon-plus fz12" aria-hidden="true"></i><spring:message code="new" />
	                        </button>
	                    </shiro:hasPermission>
	                    <!-- 删除按钮权限 -->
	                    <shiro:hasPermission name="sys:pubRyxx:delete">
	                        <c:set var='deletePer' value='true' />
	                        <!-- 批量删除 -->
	                        <button id="removeBtn" type="button" class="btn btn-default" title="<spring:message code="remove" />">
	                            <i class="glyphicon glyphicon-trash fz12" aria-hidden="true"></i><spring:message code="batchRemove" />
	                        </button>
	                    </shiro:hasPermission>
	                    <!--刷新按钮  -->
	                         <button id="refreshBtn" type="button" class="btn btn-default">
                            <i class="glyphicon glyphicon-refresh fz12" aria-hidden="true"></i><spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <!-- 顶部按钮组介绍 -->
            <!-- 中间div -->
          <div class="ibox-content ">
          <!--查询form表单  -->
         <form method="get" class="form-horizontal" id="searchUserForm">
            		<div class="row labelpd0">
            		<!-- 所属单位名称 -->
            		  <div class="form-group col-sm-4">
                         <label class="col-sm-3 control-label"><spring:message code="pubRyxx.ssdwmc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="ssdwmc" placeholder="请选择所属单位名称..." name="ssdwmc" class="form-control"readonly>
                         </div>
                      </div>
                      <!-- 人员姓名 -->
                      <div class="form-group col-sm-4">
                         <label class="col-sm-3 control-label"><spring:message code="pubRyxx.ryxm" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="ryxm" name="ryxm" class="form-control">
                         </div>
                      </div>
                      <!-- 人员警号 -->
                      <div class="form-group col-sm-4">
                         <label class="col-sm-3 control-label"><spring:message code="pubRyxx.ryjh" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="ryjh" name="ryjh" class="form-control">
                         </div>
                      </div>
                      <!-- 使用使用标志 -->
                      <div class="form-group col-sm-4">
	                   		<label class="col-sm-3 control-label"><spring:message code="pubRyxx.sybz" />:</label>
	                        <div class="col-sm-9">
                        		<select id="sybz_select" class="form-control">
                        			<option value ="">请选择</option>
									<option value ="Y">启用</option>
								  	<option value ="N">禁用</option>
								</select>
                        	</div>
	                    </div>
	                    <div class="form-group col-sm-4">
	                     </div>
	                     <!-- 中间按钮组 -->
	                     <div class="form-group col-sm-4">
	                         <div class="col-sm-6">
	                         </div>
	                         <div class="col-sm-6">
	                             <div class="col-sm-4">
	                             </div>
		                         <div class="col-sm-4">
		                         <!-- 查询按钮 -->
				                     <button type="button" id="searchBtn" class="btn btn-primary">
				                         <spring:message code="find" />
				                     </button>
			                     </div>
			                     <div class="col-sm-4">
			                     <!-- 重置按钮 -->
				                     <button type="reset" id="resetBtn" class="btn btn-primary">
				                         <spring:message code="reset" />
			                         </button>
		                         </div>
	                         </div>
                        </div>
                     </div>
            	</form>
            	<!-- 查询form表单结束 -->
            	<!-- 底部div -->
                <div class="row">
                     <div class="col-sm-12">
                     <div id="tableToolbar">
                            <div class="form-inline" role="form">
                            <!-- 编辑按钮权限 -->
                                <shiro:hasPermission name="sys:pubRyxx:edit">
                                    <c:set var='editPer' value='true' />
                                </shiro:hasPermission>
                                <!--查看按钮权限  -->
                                <shiro:hasPermission name="sys:pubRyxx:view">
                                    <c:set var='viewPer' value='true' />
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <!-- table -->
                      <div class="table-responsive">
                            <table class="table table-bordered" height="auto">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                       	<th data-field="rybh" data-sortable="true"  data-sort-name="rybh" data-visible="false"><spring:message code="pubRyxx.rybh" /></th>
										<th data-field="ryxm" data-sortable="true" data-sort-name="ryxm" ><spring:message code="pubRyxx.ryxm" /></th><!-- 人员姓名列 -->
										<th data-field="xbms" data-sortable="true" data-sort-name="xbms"><spring:message code="pubRyxx.ryxb" /></th><!-- 人员性别列 -->
										<th data-field="csny" data-sortable="true" data-sort-name="csny" data-formatter="csnyFormatter"><spring:message code="pubRyxx.csny" /></th> <!-- 出生年月列 -->
										<th data-field="zwms" data-sortable="true" data-sort-name="zwms"><spring:message code="pubRyxx.ryzw" /></th><!-- 人员职务列 -->
										<th data-field="ssdwmc" data-sortable="true" data-sort-name="ssdwmc" ><spring:message code="pubRyxx.ssdwmc" /></th><!-- 所属单位列 -->
										<th data-field="sybz"  data-sortable="true" data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message code="pubRyxx.sybz" /></th><!--使用标志  -->
										<th data-field="operate" data-formatter="defaultActionFormatter"><spring:message code="operate" /></th><!-- 操作按钮组 -->
                                    </tr>
                                </thead>
                            </table> 
                        </div> <!--table结束  -->      
                     </div>
       </div><!-- 底部div结束 -->
       
      </div> <!--中间div结束  -->
     
 </div>
</div>
<!--引入js基础库  -->
<jsp:include page="/common/template/script_basic_table.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript">
//获取页面权限值
var addPer = ${addPer};
var editPer = ${editPer};
var deletePer = ${deletePer};
var viewPer = ${viewPer};

//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var pubRyxxUrl = {
	index : "<c:url value='/pubRyxx/index' />",/* 主界面 */
	view : "<c:url value='/pubRyxx/view/' />",/* 查看 */
	add : "<c:url value='/pubRyxx/add' />",/* 新增 */
	edit : "<c:url value='/pubRyxx/edit/' />",/* 编辑 */
	remove : "<c:url value='/pubRyxx/delete/' />",/* 单个删除 */
	removeBatch : "<c:url value='/pubRyxx/deleteBatch' />",/* 批量删除 */
	getDataByPage : "<c:url value='/pubRyxx/getDataByPage' />"/* 分页查询 */
};

//初始化表格和按钮
$(function () {
	var searchFields = ManageGrid.getSearchFields(table);
	 table.bootstrapTable({
	        url: pubRyxxUrl.getDataByPage,
	        queryParams: function (params) {
	            params.searchProperty = searchFields;
	            if (limit != "") {
	                if (firstLoadFlag) {
	                    params.limit = parseInt(limit);
	                    params.offset = parseInt(offset);
	                }
	            }
	            limit = params.limit;
	            offset = params.offset;
	            params.ssdwmc=$('#ssdwmc').val();
	            params.ryxm=$.trim($("#ryxm").val());
	            params.ryjh=$("#ryjh").val();
	            params.sybz=$.trim($("#sybz_select option:selected").val());
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
	        toolbar: '#tableToolbar', uniqueId: 'rybh', clickToSelect: true, sidePagination: 'server', pagination: true
	    });
     //新增
	 $("#addBtn").click(function(){
	        window.location.href = pubRyxxUrl.add + "?limit=" + limit + "&offset=" + offset;
	    });
     // 删除 
	 $("#removeBtn").click(function(){
	        ManageGrid.deleteMultiple(table, pubRyxxUrl.removeBatch, function(){window.location.href = pubRyxxUrl.index + "?limit=" + limit + "&offset=" + offset;}, "rybh");
	    });
    
	 // 刷新
	 $("#refreshBtn").click(function(){
	        ManageGrid.refreshTable(table, pubRyxxUrl.getDataByPage);
	    });
	 //查询按钮
	 $("#searchBtn").click(function(){
	        ManageGrid.refreshTable(table, pubRyxxUrl.getDataByPage);
	    });
	 //加载所属单位目录树
	 $("#ssdwmc").focus(function() {
	    	loadTree();
	    });

});

/* teble点击事件 */
function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

/*出生年月日期格式转换  */
function csnyFormatter(value) {
	var csnydate = '';
	if (value != null && value != "") {
		csnydate = moment(value).format('YYYY-MM-DD')
	}
	return csnydate;
}

//操作formatter
function defaultActionFormatter(value, row) {
	var html = '<div class="action-buttons">';
	html += '<a href="javascript:void(0);" onclick="view(\''+ row.rybh+ '\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
	html += '<a href="javascript:void(0);" onclick="edit(\''+ row.rybh+ '\')" title="<spring:message code="edit" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
	html += '<a href="javascript:void(0);" onclick="del(\''+ row.rybh+ '\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
	html += '</div>';
	return html;
}
  /*修改人员信息  */
function edit(rowId) {
	window.location.href = pubRyxxUrl.edit + rowId + "?limit=" + limit+ "&offset=" + offset + "&id=" + rowId;
}
  /* 删除人员信息 */
function del(rowId) {
	ManageGrid.deleteSingle(pubRyxxUrl.remove + rowId, function() {
		window.location.href = pubRyxxUrl.index + "?limit=" + limit+ "&offset=" + offset;
	});
}
  /* 查看人员信息 */
function view(rowId) {
	window.location.href = pubRyxxUrl.view + rowId + "?limit=" + limit	+ "&offset=" + offset + "&id=" + rowId;
}
  
  

var treeDiv;//构建下拉框树
//树形下拉框加载标志，如果加载过就不要执行jstree构建
var treeLoadFlag = false;
//获取所属单位目录树 
function loadTree() {
treeDiv = Public.dropdown($("#ssdwmc"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
	if (!treeLoadFlag) {
        treeLoadFlag = true;
    	$("#typeTree").jstree({
            'checkbox': {
                'keep_selected_style': false
            },
            'core' : {
		        'data' : {
		            "url" : "<c:url value='/pubZzjg/getTree?type=0' />",//url
		            "data" : function (node) {
		                return { "dwdm" : node.id };
		            }
		        }
		    }
        });
    	
    	$("#typeTree").on('select_node.jstree', function (e, data) {
            var nodeTxt = data.instance.get_node(data.selected[0]).text;
            $('#ssdwmc').val(nodeTxt);
            treeDiv.hide();

        });
	}
}});
} 


</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<!-- 头部 -->
<head>
<!--引入基础css样式库  -->
<jsp:include page="/common/template/head_basic_table.jsp" />
<link
	href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />"
	rel="stylesheet" type="text/css" />
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<!-- 标题栏div开始 -->
		<div class="ibox float-e-margins">
			<!-- 标题 -->
			<div class="ibox-title">
				<h5>
					<i class="fa fa-file-text-o mt2 mr5"></i>
					<spring:message code="pubRyxx.select" />
				</h5>
			</div>
			<!--查询 div-->
			<div class="ibox-content ">
				<form method="get" class="form-horizontal" id="searchUserForm">
					<div class="row labelpd0">
						
						<!-- 用户姓名 -->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message
									code="pubUser.yhmc" />:</label>
							<div class="col-sm-9">
								<input type="text" id="yhmc" name="yhmc" class="form-control" >
							</div>
						</div>
						<!-- 联系电话  -->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message
									code="pubUser.lxdh" />:</label>
							<div class="col-sm-9">
								<input type="text" id="lxdh" name=lxdh class="form-control" >
							</div>
						</div>
						<%-- 所属单位名称 --%>
<!-- 						<div class="form-group col-sm-3"> -->
<%-- 							<label class="col-sm-2 control-label"><spring:message --%>
<%-- 									code="pubUser.ssdwmc" />:</label> --%>
<!-- 							<div class="col-sm-10"> -->
<!-- 								<input type="text" id="ssdwmc" readonly="readonly" -->
<!-- 									class="form-control timebox" placeholder="所属单位名称"> <input -->
<!-- 									type="hidden" id="ssdwdm" name="ssdwdm"> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<!-- 使用使用标志 -->
						<div class="form-group col-sm-3">
							<label class="col-sm-3 control-label"><spring:message
									code="pubUser.sybz" />:</label>
							<div class="col-sm-9">
								<select id="sybz_select" class="form-control">
									<option value=""></option>
									<option value="Y">启用</option>
									<option value="N">禁用</option>
								</select>
							</div>
						</div>
						
						<!--按钮组div  -->
	                    <div class="form-group col-sm-6" style="float:right">
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
		<!-- 标题栏div结束 -->
		<!-- 内容div开始 -->
		<div class="ibox float-e-margins mt10">
			<!--内容栏按钮组div  -->
			<div class="ibox-title">
				<h5>
					<i class="fa fa-calculator mt2 mr5"></i>
					<spring:message code="pubRyxx.list" />
				</h5>
				<div class="ibox-tools">
					<c:set var='viewPer' value='false' />
					<div class="btn-group hidden-xs mt8" role="group">
						<!-- 批量提交 -->
						<button id="synchroBatch" type="button" class="btn">
							<i class="fa fa-plus-circle"></i>&nbsp;批量新增
						</button>
						<!-- 刷新按钮 -->
						<button id="refreshBtn" type="button" class="btn">
							<i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
						</button>
					</div>
				</div>
			</div>
			<!--内容栏按钮组div结束-->
			<!-- table显示div -->
			<div class="ibox-content ">
				<div class="row">
					<div class="col-sm-12">
						<div id="tableToolbar">
							<!--  查看权限-->
								<c:set var='viewPer' value='true' />
						</div>
						<!-- table -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped" treeGrid="true"
								height="auto">
								<thead>
									<tr>
										<th data-checkbox="true"></th>
										<th data-field="yhbh" data-sortable="true"
											data-sort-name="yhbh" ><spring:message
												code="pubUser.yhbh" /></th>
										<!-- 用户名称 -->
										<th data-field="yhmc" data-sortable="true"
											data-sort-name="yhmc"><spring:message
												code="pubUser.yhmc" /></th>
										<!-- 手机号码  联系电话-->
										<th data-field="lxdh" data-sortable="true"
											data-sort-name="lxdh"><spring:message
												code="pubUser.lxdh" /></th>
										<!-- 所属单位列 -->
										<th data-field="ssdwdm" data-sortable="true"
											data-sort-name="ssdwdm"><spring:message
												code="pubUser.ssdwdm" /></th>
										<!-- 数据启用  -->
										<th data-field="sybz" data-sortable="true"
											data-sort-name="sybz" data-formatter="sybzFormatter"><spring:message
												code="pubUser.sybz" /></th>
										<!-- 同步标识  -->
										<th data-field="tbbs" width="10%" data-sortable="true"  data-formatter="tbbsFormatter">同步标识</th>
												
										<!-- 操作按钮组 -->		
										<th data-field="operate"
											data-formatter="defaultActionFormatter"><spring:message
												code="operate" /></th>
										
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 内容栏div结束 -->
	</div>
	<!--引入js基础库  -->
	<jsp:include page="/common/template/script_basic_table.jsp" />
	<script type="text/javascript"
		src="<c:url value='/common/static/js/moment.min.js' />"></script>
	<script
		src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script type="text/javascript">
//获取页面权限值
var indexPage;

var viewPer = ${viewPer};
	
//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var sysUserUrl = {
	index : "<c:url value='/sysUser/index' />",/* 主界面 */
	//view : "<c:url value='/sysUser/view' />",/* 查看 */
	synchroData :"<c:url value='/sysUser/synchroData' />",/*单条同步数据*/
	synchroBatch :"<c:url value='/sysUser/synchroBatch' />",/*批量同步数据  */
	getDataByPage : "<c:url value='/sysUser/getDataByPage' />"/* 分页查询 */
};
	
//初始化表格和按钮
$(function () {
	var searchFields = ManageGrid.getSearchFields(table);
	table.bootstrapTable({
	       url: sysUserUrl.getDataByPage,
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
	         	params.yhmc=$.trim($("#yhmc").val());
	            params.lxdh=$.trim($("#lxdh").val());
	            params.sybz=$.trim($("#sybz_select option:selected").val());
	            return params;
	        },
	       onLoadSuccess: function () {
	            if (firstLoadFlag && offset != 0) {
	                table.bootstrapTable("selectPage", offset/limit + 1);
	            }
	            firstLoadFlag = false;
	            setTimeout ("checkByTable()", 100);
	        },
	        toolbar: '#tableToolbar', uniqueId: 'yhbh', clickToSelect: true, sidePagination: 'server', pagination: true
		});
	// 刷新
	$("#refreshBtn").click(function(){
		$('#searchUserForm')[0].reset();
		ManageGrid.refreshTable(table, sysUserUrl.getDataByPage);
	});
	//查询按钮 (未使用)
	$("#searchBtn").click(function(){
		ManageGrid.refreshTable(table, sysUserUrl.getDataByPage);
	});
	//批量同步
	$("#synchroBatch").click(function(){
		 ManageGrid.synchroBatch(table, sysUserUrl.synchroBatch, function(){$("#refreshBtn").click()},"yhbh");
	});
	//加载所属单位目录树(需要修改)
	$("#ssdwmc").focus(function() {
		loadTree();
	});
	
	$(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });
});
	
/* teble点击事件 */
function checkByTable() {
	    if (selectId != "") {
	        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
	        selectedRow.removeClass().addClass("selected");
	    }
}
	
	
//操作formatter
function defaultActionFormatter(value, row) {
		var html = '<div class="action-buttons">';
		html += '<a href="javascript:void(0);" onclick="synchroData(\''+ row.yhbh+ '\')" title="同步"><span class="fa fa-plus-circle" aria-hidden="true"></span></a>';
		html += '</div>';
		return html;
}
//单条同步
function synchroData(yhbh){
	console.log (yhbh);
	Manage.query(sysUserUrl.synchroData,{yhbh:yhbh},function(){$("#refreshBtn").click()});
	
}

function tbbsFormatter(value,row) {
    if('1' == row.tbbs) {
      	 return '<span style="color:red">新增</span>';
    }else if('2' == row.tbbs){
         return '<span style="color:blue">修改</span>';
    }
    return '<span style="color:green">相同</span>';
    
}

var treeDiv;//构建下拉框树
//树形下拉框加载标志，如果加载过就不要执行jstree构建
var treeLoadFlag = false;
//获取所属单位目录树 
function loadTree() {
		treeDiv = Public.dropdown($("#ssdwmc"), '<div id="typeTree" style="padding: 10px;"></div>', {
			onShow:function(){
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
			}
		});
	}
//给子页面调用，关闭层
function closeLayer() {
		layer.close(indexPage);
}
// 给子页面调用，刷新
function refreshTable() {
		firstLoadFlag = true;
		ManageGrid.refreshTable(table, sysUserUrl.getDataByPage);
		
}
</script>
</body>
</html>
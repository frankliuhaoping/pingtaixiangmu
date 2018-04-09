<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/template/head_basic_treeTable.jsp" />
<jsp:include page="/common/template/head_basic_table.jsp" />
<link
	href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					<spring:message code="pubUser.list" />
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<input type="hidden" name="yyid" id="yyid" />
					<div class="col-sm-12">
						<div class="row">
							<div id="appTree" class="col-sm-2" style="border: #ddd solid 1px; margin: 0 10px; padding: 10px 0; overflow: auto;"></div>
							<div class="row table-responsive col-sm-10">
								<div class="input-group col-sm-12" style="padding-bottom: 5px;">
									<div class="input-group col-sm-3">
										<input type="text" id="jsmc"
											placeholder="<spring:message code="pubRole.jsmc" />"
											class="form-control" maxlength="32"> <span
											class="input-group-btn">
											<button type="button" class="btn btn btn-primary"
												id="searchbtn">
												<i class="fa fa-search"></i> 搜索
											</button>
										</span>
									</div>
								</div>
								<table class="table table-bordered table-striped"
									data-mobile-responsive="true">
									<thead>
										<tr>
											<th data-checkbox="true"></th>
											<th data-field="jsid" data-visible="false"><spring:message code="pubRole.jsid" /></th>
											<th data-field="jsmc" data-sortable="true" data-sort-name="jsmc"><spring:message code="pubRole.jsmc" /></th>
											<th data-field="sybz" data-sortable="true" data-sort-name="t.sybz" data-formatter="sybzFormatter"><spring:message code="pubRole.sybz" /></th>
											<th data-field="jsms" data-sortable="true" data-sort-name="jsms"><spring:message code="pubRole.jsms" /></th>
										</tr>
									</thead>
								</table>
								<div class="form-group">
									<div class="col-sm-offset-10 col-sm-2">
										<button type="button" class="btn btn-primary" id="saveBtn">
											<spring:message code="determine" />
										</button>
										&nbsp;&nbsp;
										<button type="button" class="btn btn-default" id="cancelBtn">
											<spring:message code="cancel" />
										</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/common/template/script_basic_treeTable.jsp" />
<jsp:include page="/common/template/script_basic_table.jsp" />
<script src="<c:url value='/common/static/js/frame/jquery.metisMenu.js' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/frame/jquery.slimscroll.min.js?v=1.3.6' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/frame/hplus.min.js?v=4.0.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>

<script type="text/javascript">
var table = $('.table'),resTab = $('#myResTab'),resTabs = $(resTab).find('a'),selectId = '${param.selectId}',limit = '${param.limit}',offset = '${param.offset}',firstLoadFlag = true
,table = $('.table'),appTab = $('#myAppTab'),appTabs = $(appTab).find('li');
var tableConfig;
var selectTreeId;

var pubUserUrl = {
    index: "<c:url value='/pubUser/index' />",
    getDataByPage: "<c:url value='/pubRole/getDataByPage' />"
};

var jsidArr = new Array();
var ojsid = ${jsid};
var yhbh = '${yhbh}';
var yyid = '${param.yyid}';
if(ojsid && "" != ojsid){
	for(var i = 0; i < ojsid.length; i++){
		jsidArr[i] = ojsid[i];
	}
}

var loadFlg = false;
$(function () {
	
	tableConfig = {
	        url: '',
	        queryParams: function (params) {
	            if (limit != "") {
	                if (firstLoadFlag) {
	                    params.limit = parseInt(limit);
	                    params.offset = parseInt(offset);
	                }
	            }
	            params.yyid = getYyid();
                params.jsmc = $('#jsmc').val();
	            limit = params.limit;
	            offset = params.offset;
	            return params;
	        },
	        onLoadSuccess: function () {
	            if (firstLoadFlag && offset != 0) {
	                table.bootstrapTable("selectPage", offset/limit + 1);
	            }
	            firstLoadFlag = false;
	            // 加载完数据后进行选中处理
	            setTimeout ("checkByTable()", 100);
                loadFlg = false;
	            //console.log (table.bootstrapTable("getOptions"));
	        },
	        onCheck: function (row) {
                var rows = new Array();
                rows.push(row);
                addJsid(rows);
            },
            onUncheck: function (row) {
                var rows = new Array();
                rows.push(row);
                reomveJsid(rows);
            },
            onCheckAll: function (rows) {
                addJsid(rows);
            },
            onUncheckAll: function (rows) {
                reomveJsid(rows);
            },
	        toolbar: '#tableToolbar', uniqueId: 'jsid', clickToSelect: true, sidePagination: 'server', pagination: true
	    };
	
	$("#searchbtn").click(function(){
    	ManageGrid.refreshTable(table, pubUserUrl.getDataByPage);
    });
	 
	$("#appTree").jstree({
        'checkbox': {
            'keep_selected_style': false
        },
        'core' : {
            'data' : {
                "url" : "${pageContext.request.contextPath}/pubRole/getTree",
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
            ManageGrid.refreshTable(table, pubUserUrl.getDataByPage+"?yyid="+selectTreeId);
        } else {
            tableConfig.url = pubUserUrl.getDataByPage+"?rand="+Math.random()+"&yyid="+selectTreeId;
            table.bootstrapTable(tableConfig);
        }
    });
});

// 保存按钮
$('#saveBtn').click(function(){
	if(jsidArr.length == 0 && ojsid.length == 0){
		Layer.msg('<spring:message code="checkOneOrMultiple" />');
	}else{
		Manage.save("<c:url value='/pubUser/saveAuth' />", {id:jsidArr,yhbh:yhbh,jsid:ojsid}, function(){
			$('#cancelBtn').click();
		});
	}
});

// 取消按钮
$('#cancelBtn').click(function(){
    Manage.url(pubUserUrl.index, {limit: '${param.limit}', offset: '${param.offset}', selectId: '${param.id}'});
}); 

// 单条选中数据行处理
function checkByTableSingle(selectId,datas) {
	var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
	for(var i = 0;i < datas.length; i++){
		if(selectId == datas[i].jsid){
			table.bootstrapTable('check',i);
			selectedRow.removeClass().addClass("selected");
			return false;
		}
	 }
}

// 添加角色id
function addJsid(rows){
	if(loadFlg){
		return false;
	}
	for(var i = 0;i < rows.length; i++){
		var jsid = rows[i].jsid;
		if(!jsidArr.contains(jsid)){
			jsidArr.push(jsid);
		}
	}
}

// 删除角色id
function reomveJsid(rows){
	for(var i = 0;i < rows.length; i++){
		var jsid = rows[i].jsid;
		if(jsidArr.contains(jsid)){
			jsidArr.remove(jsid);
		} 
	}
}

Array.prototype.contains = function (obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
}

Array.prototype.remove = function(val) {
	for(var i = 0; i< this.length; i++) {
	   if(this[i] == val) {
	     	this.splice(i, 1);
	    	break;
	   }
	}
}

// 选择表格中已添加的角色
function checkByTable() {
    var datas = table.bootstrapTable('getData');
    if(jsidArr.length > 0){
        for(var i = 0;i < jsidArr.length; i++){
        	checkByTableSingle(jsidArr[i],datas);
        }
    }
    /* if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    } */
}

// 使用标志格式化
function sybzFormatter(value, opts, row) {
    if('Y' == value) {
        return '<span style="color:green"><spring:message code="enable" /></span>';
    }else if('N' == value){
    	 return '<span style="color:red"><spring:message code="disable" /></span>';
    }
    return '';
}

// 查询角色
function queryRole(yyid,tabIndex){
	$.each(resTabs,function(i,item){
		$(this).removeClass('active');
	});
	$(resTabs[tabIndex]).addClass('active');
	$('#jsmc').val('');
	ManageGrid.refreshTable(table, pubUserUrl.getDataByPage);
}

// 获取yyid
function getYyid(){
	return $(resTab).find('.active').attr('value');
}

</script>
</body>
</html>
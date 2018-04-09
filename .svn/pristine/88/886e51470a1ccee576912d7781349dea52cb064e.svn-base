<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
      <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
      <%--左边列表树 begin --%>
<!--        <div class="col-sm-2" style="padding-left:0;padding-right:0;"> -->
<!--          <div class="ibox float-e-margins"> -->
<!--             <div class="ibox-title"> -->
<!--                <h5>机器管理</h5> -->
<!--             </div> -->
<!--             <div class="ibox-content pb10"> -->
<!-- 	            <div class="clearfix"> -->
<!-- 	               <input type="hidden" id="zdbh" name="zdbh"> -->
<%-- 	               <input type="hidden" id="serviceUrl" name="serviceUrl" value="${serviceUrl}"> --%>
<!-- 	               <div id="appTree" style="border: #ddd solid 1px; padding: 10px 0;overflow:auto;"></div> -->
<!-- 	             </div> -->
<!--             </div> -->
<!--          </div> -->
<!--         </div> -->
        <%--左边列表树 end --%>
        
        <%--右边数据显示 begin --%>
        <div class="col-sm-10" style="padding-left:10px;padding-right:0;">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>机器信息</h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                    	<button id="removeBtn" type="button" class="btn" title="<spring:message code="remove" />">
                          	<i class="fa fa-times-circle"></i>&nbsp;<spring:message code="batchRemove"/>
                      	</button>
	                    <button id="refreshBtn" type="button" class="btn">
                            <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
                        </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="tableToolbar">
                            
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped" data-mobile-responsive="true">
                                <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="userName" data-sort-name="userName">用户名</th>
                                        <th data-field="osInfo" data-sort-name="osInfo">操作系统</th>
                                        <th data-field="address" data-sort-name="address"  >ip地址</th>
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
    <%--右边数据显示 end --%>
  </div>
<jsp:include page="/common/template/script_basic_table.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript">
//操作id和分页信息记录
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
var indexPage;
var jstreeFlag = true;
var viewCacheName;
//table对象
var table = $('.table');
//url定义
var sigarManagerUrl = {
    index: "<c:url value='/sigarManager/index' />",
    view: "<c:url value='/sigarManager/view/' />",
    getData: "<c:url value='/sigarManager/getData' />",
    getListTree:"<c:url value='/sigarManager/getListTree' />"
};
//初始化表格和按钮
$(function () {
	//初始化左边的列表树
	initTree();
	
    $("#refreshBtn").click(function(){
    	var zdbh =$.trim($("#zdbh").val());
    	 var param = 
		  {
				  zdbh : zdbh	  
		  }
        ManageGrid.refreshTable(table, sigarManagerUrl.getData,param);
    });
     
});

//初始化左边的系统列表
function initTree()
{
	 $("#appTree").jstree({
	        'checkbox': {
	            'keep_selected_style': false
	        },
	        'core' : {
	            'data' : {
	                "url" : sigarManagerUrl.getListTree,
	                "data" : function (node) {
	                
	                }
	            }
	        }
	    // 默认选中根节点
	    }).on('loaded.jstree', function(e, data){
	        var inst = data.instance;//TODO 处理没有节点的情况
	        var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);
	        selectTreeId = obj.id;
	        inst.select_node(obj);
	        $("#zdbh").val(selectTreeId);
	        //树节点加载完毕，根据默认的字典编号加载对应的数据
	        initTable();
	        
	    //树节点改变的时候
	    }).on('select_node.jstree', function (e, data){
	  	  selectTreeId = data.selected[0];
		  $("#zdbh").val(selectTreeId);
		  var zdbh =$.trim($("#zdbh").val());
		  //数节点改变时根据字典编号请求对应的数据，刷新数据表
		  if(!jstreeFlag)
		  {
			  var param = 
			  {
					  zdbh : zdbh	  
			  }
			  ManageGrid.refreshTable(table, sigarManagerUrl.getData,param);
		  }
	    });;   
}


//初始化表格
function initTable()
{
	  //获取字典的编号
	    table.bootstrapTable({
	        url: sigarManagerUrl.getData + "?zdbh="+selectTreeId,
	        toolbar: '#tableToolbar',uniqueId: 'userName', clickToSelect: true,pagination: true 
	    }); 
	    jstreeFlag = false;
}

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

//ipaddress formatter
function addressFormatter (value) {
    var html = '';
    $.each (value, function(index,ipaddress){
        html += ipaddress + "/";
    }); 
    return html;
}

//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    html += '<a href="javascript:void(0);" onclick="view()" title="查看cpu"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    html += '</div>';
    return html;
}

//查看具体cpu
function view() {
	var zdbh =$.trim($("#zdbh").val());
	indexPage = Layer.openIframeByOptions(sigarManagerUrl.view + zdbh+"?zdbh="+zdbh,{});
}


//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	 $("#refreshBtn").click();
}
</script>
</body>
</html>
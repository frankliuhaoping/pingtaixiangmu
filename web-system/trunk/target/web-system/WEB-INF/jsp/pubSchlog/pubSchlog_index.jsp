<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="pubSchlog.select" /></h5>
            </div>
            <div class="ibox-content clearfix">
				<form class="form-horizontal labelpd0" id="searchUserForm">
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubSchlog.rwmc" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="rwmc" name="rwmc" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubSchlog.zxip" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="zxip" name="zxip" class="form-control">
                         </div>
                      </div>
                      <div class="form-group col-sm-3">
	                  	  <label class="col-sm-3 control-label"><spring:message code="pubSchlog.zxzt" />:</label>
	                      <div class="col-sm-9">
                              <select id="zxzt_select" class="form-control">
                        		  <option value =""></option>
								  <option value ="1">成功</option>
								  <option value ="0">失败</option>
							  </select>
                          </div>
	                  </div>
	                  
	                   <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubSchlog.fwdm" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="fwdm" name="fwdm" class="form-control">
                         </div>
                      </div>
                      
                      <div class="form-group col-sm-3">
                            <label class="col-sm-3 control-label"><spring:message code="pubSchlog.zxsjE" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="zxsjE" name="zxsjE" digits="true" class="form-control">
                         </div>
                      </div>
                     
                       <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="pubSchlog.zxsjS" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="zxsjS" name="zxsjS" digits="true" class="form-control">
                            </div>
                       </div>
                   
                   
                        <div class="form-group col-sm-3">
                            <label class="col-sm-3 control-label"><spring:message code="starttime" />:</label>
                            <div class="col-sm-9">
                                <input type="text" id="starttime" name="starttime" readonly="readonly" class="form-control timebox" >
                            </div>
                         </div>
                         <div class="form-group col-sm-3">
                            <label class="col-sm-3 control-label"><spring:message code="endtime" />:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control timebox" id="endtime" readonly="readonly" name="endtime" >
                            </div>
                         </div>
                         <div class="form-group col-sm-12">
                               <div class="col-sm-12" style="text-align:right;">
                                   <button type="button" id="searchBtn" class="btn btn-primary">
                                       <i class="glyphicon glyphicon-search"></i>&nbsp;<spring:message code="find" />
                                   </button>
                                   <button type="reset" id="resetBtn" class="btn btn-default">
                                       <i class="glyphicon glyphicon-repeat"></i>&nbsp;<spring:message code="reset" />
                                   </button>
                               </div>
                         </div>
                  
                </form>
            </div>
        </div>
        
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><spring:message code="pubSchlog.list" /></h5>
                <div class="ibox-tools">
                    <c:set var='viewPer' value='false' />
                    <div class="btn-group hidden-xs mt8" role="group">
	                    <button id="refreshBtn" type="button" class="btn">
	                         <i class="fa fa-refresh"></i>&nbsp;<spring:message code="refresh" />
	                    </button>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <div class="clearfix">
                    <div id="tableToolbar">
                        <div class="form-inline" role="form">
                            <shiro:hasPermission name="sys:pubSchlog:view">
                                <c:set var='viewPer' value='true' />
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped" height="auto">
                            <thead>
                                <tr>
                                    <th data-checkbox="true"></th>
                                    <th data-field="rwzxid" data-visible="false"><spring:message code="pubSchlog.rwzxid" /></th>
                                    <th data-field="rwmc" data-sortable="true" data-sort-name="rwmc"><spring:message code="pubSchlog.rwmc" /></th>
                                    <th data-field="zxip" data-sortable="true" data-sort-name="zxip"><spring:message code="pubSchlog.zxip" /></th>
                                    <th data-field="zxzt" data-sortable="true" data-sort-name="zxzt" data-formatter="zxztFormatter"><spring:message code="pubSchlog.zxzt" /></th>
                                    <th data-field="zxsj" data-sortable="true" data-sort-name="zxsj"><spring:message code="pubSchlog.zxsj" /></th>
                                    <th data-field="cjsj" data-sortable="true" data-sort-name="cjsj" data-formatter="dateFormatter"><spring:message code="cjsj" /></th>
						<th data-field="fwdm" data-sortable="true" data-sort-name="fwdm"><spring:message code="pubSchlog.fwdm" /></th>
                                    <th data-field="cron" data-sortable="true" data-sort-name="cron"><spring:message code="pubSchlog.cron" /></th>
                                    <th data-field="operate" data-formatter="actionFormatter"><spring:message code="operate" /></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/common/template/script_basic_table.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script src="<c:url value='/common/static/plugins/laydate/laydate.js' />" type="text/javascript"></script>
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
var pubSchlogUrl = {
    index: "<c:url value='/pubSchlog/index' />",
    view: "<c:url value='/pubSchlog/view/' />",
    getDataByPage: "<c:url value='/pubSchlog/getDataByPage' />"
};
//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: pubSchlogUrl.getDataByPage,
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
            
            params.rwmc = $.trim($('#rwmc').val());		//任务名称
            params.zxip = $.trim($('#zxip').val());	//服务端ip
            params.zxzt = $.trim($("#zxzt_select option:selected").val());
            params.zxsjS = $("#zxsjS").val();//执行时间大于
            params.zxsjE = $("#zxsjE").val();//执行时间小于
            params.fwdm = $("#fwdm").val();//服务代码
            params.starttime = $("#starttime").val();//创建时间大于
            params.endtime = $("#endtime").val();//创建时间小于
            return params;
        },
        onLoadSuccess: function () {
            if (firstLoadFlag && offset != 0) {
                table.bootstrapTable("selectPage", offset/limit + 1);
            }
            firstLoadFlag = false;
            setTimeout ("checkByTable()", 100);
        },
        toolbar: '#tableToolbar', uniqueId: 'rwzxid', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    
    $("#searchBtn").click(function(){
        ManageGrid.refreshTable(table, pubSchlogUrl.getDataByPage);
    });
    
    //刷新按钮点击事件，首先清空表单内容
    $("#refreshBtn").click(function(){
    	$('#searchUserForm')[0].reset();
        ManageGrid.refreshTable(table, pubSchlogUrl.getDataByPage);
    });
    
    $(window).resize(function(){
    	if(indexPage){
    		layer.full(indexPage);
    	}
    });
    
    laydate.skin('molv');
    laydate({
       elem: '#starttime',
       istime: true,
       format: 'YYYY-MM-DD hh:mm:ss'
    });
    
    laydate({
       elem: '#endtime',
       istime: true,
       format: 'YYYY-MM-DD hh:mm:ss'
    });
});

function checkByTable() {
    if (selectId != "") {
        var selectedRow = $("tr[data-uniqueid$='" + parseInt(selectId) +"']");
        selectedRow.removeClass().addClass("selected");
    }
}

//操作formatter
function actionFormatter(value, row) {
    var html = '<div class="action-buttons">';
    if (viewPer) {
        html += '<a href="javascript:void(0);" onclick="view(\''+row.rwzxid+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    }
    html += '</div>';
    return html;
}

// 查看定时任务
function view(rowId) {
	indexPage = Layer.openIframeByOptions(pubSchlogUrl.view + rowId,{});
}

//时间处理formatter
function dateFormatter (value, row) {
    var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
    return html;
}

//执行状态formatter
function zxztFormatter(value, row) {
    if(value == null || value.trim() == ""){
        return "-";
    } else {
    	var zxztVal = '<font color="#006000"><spring:message code="pubSchlog.zxztSuccess" /></font> ';
        if (value == 0) {
            zxztVal = '<font color="#FF0000"><spring:message code="pubSchlog.zxztFailure" /></font>';
        }
        return zxztVal;
    }
}
//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, pubSchlogUrl.getDataByPage);
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic_table.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
     <%--查询条件  begin  --%>
     <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><i class="fa fa-file-text-o mt2 mr5"></i><spring:message code="cacheManagerDetail.select" /></h5>
            </div>
            <div class="ibox-content clearfix">
            	<form method="get" class="form-horizontal labelpd0" id="searchUserForm">
            		  <div class="form-group col-sm-3">
                         <label class="col-sm-3 control-label"><spring:message code="cacheManagerDetail.objectKey" />:</label>
                         <div class="col-sm-9">
                             <input type="text" id="objectKey" name="objectKey" class="form-control"  >
                             <!-- onkeyup="this.value=this.value.replace(/\D/g,'')" --> 
                         </div>
                      </div>
	                  <div class="form-group col-sm-9">
						<div class="col-sm-15" style="text-align:right;">
							<button type="button" id="searchBtn" class="btn btn-primary">
								<i class="glyphicon glyphicon-search fz12" aria-hidden="true"></i>&nbsp;<spring:message code="find" />
							</button>
							<button type="reset" id="resetBtn" class="btn btn-default">
								<i class="glyphicon glyphicon-repeat fz12" aria-hidden="true"></i>&nbsp;<spring:message code="reset" />
							</button>
						</div>
					</div>
            	</form>
            </div>
        </div>
        <%--查询条件  end  --%>
        
        <%--  数据列表  begin --%>
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><spring:message code="cacheManagerDetail.list" /></h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                        <div class="btn-group hidden-xs" role="group">
                        	<button id="removeBtn" type="button" class="btn" title="<spring:message code="remove" />">
                                <i class="fa fa-times-circle"></i>&nbsp;删除
                            </button>
                            <button id="refreshBtn" type="button" class="btn" title="<spring:message code="refresh" />">
                                <i class="fa fa-refresh"></i>&nbsp;刷新
                            </button>
                            <button type="button" class="btn" id="backBtn">
                            	<i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" />
                            </button>
                        </div>
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
                                        <th data-field="objectKey"><spring:message code="cacheManagerDetail.objectKey" /></th>
                                        <th data-field="hitCount"><spring:message code="cacheManagerDetail.hitCount" /></th>
                                        <th data-field="size"><spring:message code="cacheManagerDetail.size" /></th>
                                        <th data-field="creationTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.creationTime" /></th>
                                        <th data-field="latestOfCreationAndUpdateTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.latestOfCreationAndUpdateTime" /></th>
                                        <th data-field="lastAccessTime" data-formatter="dateFormatter"><spring:message code="cacheManagerDetail.lastAccessTime" /></th>
                                        <th data-field="expirationTime" data-formatter=dateFormatterYear><spring:message code="cacheManagerDetail.expirationTime" /></th>
                                        <th data-field="timeToIdle" data-formatter=dateFormatter><spring:message code="cacheManagerDetail.timeToIdle" /></th>
                                        <th data-field="version"><spring:message code="cacheManagerDetail.version" /></th>
                                        <%-- <th data-field="objectValue" data-width="25%"><spring:message code="cacheManagerDetail.objectValue" /></th> --%>
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
<jsp:include page="/common/template/script_basic_table.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script type="text/javascript">
//操作id和分页信息记录
var indexPage;

var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//父类的字典编号
var zdbh = parent.$('#zdbh').val();
 var viewCacheName = parent.viewCacheName;
//table对象
var table = $('.table');
//url定义
var cacheDetailsManagerUrl = {
    index: "<c:url value='/cacheManager/view/' />" + viewCacheName,
    getDetails: "<c:url value='/cacheManager/getDetails/' />",
    getDataByPage: "<c:url value='/cacheManager/getDataByPage' />",
    remove: "<c:url value='/cacheManager/deleteDetails' />",
    view: "<c:url value='/cacheManager/viewDetail/' />" + viewCacheName + "/"+zdbh+"/",
    removeBatch: "<c:url value='/cacheManager/deleteBatchDetails/' />" + viewCacheName+"/"+zdbh,
    select:"<c:url value='/cacheManager/select' />"
};

//初始化表格和按钮
$(function () {
    var searchFields = ManageGrid.getSearchFields(table);
    table.bootstrapTable({
        url: cacheDetailsManagerUrl.getDataByPage,
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
            params.zdbh = zdbh;
            params.cacheName = viewCacheName;
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
        toolbar: '#tableToolbar', uniqueId: 'id', clickToSelect: true, sidePagination: 'server', pagination: true
    });
    //返回
    $('#backBtn').click(function(){
    	parent.refreshTable();
    	parent.closeLayer();
    });
    //查询按钮点击
    $('#searchBtn').click(function(){
    	var param = 
        {
        	objectKey:$.trim($('#objectKey').val())
        }
        ManageGrid.refreshTable(table,cacheDetailsManagerUrl.select,param);
    });
    // 批量删除缓存
    $("#removeBtn").click(function(){
        ManageGrid.deleteMultiple(table, cacheDetailsManagerUrl.removeBatch, function(){window.location.href = cacheDetailsManagerUrl.index + "?limit=" + limit + "&offset=" + offset;}, "objectKey");
    });
    //刷新
    $("#refreshBtn").click(function(){
        $('#searchUserForm')[0].reset();
        var param = 
        	{
        		zdbh:'${zdbh}'
        	}
        ManageGrid.refreshTable(table, cacheDetailsManagerUrl.getDataByPage);
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
    html += '<a href="javascript:void(0);" onclick="view(\''+row.objectKey+'\')" title="<spring:message code="view" />"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>';
    html += '<a href="javascript:void(0);" onclick="del(\''+row.objectKey+'\')" title="<spring:message code="remove" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>';
    html += '</div>';
    return html;
}

function dateFormatter (value, row) {
    var html = moment(value).format('YYYY-MM-DD HH:mm:ss');
    return html;
}

function dateFormatterYear (value, row) {
	value = value.toString();
	value = value.substring(0,value.length-4);
    var html = moment(parseInt(value)).format('YYYY-MM-DD HH:mm:ss');
    return html;
}
//删除缓存
function del(rowId) {
    ManageGrid.deleteSingle(cacheDetailsManagerUrl.remove+"?cacheName="+viewCacheName+"&zdbh="+zdbh+"&objectKey="+rowId, function(){window.location.href = cacheDetailsManagerUrl.index + "?limit=" + limit + "&offset=" + offset;});
}

//查看细节
function view(rowId) {
	indexPage = Layer.openIframeByOptions( cacheDetailsManagerUrl.view  + rowId,{});
}

//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, cacheManagerUrl.getDataByPage);
}
</script>
</body>
</html>
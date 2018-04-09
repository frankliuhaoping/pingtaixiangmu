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
     
        <%--查询条件  end  --%>
        
        <%--  数据列表  begin --%>
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5>CPU详情</h5>
                <div class="ibox-tools">
                    <div class="btn-group hidden-xs mt8" role="group">
                        <div class="btn-group hidden-xs" role="group">               
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
                    <div id="serverInfo_cpu" class="col-sm-12">
                    
                        <div id="cpu_show">
                        dfsdf
                        </div>
                  
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/common/template/script_basic_table.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
<script src="<c:url value='/common/static/plugins/echarts/echarts.js' />" type="text/javascript"></script>
<script type="text/javascript">

//操作id和分页信息记录
var indexPage;
var selectId = '${param.selectId}';
var limit = '${param.limit}';
var offset = '${param.offset}';
var firstLoadFlag = true;
//table对象
var table = $('.table');
//url定义
var systemManagerUrl = {
	 getData: "<c:url value='/systemManager/getData'/>"
};

//初始化表格和按钮
$(function () {	
	var cpu = document.getElementById("cpu_show");
	var cpuChart=echarts.init(cpu);
	var option ={
			tooltip:{
				formatter:"{a}<br/>{b}:{c}%"
			},
			series:[
			     {
			    	 name:'cpu使用率',
			    	 type:'gauge',
			    	 detail:{
			    		 formatter:'{value}%'
			    	 },
			    	 data:[{value:0,name:'使用率'}]
			     }
		    ]
	};
// 	cpuChart.setOptin(option,true);
// 	setInterval(function(){
// 		option.series[0].data[0].value=(Math.random()*100).toFixed(2)-0;
// 		cpuChart.setOption(option,true);
// 	});
    //返回
    $('#backBtn').click(function(){
    	parent.refreshTable();
    	parent.closeLayer();
    });
    //刷新
    $("#refreshBtn").click(function(){
        $('#searchUserForm')[0].reset();
        var param = 
        	{
        		zdbh:'${zdbh}'
        	}
        ManageGrid.refreshTable(table, sigarManagerUrl.getCpuInfos);
    });
});


//给子页面调用，关闭层
function closeLayer() {
	layer.close(indexPage);
}

// 给子页面调用，刷新
function refreshTable() {
	firstLoadFlag = true;
	ManageGrid.refreshTable(table, sigarManagerUrl.getDataByPage);
}
</script>
</body>
</html>
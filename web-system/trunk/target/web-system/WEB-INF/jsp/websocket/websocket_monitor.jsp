<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <%--  websocket监控页面主页 --%>>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><i class="fa fa-file-text-o mt2 mr5"></i>频道监控</h5>
            </div>
            <div class="ibox-content ">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped"  treeGrid="true" height="auto">
                                <thead>
                                    <tr>
                                        <th width="20%" style="text-align:center">频道名称</th>
                                        <th width="80%" style="text-align:center"><spring:message code="pubUser.yhzh" /></th>
                                    </tr>
                                </thead>
                                <tbody id="channelUser">
                               
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><i class="fa fa-calculator mt2 mr5"></i>用户监控</h5>
                <div class="ibox-tools">
                </div>
            </div>
            <div class="ibox-content ">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped"  treeGrid="true" height="auto">
                                <thead>
                                    <tr>
                                        <th width="20%" style="text-align:center"><spring:message code="pubUser.yhzh" /></th>
                                        <th width="80%" style="text-align:center">频道名称</th>
                                    </tr>
                                </thead>
                                <tbody id="userChannel">
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <jsp:include page="/common/template/head_basic_table.jsp" />
 <script type="text/javascript" src="<c:url value='/common/static/js/frame/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	//一个频道多个用户
	$.ajax({
		type:'post',             //请求方式
		url:"<c:url value='/websocket/channelUserMonitor' />",//地址
		async:false,             //是否异步
		dataType:'json',         //数据返回类型
		success:function(result){//请求正常返回
			//一个频道多个用户
			if(result){
				var str = "";
				$.each(result,function(key,val){
					str += "<tr>" +
					   "<td style='text-align:center'>" + key + "</td>" +
					   "<td style='text-align:center'>" + "[ "+val+ " ]"+"</td>" +
					   "</tr>";
				});
				$('#channelUser').append(str);
			}
		},
		error:function(){      //请求错误
			console.log("数据请求发生错误,请重新请求或刷新!","error");
		}
	});
	
	//一个用户多个频道
	$.ajax({
		type:'post',             //请求方式
		url:"<c:url value='/websocket/userChannelMonitor' />",//地址
		async:false,             //是否异步
		dataType:'json',         //数据返回类型
		success:function(result){//请求正常返回
			//一个用户多个频道
			if(result){
				var str = "";
				$.each(result,function(key,val){
					str += "<tr>" +
					   "<td style='text-align:center'>" + key + "</td>" +
					   "<td style='text-align:center'>" + "[ "+val+" ]"+"</td>" +
					   "</tr>";
				});
				$('#userChannel').append(str);
			}
		},
		error:function(){      //请求错误
			console.log("数据请求发生错误,请重新请求或刷新!");
		}
	});
});
</script>
</body>
</html>
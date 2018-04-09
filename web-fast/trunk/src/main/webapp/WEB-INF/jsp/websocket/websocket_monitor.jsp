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
                <h5><i class="fa fa-file-text-o mt2 mr5"></i>websocket session监控</h5>
            </div>
            <div class="ibox-content ">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped"  treeGrid="true" height="auto">
                                <thead>
                                    <tr>
                                        <th><spring:message code="pubApp.yydm" /></th>
                                        <th><spring:message code="pubUser.yhzh" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${userSocketSessionMap}" var="socketSessionMap">
                                    <c:forEach items="${socketSessionMap.value}" var="userSocketMap">
                                    <tr>
                                        <td>${socketSessionMap.key}</td>
                                        <td>${userSocketMap.key}</td>
                                    </tr>
                                    </c:forEach>
                                </c:forEach>
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="ibox float-e-margins mt10">
            <div class="ibox-title">
                <h5><i class="fa fa-calculator mt2 mr5"></i>频道监控</h5>
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
                                        <th><spring:message code="pubApp.yydm" /></th>
                                        <th>频道名称</th>
                                        <th><spring:message code="pubUser.yhzh" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${channelMap}" var="channelMap">
                                    <c:forEach items="${channelMap.value}" var="userMap">
                                    <tr>
                                        <td>${channelMap.key}</td>
                                        <td>${userMap.key}</td>
                                        <td>${userMap.value}</td>
                                    </tr>
                                    </c:forEach>
                                </c:forEach>
                            </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/template/head_basic.jsp" />
	<link rel="stylesheet" href="<c:url value='/common/static/plugins/webuploader/webuploader.css' />">
    <link rel="stylesheet" href="<c:url value='/common/static/plugins/webuploader/style.css' />">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>测试多文件上传</h5>
			</div>
			<div class="ibox-content">
			    <form class="form-horizontal formW60p">
				    <div class="form-group">
                       <label class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;文件:</label>
                       <div class="col-sm-9">
                           <div id="uploader">
                               <div class="queueList">
                                   <div id="dndArea" class="placeholder">
                                       <div id="filePicker">选择文件</div>
                                       <p>或将文件拖到这里，最多可选50个</p>
                                   </div>
                               </div>
                               <div class="statusBar" style="display:none;">
                                   <div class="progress">
                                       <span class="text">0%</span>
                                       <span class="percentage"></span>
                                   </div>
                                   <div class="info"></div>
                                   <div class="btns">
                                       <div id="filePicker2">继续添加</div><div class="uploadBtn">开始上传</div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                </form>
			</div>
		</div>
	</div>

<jsp:include page="/common/template/script_basic.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/plugins/webuploader/webuploader.nolog.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/upload.js' />"></script>
<script type="text/javascript">
//文件上传
var uploader = initWebUploader('<c:url value="/uploadify/upload?dir=resource" />', '<c:url value="/common/static/plugins/webuploader/Uploader.swf" />', '<c:url value="/common/static/plugins/webuploader/expressInstall.swf" />',
{
    fileSingleSizeLimit: 500 * 1024 * 1024,
    fileSizeLimit: 10000 * 1024 * 1024,
    fileNumLimit: 50,
    acceptExtensions: null,
    uploadSuccess: function(file, response) {
    	// 通过response可以拿到多个存储路径，结合具体表单进行处理
    	console.log (response._raw);
    }
});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/template/head_basic.jsp" />
	<link rel="stylesheet" href="<c:url value='/common/static/plugins/webuploader/webuploader.css' />">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>测试一个图片上传</h5>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-2" style="padding-right: 0; padding-left: 45px;">
						<div class="portrait">
							<div class="thumbnail tx"><img src="<c:url value='/common/static/img/touxiang.jpg'/>"></div>
    						<div id="filePicker">选择图片</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/common/template/script_basic.jsp" />
<script type="text/javascript" src="<c:url value='/common/static/plugins/webuploader/webuploader.nolog.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/portrait.js' />"></script>
<script type="text/javascript">
// 缩略图上传
var uploader = initPhotoUploader('<c:url value="/uploadify/upload" />', '<c:url value="/common/static/plugins/webuploader/Uploader.swf" />',
{
	fileSingleSizeLimit: 200 * 1024,
	uploadSuccess: function(file, response) {
		// 通过response可以拿到存储路径，结合具体表单进行处理
	    console.log (response._raw);
	}
});
</script>
</body>
</html>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<script src="<c:url value='/common/static/js/frame/jquery.min.js?v=1.11.3' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/bootstrap/js/bootstrap.min.js?v=3.3.5' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/plugins/layer/layer.js?v=2.3' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/frame/content.min.js?v=4.0.0' />" type="text/javascript"></script>
<script src="<c:url value='/common/static/js/manage.js?v=1.0' />" type="text/javascript"></script>

<c:set var="webAppUrl" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
var webAppUrl = '${webAppUrl}';
</script>

<!--[if lt IE 9]>
  	<script src="<c:url value='/common/static/js/frame/html5shiv.js' />" type="text/javascript"></script>
  	<script src="<c:url value='/common/static/js/frame/respond.min.js' />" type="text/javascript"></script>
<![endif]-->
<script type="text/javascript">
    function goHome() {
        if(window.top !== window.self){
            window.top.location = "<c:url value='/index'/>";
        }
    }
</script>
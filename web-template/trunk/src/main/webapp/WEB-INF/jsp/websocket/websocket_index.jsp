<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Socket JavaScript Echo Client</title>
</head>

<body class="gray-bg">
    <h1>Echo Server</h1>
    <div style="float: left;text-align: left;">
        <form action="">
            <input onclick="send_echo('join')" value="join"
                type="button"> <input id=channleId name="channleId"
                value="channleId" type="text">
            <input onclick="send_echo('quit')" value="quit"
                type="button"><br>
            <input onclick="send_echo('unicast')" value="send websocket request"
                type="button"> <input id="toUser" name="toUser"
                value="sadmin,lizhuo1,lizhuo2,test123" type="text"> <input id="textID1" name="textID1"
                value="unicast" type="text"><br>
            <input onclick="send_echo('multicast')" value="send websocket request"
                type="button"> <input id="textID" name="textID"
                value="Hello world, Web Sockets" type="text"> <br>
                
        </form>
        <textarea id="output" style="height:500px; width:400px"></textarea>
    </div>
    
</body>

<jsp:include page="/common/template/script_basic_table.jsp" />
<script language="javascript" type="text/javascript">
function send_echo(type) {
    //echo_websocket = new SockJS("ws://192.168.0.198:8088/web-system/ws") ;   //初始化 websocket
    var msgContent = $("#textID").val();
    if (type == "unicast") {
        msgContent = $("#textID1").val();
    }
    var url = document.URL;
    url = url.replace(url.split("/")[0] + "//" + url.split("/")[2], "");
    var webSocketMsg = {
            type : type,
            url: url,
            channleId : $("#channleId").val(),
            msg : msgContent,
            toUser : $("#toUser").val().split(","),
    };
    console.log (JSON.stringify(webSocketMsg));
    top.echo_websocket.send(JSON.stringify(webSocketMsg));
}

function update(msg) {
    var originalText = $("#output").val();
    if (originalText != "") {
        $("#output").val(originalText + "\n" + msg);
    } else {
        $("#output").val(msg);
    }
}
</script>
</html>
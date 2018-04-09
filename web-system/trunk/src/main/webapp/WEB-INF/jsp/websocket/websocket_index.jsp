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
            <input onclick="send_echo('join')" value="连接" type="button"> 
            <input id=channleId name="channleId" value="PUBLIC_CHANNEL" type="text"> 
            
            <input onclick="send_echo('quit')" value="退出"type="button"><br>
            
            <input onclick="send_echo('unicast')" value="单播发送" type="button"> 
            <input id="toUser" name="toUser" value="sadmin,lizhuo1,lizhuo2,test123" type="text">
             <input id="textID1" name="textID1"value="给某个某些人发的消息" type="text"><br>
             
            <input onclick="send_echo('multicast')" value="组播发送"type="button"> 
            <input id="textID" name="textID" value="给所有频道发的消息" type="text"> <br>
                
        </form>
        <textarea id="output" style="height:500px; width:400px" ></textarea>
    </div>
    
</body>

<jsp:include page="/common/template/script_basic_table.jsp" />
<script language="javascript" type="text/javascript">
//发送消息，类别固定（连接join,退出quit,单播unicast,组播multicast）
function send_echo(type) {
    //echo_websocket = new SockJS("ws://192.168.0.198:8088/web-system/ws") ;   //初始化 websocket
    //组播的消息内容
    var msgContent = $("#textID").val();
    if (type == "unicast") {
    	//单播的消息内容
        msgContent = $("#textID1").val();
    }
    var url = document.URL;
    url = url.replace(url.split("/")[0] + "//" + url.split("/")[2], "");
    //消息的发送格式
    var webSocketMsg = {
            type : type,
            url: url,
            channleId : $("#channleId").val(),
            msg : msgContent,
            toUser : $("#toUser").val().split(","),
    };
   console.log ("消息发送 =" + JSON.stringify(webSocketMsg));
   //消息发送
    top.echo_websocket.send(JSON.stringify(webSocketMsg));
}

//有消息传送则显示在textare 文本框中
function update(msg) {
	var originalText = $("#output").val();
	//如果内容不为空 则在原来的内容上换行加上新的消息
    if (originalText != "") {
        $("#output").val(originalText + "\n" + msg);
    } else {
        $("#output").val(msg);
    }
}

</script>
</html>
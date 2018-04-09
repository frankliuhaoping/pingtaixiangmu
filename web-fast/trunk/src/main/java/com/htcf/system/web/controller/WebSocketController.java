/** 
 * Project Name:web-system 
 * File Name:WebSocketController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年4月14日上午9:49:02 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.htcf.frame.base.model.WebSocketMsg;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.system.service.WebSocketService;
import com.htcf.system.web.websocket.HtcfWebSocketHandler;
import com.htcf.system.web.websocket.WebSocketConstant;


/** 
 * ClassName: WebSocketController <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2017年4月14日 上午9:49:02 <br/> 
 * 
 * @author chenshizhe 
 */

@Controller
@RequestMapping("/websocket")
public class WebSocketController {
	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(WebSocketController.class);
	

	@Autowired
	HtcfWebSocketHandler handler;

	@Autowired
	private WebSocketService webSocketService;

	
	
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到websocket index界面");
		return "/websocket/websocket_index";
	}

	
	@RequestMapping(value = "/sendMessage")
	public void sendMessage(WebSocketMsg webSocketMsg, HttpServletRequest request) throws Exception {
		logger.entry("-------发送消息");
		
		
		String type = webSocketMsg.getType();
		
		webSocketMsg.setDate(new Date());
		TextMessage textMsg = new TextMessage(JsonUtil.toJsonNonNull(webSocketMsg));
		
		if (StringUtils.isNotBlank(type) && type.equals(WebSocketMsg.Type.MULTICAST.value())) {
			// 组播
			handler.sendToChannel(textMsg, webSocketMsg.getYydm(), webSocketMsg.getChannleId());
		} else if (StringUtils.isNotBlank(type) && type.equals(WebSocketMsg.Type.UNICAST.value())) {
			// 单播
			handler.sendToUser(textMsg, webSocketMsg.getYydm(), webSocketMsg.getChannleId(), webSocketMsg.getToUser());
		}
	}
	
	@RequestMapping("/monitor")
	public String monitor(HttpServletRequest request) {
		logger.entry("-------返回到websocket 监控界面");
		request.setAttribute("userSocketSessionMap", WebSocketConstant.USER_SOCKET_SESSION_MAP);
		request.setAttribute("channelMap", webSocketService.getAllChannel());
		return "/websocket/websocket_monitor";
	}
	
	@RequestMapping(value = "/test")
	public void test() throws Exception {
		
		logger.entry("-------发送消息");
		WebSocketMsg webSocketMsg = new WebSocketMsg();
		webSocketMsg.setYydm("system");
		webSocketMsg.setChannleId("1");
		webSocketMsg.setMsg("test");
		webSocketMsg.setType("multicast");
//		Set<String> set = new HashSet<String> ();
//		set.add("sadmin");
//		set.add("111");
		//webSocketMsg.setToUser(set);
		webSocketMsg.setUrl("/web-system/websocket/index");
		webSocketMsg.setYydm("system");
		webSocketService.sendMessage(webSocketMsg);

	}
}

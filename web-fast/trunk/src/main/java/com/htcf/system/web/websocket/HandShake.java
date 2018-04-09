package com.htcf.system.web.websocket;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.server.HandshakeInterceptor;

public class HandShake implements HandshakeInterceptor {
	private static Logger logger = LogManager.getLogger(HandShake.class);

	// 用户socket yydm user socket

	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler handler,
			Exception e) {

	}

	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler handler,
			Map<String, Object> attributes) throws Exception {
		logger.trace("********进入websocket握手");

		try {
			if (request instanceof ServletServerHttpRequest) {
				ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;

				Object obj = SecurityUtils.getSubject().getPrincipal();
				String uid = null;

				if (obj == null) {
					uid = "";
				} else {
					uid = (String) SecurityUtils.getSubject().getPrincipal();
				}

				String yydm = servletRequest.getServletRequest().getParameter("yydm");

				if (yydm == null) {
					// 这里设置为空是为了建立上连接，给前台明确报错，详见afterConnectionEstablished
					yydm = "";
				}

				attributes.put("yydm", yydm);
				attributes.put("uid", uid);

				// 握手成功
				return true;
			}
		} catch (Exception e) {
			logger.error("********进入websocket握手失败");
			// 握手失败
			return false;
		}
		logger.error("********进入websocket握手失败");
		return false;
	}
}

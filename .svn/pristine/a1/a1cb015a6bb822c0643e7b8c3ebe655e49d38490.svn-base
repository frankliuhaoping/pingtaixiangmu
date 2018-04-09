package com.htcf.system.web.websocket;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.htcf.frame.base.model.WebSocketMsg;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubFileService;
import com.htcf.system.service.WebSocketService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * 
 * 描述 Title: 消息处理中心 Description: Company: 航天长峰湖南分公司
 * 
 * @author chenshizhe
 * @created 2016-9-1 上午11:15:51
 * @version 1.0.0
 */
@Component
public class HtcfWebSocketHandler implements WebSocketHandler {
	private static Logger logger = LogManager.getLogger(HtcfWebSocketHandler.class);

	@Autowired
	protected WebSocketService webSocketService;

	@Autowired
	protected PubAppService pubAppService;

	/**
	 * 连接
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.entry("!!!-------连接");
		String uid = (String) session.getAttributes().get("uid");
		String yydm = (String) session.getAttributes().get("yydm");

		if (StringUtils.isBlank(uid)) {
			close(session, "uid为空");
		}

		if (StringUtils.isBlank(yydm)) {
			close(session, "应用代码为空");
		} else {
			try {
				//调用一次  如果异常则说明应用代码不合法
				pubAppService.getAppByYydm(yydm);
			} catch (Exception e) {
				close(session, "应用代码不合法");
			}
		}

		// user session map
		Map<String, WebSocketSession> sessionMap = WebSocketConstant.USER_SOCKET_SESSION_MAP.get(yydm);
		if (sessionMap == null) {
			sessionMap = new ConcurrentHashMap<String, WebSocketSession>();
			WebSocketConstant.USER_SOCKET_SESSION_MAP.put(yydm, sessionMap);
		}

		if (sessionMap.get(uid) != null) {
			// 踢下之前的session
			WebSocketSession before = sessionMap.get(uid);
			before.close();
		}

		sessionMap.put(uid, session);
	}

	
	/**
	 * close 连接， 非法请求的时候调用
	 * 
	 * @param session
	 * @param msg
	 * @throws IOException void
	 */
	private void close(WebSocketSession session, String msg) throws IOException {
		TextMessage textMsg = new TextMessage(msg);
		session.sendMessage(textMsg);
		session.close();
	}

	/**
	 * 关闭连接
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.entry("!!!-------连接关闭");
		removeSession(session);
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 接收消息
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		logger.entry("!!!-------接收消息");

		if (message.getPayloadLength() == 0) {
			return;
		}

		Object msg = message.getPayload();

		WebSocketMsg wsm = (WebSocketMsg) JsonUtil.toObjectByTypeReference(msg.toString(),
				new TypeReference<WebSocketMsg>() {
				});

		String uid = (String) session.getAttributes().get("uid");
		String yydm = (String) session.getAttributes().get("yydm");

		String type = wsm.getType();
		if (StringUtils.isNotBlank(type) && type.equals(WebSocketMsg.Type.JOIN.value())) {
			// 消息类型 加入频道
			webSocketService.joinChannel(yydm, uid, wsm.getChannleId());
		} else if (StringUtils.isNotBlank(type) && type.equals(WebSocketMsg.Type.QUIT.value())) {
			// 消息类型 退出频道
			webSocketService.quitChannel(yydm, uid, wsm.getChannleId());
		} else if (StringUtils.isNotBlank(type) && type.equals(WebSocketMsg.Type.MULTICAST.value())) {
			// 组播
			wsm.setDate(new Date());
			TextMessage textMsg = new TextMessage(JsonUtil.toJsonNonNull(wsm));
			sendToChannel(textMsg, yydm, wsm.getChannleId());
		} else if (StringUtils.isNotBlank(type) && type.equals(WebSocketMsg.Type.UNICAST.value())) {
			// 单播
			wsm.setDate(new Date());
			TextMessage textMsg = new TextMessage(JsonUtil.toJsonNonNull(wsm));
			sendToUser(textMsg, yydm, wsm.getChannleId(), wsm.getToUser());
		}
	}

	/**
	 * 错误处理
	 */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable e) throws Exception {
		logger.entry("!!!-------错误处理");
		removeSession(session);
	}

	/**
	 * 清理频道以及sessionMap
	 * 
	 * @param session
	 */
	private void removeSession(WebSocketSession session) {
		logger.entry("!!!-------清理频道以及session");
		String uid = (String) session.getAttributes().get("uid");
		String yydm = (String) session.getAttributes().get("yydm");

		webSocketService.quitAllChannel(yydm, uid);

		// 移除用户
		Map<String, WebSocketSession> sessionMap = WebSocketConstant.USER_SOCKET_SESSION_MAP.get(yydm);
		// 在移除用户
		if(sessionMap!=null){
			sessionMap.remove(uid);
		}
	}

	/**
	 * 发送消息给某一个人
	 * 
	 * @throws IOException
	 */
	public void sendToOne(final TextMessage message, String yydm, String uid) {
		logger.entry("!!!-------发送单条消息", yydm, uid, message);
		// user session map
		Map<String, WebSocketSession> sessionMap = WebSocketConstant.USER_SOCKET_SESSION_MAP.get(yydm);

		WebSocketSession session = sessionMap.get(uid);
		if (session != null && session.isOpen()) {
			try {
				session.sendMessage(message);
			} catch (IOException e) {
				logger.error("发送消息异常", e);
			}
		}
	}

	/**
	 * 发送消息给某个频道的所有的人
	 * 
	 * @param session
	 */
	public void sendToChannel(final TextMessage message, final String yydm, String channelId) {
		logger.entry("!!!-------发送消息到一个频道", yydm, channelId, message);
		// user session map

		Set<String> allUserSet = webSocketService.getChannelUsers(yydm, channelId);

		if (allUserSet != null) {
			for (final String uid : allUserSet) {
				new Thread(new Runnable() {
					public void run() {
						sendToOne(message, yydm, uid);
					}
				}).start();
			}
		}
	}

	/**
	 * 发送消息给某一些人
	 * 
	 * @param message
	 * @param yydm
	 * @param channelId
	 * @param userSet void
	 */
	public void sendToUser(final TextMessage message, final String yydm, String channelId, Set<String> userSet) {
		logger.entry("!!!-------发送消息到一个频道", yydm, channelId, userSet, message);

		if (yydm == null || channelId == null || userSet == null) {
			return;
		}

		// 当前频道的所有人
		Set<String> allUserSet = webSocketService.getChannelUsers(yydm, channelId);

		if (allUserSet != null) {
			for (final String uid : userSet) {
				// 是否在当前频道
				if (allUserSet.contains(uid)) {
					new Thread(new Runnable() {
						public void run() {
							sendToOne(message, yydm, uid);
						}
					}).start();
				}
			}
		}
	}

}

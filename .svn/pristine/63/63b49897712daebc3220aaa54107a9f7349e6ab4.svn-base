package com.htcf.system.web.websocket;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.WebSocketSession;

/**
 * 
 * 描述 Title: 消息处理中心 Description: Company: 航天长峰湖南分公司
 * 
 * @author chenshizhe
 * @created 2016-9-1 下午15:15:11
 * @version 1.0.0
 */
public class WebSocketConstant {
	// 用户socket yydm user socket
	public static final Map<String, Map<String, WebSocketSession>> USER_SOCKET_SESSION_MAP;

	// 频道 K=频道id, V=(set={1,3,5} 用户id)
	//public static final Map<String, Map<String, Set<String>>> CHANNEL_MAP;

	static {
		USER_SOCKET_SESSION_MAP = new ConcurrentHashMap<String, Map<String, WebSocketSession>>();
		//CHANNEL_MAP = new ConcurrentHashMap<String, Map<String, Set<String>>>();
	}

	// 频道信息 k=频道id前缀， v =频道类型
	// public static final Map<String, Integer> CHANNEL_INFO_MAP;
	//
	// // 用户id
	// public static final String UID_STR = "uid";
	//
	// // 合成作战事件频道前缀
	// public static final String HCZZ_EVENT = "event_";
	//
	// // v =频道类型
	// public static enum CHANNEL_TYPE {
	// // 普通
	// NORMAL {public Integer getType(){return 1;}},
	// // 唯一性频道 如 event_001 event_002 用户则只能加入其中一个频道
	// UNIQEU {public Integer getType(){return 2;}};
	//
	// public abstract Integer getType();
	// }
	//
	// static {
	// CHANNEL_INFO_MAP = new HashMap<String, Integer>();
	// CHANNEL_INFO_MAP.put(HCZZ_EVENT, CHANNEL_TYPE.UNIQEU.getType());
	// }
}

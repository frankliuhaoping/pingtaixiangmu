/** 
 * Project Name:service-system 
 * File Name:ChannelServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年4月17日下午1:11:49 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.base.model.WebSocketMsg;
import com.htcf.system.cache.ChannelCache;
import com.htcf.system.service.WebSocketService;

/**
 * ClassName: ChannelServiceImpl <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年4月17日 下午1:11:49 <br/>
 * 
 * @author chenshizhe
 */

@Service("webSocketService")
public class WebSocketServiceImpl implements WebSocketService {
	private static final Logger logger = LogManager.getLogger(PubResServiceImpl.class);

	/**
	 * channelCache:频道数据
	 */
	@Autowired
	private ChannelCache channelCache;

	/**
	 * 加入频道
	 */
	public void joinChannel(String yydm, String uid, String channelId) {
		logger.entry("!!!-------加入频道", yydm, uid, channelId);

		try {

			Map<String, Set<String>> channelMap = channelCache.get(yydm);

			if (channelMap == null) {
				// 如果应用不存在则先创建应用
				channelMap = new ConcurrentHashMap<String, Set<String>>();
				channelCache.put(yydm, channelMap);
			}

			// 加锁
			channelCache.acquireWriteLockOnKey(yydm);
			channelMap = channelCache.get(yydm);

			Set<String> set = channelMap.get(channelId);
			if (set == null) {
				// 如果频道不存在则先创建频道
				set = new CopyOnWriteArraySet<String>();
				channelMap.put(channelId, set);
			}

			// 加入频道
			set.add(uid);

			// 修改缓存
			channelCache.put(yydm, channelMap);
		} finally {
			channelCache.releaseWriteLockOnKey(yydm);
		}

	}

	public void quitChannel(String yydm, String uid, String channelId) {
		logger.entry("!!!-------退出一个频道", uid, channelId);
		// user session map
		try {
			// 加锁
			channelCache.acquireWriteLockOnKey(yydm);
			Map<String, Set<String>> channelMap = channelCache.get(yydm);

			if (channelMap != null) {
				Set<String> set = channelMap.get(channelId);
				if (set != null) {
					// 从当前频道中移除
					set.remove(uid);

					if (set.size() <= 0) {
						// 频道中没有人了
						channelMap.remove(channelId);
					}
				}

				channelCache.put(yydm, channelMap);

			}
		} finally {
			channelCache.releaseWriteLockOnKey(yydm);
		}

	}

	public void quitAllChannel(String yydm, String uid) {
		logger.entry("!!!-------退出所有频道", yydm, uid);

		try {
			// 加锁
			channelCache.acquireWriteLockOnKey(yydm);
			// user session map
			Map<String, Set<String>> channelMap = channelCache.get(yydm);

			// 遍历所有频道，用户退出所有频道
			if (channelMap != null) {
				Iterator<Map.Entry<String, Set<String>>> it = channelMap.entrySet().iterator();

				while (it.hasNext()) {
					Map.Entry<String, Set<String>> entry = it.next();
					Set<String> set = entry.getValue();
					if (set != null) {
						set.remove(uid);
						logger.debug("用户" + "退出频道" + entry.getKey());
						if (set.size() <= 0) {
							// 频道中没有人了
							it.remove();
						}
					}
				}
				// 修改缓存
				channelCache.put(yydm, channelMap);
			}
			
		} finally {
			channelCache.releaseWriteLockOnKey(yydm);
		}

	}

	public Set<String> getChannelUsers(String yydm, String channelId) {
		logger.entry("!!!-------获取某个频道的所有人", yydm, channelId);
		Map<String, Set<String>> channelMap = channelCache.get(yydm);

		if (channelMap != null) {
			Set<String> allUserSet = channelMap.get(channelId);
			if (allUserSet != null) {
				return allUserSet;
			}
		}
		return null;
	}

	public Map<String, Map<String, Set<String>>> getAllChannel() {
		logger.entry("!!!-------获取所有频道");

		List<?> list = channelCache.getAllKeys();

		Map<String, Map<String, Set<String>>> channelMap = new TreeMap<String, Map<String, Set<String>>>();

		for (Object object : list) {
			Map<String, Set<String>> map = channelCache.get(object);
			channelMap.put(object.toString(), map);
		}

		return channelMap;
	}

	public void sendMessage(WebSocketMsg webSocketMsg) {
		logger.entry("!!!-------发送消息到一个频道");
		// user session map
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();

//		parameters.add(new BasicNameValuePair("yydm", webSocketMsg.getYydm()));
//		parameters.add(new BasicNameValuePair("type", webSocketMsg.getType()));
//		parameters.add(new BasicNameValuePair("channleId", webSocketMsg.getChannleId()));
//		parameters.add(new BasicNameValuePair("msg", webSocketMsg.getMsg()));
//		parameters.add(new BasicNameValuePair("url", webSocketMsg.getUrl()));

		Set<String> set = webSocketMsg.getToUser();
		if (set != null) {
			for (String userName : set) {
				parameters.add(new BasicNameValuePair("toUser", userName));
			}
		}

		String url = "http://localhost:8080/web-system/websocket/sendMessage";

		doPost(url, parameters);
	}

	public static String doPost(String url, List<NameValuePair> parameters) {
		// 构建httpclient
		CloseableHttpClient httpClient = HttpClients.createDefault();
		// 构建httppost
		HttpPost httpPost = new HttpPost(url);
		// 构建EntityBuilder
		EntityBuilder builder = EntityBuilder.create();
		// 设置ContentType为默认的application/x-www-form-urlencoded
		builder.setContentType(ContentType.create("application/x-www-form-urlencoded"));
		// 构建请求参数 NameValuePair

		// 将所有参数设置都builder中
		builder.setParameters(parameters);
		// 构建HttpEntity
		HttpEntity entity = builder.build();
		// 设置entity到httppost
		httpPost.setEntity(entity);
		String result = "";
		try {
			// 执行httppost请求，并用httpResponse接收
			httpClient.execute(httpPost);

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭httpclient
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}

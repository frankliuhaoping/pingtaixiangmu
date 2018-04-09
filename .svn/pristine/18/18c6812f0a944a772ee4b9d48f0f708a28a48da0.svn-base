/** 
 * Project Name:facade-system 
 * File Name:WebSocketService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年4月17日下午1:25:07 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;
import java.util.Set;


/** 
 * ClassName: WebSocketService <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2017年4月17日 下午1:25:07 <br/> 
 * 
 * @author chenshizhe 
 */
public interface WebSocketService {
	public void joinChannel(String yydm, String uid, String channelId);
	
	public void quitChannel(String yydm, String uid, String channelId);
	
	public Set<String> getChannelUsers(String yydm, String channelId);
	
	public void quitAllChannel(String yydm, String uid);
	
	public Map<String, Map<String,Set<String>>> getAllChannel();
	
//	public void sendMessage(WebSocketMsg webSocketMsg);
}


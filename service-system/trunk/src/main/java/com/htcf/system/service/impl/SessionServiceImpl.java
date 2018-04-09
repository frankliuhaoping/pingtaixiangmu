/**
 * Copyright 1999-2014 dangdang.com.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.htcf.system.service.impl;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.service.SessionService;
import com.htcf.system.cache.SessionCache;
import com.htcf.system.cache.UserSessionCache;


/** 
 * ClassName: SessionServiceImpl <br/> 
 * Function: shiro的session管理，操作ehcache缓存 <br/> 
 * date: 2017年1月20日 下午12:37:09 <br/> 
 * 
 * @author chenshizhe 
 */
@Service("system.SessionService")
public class SessionServiceImpl implements SessionService {
	private static final Logger logger = LogManager.getLogger(SessionServiceImpl.class);
	@Autowired
	private SessionCache sessionCache;
	@Autowired
	private UserSessionCache userSessionCache;

	public boolean checkSessionKey(String key) {
		if (sessionCache.get(key) != null) {
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}

	public void removeSession(String key) {
		sessionCache.remove(key);
		//logger.trace("sessionCache.getSize()" + sessionCache.getSize(), sessionCache.getSize());
	}


	@Override
	public void putSession(String key, String value) {
		sessionCache.put(key, value);
		//logger.trace("sessionCache.getSize()" + sessionCache.getSize(), sessionCache.getSize());
	}

	@Override
	public String getSession(String key) {
		return sessionCache.get(key);
	}

	/**
	 * 根据用户获得对应的多个sessionId
	 * @param uid
	 * @return
	 * @see com.htcf.frame.service.SessionService#getSessionIdByUser(java.lang.String)
	 */
	@Override
	public Collection<String> getSessionIdByUser(String uid) {
		// TODO Auto-generated method stub
		logger.trace(uid);
		return userSessionCache.get(uid);
	}

	/**
	 * 用户sessionId保存
	 * @param uid
	 * @param sessionId
	 * @see com.htcf.frame.service.SessionService#putUser(java.lang.String, java.lang.String)
	 */
	@Override
	public void putUser(String uid, String sessionId) {
		// TODO Auto-generated method stub
		logger.trace(uid + ",sessionId:"+sessionId);
		Collection sessionids = userSessionCache.get(uid);
		if( sessionids == null )
		{
			sessionids = new HashSet();			
		}
		sessionids.add(sessionId);
		userSessionCache.put(uid, sessionids);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * @param uid
	 * @see com.htcf.frame.service.SessionService#removeUser(java.lang.String)
	 */
	@Override
	public void removeUser(String uid) {
		// TODO Auto-generated method stub
		logger.trace(uid);
		userSessionCache.remove(uid);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * @param uid
	 * @param sessionId
	 * @see com.htcf.frame.service.SessionService#removeUserSession(java.lang.String, java.lang.String)
	 */
	@Override
	public void removeUserSession(String uid, String sessionId) {
		// TODO Auto-generated method stub
		Collection sessionids = userSessionCache.get(uid);
		if( sessionids != null )
		{
			sessionids.remove(sessionId);
			userSessionCache.put(uid, sessionids);
		}
	}

}

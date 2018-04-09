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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.system.cache.SessionCache;
import com.htcf.system.service.SessionService;


/** 
 * ClassName: SessionServiceImpl <br/> 
 * Function: shiro的session管理，操作ehcache缓存 <br/> 
 * date: 2017年1月20日 下午12:37:09 <br/> 
 * 
 * @author chenshizhe 
 */
@Service("sessionService")
public class SessionServiceImpl implements SessionService {
	private static final Logger logger = LogManager.getLogger(SessionServiceImpl.class);
	@Autowired
	private SessionCache sessionCache;

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

}

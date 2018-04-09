/** 
 * Project Name:service-system 
 * File Name:ChannelCache.java 
 * Package Name:com.htcf.system.cache 
 * Date:2017年4月17日下午1:08:12 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.cache;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.cache.BaseCache;


/** 
 * ClassName: ChannelCache <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2017年4月17日 下午1:08:12 <br/> 
 * 
 * @author chenshizhe 
 */
@Repository
public class ChannelCache extends BaseCache<Map<String, Set<String>>>{
	public List<?> getAllKeys() {
		List<?> keys = ehCache.getKeys();
		return keys;
	}
}

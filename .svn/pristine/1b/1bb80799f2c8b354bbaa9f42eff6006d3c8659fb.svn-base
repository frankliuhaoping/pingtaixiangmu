/** 
 * Project Name:service-cf110 
 * File Name:JcjZhzxpzxxServiceImpl.java 
 * Package Name:com.htcf.cf110.service.impl 
 * Date:2017年4月6日下午5:14:33 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.JcjZhzxpzxxDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.JcjZhzxpzxx;
import com.htcf.system.service.JcjZhzxpzxxService;

/**
 * 指挥中心配置信息Service实现类
 */
@Service("jcjZhzxpzxxService")
public class JcjZhzxpzxxServiceImpl implements JcjZhzxpzxxService {
	private static final Logger logger = LogManager.getLogger(JcjZhzxpzxxServiceImpl.class);
	@Autowired
	private JcjZhzxpzxxDao jcjZhzxpzxxDao;

	/**
	 * 获取指挥中心配置信息list
	 * 
	 * @return
	 * @throws Exception
	 * @see com.htcf.cf110.service.JcjZhzxpzxxService#getJcjZhzxList()
	 */
	@Override
	public List<JcjZhzxpzxx> getJcjZhzxList() throws Exception {
		logger.entry("!!!!!!!!!!!!!!获取指挥中心配置信息list");
		QueryParam queryParam = new QueryParam();
		List<JcjZhzxpzxx> list = jcjZhzxpzxxDao.getList(queryParam);

		if (list == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("指挥中心数据不存在");
		}
		return list;
	}

}

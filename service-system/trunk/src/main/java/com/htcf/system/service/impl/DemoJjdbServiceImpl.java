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
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.DemoJjdbDao;
import com.htcf.system.dao.JcjZhzxpzxxDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.DemoJjdb;
import com.htcf.system.model.po.JcjZhzxpzxx;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubLog;
import com.htcf.system.service.DemoJjdbService;
import com.htcf.system.service.JcjZhzxpzxxService;

/**
 * 指挥中心配置信息Service实现类
 */
@Service("demoJjdbService")
public class DemoJjdbServiceImpl implements DemoJjdbService {
	private static final Logger logger = LogManager.getLogger(DemoJjdbServiceImpl.class);
	@Autowired
	private DemoJjdbDao demoJjdbDao;
	
	@Override
	public DemoJjdb addJjdb(DemoJjdb demoJjdb) {
		demoJjdbDao.add(demoJjdb);
		return demoJjdb;
	}
	
	
	@Override
	public PageInfo<DemoJjdb> getListPage(Map<String, Object> map) {
		logger.entry("!!!!!!!!!!根据条件获取分页后的Log列表", map);
		
		QueryParam queryParam = new QueryParam(map);
		
		PageInfo<DemoJjdb> pageInfo = demoJjdbDao.getListPage("get", queryParam);
		return pageInfo;
	}

	@Override
	public DemoJjdb updatejjd(DemoJjdb demoJjdb){
		logger.entry("!!!!!!!!!!修改jjd", JsonUtil.toJsonNonNull(demoJjdb));

		demoJjdbDao.update(demoJjdb, "jjdbh");
		return demoJjdb;
	}

}

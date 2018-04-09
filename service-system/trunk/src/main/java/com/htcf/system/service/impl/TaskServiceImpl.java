/** 
 * Project Name:service-system 
 * File Name:TaskServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年4月26日上午11:42:24 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.List;
import java.util.Random;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.base.util.CommonStringUtil;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.SysUserService;
import com.htcf.system.service.XdhCopyService;

/**
 * ClassName: TaskServiceImpl <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年4月26日 上午11:42:24 <br/>
 * 
 * @author chenshizhe
 */
@Service("taskServiceImpl")
public class TaskServiceImpl {
	private static final Logger logger = LogManager.getLogger(TaskServiceImpl.class);
	/**
	 * 
	 */
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysOrgService sysOrgService;
	@Autowired
	private XdhCopyService xdhCopyService;
	
	public void test1() {
		logger.info("定时任务开始" + Thread.currentThread().getName());
		int max = 15;
		int min = 5;
		Random random = new Random();

		int s = random.nextInt(max) % (max - min + 1) + min;
		logger.info("休眠" + s + "秒");
		try {
			Thread.sleep(s * 1000L);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("定时任务结束" + Thread.currentThread().getName());
	}
	
	public void synchroSysUser() throws Exception{
		//查询视图所有的数据   然后添加到中间表在更新到正式表
		List<SysUser> list=sysUserService.getList();
		
		xdhCopyService.synchroBatchSysUser(list);
		
	}
	
	public void synchroSysOrg() throws Exception{
		List<SysOrg> list=sysOrgService.getList();
		
		xdhCopyService.synchroBatchSysOrg(list);
	}
}

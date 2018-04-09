/** 
 * Project Name:service-template 
 * File Name:StartServer.java 
 * Package Name:com.htcf.template.init 
 * Date:2017-2-24 16:27:02 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.template.init;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csource.fastdfs.ClientGlobal;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.common.bo.TaskBo;
import com.htcf.common.service.ScheduleService;
import com.htcf.common.service.impl.ScheduleServiceImpl;
import com.htcf.system.model.bo.PubScheduleBo;
import com.htcf.system.model.po.PubSchedule;
import com.htcf.system.service.PubScheduleService;
import com.htcf.template.dao.XXXObjectDao;



@Service
public class StartServer {
	/**
	 * The Constant logger.
	 */
	private static final Logger logger = LogManager.getLogger(StartServer.class);

	private static final String CONF_FILENAME = Thread.currentThread().getContextClassLoader().getResource("")
			.getPath()
			+ "fastdfs/fdfs_client.conf";
	

	@Autowired
	private PubScheduleService pubScheduleService;
	
	@Autowired
	private ScheduleService scheduleService;

	/**
	 * 启动fastdfs客户端
	 * 
	 * @throws Exception
	 */
	@PostConstruct
	private void startFastDFSClient() throws Exception {
		logger.entry("-------FastDFSClient加载配置");
		try {
			logger.info("=== CONF_FILENAME:" + CONF_FILENAME);
			ClientGlobal.init(CONF_FILENAME);
		} catch (Exception e) {
			logger.error(e);
		}
		logger.info("-------FastDFSClient加载配置成功");
	}
	
	
	/**
	 * 加载定时任务
	 * 
	 * @throws Exception void
	 */
	@PostConstruct
	public void startSchehle() throws Exception {
		logger.entry("-------加载定时任务");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fwdm", ServiceTemplateConstants.SERVICE_CODE);
		map.put("sybz", "Y");
		List<PubSchedule> list = pubScheduleService.getPubScheduleList(map);
		
		for (PubSchedule pubSchedule : list) {
			TaskBo taskBo = new TaskBo();
			
			//对象拷贝
			Mapper mapper = new DozerBeanMapper();
			mapper.map(pubSchedule, taskBo);
			
			scheduleService.addSchedule(taskBo);
		}
	}

}

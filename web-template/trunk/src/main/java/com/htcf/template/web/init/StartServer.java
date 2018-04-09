/** 
 * Project Name:web-template 
 * File Name:StartServer.java 
 * Package Name:com.htcf.template.web.init 
 * Date:2017-2-24 16:24:36 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.template.web.init;

import java.net.InetSocketAddress;

import javax.annotation.PostConstruct;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.TrackerGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubParam;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubParamService;
import com.htcf.frame.web.shiro.client.ClientRealm;
import com.htcf.template.web.excepiton.WebTemplateException;

@Service
public class StartServer {
	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(StartServer.class);
	
	/** 
	 * CONF_FILENAME:文件服务配置地址. 
	 */
	private static final String CONF_FILENAME = Thread.currentThread().getContextClassLoader().getResource("").getPath() + "fastdfs/fdfs_client.conf";

	@Autowired
	private PubAppService pubAppService;
	
	@Autowired
	private PubParamService pubParamService;

	/**
	 * app启动
	 * 
	 * @throws Exception
	 */
	@PostConstruct
	private void getPubAppCode() throws Exception {
		logger.entry("-------app启动");
		String yydm = ComponentConstants.APP_CODE;
		PubApp pubApp = pubAppService.getAppByYydm(yydm);
		if (pubApp == null) {
			throw WebTemplateException.WEB_SETTING;
		}
		ComponentConstants.APP_YYID = pubApp.getYyid();

		// shiro使用
		ClientRealm.APP_ID = pubApp.getYyid();
		if (ComponentConstants.APP_YYID == 0) {// 应用ID不能为0
			throw WebTemplateException.WEB_SETTING;
		}
		logger.info("-------app启动成功");
	}
	
	/**
	 * 启动fastdfs客户端
	 * 
	 * @throws Exception
	 */
	@PostConstruct
	private void startFastDFSClient() throws Exception {
		logger.entry("-------FastDFSClient启动");
		try {
			logger.info("=== CONF_FILENAME:" + CONF_FILENAME);
			//ClientGlobal.init(CONF_FILENAME);
			
			//连接超时
			ClientGlobal.setG_connect_timeout(5000);
			//网络超时
			ClientGlobal.setG_network_timeout(30000);  
			
			ClientGlobal.setG_charset("UTF-8");
			
			//设置anti_steal_token
			ClientGlobal.setG_anti_steal_token(false);
			//设置secret_key
			PubParam pubParam = pubParamService.getParamByCsm("fastdfs_secret_key");
			ClientGlobal.setG_secret_key(pubParam.getCsz());
			//设置tracker_http_port
			pubParam = pubParamService.getParamByCsm("fastdfs_tracker_http_port");
			ClientGlobal.setG_tracker_http_port(Integer.parseInt(pubParam.getCsz()));
			
			//设置tracker_servers
			pubParam = pubParamService.getParamByCsm("fastdfs_tracker_server");
			String[] szTrackerServers = pubParam.getCsz().split(",");
			InetSocketAddress[] tracker_servers = new InetSocketAddress[szTrackerServers.length];
	  		for (int i=0; i<szTrackerServers.length; i++)
	  		{
	  			String[] parts = szTrackerServers[i].split("\\:", 2);  			
	  			tracker_servers[i] = new InetSocketAddress(parts[0].trim(), Integer.parseInt(parts[1].trim()));
	  		}
	  		TrackerGroup trackerGroup = new TrackerGroup(tracker_servers);
			ClientGlobal.setG_tracker_group(trackerGroup);
			

		} catch (Exception e) {
			logger.error(e);
		}
		logger.info("-------FastDFSClient启动成功");
	}

}

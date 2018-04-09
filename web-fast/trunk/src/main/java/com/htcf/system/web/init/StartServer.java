package com.htcf.system.web.init;

import java.net.InetSocketAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.TrackerGroup;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.ProtocolConfig;
import com.htcf.common.bo.TaskBo;
import com.htcf.common.service.ScheduleService;
import com.htcf.system.init.ServiceSystemConstants;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubParam;
import com.htcf.system.model.po.PubSchedule;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubParamService;
import com.htcf.system.service.PubScheduleService;
import com.htcf.system.web.exception.WebSystemException;
import com.htcf.system.web.shiro.WebSystemRealm;

@Service
public class StartServer {
	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(StartServer.class);
	
	private static final String CONF_FILENAME = Thread.currentThread().getContextClassLoader().getResource("").getPath() + "fastdfs/fdfs_client.conf";

	@Autowired
	private PubAppService pubAppService;
	
	@Autowired
	private PubParamService pubParamService;
	
	@Autowired
	private PubScheduleService pubScheduleService;
	
	@Autowired
	private ScheduleService scheduleService;

	/**
	 * app启动
	 * 
	 * @throws Exception
	 */
	@PostConstruct
	private void getPubAppCode() throws Exception {
		logger.entry("-------app启动");
		String yydm = WebSystemConstans.APP_CODE;
		PubApp pubApp = pubAppService.getAppByYydm(yydm);
		if (pubApp == null) {
			throw WebSystemException.WEB_SETTING;
		}
		WebSystemConstans.APP_YYID = pubApp.getYyid();

		// shiro使用
		WebSystemRealm.APP_ID = pubApp.getYyid();
		if (WebSystemConstans.APP_YYID == 0) {// 应用ID不能为0
			throw WebSystemException.WEB_SETTING;
		}
		
		PubParam rootNumberPubParam = pubParamService.getParamByCsm(WebSystemConstans.XZQH_ROOT_NUMBER);
		if (rootNumberPubParam != null) {
			String csz = rootNumberPubParam.getCsz();
			if (StringUtils.isNotEmpty(csz)) {
				WebSystemConstans.XZQH_ROOT_NUMBER_VALUE = Integer.valueOf(csz);
			}
			
		}
		
		PubParam otherNumberPubParam = pubParamService.getParamByCsm(WebSystemConstans.XZQH_OTHER_NUMBER);
		if (rootNumberPubParam != null) {
			String csz = otherNumberPubParam.getCsz();
			if (StringUtils.isNotEmpty(csz)) {
				WebSystemConstans.XZQH_OTHER_NUMBER_VALUE = Integer.valueOf(csz);
			}
			
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
	
	/**
	 * 加载定时任务
	 * 
	 * @throws Exception void
	 */
	@PostConstruct
	public void startSchehle() throws Exception {
		logger.entry("-------加载定时任务");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fwdm", ServiceSystemConstants.SERVICE_CODE);
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
	
	@PreDestroy
	public void shutdownDestroy() {
	    ProtocolConfig.destroyAll();
	}

}

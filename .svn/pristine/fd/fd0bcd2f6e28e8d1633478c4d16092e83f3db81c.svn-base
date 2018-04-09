package com.htcf.system.web.init;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alibaba.dubbo.config.ProtocolConfig;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubParam;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubParamService;
import com.htcf.system.web.exception.WebSystemException;

@Service
public class StartServer {
	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(StartServer.class);
	
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
		String yydm = WebSystemConstans.APP_CODE;
		PubApp pubApp = pubAppService.getAppByYydm(yydm);
		if (pubApp == null) {
			throw WebSystemException.WEB_SETTING;
		}
		WebSystemConstans.APP_YYID = pubApp.getYyid();
		// shiro使用
//		WebSystemRealm.APP_ID = pubApp.getYyid();
		if (WebSystemConstans.APP_YYID.equals("0")) {// 应用ID不能为0
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
	
	
	
	@PreDestroy
	public void shutdownDestroy() {
	    ProtocolConfig.destroyAll();
	}

}

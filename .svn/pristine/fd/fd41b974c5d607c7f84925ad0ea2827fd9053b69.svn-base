/** 
 * Project Name:web-system 
 * File Name:WorkspaceController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016-12-813:53:55 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ClassName: WorkspaceController <br/>
 * Function: WorkspaceController. <br/>
 * date: 2016年12月7日 下午2:28:45 <br/>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/workspace")
public class WorkspaceController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(WorkspaceController.class);

	/**
	 * 返回工作台主页面.
	 *
	 * @param request the request
	 * @param response the response
	 * @param modelMap the model map
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/index")
	public String index() throws Exception {
		logger.entry("-------返回工作台主页面");
		return "myWorkspace";
	}

}
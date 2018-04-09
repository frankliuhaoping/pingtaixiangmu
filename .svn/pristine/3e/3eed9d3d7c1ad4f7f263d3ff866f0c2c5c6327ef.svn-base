/** 
 * Project Name:web-sjwh 
 * File Name:JcjZhzxpzxxController.java 
 * Package Name:com.htcf.sjwh.web.controller 
 * Date:2017年4月6日下午6:27:18 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.system.model.po.JcjZhzxpzxx;
import com.htcf.system.service.JcjZhzxpzxxService;

/**
 * 指挥中心配置信息控制类
 */
@Controller
@RequestMapping("jcjZhzxpzxx")
public class JcjZhzxpzxxController {
	// 日志
	private static final Logger logger = LogManager.getLogger(JcjZhzxpzxxController.class);
	// 指挥中心service服务接口
	@Autowired
	private JcjZhzxpzxxService jcjZhzxpzxxService;

	/**
	 * 获取指挥中心配置信息list
	 */
	@RequestMapping(value = "/getZhzxList")
	@ResponseBody
	public String getZhzxList() throws Exception {
		logger.entry("-------获取指挥中心配置信息list");
		ActionResult ar = ActionResult.success().build();
		List<JcjZhzxpzxx> jcjZhzxpzxxs = jcjZhzxpzxxService.getJcjZhzxList();
		ar.setData(jcjZhzxpzxxs);
		return JsonUtil.toJsonNonNull(ar);
	}

}

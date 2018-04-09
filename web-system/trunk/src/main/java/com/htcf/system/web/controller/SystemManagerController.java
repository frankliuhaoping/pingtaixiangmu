/** 
 * Project Name:web-system 
 * File Name:SigarManagerController.java 
 * Package Name:com.htcf.frame.service 
 * Date:2017年12月8日 上午11:08:41 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.base.util.SpringContextUtil;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.service.PubXtzdService;
import com.htcf.system.web.exception.WebSystemException;

/** 
 * ClassName: SigarManagerController
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年12月8日 上午11:08:41
 * 
 * @author liuhuan
 */
@Controller
@RequestMapping("/systemManager")
public class SystemManagerController {
	private static final Logger logger = LogManager.getLogger(CacheManagerController.class);

	/**
	 * 系统字典服务
	 */
	@Autowired
	private PubXtzdService pubXtzdService;
	
	@RequestMapping("/index")
	public String index() {
		// TODO 需要根据后台配置的systemManagerRestService返回列表数据
		logger.entry("-------返回到systemManagerRest index界面");
		return "/systemManager/systemManager_index";
	}
	/**
	 * 查看cpu
	 * 
	 * @param request the request
	 * @param response the response
	 * @return String  返回对应目录的页面
	 * @throws Exception  抛出可能发生的异常
	 */
	@RequestMapping(value = "/view")
	public String view(HttpServletRequest request) throws Exception {
		//获取请求的值
//		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		logger.entry("-------查看cpu列表界面");
//		request.setAttribute("ipAddress", map.get("ipAddress"));
		return "/systemManager/systemManager_view";
	}
	/**
	 * 获取所有数据生成json格式传回.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String   返回查询的数据以json格式
	 * @throws Exception the exception  抛出可能发生的异常
	 */
	@RequestMapping(value = "/getData")
	@ResponseBody
	public String getData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------获取数据生成json格式传回");
		//获取请求的值
		try {
//			SystemManagerService ss = (SystemManagerService) SpringContextUtil.getBean("systemManager");
//			List<SystemInfo> list = ss.getSystemInfo();
//			return JsonUtil.toJsonNonNull(list);
		} catch (Exception e) {
			throw WebSystemException.WEB_SYSTEM.newInstance("机器服务未启动");
		}
		return null;
	}
}

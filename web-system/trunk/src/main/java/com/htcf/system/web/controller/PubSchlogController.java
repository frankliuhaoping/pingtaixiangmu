/** 
 * Project Name:web-system 
 * File Name:PubSchlog.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年3月9日 下午3:35:00 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.po.PubSchlog;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubSchlogService;

/**
 * ClassName: PubSchlogController<br/>
 * Function: 定时任务日志管理控制类. <br/>
 * date: 2017年3月9日 下午3:35:00<br/>
 * 
 * @author wuwei
 */
@Controller
@RequestMapping("/pubSchlog")
public class PubSchlogController {

	/**
	 * logger:The Constant logger
	 */
	private static final Logger logger = LogManager.getLogger(PubSchlogController.class);

	/**
	 * pubSchlogService: 定时任务日志服务.
	 */
	@Autowired
	private PubSchlogService pubSchlogService;

	/**
	 * pubAppService: 获取应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * 返回到PubSchlog index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() throws Exception {
		logger.entry("-------返回到pubSchlog index界面");
		return "/pubSchlog/pubSchlog_index";
	}

	/**
	 * 获取分页数据生成json格式传回.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubSchlog> pageInfo = pubSchlogService.getListPage(map);
		PageResult<PubSchlog> recordBeanPageResult = new PageResult<PubSchlog>(pageInfo.getList(), (int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 查看定时任务日志具体信息
	 * 
	 * @param id 日志id
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubSchlog:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看定时任务日志");
		PubSchlog pubSchlog = pubSchlogService.getSchlogByRwzxid(id);
		request.setAttribute("pubSchlog", JsonUtil.toJsonNonNull(pubSchlog));
		return "pubSchlog/pubSchlog_view";
	}

}

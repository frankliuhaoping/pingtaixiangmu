/** 
 * Project Name:web-system 
 * File Name:PubAuditController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年3月6日 下午1:00:00
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.Date;
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
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubAudit;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuditService;

/**
 * ClassName: PubAuditController<br/>
 * Function: 审计配置信息管理控制类. <br/>
 * date: 2017年3月6日 下午1:00:00<br/>
 * 
 * @author wuwei
 */
@Controller
@RequestMapping("/pubAudit")
public class PubAuditController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubAuditController.class);

	/**
	 * pubAuditService: 审计配置信息方法服务.
	 */
	@Autowired
	private PubAuditService pubAuditService;
	
	/**
	 * pubAppService: 获取应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * 返回到PubAudit index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubAudit index界面");
		return "/pubAudit/pubAudit_index";
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
		PageInfo<PubAudit> pageInfo = pubAuditService.getListPage(map);
		PageResult<PubAudit> recordBeanPageResult = new PageResult<PubAudit>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 新增审计配置信息.
	 *
	 * @return String
	 */
	@RequiresPermissions("sys:pubAudit:add")
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) throws Exception {
		logger.entry("-------新增审计配置信息");
		PubApp pubApp = pubAppService.getAppByYyid(new Long(request.getParameter("yyid")));
		request.setAttribute("yymc", pubApp.getYymc());
		request.setAttribute("xtm", "/web-"+pubApp.getYydm());
		return "pubAudit/pubAudit_add";
	}

	/**
	 * 保存新增审计配置信息.
	 *
	 * @param pubAudit 审计配置信息
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubAudit pubAudit, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增审计配置信息");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubAudit.setCjrxm(pubUser.getYhmc());
		pubAudit.setCjsj(new Date(System.currentTimeMillis()));
		pubAudit.setGxsj(new Date(System.currentTimeMillis()));
//		pubAudit.setXtm(request.getContextPath());
//		pubAudit.setFwlj(request.getServletPath());
		pubAuditService.addAudit(pubAudit);

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改审计配置信息.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubAudit:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改审计配置信息");
		PubAudit pubAudit = pubAuditService.getAuditBySjid(id);
		request.setAttribute("pubAudit", JsonUtil.toJsonNonNull(pubAudit));
		request.setAttribute("pubAuditBean", pubAudit);
		PubApp pubApp = pubAppService.getAppByYyid(new Long(request.getParameter("yyid")));
		request.setAttribute("yymc", pubApp.getYymc());
		return "pubAudit/pubAudit_edit";
	}

	/**
	 * 查看审计配置信息.
	 * 
	 * @param id
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubAudit:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看审计配置信息");
		PubAudit pubAudit = pubAuditService.getAuditBySjid(id);
		request.setAttribute("pubAudit", JsonUtil.toJsonNonNull(pubAudit));
		PubApp pubApp = pubAppService.getAppByYyid(new Long(request.getParameter("yyid")));
		request.setAttribute("yymc", pubApp.getYymc());
		return "pubAudit/pubAudit_view";
	}

	/**
	 * 更新审计配置信息.
	 *
	 * @param pubAudit 审计配置信息
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubAudit pubAudit, HttpServletRequest request) throws Exception {
		logger.entry("-------更新审计配置信息");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubAudit.setGxrxm(pubUser.getYhmc());
		pubAudit.setGxsj(new Date(System.currentTimeMillis()));
		pubAuditService.updateAudit(pubAudit);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条审计配置信息.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubAudit:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除单条审计配置信息");
		ActionResult ar = ActionResult.success().build();
		pubAuditService.delelteAudit(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除审计配置信息.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubAudit:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除审计配置信息");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			pubAuditService.delelteAudit(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

}

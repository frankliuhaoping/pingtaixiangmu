/** 
 * Project Name:web-system 
 * File Name:PubScheduleController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年3月2日 下午4:11:00
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
import com.htcf.system.model.po.PubSchedule;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubScheduleService;

/**
 * ClassName: PubScheduleController<br/>
 * Function: 定时任务管理控制类. <br/>
 * date: 2017年3月2日 下午4:11:00<br/>
 * 
 * @author wuwei
 */
@Controller
@RequestMapping("/pubSchedule")
public class PubScheduleController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubScheduleController.class);

	/**
	 * pubScheduleService: 定时任务方法服务.
	 */
	@Autowired
	private PubScheduleService pubScheduleService;

	/**
	 * 返回到PubSchedule index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubSchedule index界面");
		return "/pubSchedule/pubSchedule_index";
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
		PageInfo<PubSchedule> pageInfo = pubScheduleService.getListPage(map);
		PageResult<PubSchedule> recordBeanPageResult = new PageResult<PubSchedule>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 新增定时任务.
	 *
	 * @return String
	 */
	@RequiresPermissions("sys:pubSchedule:add")
	@RequestMapping(value = "/add")
	public String add() {
		logger.entry("-------新增定时任务");
		return "pubSchedule/pubSchedule_add";
	}

	/**
	 * 保存新增定时任务.
	 *
	 * @param pubSchedule 定时任务
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubSchedule pubSchedule, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增定时任务");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubSchedule.setCjr(pubUser.getYhmc());
		pubSchedule.setCjsj(new Date());
		pubSchedule.setGxsj(new Date());
		pubScheduleService.addSchedule(pubSchedule);

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改定时任务.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubSchedule:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改定时任务");
		PubSchedule pubSchedule = pubScheduleService.getScheduleByRwid(id);
		request.setAttribute("pubSchedule", JsonUtil.toJsonNonNull(pubSchedule));
		request.setAttribute("pubScheduleBean", pubSchedule);
		return "pubSchedule/pubSchedule_edit";
	}

	/**
	 * 查看定时任务
	 * 
	 * @param id
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubSchedule:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看定时任务");
		PubSchedule pubSchedule = pubScheduleService.getScheduleByRwid(id);
		request.setAttribute("pubSchedule", JsonUtil.toJsonNonNull(pubSchedule));
		return "pubSchedule/pubSchedule_view";
	}

	/**
	 * 更新定时任务.
	 *
	 * @param pubSchedule 定时任务
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubSchedule pubSchedule, HttpServletRequest request) throws Exception {
		logger.entry("-------更新定时任务");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubSchedule.setGxr(pubUser.getYhmc());
		pubSchedule.setGxsj(new Date(System.currentTimeMillis()));
		pubScheduleService.updateSchedule(pubSchedule);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条定时任务.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubSchedule:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除单条定时任务");
		ActionResult ar = ActionResult.success().build();
		pubScheduleService.delelteSchedule(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除定时任务.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubSchedule:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除定时任务");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			pubScheduleService.delelteSchedule(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

}

/** 
 * Project Name:web-system 
 * File Name:PubParamController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年2月8日 上午9:35:29 
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
import com.htcf.system.model.po.PubParam;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubParamService;

/**
 * ClassName: PubParamController<br/>
 * Function: 全局参数管理控制类. <br/>
 * date: 2017年2月8日 上午9:35:29<br/>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/pubParam")
public class PubParamController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubParamController.class);

	/**
	 * pubParamService: 全局参数方法服务.
	 */
	@Autowired
	private PubParamService pubParamService;

	/**
	 * 返回到PubParam index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubParam index界面");
		return "/pubParam/pubParam_index";
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
		PageInfo<PubParam> pageInfo = pubParamService.getListPage(map);
		PageResult<PubParam> recordBeanPageResult = new PageResult<PubParam>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 新增全局参数.
	 *
	 * @return String
	 */
	@RequiresPermissions("sys:pubParam:add")
	@RequestMapping(value = "/add")
	public String add() {
		logger.entry("-------新增全局参数");
		return "pubParam/pubParam_add";
	}

	/**
	 * 保存新增全局参数.
	 *
	 * @param pubParam 全局参数
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubParam pubParam, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增全局参数");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubParam.setCjrxm(pubUser.getYhmc());
		pubParam.setCjsj(new Date(System.currentTimeMillis()));
		pubParam.setGxsj(new Date(System.currentTimeMillis()));
		pubParamService.addParam(pubParam);

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改全局参数.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubParam:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改全局参数");
		PubParam pubParam = pubParamService.getParamByCsm(id);
		request.setAttribute("pubParam", JsonUtil.toJsonNonNull(pubParam));
		request.setAttribute("pubParamBean", pubParam);
		return "pubParam/pubParam_edit";
	}

	/**
	 * 查看全局参数
	 * 
	 * @param id
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubParam:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看全局参数");
		PubParam pubParam = pubParamService.getParamByCsm(id);
		request.setAttribute("pubParam", JsonUtil.toJsonNonNull(pubParam));
		return "pubParam/pubParam_view";
	}

	/**
	 * 更新全局参数.
	 *
	 * @param pubParam 全局参数
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubParam pubParam, HttpServletRequest request) throws Exception {
		logger.entry("-------更新全局参数");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubParam.setGxrxm(pubUser.getYhmc());

		pubParam.setGxsj(new Date(System.currentTimeMillis()));
		pubParamService.updateParam(pubParam);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条全局参数.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubParam:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除单条全局参数");
		ActionResult ar = ActionResult.success().build();
		pubParamService.delelteParam(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除全局参数.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubParam:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除全局参数");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			pubParamService.delelteParam(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

}

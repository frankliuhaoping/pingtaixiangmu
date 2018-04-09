/** 
 * Project Name:web-system 
 * File Name:PubRyxxController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年2月13日上午9:59:05 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.text.SimpleDateFormat;
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
import com.htcf.system.model.po.PubRyxx;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubRyxxService;
import com.htcf.system.web.init.WebSystemConstans;

/**
 * 人员信息控制类 <br/>
 * date: 2017年2月13日 上午9:59:05<br/>
 * 
 * @author chenhao
 */
@Controller
@RequestMapping("/pubRyxx")
public class PubRyxxController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubRyxxController.class);
	@Autowired
	private PubRyxxService PubRyxxService;// 人员信息服务

	/**
	 * 
	 * 返回到PubRyxx_index界面
	 * 
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping("/index")
	public String index() throws Exception {
		logger.entry("-------返回到PubRyxx_index界面");
		return "/pubRyxx/pubRyxx_index";
	}

	/**
	 * 获取分页数据并生成json格式返回
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据并生成json格式返回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubRyxx> pageInfo = PubRyxxService.getListPage(map);
		if (pageInfo == null) {
			return JsonUtil.toJsonNonNull("");
		}
		PageResult<PubRyxx> recordBeanPageResult = new PageResult<PubRyxx>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 
	 * 新增人员信息
	 * 
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubRyxx:add")
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) throws Exception {
		logger.entry("新增人员信息");
		// 设置需要的单位代码数到前端
		request.setAttribute(WebSystemConstans.XZQH_ROOT_NUMBER, WebSystemConstans.XZQH_ROOT_NUMBER_VALUE);
		request.setAttribute(WebSystemConstans.XZQH_OTHER_NUMBER, WebSystemConstans.XZQH_OTHER_NUMBER_VALUE);
		return "pubRyxx/pubRyxx_add";
	}

	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubRyxx pubRyxx, HttpServletRequest request) throws Exception {
		logger.entry("保存人员信息");
		String csnys = request.getParameter("csnys");// 获取人员出生年月
		if (csnys != null && csnys != "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 将出生年月转换为指定格式
			Date csnydate = sdf.parse(csnys);
			pubRyxx.setCsny(csnydate);
		}
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);// TODO// 需不需要每个请求都拦截获取user？
		pubRyxx.setCjr(pubUser.getYhmc());// 设置用户名称
		pubRyxx.setCjsj(new Date(System.currentTimeMillis()));// 创建时间
		pubRyxx.setGxsj(new Date(System.currentTimeMillis()));// 更新时间
		PubRyxxService.addRyxx(pubRyxx);
		return JsonUtil.toJsonNonNull(ar);

	}

	/**
	 * 
	 * 修改人员信息
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRyxx:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改人员信息");
		// 设置需要的单位代码数到前端
		request.setAttribute(WebSystemConstans.XZQH_ROOT_NUMBER, WebSystemConstans.XZQH_ROOT_NUMBER_VALUE);
		request.setAttribute(WebSystemConstans.XZQH_OTHER_NUMBER, WebSystemConstans.XZQH_OTHER_NUMBER_VALUE);
		PubRyxx pubRyxx = PubRyxxService.getPubRyxxByRybh(id);
		request.setAttribute("pubRyxx", JsonUtil.toJsonNonNull(pubRyxx));
		return "pubRyxx/pubRyxx_edit";
	}

	/**
	 * 
	 * 查看人员信息
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRyxx:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看人员信息");
		PubRyxx pubRyxx = PubRyxxService.viewPubRyxxByRybh(id);
		request.setAttribute("pubRyxx", JsonUtil.toJsonNonNull(pubRyxx));
		return "pubRyxx/pubRyxx_view";
	}

	/**
	 * 
	 * 更新人员信息
	 * 
	 * @param pubRyxx
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubRyxx pubRyxx, HttpServletRequest request) throws Exception {
		logger.entry("-------更新人员信息");
		String csnys = request.getParameter("csnys");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date csnydate = sdf.parse(csnys);
		pubRyxx.setCsny(csnydate);
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);// 需不需要每个请求都拦截获取user？
		pubRyxx.setGxr(pubUser.getYhmc());
		pubRyxx.setGxsj(new Date(System.currentTimeMillis()));
		PubRyxxService.upDateRyxx(pubRyxx);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 删除人员信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRyxx:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除人员信息");
		ActionResult ar = ActionResult.success().build();
		PubRyxxService.deleltePubRybh(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 批量删除人员信息
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删人员信息");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			PubRyxxService.deleltePubRybh(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

}

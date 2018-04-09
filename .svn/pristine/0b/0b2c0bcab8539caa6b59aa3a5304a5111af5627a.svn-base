/** 
 * Project Name:web-system 
 * File Name:PubPdtthzxxController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年6月6日 下午3:07:54 
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.po.PubPdtthzxx;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubPdtthzxxService;

/**
 * ClassName: PubPdtthzxxController <br/>
 * Function: 通话组控制器 <br/>
 * date: 2017年6月6日 下午3:07:54
 * 
 * @author yiqiang
 */
@Controller
@RequestMapping("/pubPdtthzxx")
public class PubPdtthzxxController {
	private static final Logger logger = LogManager.getLogger(PubPdtthzxxController.class);
	
	@Autowired
	private PubPdtthzxxService pubPdtthzxxService;
	
	@RequestMapping("/index")
	public String index() {
		return "/pubPdtthzxx/pubPdtthzxx_index";
	}
	
	 
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubPdtthzxx> pageInfo = pubPdtthzxxService.getListPage(map);
		PageResult<PubPdtthzxx> recordBeanPageResult = new PageResult<PubPdtthzxx>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}
	
	@RequiresPermissions("sys:pubPdtthzxx:view")
	@RequestMapping(value = "/view/{thzbh}")
	public String view(@PathVariable String thzbh, HttpServletRequest request) throws Exception {
		logger.entry("-------查看审计配置信息");
		PubPdtthzxx pdtthzxx = pubPdtthzxxService.getPdtthzxxByThzbh(thzbh);
		request.setAttribute("pubPdtthzxx", JsonUtil.toJsonNonNull(pdtthzxx));
		return "pubPdtthzxx/pubPdtthzxx_view";
	}

	
	@RequiresPermissions("sys:pubPdtthzxx:add")
	@RequestMapping(value = "/add")
	public String add() {
		return "/pubPdtthzxx/pubPdtthzxx_add";
	}
	
	/**
	 * saveAdd 保存新增用户
	 * 
	 * @param pubUser
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubPdtthzxx:add")
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubPdtthzxx pdtthzxx, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增通话组");
		ActionResult ar = ActionResult.success().build();
		PubUser pUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pdtthzxx.setCjr(pUser.getYhmc());
		pdtthzxx.setCjsj(new Date(System.currentTimeMillis()));
		pdtthzxx.setGxsj(new Date(System.currentTimeMillis()));
		pubPdtthzxxService.addPubPdtthzxx(pdtthzxx);
		return JsonUtil.toJsonNonNull(ar);
	}
	
	@RequestMapping(value = "/edit/{thzbh}")
	public ModelAndView edit(@PathVariable String thzbh) throws Exception {
		PubPdtthzxx pubPdtthzxx = pubPdtthzxxService.getPdtthzxxByThzbh(thzbh);
		logger.entry("查询通话组数据 {}",pubPdtthzxx);
		ModelAndView mav = new ModelAndView("/pubPdtthzxx/pubPdtthzxx_edit");
		mav.addObject("pubPdtthzxx", JsonUtil.toJsonNonNull(pubPdtthzxx));
		return mav;
	} 
	
	@RequiresPermissions("sys:pubPdtthzxx:edit")
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubPdtthzxx pdtthzxx, HttpServletRequest request) throws Exception {
		logger.entry("-------保存修改通话组 {}"+pdtthzxx);
		ActionResult actionResult = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pdtthzxx.setGxr(pubUser.getYhmc());
		pdtthzxx.setGxsj(new Date(System.currentTimeMillis()));
		pubPdtthzxxService.updatePubPdtthzxx(pdtthzxx);
		return JsonUtil.toJsonNonNull(actionResult);
	} 
	
	 
	@RequestMapping(value = "/delete/{thzbh}")
	@ResponseBody
	public String delete(@PathVariable String thzbh) throws Exception {
		logger.entry("-------删除通话组信息");
		ActionResult ar = ActionResult.success().build();
		pubPdtthzxxService.deleltePubPdtthzxx(thzbh);
		return JsonUtil.toJsonNonNull(ar);
	}
 
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		ActionResult ar = ActionResult.success().build();
		String[] thzbhs = request.getParameterValues("id[]");
		logger.entry("-------批量删通话组信息 thzbhs={}",thzbhs);
		if(thzbhs!=null){
			pubPdtthzxxService.deleltePubPdtthzxx(thzbhs);
		}
		return JsonUtil.toJsonNonNull(ar);
	}
}

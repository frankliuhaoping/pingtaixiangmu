/** 
 * Project Name:web-system 
 * File Name:SysUserController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年9月12日 下午2:40:23 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.PubUserService;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.SysUserService;
import com.htcf.system.service.XdhCopyService;

/** 
 * ClassName: SysUserController
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月12日 下午2:40:23
 * 
 * @author liuhuan 
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
	private static final Logger logger = LogManager.getLogger(SysUserController.class);
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private XdhCopyService xdhCopyService;
	
	
	
	/**
	 * 返回到sysUser index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到sysUser index界面");
		return "/sysUser/sysUser_index";
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
		PageInfo<SysUser> pageInfo = sysUserService.getListPage(map);
		if (pageInfo == null) {
			return JsonUtil.toJsonNonNull("");
		}
		PageResult<SysUser> recordBeanPageResult = new PageResult<SysUser>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}
	/**
	 * 
	 * 查看sysUser
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看sysUser");
		SysUser sysUser = sysUserService.getSysUserById(id);
		request.setAttribute("sysUser", JsonUtil.toJsonNonNull(sysUser));
		return "/sysUser/sysUser_view";
	}
	
	/**
	 * 
	 * 
	 * 单条同步
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/synchroData")
	@ResponseBody
	public String synchroData(HttpServletRequest request)throws Exception{
		logger.entry("-------同步操作");
		ActionResult ar = ActionResult.success().build();
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		String yhbh =(String) map.get("yhbh");
		SysUser sysUser =  sysUserService.getSysUserById(yhbh);
		xdhCopyService.synchroSysUser(sysUser);
		return JsonUtil.toJsonNonNull(ar);
	}
	
	/**
	 * 
	 * 批量同步
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/synchroBatch")
	@ResponseBody
	public String synchroBatch(HttpServletRequest request)throws Exception{
		logger.entry("-------同步操作");
		ActionResult ar = ActionResult.success().build();
		//需要同步操作的id
		String[] ids = request.getParameterValues("id[]");
		List<SysUser> list = sysUserService.getBatch(ids);
		if (list != null && !list.isEmpty()) {
			xdhCopyService.synchroBatchSysUser(list);
		}
		return JsonUtil.toJsonNonNull(ar);
	}
	
	
	
}

/** 
 * Project Name:web-system 
 * File Name:SysOrgController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年9月13日 上午9:12:26 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.XdhCopyService;

/** 
 * ClassName: SysOrgController
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月13日 上午9:12:26
 * 
 * @author liuhuan 
 */
@Controller
@RequestMapping("/sysOrg")
public class SysOrgController {
	private static final Logger logger = LogManager.getLogger(SysOrgController.class);
	
	@Autowired
	private SysOrgService sysOrgService;
	
	@Autowired
	private XdhCopyService xdhCopyService;
	
	@Autowired
	private PubZzjgService pubZzjgService;
	/**
	 * 返回到SysOrg index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到sysUser index界面");
		return "/sysOrg/sysOrg_index";
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
		PageInfo<SysOrg> pageInfo = sysOrgService.getListPage(map);
		if (pageInfo == null) {
			return JsonUtil.toJsonNonNull("");
		}
		PageResult<SysOrg> recordBeanPageResult = new PageResult<SysOrg>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}
	/**
	 * 
	 * 查看SysOrg
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看SysOrg");
		SysOrg sysOrg = sysOrgService.getSysOrgById(id);
		request.setAttribute("sysOrg", JsonUtil.toJsonNonNull(sysOrg));
		return "/sysOrg/sysOrg_view";
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
		String dwdm =(String) map.get("dwdm");
		SysOrg sysOrg =  sysOrgService.getSysOrgById(dwdm);
		xdhCopyService.synchroSysOrg(sysOrg);
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
		//根据ids查询sysOrg
		List<SysOrg> list =sysOrgService.getBatch(ids);
		if (!list.isEmpty() && list !=null) {
			xdhCopyService.synchroBatchSysOrg(list);
		}
		return JsonUtil.toJsonNonNull(ar);
	}
	
}

/** 
 * Project Name:web-test 
 * File Name:PubAppController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016年12月1日下午4:45:00 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubXtzdService;
import com.htcf.system.web.init.WebSystemConstans;

/**
 * 
 * ClassName: PubAppController <br/>
 * Function: 应用 Controller <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月1日 下午4:45:00 <br/>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/pubApp")
public class PubAppController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubAppController.class);

	/**
	 * pubAppService: 应用方法服务.
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * pubXtzdService: 系统字典服务.
	 */
	@Autowired
	private PubXtzdService pubXtzdService;

	/**
	 * 返回到pubApp index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubApp index界面");
		return "/pubApp/pubApp_index";
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

		PageInfo<PubApp> pageInfo = pubAppService.getListPage(map);

		// 字典编号
		String zdbh = "system_yylx";

		// 根据 字典编号获取该字典下的子字典
		Map<String, String> zdMap = pubXtzdService.getStringMapByZdbh(WebSystemConstans.APP_YYID, zdbh);

		List<PubApp> list = pageInfo.getList();
		for (PubApp pubApp : list) {
			String key = zdbh + "_" + pubApp.getYylx();
			pubApp.setYylx(zdMap.get(key));
		}

		PageResult<PubApp> recordBeanPageResult = new PageResult<PubApp>(pageInfo.getList(), (int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 新增应用.
	 *
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubApp:add")
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) throws Exception {
		logger.entry("-------新增应用");

		PubXtzd pubxyzd = pubXtzdService.getPubXtzdByZdxm(WebSystemConstans.ZDXM);
		List<PubXtzd> pbuztzds = pubXtzdService.getPubXtzdListByZdbh(pubxyzd.getYyid(), pubxyzd.getZdbh());
		request.setAttribute("pbuztzds", pbuztzds);
		return "pubApp/pubApp_add";
	}

	/**
	 * 保存新增应用.
	 *
	 * @param pubApp the pub app
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubApp pubApp, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增应用");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubApp.setCjrxm(pubUser.getYhmc());
		pubApp.setCjsj(new Date());
		pubApp.setGxrxm(pubUser.getYhmc());
		pubApp.setGxsj(new Date());
		pubAppService.addApp(pubApp);

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改应用.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubApp:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改应用");
		PubApp pubApp = pubAppService.getAppByYyid(Long.valueOf(id));
		PubXtzd pubxyzd = pubXtzdService.getPubXtzdByZdxm(WebSystemConstans.ZDXM);
		List<PubXtzd> pbuztzds = pubXtzdService.getPubXtzdListByZdbh(pubxyzd.getYyid(), pubxyzd.getZdbh());
		request.setAttribute("pbuztzds", pbuztzds);
		request.setAttribute("pubApp", JsonUtil.toJsonNonNull(pubApp));
		request.setAttribute("pubAppBean", pubApp);

		return "pubApp/pubApp_edit";
	}

	/**
	 * 查看应用
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubApp:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看应用");
		PubApp pubApp = pubAppService.getAppByYyid(Long.valueOf(id));
		request.setAttribute("pubApp", JsonUtil.toJsonNonNull(pubApp));
		// 构建审计日志需要替换的信息
		Map<String, Object> auditMessageMap = new HashMap<String, Object>();
		auditMessageMap.put("yyid", id);
		PubXtzd pubxyzd = pubXtzdService.getPubXtzdByZdxm(WebSystemConstans.ZDXM);
		List<PubXtzd> pbuztzds = pubXtzdService.getPubXtzdListByZdbh(pubxyzd.getYyid(), pubxyzd.getZdbh());
		request.setAttribute("pbuztzds", pbuztzds);
		request.setAttribute(WebSystemConstans.AUDIT_MESSAGE, auditMessageMap);
		return "pubApp/pubApp_view";
	}

	/**
	 * 更新应用.
	 *
	 * @param pubApp the pub app
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubApp pubApp, HttpServletRequest request) throws Exception {
		logger.entry("-------更新应用");
		ActionResult ar = ActionResult.success().build();
		// 获取用户信息
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		// 设置更新人姓名
		pubApp.setGxrxm(pubUser.getYhmc());
		// 设置更新时间
		pubApp.setGxsj(new Date(System.currentTimeMillis()));
		// 更新应用
		pubAppService.updateApp(pubApp);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条应用.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubApp:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除单条应用");
		ActionResult ar = ActionResult.success().build();
		pubAppService.delelteApp(Long.valueOf(id));
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除应用.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubApp:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除应用");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			long[] lids = new long[ids.length];
			for (int i = 0; i < ids.length; i++) {
				lids[i] = Long.valueOf(ids[i]);
			}
			pubAppService.delelteApp(lids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * validateYymc 验证应用名称
	 * 
	 * @param request
	 * @param yymc
	 * @return
	 * @throws Exception String
	 */
	@ResponseBody
	@RequestMapping("/validateYymc")
	public String validateYymc(HttpServletRequest request, String yymc) throws Exception {
		logger.entry("-------验证应用名称");

		PubApp pubApp = pubAppService.getAppByYymc(yymc);
		String flag = "true";
		if (pubApp != null) {
			flag = "false";
		}
		return flag;
	}

}

/** 
 * Project Name:web-system 
 * File Name:PubFileController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年1月23日 下午2:07:06 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.base.util.PrettyMemoryUtils;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.po.PubFile;
import com.htcf.system.model.vo.PubFileVo;
import com.htcf.system.service.PubFileService;

/**
 * ClassName: PubFileController<br/>
 * Function: 文件管理的查看，删除等处理. <br/>
 * date: 2017年1月23日 下午2:07:06<br/>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/pubFile")
public class PubFileController {

	/**
	 * The logger.
	 */
	private static final Logger logger = LogManager.getLogger(PubFileController.class);

	/**
	 * pubFileService: 文件服务.
	 */
	@Autowired
	protected PubFileService pubFileService;

	/**
	 * 返回到pubFile index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubFile index界面");
		return "/pubFile/pubFile_index";
	}

	/**
	 * 获取分页数据生成json格式传回.
	 *
	 * @param request the request
	 * @return String json格式的页面信息
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubFile> pageInfo = pubFileService.getListPage(map);
		List<PubFileVo> voList = new ArrayList<PubFileVo>();
		for (PubFile pubFile : pageInfo.getList()) {
			Mapper mapper = new DozerBeanMapper();
			PubFileVo vo = new PubFileVo();
			mapper.map(pubFile, vo);
			vo.setSize(PrettyMemoryUtils.prettyByteSize(pubFile.getWjdx()));
			voList.add(vo);
		}
		PageResult<PubFileVo> pubFilePageResult = new PageResult<PubFileVo>(voList, (int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(pubFilePageResult);
	}

	/**
	 * 删除单条文件.
	 *
	 * @param request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubFile:delete")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public String delete(HttpServletRequest request) throws Exception {
		logger.entry("-------删除单条文件");
		ActionResult ar = ActionResult.success().build();
		// 获取前端传过来的id。这里不能用restful的请求方式
		String id = request.getParameter("id");
		pubFileService.delelteFile(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除文件.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubFile:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除文件");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			pubFileService.delelteFile(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

}

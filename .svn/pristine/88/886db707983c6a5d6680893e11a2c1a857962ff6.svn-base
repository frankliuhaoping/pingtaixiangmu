/** 
 * Project Name:web-system 
 * File Name:CacheManagerRestController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年2月14日 上午11:33:22 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.htcf.frame.base.util.SpringContextUtil;
import com.htcf.frame.bo.ElementBo;
import com.htcf.frame.service.CacheManagerService;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.service.PubXtzdService;
import com.htcf.system.web.exception.WebSystemException;

/**
 * ClassName: CacheManagerRestController<br>
 * Function: 通过CacheManagerRestService去调用各个应用的缓存，并进行管理. <br>
 * date: 2017年2月14日 上午11:33:22<br>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/cacheManager")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class CacheManagerController {

	private static final Logger logger = LogManager.getLogger(CacheManagerController.class);

	private static final String SYSTEM_CACHEURL_PREFIX = "system_cacheurl_";

	/**
	 * 系统字典服务
	 */
	@Autowired
	private PubXtzdService pubXtzdService;
	/**
	 * 返回到cacheManagerRest index界面.
	 *
	 * @return String 返回到对应目录下的页面
	 * @throws Exception 抛出可能发生的异常
	 */
	@RequestMapping("/index")
	public String index() {
		// TODO 需要根据后台配置的CacheManagerRestService返回列表数据
		logger.entry("-------返回到cacheManagerRest index界面");
		return "/cacheManager/cacheManager_index";
	}

	/**
	 * 获取所有数据生成json格式传回.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String   返回查询的数据以json格式
	 * @throws Exception the exception  抛出可能发生的异常
	 */
	@RequestMapping(value = "/getData")
	@ResponseBody
	public String getData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------获取数据生成json格式传回");
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		String zdbh = map.get("zdbh").toString();
		zdbh = zdbh.replace(SYSTEM_CACHEURL_PREFIX, "");
		try {
			CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
			List list =  cs.getListPage(map);
			return JsonUtil.toJsonNonNull(list);
		} catch (Exception e) {
			throw WebSystemException.WEB_SYSTEM.newInstance("缓存服务未启动,zdbh={%s}", zdbh);
		}
	}

	/**
	 * 查看缓存
	 * 
	 * @param request the request
	 * @param response the response
	 * @return String  返回对应目录的页面
	 * @throws Exception  抛出可能发生的异常
	 */
	@RequestMapping(value = "/view/{cacheName}")
	public String view(HttpServletRequest request) throws Exception {
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		logger.entry("-------查看具体缓存Element列表界面",JsonUtil.toJsonNonNull(map));
		request.setAttribute("cacheName", map.get("cacheName"));
		request.setAttribute("zdbh", map.get("zdbh"));
		return "/cacheManager/cacheManager_view";
	}

	/**
	 * 获取分页数据生成json格式传回.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String  返回查询的数据
	 * @throws Exception 抛出可能发生的异常
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		// 通过字典编号查询url
		String zdbh = map.get("zdbh").toString();
		zdbh = zdbhReplace(zdbh);	
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		PageInfo pageInfo = cs.getElementPageList(map);
		
		
		PageResult pageResult = new PageResult<ElementBo>(pageInfo.getList(), (int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(pageResult);
	}

	/**
	 * 删除单条缓存.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String  返回数据操作之后的结果
	 * @throws Exception 抛出可能发生的异常
	 */
	@RequestMapping(value = "/delete/{cacheName}")
	@ResponseBody
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.entry("-------删除单条缓存");
		ActionResult ar = ActionResult.success().build();
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		
		String zdbh = map.get("zdbh").toString();
		zdbh = zdbhReplace(zdbh);	
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		cs.deleteCaches(map.get("cacheName").toString());
		
		logger.exit(JsonUtil.toJsonNonNull(ar));
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除缓存.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String  返回数据操作之后的状态
	 * @throws Exception  抛出可能发生的异常
	 */
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------批量删除缓存");
		ActionResult ar = ActionResult.success().build();
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		
		String[] cacheNames = request.getParameterValues("id[]");
		
		String zdbh = map.get("zdbh").toString();
		zdbh = zdbhReplace(zdbh);		
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		cs.deleteCaches(cacheNames);
		
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条缓存Element.
	 * 
	 * @param request the request
	 * @param response the response
	 * @return String  返回数据操作之后的状态
	 * @throws Exception 抛出可能发生的异常
	 */
	@RequestMapping(value = "/deleteDetails")
	@ResponseBody
	public String deleteDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------删除单条缓存Element");
		ActionResult ar = ActionResult.success().build();
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);

		String zdbh = map.get("zdbh").toString();
		zdbh = zdbhReplace(zdbh);		
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		cs.deleteElements(map.get("cacheName").toString(), map.get("objectKey").toString());
		
		request.setAttribute("zdbh", map.get("zdbh").toString());
		logger.exit(JsonUtil.toJsonNonNull(ar));
		return JsonUtil.toJsonNonNull(ar);
	}
	
	/**
	 * 查看单条缓存Element.
	 * 
	 * @param cacheName 缓存名字
	 * @param objectKey 具体缓存key
	 * @param request the request
	 * @param response the response
	 * @return String 返回对应目录下的页面和数据
	 * @throws Exception 抛出可能发生的异常
	 */
	@RequestMapping(value = "/viewDetail/{cacheName}/{zdbh}/{objectKey}")
	public String viewDetail(@PathVariable String cacheName, @PathVariable String objectKey,
			@PathVariable String zdbh,HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------查看单条缓存Element");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cacheName", cacheName);
		map.put("objectKey", objectKey);
		
		zdbh = zdbhReplace(zdbh);	
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		Object result = cs.getElement(map);
		// 没有任何结果返回当做异常处理
		if ( result == null ) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, ""));
		}
		
		// 设置cacheName 到前端
		request.setAttribute("cacheName", cacheName);
		request.setAttribute("cacheManagerDetail", JsonUtil.toJsonNonNull(result));
		return "/cacheManager/cacheManager_view_detail";
	}

	/**
	 * 批量删除缓存Element.
	 * 
	 * @param cacheName 缓存名称
	 * @param request the request
	 * @param response the response
	 * @return String  返回数据操作之后的状态
	 * @throws Exception  抛出可能发生的异常
	 */
	@RequestMapping("/deleteBatchDetails/{cacheName}/{zdbh}")
	@ResponseBody
	public String deleteBatchDetails(@PathVariable String cacheName,@PathVariable String zdbh,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		logger.entry("-------批量删除缓存");
		ActionResult ar = ActionResult.success().build();
		
		String[] keys = request.getParameterValues("id[]");
		
		zdbh = zdbhReplace(zdbh);		
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		
		cs.deleteElements(cacheName, keys);
		
		logger.exit(JsonUtil.toJsonNonNull(ar));
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 生成url无法访问的ActionResult
	 * 
	 * @param response HttpServletResponse，用于设置exception的head
	 * @param serviceUrl 服务URL地址
	 * @return ActionResult  返回操作之后的状态
	 */
	private ActionResult generateActionResult(HttpServletResponse response, String serviceUrl) {
		response.setHeader("htcfAjaxStatus", "exception");
		ActionResult ar = ActionResult.badRequest().build();
		ar.setErrMsg("访问rest service错误");
		ar.setErrTrace(serviceUrl + "地址没有返回response");
		return ar;
	}

	
	
	/**
	 * getDataByKey
	 * TODO(根据缓存的健(key)获取具体的数据)
	 * 
	 * @param request  HttpServletRequest
	 * @param response HttpServletResponse
	 * @return 返回查询的数据  以json的格式
	 * @throws Exception 抛出可能发生的异常
	 * 
	 */
	@RequestMapping("/select")
	@ResponseBody
	public String getDataByKey(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		//获取请求的值
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		//日志
		logger.entry("-------根据缓存的健查询具体的数据",JsonUtil.toJsonNonNull(map));
		
		String zdbh = map.get("zdbh").toString();
		zdbh = zdbhReplace(zdbh);		
		CacheManagerService cs = (CacheManagerService)SpringContextUtil.getBean(zdbh +"CacheManagerService");
		ElementBo eb = cs.getElement(map);
		//处理返回的分页数据
		List<ElementBo> list = new ArrayList<ElementBo>();
		list.add(eb);
		PageResult<ElementBo> pageResult = new PageResult<ElementBo>(list, 0);
		
		logger.exit(JsonUtil.toJsonNonNull(pageResult));
		//返回数据
		return JsonUtil.toJsonNonNull(pageResult);
	}

	/**
	 * getListTree
	 * TODO(根据字典编号查询对应的系统字典)
	 * @param request HttpServletRequest
	 * @return  返回查询到的数据以json的格式
	 * @throws Exception 抛出可能出现的异常
	 */
	@RequestMapping("/getListTree")
	@ResponseBody
	public String getListTree(HttpServletRequest request) throws Exception
	{
		//日志
		logger.entry("-----根据字典编号查询对应的系统字典");
		//设置对应的字典编号
		String zdbh= "system_cacheurl";
		//根据字典编号查询对应的系统字典
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByZdbh(zdbh);
		//根据系统字典的应用id,编号查询系统字典BoList
		List<PubXtzdBo> list = pubXtzdService.getPubXtzdNodesById(pubXtzd.getYyid(), pubXtzd.getBh(), 0);
		//创建一个对应jstree的list
		List<TreeNode> treeList = new ArrayList<TreeNode>();
		if(list != null)
		{
			//分解查询到的数据
			for(PubXtzdBo pubXtzdBo : list)
			{
				//创建一个树节点对象
				TreeNode treeNode = new TreeNode();
				treeNode.setId(pubXtzdBo.getZdbh());
				treeNode.setText(pubXtzdBo.getZdxm());
				treeNode.setOrder(pubXtzdBo.getPxdm().intValue());
				treeNode.setChildren(null);
				//将树节点对象添加到树节点集合中
				treeList.add(treeNode);
			}
		}	
		
		TreeOperate.sortTreeNodes(treeList);
		logger.exit(JsonUtil.toJsonNonNull(treeList));
		return JsonUtil.toJsonNonNull(treeList);
	}
	
	/**
	 * getUrlByZdbh
	 * TODO(根据字典编号返回对应的URl)
	 * 
	 * @param zdbh 字典编号
	 * @return  String  组合的URL
	 * @throws Exception 抛出可能出现的异常
	 */
	public String  getUrlByZdbh(String zdbh) throws Exception
	{
		logger.entry("-------根据字典编号返回对应的URl",JsonUtil.toJsonNonNull(zdbh));
		//根据字典编号查询对应的系统字典
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByZdbh(zdbh);
		return pubXtzd.getSjms()+"/cacheManager/";
	}
	
	private String zdbhReplace(String zdbh)
	{
		return  zdbh.replace(SYSTEM_CACHEURL_PREFIX, "");		
	}
}
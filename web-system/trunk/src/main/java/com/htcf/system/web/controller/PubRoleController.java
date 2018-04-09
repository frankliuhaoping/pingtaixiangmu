/** 
 * Project Name:web-system 
 * File Name:PubRoleController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016年12月15日上午10:44:56 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
import com.github.pagehelper.StringUtil;
import com.google.common.base.Splitter;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.system.model.bo.PubRoleBo;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuthService;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubRoleService;

/**
 * ClassName: PubRoleController <br/>
 * Function: 角色 Controller<br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月15日 上午10:44:56 <br/>
 * 
 * @author tw
 */
@Controller
@RequestMapping("/pubRole")
public class PubRoleController {
	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubRoleController.class);

	/**
	 * pubRoleService: 获取角色服务
	 */
	@Autowired
	private PubRoleService pubRoleService;
	/**
	 * pubAppService: 获取应用服务
	 */
	@Autowired
	private PubAppService pubAppService;
	/**
	 * pubAuthService: 获取资源授权服务
	 */
	@Autowired
	private PubAuthService pubAuthService;
	
	/**
	 * pubAuthService: 获取资源服务
	 */
	@Autowired
	private PubResService pubResService;
	/**
	 * 返回权限index页面.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) throws Exception {
		logger.entry("-------返回权限index页面");
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		map.put("yhbh", pubUser.getYhbh());
		List<PubApp> pubAppList = pubAppService.getAppJoinAuthGroupList(map);
		request.setAttribute("pubAppList", pubAppList);
		return "/pubRole/pubRole_index";
	}

	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTree(HttpServletRequest request) throws Exception {
		logger.entry("-------获取角色资源树");
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		map.put("yhbh", pubUser.getYhbh());
		List<PubApp> pubAppList = pubAppService.getAppJoinAuthGroupList(map);
		if (pubAppList != null && pubAppList.size() > 0) {
			for (PubApp pubApp : pubAppList) {
				TreeNode treeNode = new TreeNode();
				treeNode.setId(pubApp.getYyid());
				treeNode.setText(pubApp.getYymc());
				treeNode.setChildren(null);
				treeNodes.add(treeNode);
			}
		}
		TreeOperate.sortTreeNodes(treeNodes);
		return JsonUtil.toJsonNonNull(treeNodes);
	}

	/**
	 * 获取角色分页数据生成json格式传回
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		map.put("yhbh", pubUser.getYhbh());
		PageInfo<PubRoleBo> pageInfo = pubRoleService.getListPageBo(map);
		PageResult<PubRoleBo> recordBeanPageResult = new PageResult<PubRoleBo>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * add 新增角色页面跳转
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRole:add")
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) throws Exception {
		logger.entry("-------新增角色页面跳转");
		
		PubApp pubApp = pubAppService.getAppByYyid(request.getParameter("yyid"));
		request.setAttribute("yyid", request.getParameter("yyid"));
		request.setAttribute("yymc", pubApp.getYymc());
		return "pubRole/pubRole_add";
	}

	/**
	 * saveAdd 保存新增角色
	 * 
	 * @param pubRole 角色
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubRole pubRole, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增角色");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubRole.setCjrxm(pubUser.getYhmc());
		pubRole.setCjsj(new Date(System.currentTimeMillis()));
		pubRole.setGxsj(new Date(System.currentTimeMillis()));
		//pubRole.setYyid();

		pubRoleService.addRole(pubRole);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条角色.
	 * 
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubRole:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除单条角色");
		ActionResult ar = ActionResult.success().build();
		//pubRoleService.delelteRoles(Long.valueOf(id));
		pubRoleService.delelteRoles(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * TODO(查看角色)
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRole:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看角色");

		PubApp pubApp = pubAppService.getAppByYyid(request.getParameter("yyid"));
		request.setAttribute("yyid", request.getParameter("yyid"));
		request.setAttribute("yymc", pubApp.getYymc());
		//pubRoleService.getRoleByJsid(Long.valueOf(id));
		PubRole pubRole = pubRoleService.getRoleByJsid(id);
		request.setAttribute("pubRole", JsonUtil.toJsonNonNull(pubRole));
		request.setAttribute("pubRoleBean", pubRole);
		return "pubRole/pubRole_view";
	}

	/**
	 * 
	 * TODO(复制角色)
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRole:copy")
	@RequestMapping(value = "/copy/{id}")
	@ResponseBody
	public String copy(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------复制角色");
		ActionResult ar = ActionResult.success().build();
		if (StringUtil.isEmpty(id)) {
			return JsonUtil.toJsonNonNull(ar);
		}
		//pubRoleService.getRoleByJsid(Long.parseLong(id));
		PubRole pubRole = pubRoleService.getRoleByJsid(id);
		if (pubRole != null) {
			pubRole.setJsmc(pubRole.getJsmc() + "-副");
			pubRole.setCjsj(new Date(System.currentTimeMillis()));
			pubRole.setGxsj(new Date(System.currentTimeMillis()));
			pubRoleService.copyRole(pubRole);
		}

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除角色.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubRole:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除角色");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		/*if (null != ids && ids.length > 0) {
			long[] lids = new long[ids.length];
			for (int i = 0; i < ids.length; i++) {
				lids[i] = Long.valueOf(ids[i]);
			}
			pubRoleService.delelteRoles(lids);
		}*/
		pubRoleService.delelteRoles(ids);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改角色.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubRole:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改角色");
		PubApp pubApp = pubAppService.getAppByYyid(request.getParameter("yyid"));
		request.setAttribute("yyid", request.getParameter("yyid"));
		request.setAttribute("yymc", pubApp.getYymc());
		//	PubRole pubRole = pubRoleService.getRoleByJsid(Long.valueOf(id));
		PubRole pubRole = pubRoleService.getRoleByJsid(id);
		request.setAttribute("pubRole", JsonUtil.toJsonNonNull(pubRole));
		request.setAttribute("pubRoleBean", pubRole);
		return "pubRole/pubRole_edit";
	}

	/**
	 * 更新角色.
	 *
	 * @param pubApp the pub app
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubRole pubRole, HttpServletRequest request) throws Exception {
		logger.entry("-------更新角色");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubRole.setGxrxm(pubUser.getYhmc());
		pubRole.setGxsj(new Date(System.currentTimeMillis()));
		pubRoleService.updateRole(pubRole);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * orization 角色赋权跳转
	 * 
	 * @param id 角色ID
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRole:orization")
	@RequestMapping(value = "/orization/{id}")
	public String orization(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------角色赋权跳转");
		//PubRole pubRole = pubRoleService.getRoleByJsid(Long.valueOf(id));
		PubRole pubRole = pubRoleService.getRoleByJsid(id);
		if (pubRole != null) {
			//根据角色id获取zyids
			List<String> zyids=	pubResService.checkZyids(pubRole.getJsid());
			request.setAttribute("pubRoleName", pubRole.getJsmc());
			request.setAttribute("jsid", pubRole.getJsid());
			request.setAttribute("zyids",JsonUtil.toJsonNonNull(zyids));
		}
		request.setAttribute("pubRole", JsonUtil.toJsonNonNull(pubRole));
		return "pubRole/pubRole_orization";
	}

	/**
	 * saveEditOrization 保存角色赋权
	 * 
	 * @param pubRole
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveEditOrization")
	@ResponseBody
	public String saveEditOrization(HttpServletRequest request) throws Exception {
		logger.entry("-------保存角色赋权");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		PubRole pubRole=new PubRole();
		String jsid=request.getParameter("jsid");
		//前端传的zyids 保持到角色资源表中
		//先根据id删除中间表角色数据 
		pubRoleService.deleteRoleRes(jsid);
		String [] zyids=request.getParameter("zyids").split(",");
		for (String zyid : zyids) {
			pubRoleService.addPubRoleRes(zyid, jsid);
		}
		pubRole.setJsid(jsid);
		pubRole.setYyid(request.getParameter("yyid"));
		pubRole.setGxrxm(pubUser.getYhmc());
		pubRole.setGxsj(new Date(System.currentTimeMillis()));
		pubRoleService.updateRole(pubRole);
		
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * saveAndDelAuth 保存角色赋权用户
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveAndDelAuth")
	@ResponseBody
	public String saveAndDelAuth(HttpServletRequest request) throws Exception {
		logger.entry("-------保存角色赋权用户");
		ActionResult ar = ActionResult.success().build();
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		List<String> oyhbhs = new ArrayList<String>();
		//	Long jsid = Long.valueOf(map.get("jsid").toString());
		String jsid = map.get("jsid").toString();
		if (StringUtils.isNotEmpty(map.get("yhbhs").toString())) {
			// 根据','去掉空值得到list集合
			oyhbhs = Splitter.on(",").trimResults().splitToList(map.get("yhbhs").toString());
		}
		logger.debug("原用户编号:" + oyhbhs);
		List<String> yhbhs_new = new ArrayList<String>();
		if (StringUtils.isNotEmpty(map.get("yhbhs_new").toString())) {
			// 根据','去掉空值得到list集合
			yhbhs_new = Splitter.on(",").trimResults().splitToList(map.get("yhbhs_new").toString());
		}
		logger.debug("新用户编号:" + yhbhs_new);
		pubAuthService.saveAndDelAuth(jsid, oyhbhs, yhbhs_new, pubUser);

		return JsonUtil.toJsonNonNull(ar);
	}
}

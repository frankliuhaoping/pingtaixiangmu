/** 
 * Project Name:web-system 
 * File Name:PubJqxzController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016年12月23日下午3:55:37 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
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
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.frame.web.model.vo.TreeNodeState;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.vo.PubJqxzGrid;
import com.htcf.system.service.PubJqxzService;

/**
 * 警情性质控制类<br/>
 * date: 2016年12月23日 下午3:55:37 <br/>
 * 
 * @author htcf
 */
@Controller
@RequestMapping("/pubJqxz")
public class PubJqxzController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubJqxzController.class);

	@Autowired
	private PubJqxzService pubJqxzService;// 警情性质服务接口

	@RequestMapping("/index")
	public String index() throws Exception {
		logger.entry("-------返回到PubJqxz index界面");
		return "/pubJqxz/pubJqxz_index";
	}

	/**
	 * 
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
	
					
		PageInfo<PubJqxzdm> pageInfo = pubJqxzService.getListPage(map);
		if (pageInfo == null) {
			return JsonUtil.toJsonNonNull("");
		}
		PageResult<PubJqxzdm> recordBeanPageResult = new PageResult<PubJqxzdm>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 
	 * 新增警情性质
	 * 
	 * @return String
	 */
	@RequiresPermissions("sys:pubJqxz:add")
	@RequestMapping(value = "/add")
	public String add() {
		logger.entry("-------新增警情性质");
		return "pubJqxz/pubJqxz_add";
	}

	/**
	 * 
	 * 保存新增警情性质
	 * 
	 * @param pubJqxzdm
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubJqxzdm pubJqxzdm, HttpServletRequest request) throws Exception {
		logger.entry("-------保存警情性质");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubJqxzdm.setCjr(pubUser.getYhmc());
		pubJqxzdm.setCjsj(new Date(System.currentTimeMillis()));
		pubJqxzdm.setGxsj(new Date(System.currentTimeMillis()));
		pubJqxzService.addJqxz(pubJqxzdm);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 修改警情性质
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubJqxz:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改警情性质");
		PubJqxzdm pubJqxz = pubJqxzService.getPubJqxzByJqxzbh(id);
		request.setAttribute("pubJqxz", JsonUtil.toJsonNonNull(pubJqxz));
		return "pubJqxz/pubJqxz_edit";
	}

	/**
	 * 
	 * 查看警情性质
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubJqxz:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看组织机构");
		PubJqxzdm pubJqxz = pubJqxzService.viewPubJqxzByJqxzbh(id);
		request.setAttribute("pubJqxz", JsonUtil.toJsonNonNull(pubJqxz));
		return "pubJqxz/pubJqxz_view";
	}

	/**
	 * 更新警情性质
	 *
	 * @param pubApp the pub pubJqxz
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubJqxzdm pubJqxz, HttpServletRequest request) throws Exception {
		logger.entry("-------更新警情性质");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubJqxz.setGxr(pubUser.getYhmc());

		pubJqxz.setGxsj(new Date(System.currentTimeMillis()));
		pubJqxzService.upDateJqxz(pubJqxz);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条组织机构.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubJqxz:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除组织机构");
		ActionResult ar = ActionResult.success().build();
		pubJqxzService.deleltePubJqxz(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除组织机构.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除组织机构");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			pubJqxzService.deleltePubJqxz(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 获取警情性质树表格数据
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/getTreeGrid")
	@ResponseBody
	public String getTreeGrid(HttpServletRequest request) throws Exception {
		logger.entry("!!!!!!!!!!!!获取警情性质树表格数据");
		// 系统字典树的等级
		String levelStr = request.getParameter("n_level");
		// 系统字典树的bh
		String nodeIdStr = request.getParameter("nodeid");

		// 判空处理
		String nodeId = StringUtils.isEmpty(nodeIdStr) ? null : nodeIdStr;
		int level = StringUtils.isEmpty(levelStr) ? 0 : Integer.valueOf(levelStr);
		// 根据应用ID，字典bh获取字典列表
		List<PubJqxzdmBo> jqxzdmBos = pubJqxzService.getNodesJqxzByJqxzbh(nodeId, 0);
		List<PubJqxzGrid> grid = new ArrayList<PubJqxzGrid>();
		for (PubJqxzdmBo pubJqxzdmBo : jqxzdmBos) {

			PubJqxzGrid pubJqxzdGrid = new PubJqxzGrid();

			// 设置level级别
			if (StringUtils.isEmpty(nodeIdStr)) {
				// request.setAttribute("level", 0);
				pubJqxzdGrid.setLevel(0);
			} else {
				// request.setAttribute("level", level + 1);
				pubJqxzdGrid.setLevel(level + 1);
			}
			Mapper mapper = new DozerBeanMapper();
			mapper.map(pubJqxzdmBo, pubJqxzdGrid);
			if (pubJqxzdmBo.getBzjqxzfbh() == "") {
				pubJqxzdGrid.setParent(null);
			} else {
				pubJqxzdGrid.setParent(pubJqxzdmBo.getBzjqxzfbh() + "");
			}
			pubJqxzdGrid.setId(pubJqxzdmBo.getBzjqxzbh() + "");
			pubJqxzdGrid.setExpanded(false);
			pubJqxzdGrid.setOrder(pubJqxzdGrid.getPxdm() == null ? new Long(0) : pubJqxzdGrid.getPxdm());
			grid.add(pubJqxzdGrid);

		}
		//Collections.sort(grid);
		return JsonUtil.toJsonNonNull(grid);
	}

	/**
	 * 获取一个警情性质资源树.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTree(HttpServletRequest request,HttpServletResponse response) throws Exception {
		logger.entry("!!!!!!!!!!!获取一个警情性质资源树");
		//允许跨域
		response.setHeader("Access-Control-Allow-Credentials", "true"); 
		response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
		
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		String parentId = request.getParameter("id");
		
		String deepType = request.getParameter("deepType");

		ActionResult actionResult = ActionResult.success().build();

		// 按树型结构返回警情性质
		List<PubJqxzdmBo> pubJqxzdmBos = pubJqxzService.getNodesJqxzByJqxzbh(parentId, 1);
		
		if(deepType==null){
			// 重新生成树，因为本身菜单不一定是叶子节点，并把树型变成并列数据
			pubJqxzdmBos = reGenerateTree(pubJqxzdmBos);	
			if (pubJqxzdmBos.size() > 0) {
				treeNodes = pubRes2TreeNodes(pubJqxzdmBos);
			}
			TreeOperate.sortTreeNodes(treeNodes);
			actionResult.setData(treeNodes);
		}else{
			actionResult.setData(pubJqxzdmBos);
		}
		
		return JsonUtil.toJsonNonNull(actionResult);
	}

	public List<PubJqxzdmBo> reGenerateTree(List<PubJqxzdmBo> list) {
		List<PubJqxzdmBo> newList = new ArrayList<PubJqxzdmBo>();

		for (PubJqxzdmBo pubJqxzdmBo : list) {
			List<PubJqxzdmBo> childrenList = pubJqxzdmBo.getChildren();
			if (childrenList != null && childrenList.size() > 0) {
				pubJqxzdmBo.setIsLeaf(false);
				newList.addAll(reGenerateTree(childrenList));
			}
			pubJqxzdmBo.setChildren(null);
		}
		newList.addAll(list);
		return newList;
	}

	/**
	 * 根据PubJqxzdmBo 生成TreeNode list.
	 *
	 * @param PubJqxzdmBos the PubJqxzdmBos
	 * @return List<TreeNode>
	 */
	public static List<TreeNode> pubRes2TreeNodes(List<PubJqxzdmBo> pubJqxzBos) {
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		for (PubJqxzdmBo pubJqxzBo : pubJqxzBos) {
			nodeList.add(pubRes2TreeNode(pubJqxzBo));
		}
		return nodeList;
	}

	/**
	 * 根据PubJqxzdmBo 生成TreeNode.
	 *
	 * @param PubJqxzdmBo the PubJqxzdmBo
	 * @return TreeNode
	 */
	private static TreeNode pubRes2TreeNode(PubJqxzdmBo pubJqxzdmBo) {
		if (null != pubJqxzdmBo) {
			TreeNode treeNode = new TreeNode();
			
			// 将字典bzjqxzbh字段返回
			treeNode.setId(pubJqxzdmBo.getBzjqxzbh());
			treeNode.setText(pubJqxzdmBo.getBzjqxzmc());
			if (pubJqxzdmBo != null && pubJqxzdmBo.getBzjqxzfbh() != null && pubJqxzdmBo.getBzjqxzfbh() != "") {
				treeNode.setParent(pubJqxzdmBo.getBzjqxzfbh());
			} else {
				treeNode.setParent(TreeNode.ROOT_EMPTY);
			}
			if (pubJqxzdmBo.getIsLeaf()) {
				treeNode.setIcon(TreeNode.ICON_LEAF);
			} else {
				treeNode.setIcon(TreeNode.ICON_TREE);
			}
			//treeNode.setOrder(pubJqxzdmBo.getPxdm().intValue());
			TreeNodeState state = new TreeNodeState();
			state.setOpened(true);
			treeNode.setState(state);
			return treeNode;
		}
		return null;
	}

	/**
	 * 
	 * 验证警情性质编号
	 * @param request
	 * @param jqxzbh
	 * @return
	 * @throws Exception String
	 */
	@ResponseBody
	@RequestMapping("/validateJqxzbh")
	public String validateYymc(HttpServletRequest request, String jqxzbh) throws Exception {
		logger.entry("-------验证警情性质编号");
		PubJqxzdm pubJqxzdm = pubJqxzService.getPubJqxzByJqxzbh(jqxzbh);
		String flag = "true";
		if (pubJqxzdm != null) {
			flag = "false";
		}
		return flag;
	}

}

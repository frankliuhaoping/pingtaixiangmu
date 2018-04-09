/** 
 * Project Name:web-system 
 * File Name:PubXtzdController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年2月9日 下午3:26:32 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.frame.web.model.vo.TreeNodeState;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.model.vo.PubXtzdGrid;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubXtzdService;

/**
 * 
 * ClassName: PubXtzdController <br/>
 * Function: 系统字典控制类. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年2月9日 下午3:26:32 <br/>
 * 
 * @author cs
 */
@Controller
@RequestMapping("/pubXtzd")
public class PubXtzdController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubXtzdController.class);

	/**
	 * pubXtzdService: 系统字典服务.
	 */
	@Autowired
	private PubXtzdService pubXtzdService;
	
	/**
	 * pubAppService: 获取应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * 返回到pubXtzd index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubXtzd index界面");
		return "/pubXtzd/pubXtzd_index";
	}
	
	/**
	 * 获取系统字典树表格数据.
	 * 
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTreeGrid")
	@ResponseBody
	public String getTreeGrid(HttpServletRequest request) throws Exception {
		logger.entry("-------获取系统字典树表格数据");
		//系统字典树的等级
		String levelStr = request.getParameter("n_level");
		//系统字典树的bh
		String nodeIdStr = request.getParameter("nodeid");
		//应用Id
		String yyidStr = request.getParameter("yyid");
		//判空处理
		String nodeId = StringUtils.isEmpty(nodeIdStr) ? null : nodeIdStr;
		int yyid = StringUtils.isEmpty(yyidStr) ? 0 : Integer.valueOf(yyidStr);
		int level = StringUtils.isEmpty(levelStr) ? 0 : Integer.valueOf(levelStr);
		//根据应用ID，字典bh获取字典列表
		List<PubXtzdBo> pubXtzdBos = pubXtzdService.getPubXtzdNodesById(Long.valueOf(yyid), nodeId, 0);
		List<PubXtzdGrid> grid = new ArrayList<PubXtzdGrid>();
		for (PubXtzdBo pubXtzdBo : pubXtzdBos) {
			// 应用ID相同
			if (null != pubXtzdBo.getYyid() && pubXtzdBo.getYyid().intValue() == yyid) {
				
				PubXtzdGrid pubXtzdGrid = new PubXtzdGrid();
				
				// 设置level级别
				if(StringUtils.isEmpty(nodeIdStr)){
					//request.setAttribute("level", 0);
					pubXtzdGrid.setLevel(0);
				}else{
					//request.setAttribute("level", level + 1);
					pubXtzdGrid.setLevel(level + 1);
				}
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubXtzdBo, pubXtzdGrid);
				if (pubXtzdBo.getZdfbh() == "") {
					pubXtzdGrid.setParent(null);
				} else {
					pubXtzdGrid.setParent(pubXtzdBo.getZdfbh() + "");
				}
				pubXtzdGrid.setId(pubXtzdBo.getBh() + "");
				pubXtzdGrid.setExpanded(false);
				pubXtzdGrid.setOrder(pubXtzdGrid.getPxdm() == null ? new Long(0) : pubXtzdGrid.getPxdm());
				grid.add(pubXtzdGrid);
			}
		}
		Collections.sort(grid);
		return JsonUtil.toJsonNonNull(grid);
	}

	/**
	 * 新增系统字典.
	 *
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubXtzd:add")
	@RequestMapping(value = "/add")
	public String add(String zdbh, HttpServletRequest request) throws Exception {
		logger.entry("-------新增系统字典");
		String bh = request.getParameter("parentId");
		PubApp pubApp = pubAppService.getAppByYyid(new Long(request.getParameter("yyid")));
		if(StringUtils.isEmpty(bh)){
			request.setAttribute("yydm", pubApp.getYydm() + "_");
		}else{
			PubXtzd pubXtzd = pubXtzdService.getPubXtzdByBh(bh);
			if (pubXtzd != null) {
				request.setAttribute("yydm", pubXtzd.getZdbh() + "_");
				request.setAttribute("zdfName", pubXtzd.getZdxm());
			} else {
				request.setAttribute("yydm", pubApp.getYydm() + "_");
			}
		}
		request.setAttribute("zdfbh", bh);
		return "pubXtzd/pubXtzd_add";
	}

	/**
	 * 保存新增系统字典.
	 *
	 * @param pubZzjg the pub PubXtzd
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubXtzd pubXtzd, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增系统字典");
		ActionResult ar = ActionResult.success().build();
		String zdfzdbh = request.getParameter("zdfzdbh");
		// 通过字典父编号和项值生成新的字典编号
		pubXtzd.setZdbh(zdfzdbh + pubXtzd.getZdxz());
		// 时间设置
		pubXtzd.setCjsj(new Date(System.currentTimeMillis()));
		pubXtzd.setGxsj(new Date(System.currentTimeMillis()));

		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		if (pubUser != null) {
			pubXtzd.setCjr(pubUser.getYhmc());
		}

		pubXtzdService.addPubXtzd(pubXtzd);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改系统字典.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubXtzd:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改系统字典");
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByBh(id);
		request.setAttribute("pubXtzd", JsonUtil.toJsonNonNull(pubXtzd));
		//根据bh获取到字典父级的名称
		if(StringUtils.isNotEmpty(pubXtzd.getZdfbh())){
			PubXtzd parentPubXtzd = pubXtzdService.getPubXtzdByBh(pubXtzd.getZdfbh());
			request.setAttribute("zdfName", parentPubXtzd.getZdxm());
			request.setAttribute("zdfzdbh", parentPubXtzd.getZdbh() + "_");
		} else {
			request.setAttribute("zdfzdbh", pubXtzd.getZdbh().split("_")[0] + "_");
		}
		return "pubXtzd/pubXtzd_edit";
	}

	/**
	 * 查看系统字典
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubXtzd:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看系统字典");
		//根据编号获取到系统字典
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByBh(id);
		//根据bh获取到字典父级的名称
		if(StringUtils.isNotEmpty(pubXtzd.getZdfbh())){
			PubXtzd parentPubXtzd = pubXtzdService.getPubXtzdByBh(pubXtzd.getZdfbh());
			request.setAttribute("zdfName", parentPubXtzd.getZdxm());
		}

		request.setAttribute("pubXtzd", JsonUtil.toJsonNonNull(pubXtzd));
		return "pubXtzd/pubXtzd_view";
	}

	/**
	 * 更新系统字典
	 * 
	 * @param pubXtzd
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubXtzd pubXtzd, HttpServletRequest request) throws Exception {
		logger.entry("-------更新系统字典");
		ActionResult ar = ActionResult.success().build();
		String zdfzdbh = request.getParameter("zdfzdbh");
		// 通过字典父编号和项值生成新的字典编号
		pubXtzd.setZdbh(zdfzdbh + pubXtzd.getZdxz());
		// 更新时间
		pubXtzd.setGxsj(new Date(System.currentTimeMillis()));
		//获取到更新人的姓名
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		if (pubUser != null) {
			pubXtzd.setGxr(pubUser.getYhmc());
		}

		pubXtzdService.updatePubXtzd(pubXtzd);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除系统字典.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubXtzd:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除系统字典");
		ActionResult ar = ActionResult.success().build();
		pubXtzdService.deleltePubXtzdByBh(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除系统字典.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除系统字典");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			pubXtzdService.deleltePubXtzdByBh(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 获取一个字典资源树.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTree(HttpServletRequest request) throws Exception {
		logger.entry("-------获取一个字典树，只包含字典，不包含按钮");
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		String parentId = request.getParameter("id");
		String yyidStr = request.getParameter("yyid");
		int yyid = StringUtils.isEmpty(yyidStr) ? 0 : Integer.valueOf(yyidStr);
		ActionResult actionResult = ActionResult.success().build();
//		long id = 0;
//		if (!TreeNode.ROOT_EMPTY.equals(parentId)) {
//			if (parentId != null) {
//				id = Long.valueOf(parentId);
//			}
//		}
		// 按树型结构返回字典
		List<PubXtzdBo> pubXtzdBos = pubXtzdService.getPubXtzdNodesById(Long.valueOf(yyid), parentId, 1);

		// 重新生成树，因为本身菜单不一定是叶子节点，并把树型变成并列数据
		pubXtzdBos = reGenerateTree(pubXtzdBos);

		JsonUtil.toJsonNonNull(pubXtzdBos);
		if (pubXtzdBos.size() > 0) {
			treeNodes = pubRes2TreeNodes(pubXtzdBos);
		}
		TreeOperate.sortTreeNodes(treeNodes);
		actionResult.setData(treeNodes);
		return JsonUtil.toJsonNonNull(actionResult);
	}
	
	/**
	 * 获取当前系统的字典信息列表，主要用于下拉框展示
	 * 
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPubXtzdList")
	@ResponseBody
	public String getPubXtzdList(HttpServletRequest request) throws Exception {
		logger.entry("-------获取系统字典列表");
		ActionResult ar = ActionResult.success().build();
		String zdbh = request.getParameter("zdbh");	
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByZdbh(zdbh);
		List<PubXtzd> pubXtzds = pubXtzdService.getPubXtzdListByZdbh(Long.valueOf(pubXtzd.getYyid()), zdbh);
		ar.setData(pubXtzds);
		return JsonUtil.toJsonNonNull(ar);
	}
	
	public List<PubXtzdBo> reGenerateTree(List<PubXtzdBo> list) {
		List<PubXtzdBo> newList = new ArrayList<PubXtzdBo>();

		for (PubXtzdBo pubXtzdBo : list) {
			List<PubXtzdBo> childrenList = pubXtzdBo.getChildren();
			if (childrenList != null && childrenList.size() > 0) {
//				boolean haveMenu = haveMenu(childrenList);
//				if (haveMenu) {
					// 说明他的子节点中还包含菜单，需递归
					pubXtzdBo.setIsLeaf(false);

					newList.addAll(reGenerateTree(childrenList));
//				} else {
//					pubXtzdBo.setIsLeaf(true);
//				}
			}
			pubXtzdBo.setChildren(null);
		}
		newList.addAll(list);
		return newList;

	}
	
	/**
	 * 根据PubXtzdBo 生成TreeNode list.
	 *
	 * @param pubXtzdBos the pubXtzdbos
	 * @return List<TreeNode>
	 */
	public static List<TreeNode> pubRes2TreeNodes(List<PubXtzdBo> pubXtzdBos) {
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		for (PubXtzdBo pubXtzdBo : pubXtzdBos) {
			nodeList.add(pubRes2TreeNode(pubXtzdBo));
		}
		return nodeList;
	}
	
	/**
	 * 根据PubXtzdBo 生成TreeNode.
	 *
	 * @param pubXtzdBo the pubXtzdbo
	 * @return TreeNode
	 */
	private static TreeNode pubRes2TreeNode(PubXtzdBo pubXtzdBo) {
		if (null != pubXtzdBo) {
			TreeNode treeNode = new TreeNode();
//			treeNode.setId(pubXtzdBo.getZdbh() + "");
			// 将字典bh和zdbh字段返回
			treeNode.setId(pubXtzdBo.getBh());
			treeNode.setText(pubXtzdBo.getZdxm() + " : " + pubXtzdBo.getZdbh());

			if (pubXtzdBo != null && pubXtzdBo.getZdfbh() != null && pubXtzdBo.getZdfbh() != "") {
				treeNode.setParent(pubXtzdBo.getZdfbh());
			} else {
				treeNode.setParent(TreeNode.ROOT_EMPTY);
			}

			if (pubXtzdBo.getIsLeaf()) {
				treeNode.setIcon(TreeNode.ICON_LEAF);
			} else {
				treeNode.setIcon(TreeNode.ICON_TREE);
			}
			treeNode.setOrder(pubXtzdBo.getPxdm().intValue());
			TreeNodeState state = new TreeNodeState();
			state.setOpened(true);
			treeNode.setState(state);
			return treeNode;
		}
		return null;
	}
}

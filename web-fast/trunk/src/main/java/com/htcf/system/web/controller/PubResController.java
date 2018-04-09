/** 
 * Project Name:web-system 
 * File Name:MenuPrivilegeController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016-12-813:53:56 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

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

import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.frame.web.model.vo.TreeNodeState;
import com.htcf.system.model.bo.PubResBo;
import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.vo.PubResGrid;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubResService;

/**
 * 
 * ClassName: PubResController <br/>
 * Function: 资源Controller <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年12月23日 上午11:36:47 <br/>
 * 
 * @author zhangyingzi
 */
@Controller
@RequestMapping("/pubRes")
public class PubResController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubResController.class);

	/**
	 * pubResService: 获取资源权限服务.
	 */
	@Autowired
	private PubResService pubResService;

	/**
	 * pubAppService: 获取应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

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
		return "/pubRes/pubRes_index";
	}

	/**
	 * 获取权限树表格数据.
	 * 
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTreeGrid")
	@ResponseBody
	public String getTreeGrid(HttpServletRequest request) throws Exception {
		logger.entry("-------获取权限树表格数据");
		String nodeIdStr = request.getParameter("nodeid");
		String yyidStr = request.getParameter("yyid");
		int nodeId = StringUtil.isEmpty(nodeIdStr) ? 0 : Integer.valueOf(request.getParameter("nodeid"));
		int yyid = StringUtil.isEmpty(yyidStr) ? 0 : Integer.valueOf(yyidStr);
		List<PubResBo> pubResBos = pubResService.getPubResNodesById(yyid, nodeId, 0);
		List<PubResGrid> grid = new ArrayList<PubResGrid>();
		for (PubResBo pubResBo : pubResBos) {
			// 应用ID相同
			if (null != pubResBo.getYyid() && pubResBo.getYyid().intValue() == yyid) {
				PubResGrid pubResBoGrid = new PubResGrid();
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubResBo, pubResBoGrid);
				if (pubResBo.getZyfid() == 0) {
					pubResBoGrid.setParent(null);
				} else {
					pubResBoGrid.setParent(pubResBo.getZyfid() + "");
				}
				pubResBoGrid.setId(pubResBo.getZyid() + "");
				pubResBoGrid.setExpanded(false);
				pubResBoGrid.setOrder(pubResBoGrid.getPxdm() == null ? 0 : pubResBoGrid.getPxdm());
				grid.add(pubResBoGrid);
			}
		}
		Collections.sort(grid);
		return JsonUtil.toJsonNonNull(grid);
	}

	/**
	 * 新增权限.
	 *
	 * @param request the request
	 * @return String
	 */
	@RequiresPermissions("sys:pubRes:add")
	@RequestMapping(value = "/add")
	public String add() {
		logger.entry("-------新增权限");
		return "pubRes/pubRes_add";
	}

	/**
	 * 保存资源权限.
	 *
	 * @param pubRes the pub res
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubRes pubRes, HttpServletRequest request) throws Exception {
		logger.entry("-------保存资源权限");
		ActionResult actionResult = ActionResult.success().build();

		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubRes.setCjrxm(pubUser.getYhmc());
		pubRes.setCjsj(new Date(System.currentTimeMillis()));
		pubRes.setGxsj(new Date(System.currentTimeMillis()));

		pubResService.addRes(pubRes);
		return JsonUtil.toJsonNonNull(actionResult);
	}

	/**
	 * 修改权限.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubRes:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改权限");
		PubRes pubRes = pubResService.getResByZyid(Long.valueOf(id));
		if (pubRes.getZyfid() != 0) {
			PubRes parentPubRes = pubResService.getResByZyid(pubRes.getZyfid());
			request.setAttribute("zyfName", parentPubRes.getZymc());
		}
		request.setAttribute("pubRes", JsonUtil.toJsonNonNull(pubRes));
		return "pubRes/pubRes_edit";
	}

	/**
	 * 保存修改权限.
	 *
	 * @param pubRes the pub res
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubRes pubRes, HttpServletRequest request) throws Exception {
		logger.entry("-------保存修改权限");
		ActionResult actionResult = ActionResult.success().build();

		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubRes.setGxrxm(pubUser.getYhmc());
		pubRes.setGxsj(new Date(System.currentTimeMillis()));

		pubResService.updateRes(pubRes);
		return JsonUtil.toJsonNonNull(actionResult);
	}

	/**
	 * 删除资源权限.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubRes:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除资源权限");
		ActionResult actionResult = ActionResult.success().build();
		pubResService.delelteRes(Long.valueOf(id));
		return JsonUtil.toJsonNonNull(actionResult);
	}

	/**
	 * 获取一个菜单资源树.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTree(HttpServletRequest request) throws Exception {
		logger.entry("-------获取一个资源树，只包含菜单，不包含按钮");
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		String parentId = request.getParameter("id");
		String yyidStr = request.getParameter("yyid");
		int yyid = StringUtil.isEmpty(yyidStr) ? 0 : Integer.valueOf(yyidStr);
		ActionResult actionResult = ActionResult.success().build();
		long id = 0;
		if (!TreeNode.ROOT_EMPTY.equals(parentId)) {
			if (parentId != null) {
				id = Long.valueOf(parentId);
			}
		}
		// 按树型结构返回资源
		List<PubResBo> pubResBos = pubResService.getPubResNodesById(yyid, id, 1);

		// 重新生成树，因为本身菜单不一定是叶子节点，并把树型变成并列数据
		pubResBos = reGenerateTree(pubResBos);

		JsonUtil.toJsonNonNull(pubResBos);
		if (pubResBos.size() > 0) {
			treeNodes = pubRes2TreeNodes(pubResBos);
		}
		TreeOperate.sortTreeNodes(treeNodes);
		actionResult.setData(treeNodes);
		return JsonUtil.toJsonNonNull(actionResult);
	}

	/**
	 * 获取一个资源树.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getAllTree")
	@ResponseBody
	public String getAllTree(HttpServletRequest request) throws Exception {
		logger.entry("-------获取一个资源树");
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		String parentId = request.getParameter("id"), yyidStr = request.getParameter("yyid");
		int yyid = StringUtil.isEmpty(yyidStr) ? 0 : Integer.valueOf(yyidStr);
		ActionResult actionResult = ActionResult.success().build();
		long id = 0;
		if (!TreeNode.ROOT_EMPTY.equals(parentId)) {
			if (parentId != null) {
				id = Long.valueOf(parentId);
			}
		}
		// 按并列结构返回资源
		List<PubResBo> pubResBos = pubResService.getPubResNodesById(yyid, id, 2);

		if (pubResBos.size() > 0) {
			treeNodes = pubRes2TreeNodes(pubResBos);
		}
		TreeOperate.sortTreeNodes(treeNodes);
		actionResult.setData(treeNodes);
		return JsonUtil.toJsonNonNull(actionResult);
	}

	public List<PubResBo> reGenerateTree(List<PubResBo> list) {
		List<PubResBo> newList = new ArrayList<PubResBo>();

		for (PubResBo pubResBo : list) {
			List<PubResBo> childrenList = pubResBo.getChildren();
			if (childrenList != null && childrenList.size() > 0) {
				boolean haveMenu = haveMenu(childrenList);
				if (haveMenu) {
					// 说明他的子节点中还包含菜单，需递归
					pubResBo.setIsLeaf(false);

					newList.addAll(reGenerateTree(childrenList));
				} else {
					pubResBo.setIsLeaf(true);
				}
			}
			pubResBo.setChildren(null);
		}
		newList.addAll(list);
		return newList;

	}

	public boolean haveMenu(List<PubResBo> childrenList) {
		for (PubResBo childrenBo : childrenList) {
			if (childrenBo.getZylx() == 1) {
				// 资源类型为菜单
				return true;
			}
		}
		// 全部为按钮
		return false;
	}

	/**
	 * view 权限详情
	 * 
	 * @param id 主键
	 * @param request
	 * @return String 详情页面
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRes:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------权限详情");
		PubRes pubRes = pubResService.getResByZyid(Long.valueOf(id));
		if (pubRes.getZyfid() != 0) {
			PubRes parentPubRes = pubResService.getResByZyid(pubRes.getZyfid());
			request.setAttribute("zyfName", parentPubRes.getZymc());
		}
		request.setAttribute("pubRes", JsonUtil.toJsonNonNull(pubRes));
		return "pubRes/pubRes_view";
	}

	/**
	 * 根据PubResBo 生成TreeNode list.
	 *
	 * @param pubResBos the pub res bos
	 * @return List<TreeNode>
	 */
	public static List<TreeNode> pubRes2TreeNodes(List<PubResBo> pubResBos) {
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		for (PubResBo pubResBo : pubResBos) {
			nodeList.add(pubRes2TreeNode(pubResBo));
		}
		return nodeList;
	}

	/**
	 * 根据PubResBo 生成TreeNode.
	 *
	 * @param pubResBo the pub res bo
	 * @return TreeNode
	 */
	private static TreeNode pubRes2TreeNode(PubResBo pubResBo) {
		if (null != pubResBo) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(pubResBo.getZyid() + "");
			treeNode.setText(pubResBo.getZymc());

			if (pubResBo != null && pubResBo.getZyfid() != null && pubResBo.getZyfid() != 0) {
				treeNode.setParent(pubResBo.getZyfid() + "");
			} else {
				treeNode.setParent(TreeNode.ROOT_EMPTY);
			}

			if (pubResBo.getIsLeaf()) {
				treeNode.setIcon(TreeNode.ICON_LEAF);
			} else {
				treeNode.setIcon(TreeNode.ICON_TREE);
			}
			treeNode.setOrder(pubResBo.getPxdm());
			TreeNodeState state = new TreeNodeState();
			state.setOpened(true);
			treeNode.setState(state);
			return treeNode;
		}
		return null;
	}
}
/** 
 * Project Name:web-test 
 * File Name:PubAppController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016年12月1日下午4:45:00 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.htcf.frame.base.util.FworkHelper;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.model.User;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.frame.web.model.vo.TreeNodeState;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.model.po.PubZzjgsy;
import com.htcf.system.service.PubXtzdService;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.PubZzjgsyService;

/**
 * 
 * ClassName: PubZzjgsyController Function: TODO 组织机构使用维护. Reason: TODO ADD
 * REASON(可选). date: 2017年4月7日 上午9:19:38
 * 
 * @author wei
 */
@Controller
@RequestMapping("/pubZzjgsy")
public class PubZzjgsyController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubZzjgsyController.class);

	/**
	 * pubZzjgService: 组织机构方法服务.
	 */
	@Autowired
	private PubZzjgService pubZzjgService;

	/**
	 * pubXtzdService: 系统字典服务.
	 */
	@Autowired
	private PubXtzdService pubXtzdService;

	/**
	 * 组织关系使用 服务
	 */
	@Autowired
	private PubZzjgsyService pubZzjgsyService;

	/**
	 * 返回到pubZzjgsy index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubZzjgsy index界面");
		return "/pubZzjgsy/pubZzjgsy_index";
	}

	/**
	 * 保存新增组织机构.
	 *
	 * @param pubZzjg the pub pubZzjg
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubZzjgsy pubZzjgsy, HttpServletRequest request) throws Exception {
		logger.entry("-------保存组织机构");
		ActionResult ar = ActionResult.success().build();
		User pubUser = FworkHelper.getUser();
		if (pubUser != null) {
			pubZzjgsy.setCjr(pubUser.getYhzh());
		}
		pubZzjgsyService.mergePubZzjgsy(pubZzjgsy);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 获取组织机构使用树
	 * 
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/getOrgUseTree")
	public String getOrgUseTree() throws Exception {
		logger.entry("----获取字典组织数");
		String zdbh = "system_zzjgsybz";
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByZdbh(zdbh);
		List<PubXtzdBo> list = pubXtzdService.getPubXtzdNodesById(pubXtzd.getYyid(), pubXtzd.getBh(), 0);
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		if (list != null) {
			for (PubXtzdBo pubXtzdBo : list) {
				TreeNode treeNode = new TreeNode();
				treeNode.setId(pubXtzdBo.getZdbh());
				treeNode.setText(pubXtzdBo.getZdxm());
				treeNode.setChildren(null);
				treeNodes.add(treeNode);
			}
		}
		TreeOperate.sortTreeNodes(treeNodes);
		return JsonUtil.toJsonNonNull(treeNodes);
	}

	/**
	 * 
	 * TODO(获取组织待选择的树)
	 * 
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/getOrgTree")
	public String getOrgTree() throws Exception {
		logger.entry("-----获取组织待选择的树");
		List<PubZzjgBo> pubZzjgBos = pubZzjgService.getNodesZzjgByDwdm(null, 2);
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		if (pubZzjgBos != null) {
			for (PubZzjgBo pubZzjgBo : pubZzjgBos) {
				nodeList.add(pubZzjgBo2TreeNode(pubZzjgBo));
			}
		}
		// 排序
		TreeOperate.sortTreeNodes(nodeList);
		return JsonUtil.toJsonNonNull(nodeList);
	}

	private TreeNode pubZzjgBo2TreeNode(PubZzjgBo pubZzjgBo) {
		if (null != pubZzjgBo) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(pubZzjgBo.getDwdm() + "");
			treeNode.setText(pubZzjgBo.getJhdwmc());
			TreeNodeState state = new TreeNodeState();
			if (pubZzjgBo != null && !StringUtils.isEmpty(pubZzjgBo.getGxdwdm())) {
				treeNode.setParent(pubZzjgBo.getGxdwdm());
				state.setOpened(false);
			} else {
				treeNode.setParent(TreeNode.ROOT_EMPTY);
				state.setOpened(true);
			}
			if (pubZzjgBo.getIsLeaf()) {
				treeNode.setIcon(TreeNode.ICON_LEAF);
			} else {
				treeNode.setIcon(TreeNode.ICON_TREE);
			}
			// treeNode.setOrder(pubZzjgBo.getLevel());
			treeNode.setState(state);
			return treeNode;
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("/getSelectedOrgTree")
	public String getSelectedOrgTree(String zdbh) throws Exception {
		List<String> list = pubZzjgsyService.queryDwdmByZdbh(zdbh);
		return JsonUtil.toJsonNonNull(list);
	}

	@RequestMapping("/testDemo")
	public String testDemo() {
		logger.entry("-------返回到pubZzjgsy_testindex界面");
		return "/pubZzjgsy/pubZzjgsy_testindex";
	}

	@Deprecated
	@ResponseBody
	@RequestMapping("/getSelectedOrgTree2")
	public String getSelectedOrgTree2(String zdbh) throws Exception {

		List<PubZzjgBo> pubZzjgBos = pubZzjgsyService.queryPubZzjgBoByZdbh(zdbh, 2, null);
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		if (pubZzjgBos != null) {
			for (PubZzjgBo pubZzjgBo : pubZzjgBos) {
				nodeList.add(pubZzjgBo2TreeNode(pubZzjgBo));
			}
		}
		return JsonUtil.toJsonNonNull(nodeList);
	}

	/**
	 * 返回到pubZzjgsy index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/view_index")
	public String listView() {
		logger.entry("-------返回到pubZzjgsy view界面");
		return "/pubZzjgsy/pubZzjgsy_view";
	}

	/**
	 * 组织机构使用信息树 TODO(获取组织已选择的树)
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getOrgTreeView")
	public String getOrgTreeView(String zdbh) throws Exception {
		logger.entry("-----获取组织已选择的树");
		List<PubZzjgBo> pubZzjgBos = pubZzjgsyService.getPubZzjgBoByZdbh(zdbh, null, 2);
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		if (pubZzjgBos != null) {
			for (PubZzjgBo pubZzjgBo : pubZzjgBos) {
				nodeList.add(pubZzjgBo2TreeNode(pubZzjgBo));
			}
			// 排序
			TreeOperate.sortTreeNodes(nodeList);
		}
		return JsonUtil.toJsonNonNull(nodeList);
	}

	/**
	 * 
	 * 复制
	 * 
	 * @param zdbh
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/copy")
	public String copy(String zdbh, String bh, HttpServletRequest request) throws Exception {
		ActionResult ar = ActionResult.success().build();
		logger.entry("-------复制配置--源配置" + zdbh + ",配置到" + bh);
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubZzjgsyService.copyPubZzjgsy(zdbh, bh, pubUser.getYhzh());
		return JsonUtil.toJsonNonNull(ar);
	}
}

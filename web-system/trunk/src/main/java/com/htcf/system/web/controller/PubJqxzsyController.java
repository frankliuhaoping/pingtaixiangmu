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

import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.frame.web.model.vo.TreeNodeState;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubJqxzsy;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.model.po.PubZzjgsy;
import com.htcf.system.service.PubJqxzService;
import com.htcf.system.service.PubJqxzsyService;
import com.htcf.system.service.PubXtzdService;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.PubZzjgsyService;

/**
 * 
 * ClassName: PubJqxzsyController
 * Function: TODO 警情性质维护使用
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月9日 下午15:19:38
 * 
 * @author liuhuan
 */
@Controller
@RequestMapping("/pubJqxzsy")
public class PubJqxzsyController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubJqxzsyController.class);

	/**
	 * pubZzjgService: 警情性质方法服务.
	 */
	@Autowired
	private PubJqxzService pubJqxzService;
	
	/**
	 * pubXtzdService: 系统字典服务.
	 */
	@Autowired
	private PubXtzdService pubXtzdService;
	
	/**
	 *  警情关系使用 服务
	 */
	@Autowired
	private PubJqxzsyService pubJqxzsyService;

	/**
	 * 返回到pubJqxzsy index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubJqxzsy index界面");
		return "/pubJqxzsy/pubJqxzsy_index";
	}

	/**
	 * 保存新增警情性质.
	 *
	 * @param 
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubJqxzsy pubJqxzsy, HttpServletRequest request) throws Exception {
		logger.entry("-------保存警情性质使用选择");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		if (pubUser != null) {
			pubJqxzsy.setCjr(pubUser.getYhzh());
		}
		pubJqxzsyService.addPubJqxzsy(pubJqxzsy);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 获取警情性质使用树
	 * 
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping("/getOrgUseTree")
	public String getOrgUseTree() throws Exception{
		logger.entry("----获取字典警情性质数");
		String zdbh = "system_jqxzsybz";
		PubXtzd pubXtzd = pubXtzdService.getPubXtzdByZdbh(zdbh);
		List<PubXtzdBo> list = pubXtzdService.getPubXtzdNodesById(pubXtzd.getYyid(), pubXtzd.getBh(), 0);
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		if(list != null){
			for(PubXtzdBo pubXtzdBo : list ){
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
	 * 
	 * 
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping("/getOrgTree")
	public String getOrgTree() throws Exception{
		logger.entry("-----获取警情要选择的树");
		List<PubJqxzdmBo> pubJqxzdmBos = pubJqxzService.getNodesJqxzByJqxzbh(null, 2);
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		if(pubJqxzdmBos != null){
			for(PubJqxzdmBo pubJqxzdmBo : pubJqxzdmBos){
				nodeList.add(pubJqxzBo2TreeNode(pubJqxzdmBo));
			}
		}
		//排序
		TreeOperate.sortTreeNodes(nodeList);
		return JsonUtil.toJsonNonNull(nodeList); 
	}
	
	private TreeNode pubJqxzBo2TreeNode(PubJqxzdmBo pubJqxzdmBo) {
		if (null != pubJqxzdmBo) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(pubJqxzdmBo.getBzjqxzbh() + "");
			treeNode.setText(pubJqxzdmBo.getBzjqxzmc());
			TreeNodeState state = new TreeNodeState();
			if (pubJqxzdmBo != null && !StringUtils.isEmpty(pubJqxzdmBo.getBzjqxzfbh())) {
				treeNode.setParent(pubJqxzdmBo.getBzjqxzfbh());
				state.setOpened(false);
			} else {
				treeNode.setParent(TreeNode.ROOT_EMPTY);
				state.setOpened(true);
			}
			if (pubJqxzdmBo.getIsLeaf()) {
				treeNode.setIcon(TreeNode.ICON_LEAF);
			} else {
				treeNode.setIcon(TreeNode.ICON_TREE);
			}
//			treeNode.setOrder(pubJqxzdmBo.getLevel());
			treeNode.setState(state);
			
			return treeNode;
		}
		return null;
	}
	
	
	/**
	 * 根据zdbh得到所有的jqxzbh
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 */
	
	@ResponseBody
	@RequestMapping("/getSelectedOrgTree")
	public String getSelectedOrgTree(String zdbh) throws Exception{
		List<String> list = pubJqxzsyService.queryJqxzBhByZdbh(zdbh);
		return JsonUtil.toJsonNonNull(list);
	}
	
	/**
	 * 
	 * 
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getOrgTreeView")
	public String getOrgTreeView(String zdbh) throws Exception{
		logger.entry("-----获取警情性质已选择的树");
		List<PubJqxzdmBo> pubJqxzdmBos = pubJqxzsyService.getPubJqxzByZdbh(zdbh,null,2);
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		if(pubJqxzdmBos != null){
			for(PubJqxzdmBo pubJqxzdmBo : pubJqxzdmBos){
				nodeList.add(pubJqxzBo2TreeNode(pubJqxzdmBo));
			}
			//排序
			TreeOperate.sortTreeNodes(nodeList);
		}
		
		
		return JsonUtil.toJsonNonNull(nodeList); 
	}
	
	/**
	 * 
	 *  复制
	 * @param zdbh
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/copy")
	public String copy(String zdbh,String bh, HttpServletRequest request)throws Exception{
		ActionResult ar = ActionResult.success().build();
		logger.entry("-------复制配置--源配置"+zdbh+",配置到"+bh);
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubJqxzsyService.copyPubjqxzsy(zdbh, bh, pubUser.getYhzh());
		return JsonUtil.toJsonNonNull(ar); 
	}
	
	
}

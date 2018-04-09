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
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.vo.PubJqxzGrid;
import com.htcf.system.service.PubJqxzService;

/**
 * ClassName: PubJqxzController <br/>
 * Function:  ADD FUNCTION. <br/>
 * Reason:  ADD REASON(可选). <br/>
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
	private PubJqxzService pubJqxzService;

	@RequestMapping("/index")
	public String index() throws Exception {
		logger.entry("-------返回到PubJqxz index界面");
		return "/pubJqxz/pubJqxz_index";
	}

	/**
	 * 
	 * (获取分页数据并生成json格式返回)
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
	 * (新增警情性质)
	 * 
	 * @return String
	 */
	@RequiresPermissions("sys:pubJqxz:add")
	@RequestMapping(value = "/add")
	public String add() {

		logger.entry("-------新增警情性质");
		return "pubJqxz/pubJqxz_add";
	}

	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubJqxzdm pubJqxzdm, HttpServletRequest request) throws Exception {
		logger.entry("-------保存警情性质");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubJqxzdm.setCjr(pubUser.getYhmc());

		pubJqxzdm.setCjsj(new Date(System.currentTimeMillis()));
		pubJqxzdm.setGxsj(new Date(System.currentTimeMillis()));
		pubJqxzdm.setPxdm(Long.parseLong(pubJqxzdm.getBzjqxzbh()));
		pubJqxzService.addJqxz(pubJqxzdm);
		return JsonUtil.toJsonNonNull(ar);

	}

	/**
	 * 
	 * (修改警情性质)
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
	 * (查看警情性质)
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
	 * 获取树形结构 组织机构数据
	 * 
	 * @param number
	 * @return String
	 */
	@RequestMapping("/getNodesJqxzByJqxzbh")
	@ResponseBody
	public String getNodesJqxzByJqxzbh(Integer len, HttpServletRequest request) {
		logger.entry("-------获取所有根组织机构");

		String jqxzbh = request.getParameter("nodeid");
		List<PubJqxzdmBo> pubJqxzBos = pubJqxzService.getNodesJqxzByJqxzbh(jqxzbh, 0);

		List<PubJqxzGrid> grid = new ArrayList<PubJqxzGrid>();
		if (pubJqxzBos != null && pubJqxzBos.size() > 0) {

			for (PubJqxzdmBo pubJqxzBo : pubJqxzBos) {

				PubJqxzGrid pubJqxzGrid = new PubJqxzGrid();

				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubJqxzBo, pubJqxzGrid);
				pubJqxzGrid.setParent(jqxzbh);
				pubJqxzGrid.setExpanded(false);

				grid.add(pubJqxzGrid);
			}
		}

		Collections.sort(grid);
		return JsonUtil.toJsonNonNull(grid);
	}

	/**
	 * 
	 * 获取警情性质资源树.
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTree(HttpServletRequest request) throws Exception {
		logger.entry("-------获取警情性质资源树");
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		String jqxzbh = request.getParameter("jqxzbh");
		if ("#".equals(jqxzbh)) {
			jqxzbh = null;
		}

		List<PubJqxzdmBo> pubJqxzBos = pubJqxzService.getNodesJqxzByJqxzbh(jqxzbh, 0);

		if (pubJqxzBos != null && pubJqxzBos.size() > 0) {
			treeNodes = pubJqxz2TreeNodes(pubJqxzBos);
		}
		// TreeOperate.sortTreeNodes(treeNodes);
		System.out.println("控制层=======" + treeNodes);
		return JsonUtil.toJsonNonNull(treeNodes);
	}

	/**
	 * 
	 * (根据pubJqxzBos 生成TreeNode list.)
	 * 
	 * @param pubJqxzBos
	 * @return List<TreeNode>
	 */

	public static List<TreeNode> pubJqxz2TreeNodes(List<PubJqxzdmBo> pubJqxzBos) {
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		for (PubJqxzdmBo pubJqxzBo : pubJqxzBos) {
			nodeList.add(pubJqxz2TreeNode(pubJqxzBo));
		}
		return nodeList;
	}

	/**
	 * 
	 * (根据PubJqxzBo 生成TreeNode)
	 * 
	 * @param PubJqxzBo
	 * @return TreeNode
	 */
	private static TreeNode pubJqxz2TreeNode(PubJqxzdmBo PubJqxzBo) {
		if (null != PubJqxzBo) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(PubJqxzBo.getJqxzbh());
			treeNode.setText(PubJqxzBo.getJqxzjc());
			if (!PubJqxzBo.getIsLeaf()) {
				treeNode.setChildren(true);
			}
			return treeNode;
		}
		return null;
	}

}

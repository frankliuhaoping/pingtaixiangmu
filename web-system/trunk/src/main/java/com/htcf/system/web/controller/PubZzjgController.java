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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.TreeOperate;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.frame.web.model.vo.TreeNode;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.vo.PubZzjgGrid;
import com.htcf.system.service.PubZzjgService;

/**
 * ClassName: PubZzjgController <br/>
 * Function: 组织机构的Controller，用于展现和操作组织机构. <br/>
 * date: 2016年12月1日 下午4:45:00 <br/>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/pubZzjg")
public class PubZzjgController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubZzjgController.class);

	/**
	 * pubZzjgService: 组织机构方法服务.
	 */
	@Autowired
	private PubZzjgService pubZzjgService;

	/**
	 * 返回到pubZzjg index界面.
	 *
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		logger.entry("-------返回到pubZzjg index界面");
		return "/pubZzjg/pubZzjg_index";
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
		PageInfo<PubZzjg> pageInfo = pubZzjgService.getListPage(map);
		if (pageInfo == null) {
			return JsonUtil.toJsonNonNull("");
		}
		PageResult<PubZzjg> recordBeanPageResult = new PageResult<PubZzjg>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 新增组织机构.
	 *
	 * @return String
	 */
	@RequiresPermissions("sys:pubZzjg:add")
	@RequestMapping(value = "/add")
	public String add() {
		logger.entry("-------新增组织机构");
		return "pubZzjg/pubZzjg_add";
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
	public String saveAdd(PubZzjg pubZzjg, HttpServletRequest request) throws Exception {
		logger.entry("-------保存组织机构");
		ActionResult ar = ActionResult.success().build();

		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubZzjg.setCjr(pubUser.getYhmc());
		pubZzjg.setCjsj(new Date());
		pubZzjg.setGxr(pubUser.getYhmc());
		pubZzjg.setGxsj(new Date());

		pubZzjgService.addPubZzjg(pubZzjg);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 修改组织机构.
	 *
	 * @param id the id
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubZzjg:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改组织机构");
		PubZzjg pubZzjg = pubZzjgService.getPubZzjgByDwdm(id);
		request.setAttribute("pubZzjg", JsonUtil.toJsonNonNull(pubZzjg));
		return "pubZzjg/pubZzjg_edit";
	}

	/**
	 * 
	 * 查看组织机构
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubZzjg:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------查看组织机构");
		PubZzjg pubZzjg = pubZzjgService.viewPubZzjgByDwdm(id);
		request.setAttribute("pubZzjg", JsonUtil.toJsonNonNull(pubZzjg));
		return "pubZzjg/pubZzjg_view";
	}
	
	
	@RequestMapping(value = "/getxzqh")
	@ResponseBody
	public String getxzqh(HttpServletRequest request) throws Exception {
		logger.entry("-------获取所属单位名称");
		ActionResult ar = ActionResult.success().build();
		String dwdm = request.getParameter("xzqhs");
		PubZzjg pubZzjg = pubZzjgService.getPubZzjgByDwdm(dwdm);
		ar.setData(pubZzjg);
		return JsonUtil.toJsonNonNull(ar);
	}
	
	
	
	
	
	/**
	 * 更新组织机构.
	 *
	 * @param pubApp the pub pubZzjg
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubZzjg pubZzjg, HttpServletRequest request) throws Exception {
		logger.entry("-------更新组织机构");
		ActionResult ar = ActionResult.success().build();

		// 更新时间
		String currentTime = DateUtil.getDateTimeFormat(new Date());
		pubZzjg.setGxsj(DateUtil.formatDate(currentTime, DateUtil.DATETIME_DEFAULT_FORMAT));

		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		if (pubUser != null) {
			pubZzjg.setGxr(pubUser.getYhmc());
		}

		pubZzjgService.updatePubZzjg(pubZzjg);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条组织机构.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubZzjg:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除组织机构");
		ActionResult ar = ActionResult.success().build();
		pubZzjgService.deleltePubZzjg(id);
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
			pubZzjgService.deleltePubZzjg(ids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * 获取树形结构 组织机构数据
	 * 
	 * @param number
	 * @return String
	 * @throws Exception 
	 */
	@RequestMapping("/getNodesZzjgByDwdm")
	@ResponseBody
	public String getNodesZzjgByDwdm(Integer len, HttpServletRequest request) throws Exception {
		logger.entry("-------获取所有根组织机构");
		//组织机构树的等级
		String levelStr = request.getParameter("n_level");
		//组织机构的单位代码
		String dwdm = request.getParameter("nodeid");
		// 获取组织机构数
		List<PubZzjgBo> pubZzjgBos = pubZzjgService.getNodesZzjgByDwdm(dwdm, 0);
		//转成int型level
		int level = StringUtils.isEmpty(levelStr) ? 0 : Integer.valueOf(levelStr);
		List<PubZzjgGrid> grid = new ArrayList<PubZzjgGrid>();
		if (pubZzjgBos != null && pubZzjgBos.size() > 0) {

			for (PubZzjgBo pubZzjgBo : pubZzjgBos) {

				PubZzjgGrid pubZzjgGrid = new PubZzjgGrid();
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubZzjgBo, pubZzjgGrid);
				// 设置level级别
				if(StringUtils.isEmpty(dwdm)){
					//request.setAttribute("level", 0);
					pubZzjgGrid.setLevel(0);
				}else{
					//request.setAttribute("level", level + 1);
					pubZzjgGrid.setLevel(level + 1);
				}
				pubZzjgGrid.setId(pubZzjgBo.getDwdm());
				pubZzjgGrid.setParent(dwdm);
				pubZzjgGrid.setExpanded(false);

				grid.add(pubZzjgGrid);
			}
		}

		Collections.sort(grid);
		return JsonUtil.toJsonNonNull(grid);
	}

	/**
	 * 获取组织机构资源树.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTree(HttpServletRequest request) throws Exception {
		logger.entry("-------获取组织机构资源树");
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		String dwdm = request.getParameter("dwdm");
		if ("#".equals(dwdm)) {
			dwdm = null;
		}
		List<PubZzjgBo> pubZzjgBos = pubZzjgService.getNodesZzjgByDwdm(dwdm, 0);
		if (pubZzjgBos != null && pubZzjgBos.size() > 0) {
			treeNodes = pubZzjg2TreeNodes(pubZzjgBos);
		}

		String type = request.getParameter("type");
		/*if (StringUtils.isBlank(dwdm) && StringUtils.isNotBlank(type) && "0".equals(type)) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId("-1"); // 代表最顶层根节点 id
			treeNode.setText("不限");
			treeNode.setChildren(null);
			treeNodes.add(0, treeNode);
		}*/

		TreeOperate.sortTreeNodes(treeNodes);
		return JsonUtil.toJsonNonNull(treeNodes);
	}

	/**
	 * 
	 * 根据pubZzjgBos 生成TreeNode list.
	 * 
	 * @param pubZzjgBos
	 * @return List<TreeNode>
	 */
	public static List<TreeNode> pubZzjg2TreeNodes(List<PubZzjgBo> pubZzjgBos) {
		List<TreeNode> nodeList = new ArrayList<TreeNode>();
		for (PubZzjgBo pubZzjgBo : pubZzjgBos) {
			nodeList.add(pubZzjg2TreeNode(pubZzjgBo));
		}
		return nodeList;
	}

	/**
	 * 
	 * 根据PubZzjgBo 生成TreeNode
	 * 
	 * @param PubZzjgBo
	 * @return TreeNode
	 */
	private static TreeNode pubZzjg2TreeNode(PubZzjgBo PubZzjgBo) {
		if (null != PubZzjgBo) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(PubZzjgBo.getDwdm());
			treeNode.setText(PubZzjgBo.getDwmc());
			if (!PubZzjgBo.getIsLeaf()) {
				treeNode.setChildren(true);
			}
			return treeNode;
		}
		return null;
	}

}

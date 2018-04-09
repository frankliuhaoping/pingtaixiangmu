package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.base.util.TreeUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubJqxzCache;
import com.htcf.system.cache.PubJqxzListCache;
import com.htcf.system.cache.PubZzjgBoCache;
import com.htcf.system.dao.PubJqxzsyDao;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubJqxzsy;
import com.htcf.system.model.po.PubZzjgsy;
import com.htcf.system.service.PubJqxzsyService;

/** 
 * Project Name:service-system 
 * File Name:PubJqxzsyServiceImpl.java 
 * Package Name: 
 * Date:2017年10月10日 上午9:39:07 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/**
 * ClassName: PubJqxzsyServiceImpl Function: TODO ADD FUNCTION. Reason: TODO ADD
 * REASON(可选). date: 2017年10月10日 上午9:39:07
 * 
 * @author liuhuan
 */
@Service("pubJqxzsyService")
public class PubJqxzsyServiceImpl implements PubJqxzsyService {
	private static final Logger logger = LogManager.getLogger(PubJqxzsyServiceImpl.class);

	@Autowired
	private PubJqxzsyDao pubJqxzsyDao;

	/**
	 * PubJqxzListCache 警情性质的子集缓存List
	 */
	@Autowired
	private PubJqxzListCache pubJqxzListBoCache;

	/**
	 * PubJqxzCache 警情性质自身单个缓存
	 */
	@Autowired
	private PubJqxzCache pubJqxzBoCache;

	/**
	 * 根据zdbh获得所有jqxzbh
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzsyService#queryJqxzBhByZdbh(java.lang.String)
	 */
	@Override
	public List<String> queryJqxzBhByZdbh(String zdbh) throws Exception {
		logger.entry("根据zdbh获得所有jqxzbh");
		List<String> jqxzbhs = pubJqxzsyDao.queryJqxzBhByZdbh(zdbh);
		return jqxzbhs;
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param pubJqxzsy
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzsyService#addPubJqxzsy(com.htcf.system.model.po.PubJqxzsy)
	 */
	@Override
	public void addPubJqxzsy(PubJqxzsy pubJqxzsy) throws Exception {
		logger.entry("addPubJqxzsy");
		// 新增的的时候 先根据zdbh删除以前的
		pubJqxzsyDao.deleteByZdbh(pubJqxzsy.getZdbh());

		String[] pubJqxzsybhs = pubJqxzsy.getJqxzbh().split(",");
		// 不等于空的时候添加数据
		if (pubJqxzsybhs.length > 0 || pubJqxzsybhs != null) {
			for (String pubJqxzsybh : pubJqxzsybhs) {
				pubJqxzsy.setJqxzsyid(UUID.randomUUID().toString().replaceAll("-", ""));
				pubJqxzsy.setJqxzbh(pubJqxzsybh);
				pubJqxzsy.setCjsj(new Date());
				pubJqxzsyDao.add(pubJqxzsy);
			}
		}
	}

	/**
	 *
	 * @param zdbh
	 * @param bzjqxzbh
	 * @param deepType
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzsyService#getPubJqxzByZdbh(java.lang.String,
	 *      java.lang.String, int)
	 */
	@Override
	public List<PubJqxzdmBo> getPubJqxzByZdbh(String zdbh, String bzjqxzbh, int deepType) throws Exception {
		logger.entry("getPubJqxzByZdbh-------------zdbh=" + zdbh);
		// 根据zdbh查询警情使用表中 警情性质集合
		List<PubJqxzdmBo> resuleList = null;
		List<PubJqxzdmBo> pubJqxzsys = pubJqxzsyDao.getPubJqxzByZdbh(zdbh);
		if (pubJqxzsys.isEmpty() || pubJqxzsys == null) {
			return null;
		}
		resuleList = getPubJqxzByZdbh2(pubJqxzsys, bzjqxzbh, deepType);
		if (deepType == 1) {
			TreeUtil<PubJqxzdmBo> t = new TreeUtil<PubJqxzdmBo>();
			return t.buildTree(resuleList, "bzjqxzbh", "bzjqxzfbh", "children");
		}
		return resuleList;
	}

	/**
	 * 
	 * 根据zdbh和bzjqfbh获取子节点
	 * 
	 * @param pubJqxzsys
	 * @param bzjqxzbh
	 * @param deepType
	 * @return
	 * @throws Exception
	 */
	public List<PubJqxzdmBo> getPubJqxzByZdbh2(List<PubJqxzdmBo> pubJqxzsys, String bzjqxzbh, int deepType)
			throws Exception {
		List<PubJqxzdmBo> resultList = new ArrayList<PubJqxzdmBo>();
		// 判断bzjqfbh是否为null
		if (StringUtils.isBlank(bzjqxzbh)) {
			bzjqxzbh = null;
		}
		for (PubJqxzdmBo pubJqxzdm : pubJqxzsys) {
			if (Objects.equals(pubJqxzdm.getBzjqxzfbh(), bzjqxzbh)) {
				pubJqxzdm.setIsLeaf(false);
				// deepType等于 1或者2的时候返回并列结构
				if (deepType == 2 || deepType == 1) {
					List<PubJqxzdmBo> childList = getPubJqxzByZdbh2(pubJqxzsys, pubJqxzdm.getBzjqxzbh(), deepType);
					if (childList == null || childList.isEmpty()) {
						pubJqxzdm.setIsLeaf(true);
					} else {
						resultList.addAll(childList);
					}
				}
				resultList.add(pubJqxzdm);
			}
		}
		return resultList;
	}

	/**
	 * 获取并列数据结构
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzsyService#getPubJqxzByZdbh(java.lang.String)
	 */
	public List<PubJqxzdmBo> getPubJqxzByZdbh(String zdbh) throws Exception {
		logger.entry("getPubJqxzByZdbh-------------zdbh=" + zdbh);
		List<PubJqxzdmBo> resultList = new ArrayList<PubJqxzdmBo>();
		// 根据zdbh查询警情使用表中 警情性质集合
		List<PubJqxzdmBo> pubJqxzsys = pubJqxzsyDao.getPubJqxzByZdbh(zdbh);
		// 获取缓存中的警情性质 需要缓存中的数据
		for (PubJqxzdmBo pubJqxzdm : pubJqxzsys) {
			PubJqxzdmBo pubJqxzdmBo = pubJqxzBoCache.get(pubJqxzdm.getBzjqxzbh());
			if (pubJqxzdmBo != null) {
				resultList.add(pubJqxzdmBo);
			}
		}
		return resultList;
	}

	/**
	 * 
	 * 构建树形结构
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PubJqxzdmBo> createTree(String zdbh) throws Exception {
		// 根据zdbh查询警情使用表中 警情性质集合
		List<PubJqxzdmBo> pubJqxzsys = pubJqxzsyDao.getPubJqxzByZdbh(zdbh);

		List<PubJqxzdmBo> list = new ArrayList<PubJqxzdmBo>();
		// 找到所有的一级菜单
		for (PubJqxzdmBo pubJqxzdmBo : pubJqxzsys) {
			pubJqxzdmBo.setIsLeaf(true);
			if (StringUtils.isBlank(pubJqxzdmBo.getBzjqxzfbh())) {
				list.add(pubJqxzdmBo);
			}
		}
		// 为一级菜单设置子菜单 递归
		for (PubJqxzdmBo pubJqxzdm : list) {
			pubJqxzdm.setChildren(getChild(pubJqxzdm.getBzjqxzbh(), pubJqxzsys));
			if (pubJqxzdm.getChildren() != null) {
				pubJqxzdm.setIsLeaf(false);
			}
		}
		return list;
	}

	/**
	 * 
	 * 树形结构 ,根据zdbh,jqxzbh 获取子节点树形结构
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PubJqxzdmBo> createTree(String zdbh, String jqxzbh) throws Exception {
		// 根据zdbh查询警情使用表中 警情性质集合
		List<PubJqxzdmBo> pubJqxzsys = pubJqxzsyDao.getPubJqxzByZdbh(zdbh);
		if (pubJqxzsys.isEmpty() || pubJqxzsys == null) {
			return null;
		}
		for (PubJqxzdmBo pubJqxzdm : pubJqxzsys) {
			pubJqxzdm.setIsLeaf(true);
			for (PubJqxzdmBo pubJqxzdm2 : pubJqxzsys) {
				if (pubJqxzdm.getBzjqxzbh().equals(pubJqxzdm2.getBzjqxzfbh())) {
					pubJqxzdm.setIsLeaf(false);
					pubJqxzdm.getChildren().add(pubJqxzdm2);
				}
			}
		}

		List<PubJqxzdmBo> tree = new ArrayList<PubJqxzdmBo>();
		for (PubJqxzdmBo pubJqxzdmBo : pubJqxzsys) {
			if (StringUtils.isBlank(jqxzbh) && StringUtils.isBlank(pubJqxzdmBo.getBzjqxzfbh())) {
				tree.add(pubJqxzdmBo);
			}
			if (pubJqxzdmBo.getBzjqxzbh().equals(jqxzbh)) {
				return pubJqxzdmBo.getChildren();
			}
		}
		return tree;
	}

	/**
	 * 查找子菜单
	 * 
	 * @param bzjqxzbh
	 * @param pubJqxzsys
	 * @return
	 */
	private List<PubJqxzdmBo> getChild(String bzjqxzbh, List<PubJqxzdmBo> pubJqxzsys) {
		List<PubJqxzdmBo> childList = new ArrayList<PubJqxzdmBo>();
		for (PubJqxzdmBo pubJqxzdmBo : pubJqxzsys) {
			// 遍历所有节点,将父菜单id于传过来的id 做比较
			if (StringUtils.isNotBlank(pubJqxzdmBo.getBzjqxzfbh())) {
				if (pubJqxzdmBo.getBzjqxzfbh().equals(bzjqxzbh)) {
					childList.add(pubJqxzdmBo);
				}
			}
		}
		if (childList.size() == 0) {
			return null;
		}
		// 把子菜单循环
		for (PubJqxzdmBo pubJqxzdmBo : childList) {
			pubJqxzdmBo.setChildren(getChild(pubJqxzdmBo.getBzjqxzbh(), pubJqxzsys));
			if (pubJqxzdmBo.getChildren() != null) {
				pubJqxzdmBo.setIsLeaf(false);
			}
		}
		return childList;
	}

	/**
	 * 复制
	 * 
	 * @param zdbh
	 * @param bh
	 * @param yhzh
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzsyService#copyPubZzjgsy(java.lang.String,
	 *      java.lang.String, java.lang.String)
	 */
	@Override
	public void copyPubjqxzsy(String zdbh, String bh, String cjr) throws Exception {
		logger.entry("复制组织机构使用关系表,zdbh=" + zdbh + ",bh=" + bh);
		// 清空需要复制的表
		pubJqxzsyDao.deleteByZdbh(bh);
		// 获取需要复制的警情性质代码
		List<String> jqxzbhs = queryJqxzBhByZdbh(zdbh);
		PubJqxzsy pubJqxzsy = new PubJqxzsy();
		pubJqxzsy.setZdbh(bh);
		pubJqxzsy.setCjr(cjr);
		for (String jqxzbh : jqxzbhs) {
			pubJqxzsy.setJqxzbh(jqxzbh);
			pubJqxzsy.setCjsj(new Date());
			pubJqxzsyDao.add(pubJqxzsy);
		}
	}

	/**
	 * 
	 * 根据zdbh,jqxzbh 获取pubjqxzdm
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 */
	@Override
	public PubJqxzdm getPubJqxzdm(String zdbh, String jqxzbh) throws Exception {
		logger.entry("getPubJqxzdm-------------zdbh=" + zdbh + ",jqxzbh=" + jqxzbh);
		QueryParam param = new QueryParam();
		param.put("zdbh", zdbh);
		param.put("jqxzbh", jqxzbh);
		return pubJqxzsyDao.getPubJqxzdm(param);
	}

	/**
	 * 获取jqxzsy级别
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 */
	@Override
	public int getPubJqxzsyLevel(String zdbh, String jqxzbh) throws Exception {
		PubJqxzdm pubJqxzdm = getPubJqxzdm(zdbh, jqxzbh);
		int level = 1;
		// 递归查询父级id,查到一个级别就加1
		while (true) {
			if (pubJqxzdm.getBzjqxzfbh() == null || StringUtils.isBlank(pubJqxzdm.getBzjqxzfbh())) {
				break;
			} else {
				pubJqxzdm = getPubJqxzdm(zdbh, pubJqxzdm.getBzjqxzfbh());
				level++;
			}
		}
		return level;
	}
}

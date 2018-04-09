/** 
 * Project Name:service-system 
 * File Name:PubZzjgsyServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年4月7日 下午4:51:43 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.base.util.TreeUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubZzjgBoCache;
import com.htcf.system.dao.PubZzjgsyDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.PubZzjgsy;
import com.htcf.system.service.PubZzjgsyService;

/**
 * ClassName: PubZzjgsyServiceImpl <br>
 * Function: 组织机构使用Service接口Impl. <br>
 * date: 2017年4月7日 下午4:51:43 <br>
 * 
 * @author wei <br>
 */
@Service("pubZzjgsyService")
public class PubZzjgsyServiceImpl implements PubZzjgsyService {
	// 日志
	private static final Logger logger = LogManager.getLogger(PubZzjgsyServiceImpl.class);

	// 组织机构使用DAO
	@Autowired
	private PubZzjgsyDao pubZzjgsyDao;
	// 组织机构单个缓存
	@Autowired
	private PubZzjgBoCache pubZzjgBoCache;

	/*
	 * 组织机构使用集合
	 */
	// private Map<String,List<PubZzjgBo>> map;
	/**
	 * 
	 * 合并保存组织机构使用关系表
	 * 
	 * @param pubZzjgsy 组织机构使用PO
	 * @throws Exception 抛出可发生的异常
	 * @see com.htcf.system.service.PubZzjgsyService#mergePubZzjgsy(com.htcf.system.model.po.PubZzjgsy)
	 */
	@Override
	@Transactional
	public void mergePubZzjgsy(PubZzjgsy pubZzjgsy) throws Exception {
		logger.entry("修改合并组织机构使用关系表,zdbh=" + pubZzjgsy.getZdbh());
		pubZzjgsyDao.deleteByZdbh(pubZzjgsy.getZdbh());
		String dwdm = pubZzjgsy.getDwdm();
		if (StringUtils.isEmpty(dwdm)) {
			return;
		}
		String[] arr = dwdm.split(",");
		for (String code : arr) {
			pubZzjgsy.setDwdm(code);
			pubZzjgsy.setCjsj(new Date());
			pubZzjgsyDao.add(pubZzjgsy);
		}
	}

	/**
	 * 
	 * 根据zdbh 复制组织机构使用到bh
	 * 
	 * @param pubZzjgsy 组织机构使用PO
	 * @throws Exception 抛出可发生的异常
	 * @see com.htcf.system.service.PubZzjgsyService#mergePubZzjgsy(com.htcf.system.model.po.PubZzjgsy)
	 */
	@Override
	@Transactional
	public void copyPubZzjgsy(String zdbh, String bh, String cjr) throws Exception {
		logger.entry("复制组织机构使用关系表,zdbh=" + zdbh + ",bh=" + bh);
		// 清空需要复制的表
		pubZzjgsyDao.deleteByZdbh(bh);
		// 获取需要复制的组织机构代码
		List<String> dwdms = queryDwdmByZdbh(zdbh);
		PubZzjgsy pubZzjgsy = new PubZzjgsy();
		pubZzjgsy.setZdbh(bh);
		pubZzjgsy.setCjr(cjr);
		for (String dwdm : dwdms) {
			pubZzjgsy.setDwdm(dwdm);
			pubZzjgsy.setCjsj(new Date());
			pubZzjgsyDao.add(pubZzjgsy);
		}

	}

	/**
	 * 
	 * 根据组织字典编码查询机构代码
	 * 
	 * @param zdbh 字典编号
	 * @return List&lt;String&gt; 返回的组织机构代码集合
	 * @throws Exception 抛出可发生的异常
	 * @see com.htcf.system.service.PubZzjgsyService#queryDwdmByZdbh(java.lang.String)
	 */
	@Override
	public List<String> queryDwdmByZdbh(String zdbh) throws Exception {
		logger.entry("根据组织字典编码查询机构代码,code:" + zdbh);
		return pubZzjgsyDao.queryDwdmByZdbh(zdbh);
	}

	/**
	 * 
	 * 根据组织字典编码code查询对应组织结果数
	 * 
	 * @param zdbh 字典编号
	 * @param deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回） 2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return List&lt;PubZzjgBo&gt; 返回组织机构Bo集合
	 * @throws Exception 抛出可能发生的异常
	 */
	@Override
	public List<PubZzjgBo> queryPubZzjgBoByZdbh(String zdbh, Integer deepType, String dwdm) throws Exception {
		logger.entry("根据组织字典编码code查询对应组织结果数,code:" + zdbh);
		List<PubZzjgBo> list = pubZzjgsyDao.getAllView(zdbh);
		Map<String, List<PubZzjgBo>> map = new HashMap<String, List<PubZzjgBo>>();
		map = getZzjgMap(list);
		return this.queryPubZzjgBoByZdbh2(zdbh, deepType, dwdm, map);
	}

	/**
	 * 将List<PubZzjg>生成对应的Map<String,List<PubZzjgBo>>
	 * 
	 * @pa ram list
	 * @return map中，key用于放所有的dwdm，value用于放dwdm下面所有的被管辖的组织机构（List）
	 * 
	 */
	public Map<String, List<PubZzjgBo>> getZzjgMap(List<PubZzjgBo> list) {
		Map<String, List<PubZzjgBo>> map = new LinkedHashMap<String, List<PubZzjgBo>>();
		for (PubZzjgBo pubZzjgBo : list) {
			List<PubZzjgBo> pubZzjgBos = new ArrayList<PubZzjgBo>();

			if (StringUtils.isEmpty(pubZzjgBo.getGxdwdm())) {
				List<PubZzjgBo> ZzjgList = new ArrayList<PubZzjgBo>();
				ZzjgList.add(pubZzjgBo);
				map.put(null, ZzjgList);
			}
			for (PubZzjgBo pubZzjgBo2 : list) {
				if (pubZzjgBo.getDwdm().equals(pubZzjgBo2.getGxdwdm())) {
					pubZzjgBos.add(pubZzjgBo2);
				}
			}
			map.put(pubZzjgBo.getDwdm(), pubZzjgBos);

		}
		return map;
	}

	/**
	 * 
	 * @param zdbh 字典编号
	 * @param deepType 需要返回的数据类型 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回）
	 *            2：递归加载所有孙子节点（按并列数据结构返回）
	 * @param gxdwdm 管辖单位代码（父编号）
	 * @return List&lt;PubZzjgBo&gt; 返回组织机构Bo集合
	 * @throws Exception 抛出可发生的异常
	 */
	public List<PubZzjgBo> queryPubZzjgBoByZdbh2(String zdbh, Integer deepType, String gxdwdm,
			Map<String, List<PubZzjgBo>> map) throws Exception {
		logger.entry("---------根据字典编号，返回数据类型,管辖单位代码查询组织机构BO", JsonUtil.toJsonNonNull(zdbh),
				JsonUtil.toJsonNonNull(deepType), JsonUtil.toJsonNonNull(gxdwdm));
		List<PubZzjgBo> pubZZjgList = map.get(gxdwdm);
		if (pubZZjgList == null || pubZZjgList.isEmpty()) {
			return null;
		}
		List<PubZzjgBo> pubZzjgBos = new ArrayList<PubZzjgBo>();
		for (PubZzjgBo pubZzjgBo : pubZZjgList) {
			pubZzjgBo.setIsLeaf(false);
			if (1 == deepType) {
				List<PubZzjgBo> subList = this.queryPubZzjgBoByZdbh2(zdbh, deepType, pubZzjgBo.getDwdm(), map);
				if (subList == null || subList.isEmpty()) {
					pubZzjgBo.setIsLeaf(true);
				} else {
					pubZzjgBo.setChildren(subList);
				}
			} else if (2 == deepType) {
				List<PubZzjgBo> subList = this.queryPubZzjgBoByZdbh2(zdbh, deepType, pubZzjgBo.getDwdm(), map);
				if (subList == null || subList.isEmpty()) {
					pubZzjgBo.setIsLeaf(true);
				} else {
					pubZzjgBos.addAll(subList);
				}
			}
			pubZzjgBos.add(pubZzjgBo);
		}
		return pubZzjgBos;
	}

	/**
	 * 
	 * @param zdbh
	 * @param deepType
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgsyService#queryPubZzjgBoByZdbh(java.lang.String,
	 *      java.lang.Integer)
	 */
	@Override
	public List<PubZzjgBo> queryPubZzjgBoByZdbh(String zdbh, Integer deepType) throws Exception {
		return queryPubZzjgBoByZdbh(zdbh, deepType, null);
	}

	/**
	 * 
	 * 查询pubzzjgsy级别
	 * 
	 * @param dwdm
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgsyService#getPubZzjgsyLevel(java.lang.String)
	 */
	@Override
	public int getPubZzjgsyLevel(String dwdm, String zdbh) throws Exception {

		PubZzjg pubZzjg = getPubZzjg(dwdm, zdbh);
		int level = 1;
		// 递归查询父级id,查到一个级别就加1
		while (true) {
			if (pubZzjg.getGxdwdm() == null || StringUtils.isBlank(pubZzjg.getGxdwdm())) {
				break;
			} else {
				pubZzjg = getPubZzjg(pubZzjg.getGxdwdm(), zdbh);
				level++;
			}
		}
		return level;

	}

	/**
	 * 
	 * 要根据dwdm zdbh 获得对象
	 * 
	 * @return
	 * @throws Exception
	 */
	@Override
	public PubZzjg getPubZzjg(String dwdm, String zdbh) throws Exception {
		QueryParam param = new QueryParam();
		param.put("dwdm", dwdm);
		param.put("zdbh", zdbh);
		PubZzjg pubZzjg = pubZzjgsyDao.getPubZzjg(param);
		if (pubZzjg == null) {
			throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("pubZzjgBo不存在");
		}
		return pubZzjg;
	}

	/**
	 * 查询zzjgsyBo 根据字典编号 和单位代码 和deepType 返回对应数据
	 * 
	 * @param zdbh 字典编号
	 * @param dwdm 单位代码
	 * @param deepType 需要返回的数据类型 返回当前单位代码下的子集合 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回）
	 *            2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PubZzjgBo> getPubZzjgBoByZdbh(String zdbh, String dwdm, Integer deepType) throws Exception {
		logger.entry("---------根据字典编号，返回数据类型,管辖单位代码查询组织机构BO", JsonUtil.toJsonNonNull(zdbh),
				JsonUtil.toJsonNonNull(dwdm), JsonUtil.toJsonNonNull(deepType));
		List<PubZzjgBo> resultList = null;
		// 根据zdbh查询所有使用单位代码
		List<PubZzjgBo> PubZzjgs = pubZzjgsyDao.getAllView(zdbh);
		if (PubZzjgs.isEmpty() || PubZzjgs == null) {
			return null;
		}
		resultList = getPubZzjgBoByZdbh2(PubZzjgs, dwdm, deepType);
		if (deepType == 1) {
			TreeUtil<PubZzjgBo> t = new TreeUtil<PubZzjgBo>();
			return t.buildTree(resultList, "dwdm", "gxdwdm", "children");
		}
		return resultList;
	}

	/**
	 * 具体实现
	 * 
	 * @param pubZzjgs
	 * @param dwdm
	 * @param deepType
	 * @return
	 */
	private List<PubZzjgBo> getPubZzjgBoByZdbh2(List<PubZzjgBo> pubZzjgs, String dwdm, Integer deepType) {
		List<PubZzjgBo> resultList = new ArrayList<PubZzjgBo>();
		// 判断dwdm是否为空
		if (StringUtils.isBlank(dwdm)) {
			dwdm = null;
		}
		for (PubZzjgBo pubZzjg : pubZzjgs) {
			// 返回当前dwdm下面的子集合
			if (Objects.equals(pubZzjg.getGxdwdm(), dwdm)) {
				pubZzjg.setIsLeaf(false);
				// 构建树形结构需要 并列结构
				if (deepType == 1 || deepType == 2) {
					List<PubZzjgBo> childList = getPubZzjgBoByZdbh2(pubZzjgs, pubZzjg.getDwdm(), deepType);
					if (childList == null || childList.isEmpty()) {
						pubZzjg.setIsLeaf(true);
					} else {
						resultList.addAll(childList);
					}
				}
				resultList.add(pubZzjg);
			}
			
		}

		return resultList;
	}
}

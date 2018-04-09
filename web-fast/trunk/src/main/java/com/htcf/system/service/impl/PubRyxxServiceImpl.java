/** 
 * Project Name:service-system 
 * File Name:PubRyxxServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年2月14日上午9:48:56 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubRyxxDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubRyxx;
import com.htcf.system.service.PubRyxxService;

/**
 * ClassName: PubRyxxServiceImpl <br/>
 * Function: 人员信息实现类. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年2月14日 上午9:48:56 <br/>
 * 
 * @author chenhao
 */
@Service("pubRyxxService")
public class PubRyxxServiceImpl implements PubRyxxService {
	private static final Logger logger = LogManager.getLogger(PubRyxxServiceImpl.class);// 日志
	@Autowired
	private PubRyxxDao pubRyxxDao;

	/**
	 * TODO 新增人员信息
	 * 
	 * @param pubRyxx
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubRyxxService#addRyxx(com.htcf.system.model.po.PubRyxx)
	 */
	@Override
	public PubRyxx addRyxx(PubRyxx pubRyxx) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("新增人员信息");
		pubRyxx.setSjbb(1L);
		pubRyxxDao.add(pubRyxx);
		return pubRyxx;
	}

	/**
	 * TODO 更新人员信息
	 * 
	 * @param pubRyxx
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubRyxxService#upDateRyxx(com.htcf.system.model.po.PubRyxx)
	 */
	@Override
	public PubRyxx upDateRyxx(PubRyxx pubRyxx) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("更新人员信息", JsonUtil.toJsonNonNull(pubRyxx));
		pubRyxxDao.update(pubRyxx, "rybh");
		return pubRyxx;
	}

	/**
	 * TODO 查看人员信息
	 * 
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubRyxxService#viewPubRyxxByRybh(java.lang.String)
	 */
	@Override
	public PubRyxx viewPubRyxxByRybh(String rybh) throws Exception {
		// TODO Auto-generated method stub
		return getPubRyxxByRybh(rybh);
	}

	/**
	 * TODO 根据人员编号获取人员信息
	 * 
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubRyxxService#getPubRyxxByRybh(java.lang.String)
	 */
	@Override
	public PubRyxx getPubRyxxByRybh(String rybh) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("根据人员编号获取人员信息");
		QueryParam queryParam = new QueryParam();
		queryParam.put("rybh", rybh);
		PubRyxx pubRyxx = pubRyxxDao.getOne(queryParam);
		if (pubRyxx == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("人员信息不存在,rybh{%s}", rybh);
		}

		return pubRyxx;

	}

	/**
	 * TODO 批量删除人员信息
	 * 
	 * @param rybhs
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubRyxxService#deleltePubRybh(java.lang.String[])
	 */
	@Override
	public int deleltePubRybh(String... rybhs) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("批量删除");
		int deleteCount = 0;
		for (String ryxx : rybhs) {
			// 删除授权
			deleteCount += deleltePubRyxx(ryxx);
		}
		return deleteCount;
	}

	/**
	 * 
	 * TODO 根据人员编号删除人员信息
	 * 
	 * @param rybh
	 * @return
	 * @throws Exception int
	 */
	private int deleltePubRyxx(String rybh) throws Exception {
		logger.entry("删除人员信息");
		return pubRyxxDao.delete(rybh);
	}

	/**
	 * TODO 分页获取人员信息
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubRyxxService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubRyxx> getListPage(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("!!!!!!!!!!分页获取人员信息");
		QueryParam queryParam = new QueryParam(map);
		// 人员编号
		String rybh = null != map.get("rybh") ? map.get("rybh").toString() : null;
		if (StringUtil.isNotEmpty(rybh)) {
			queryParam.put("rybh", map.get("rybh"));
		}

		// 所属单位名称
		String ssdwmc = null != map.get("ssdwmc") ? map.get("ssdwmc").toString() : null;
		if (StringUtil.isNotEmpty(ssdwmc)) {
			queryParam.put("ssdwmc", map.get("ssdwmc"));
		}

		// 人员姓名
		String ryxm = null != map.get("ryxm") ? map.get("ryxm").toString() : null;
		if (StringUtil.isNotEmpty(ryxm)) {
			//queryParam.put("ryxm", map.get("ryxm"));
			queryParam.addCondition("ryxm", "like", "%" + ryxm + "%");
		}

		// 人员警号
		String ryjh = null != map.get("ryjh") ? map.get("ryjh").toString() : null;
		if (StringUtil.isNotEmpty(ryjh)) {
			queryParam.put("ryjh", map.get("ryjh"));
		}

		// 使用标志
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtil.isNotEmpty(sybz)) {
			queryParam.addCondition("sybz", "like", "%" + sybz + "%");
		}
		PageInfo<PubRyxx> pageInfo = pubRyxxDao.getListPage("get", queryParam);
		return pageInfo;
	}

}

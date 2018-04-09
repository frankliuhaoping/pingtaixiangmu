/** 
 * Project Name:service-system 
 * File Name:PubGpssbxxServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年6月5日 下午1:27:28 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubGpssbxxDao;
import com.htcf.system.model.po.PubGpssbxx;
import com.htcf.system.service.PubGpssbxxService;

/**
 * ClassName: PubGpssbxxServiceImpl<br/>
 * Function: gps设备信息实现. <br/>
 * date: 2017年6月5日 下午1:27:28
 * 
 * @author yiqiang
 */
@Service("pubGpssbxxService")
public class PubGpssbxxServiceImpl implements PubGpssbxxService {
	private static final Logger logger = LogManager.getLogger(PubGpssbxxServiceImpl.class);

	@Autowired
	private PubGpssbxxDao pubGpssbxxDao;

	/**
	 * 新增gps设备信息
	 * 
	 * @param gpssbxx
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubGpssbxxService#addPubGpssbxx(com.htcf.system.model.po.PubGpssbxx)
	 */
	@Override
	public PubGpssbxx addPubGpssbxx(PubGpssbxx gpssbxx) throws Exception {
		logger.debug("新增gps设备信息={}", gpssbxx);
		
		if (getPubGpssbxxBySbbh(gpssbxx.getSbbh()) != null) {
			throw new Exception(gpssbxx.getSbbh() + "该设备已经存在，添加失败");
		}
		pubGpssbxxDao.add(gpssbxx);
		return gpssbxx;
	}

	/**
	 * gps设备信息分页查询实现
	 * 
	 * @param map
	 * @return
	 * @see com.htcf.system.service.PubGpssbxxService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubGpssbxx> getListPage(Map<String, Object> map) {
		logger.entry("!!!!!!!!!!gps设备信息分页查询 查询条件map={}", map);
		// 默认用户 按最后更新时间排序
		if (map != null && !map.containsKey("sort")) {
			map.put("order", "desc");
			map.put("sort", "gxsj");
		}
		QueryParam queryParam = new QueryParam(map);
		// 设备编号
		String sbbh = null != map.get("sbbh") ? map.get("sbbh").toString() : null;
		if (StringUtils.isNotEmpty(sbbh)) {
			queryParam.put("sbbh", sbbh);
		}
		// 设备名称
		String fwdm = null != map.get("sbmc") ? map.get("sbmc").toString() : null;
		if (StringUtils.isNotEmpty(fwdm)) {
			queryParam.addCondition("sbmc", "like", "%" + fwdm + "%");
		}
		// 设备类型
		String sblx = null != map.get("sblx") ? map.get("sblx").toString() : null;
		if (StringUtils.isNotEmpty(sblx)) {
			queryParam.put("sblx", sblx);
		}
		// 设备类型
		String zzjgdm = null != map.get("zzjgdm") ? map.get("zzjgdm").toString() : null;
		if (StringUtils.isNotEmpty(zzjgdm)) {
			queryParam.put("zzjgdm", zzjgdm);
		}
		// 设备状态
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtils.isNotEmpty(sybz)) {
			queryParam.put("sybz", sybz);
		}
		PageInfo<PubGpssbxx> pageInfo = pubGpssbxxDao.getListPage("get", queryParam);
		return pageInfo;
	}

	/**
	 * 获取设备信息
	 * 
	 * @param sbbh 设备编号,主键
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubGpssbxxService#getPubGpssbxxBySbbh(java.lang.String)
	 */
	@Override
	public PubGpssbxx getPubGpssbxxBySbbh(String sbbh) throws Exception {
		QueryParam param = new QueryParam();
		param.put("sbbh", sbbh);
		return pubGpssbxxDao.getOne(param);
	}

	/**
	 * 删除设备信息
	 * 
	 * @param sbbh 设备编号
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubGpssbxxService#deleltePubGpssbxx(java.lang.String[])
	 */
	@Override
	public int deleltePubGpssbxx(String... sbbh) throws Exception {
		logger.trace("删除GPS设备信息 sbbh={}", sbbh);
		return pubGpssbxxDao.delete(sbbh);
	}

	/**
	 * 修改设备信息
	 * 
	 * @param sbxx
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubGpssbxxService#updatePubGpssbxx(com.htcf.system.model.po.PubGpssbxx)
	 */
	@Override
	public PubGpssbxx updatePubGpssbxx(PubGpssbxx sbxx) throws Exception {
		pubGpssbxxDao.update(sbxx, "sbbh");
		return sbxx;
	}

	/**
	 * 批量添加设备信息实现
	 * 
	 * @param list
	 * @return
	 * @see com.htcf.system.service.PubGpssbxxService#batchAddPubGpssbxx(java.util.List)
	 */
	@Override
	public int batchAddPubGpssbxx(List<PubGpssbxx> list) throws Exception {
		for (PubGpssbxx gpsSbxx : list) {
			addPubGpssbxx(gpsSbxx);
		}
		return 0;
	}

}

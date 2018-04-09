/** 
 * Project Name:service-system 
 * File Name:PubPdtthzxxServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年6月6日 下午2:26:20 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubPdtthzxxDao;
import com.htcf.system.model.po.PubPdtthzxx;
import com.htcf.system.service.PubPdtthzxxService;

/**
 * ClassName: PubPdtthzxxServiceImpl <br/>
 * Function: 通话组接口具体实现 <br/>
 * date: 2017年6月6日 下午2:26:20 <br/>
 * 
 * @author yiqiang
 */
@Service("pubPdtthzxxService")
public class PubPdtthzxxServiceImpl implements PubPdtthzxxService {

	private static final Logger logger = LogManager.getLogger(PubPdtthzxxServiceImpl.class);

	@Autowired
	private PubPdtthzxxDao pubPdtthzxxDao;

	/**
	 * 新增通话组
	 * 
	 * @param pdtthzxx
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubPdtthzxxService#addPubPdtthzxx(com.htcf.system.model.po.PubPdtthzxx)
	 */
	@Override
	public PubPdtthzxx addPubPdtthzxx(PubPdtthzxx pdtthzxx) throws Exception {
		if (getPdtthzxxByThzbh(pdtthzxx.getThzbh()) != null) {
			throw new Exception("新增通话组失败!");
		}
		if (logger.isDebugEnabled()) {
			logger.debug("新增通话组 {}", pdtthzxx);
		}
		pubPdtthzxxDao.add(pdtthzxx);
		return pdtthzxx;
	}

	/**
	 * 更新通话组
	 * 
	 * @param pdtthzxx
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubPdtthzxxService#updatePubPdtthzxx(com.htcf.system.model.po.PubPdtthzxx)
	 */
	@Override
	public PubPdtthzxx updatePubPdtthzxx(PubPdtthzxx pdtthzxx) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("更新通话组 {}", pdtthzxx);
		}
		pubPdtthzxxDao.update(pdtthzxx, "thzbh");
		return pdtthzxx;
	}

	/**
	 * 根据编号查询通话组
	 * 
	 * @param thzbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubPdtthzxxService#getPdtthzxxByThzbh(java.lang.String)
	 */
	@Override
	public PubPdtthzxx getPdtthzxxByThzbh(String thzbh) throws Exception {
		QueryParam param = new QueryParam();
		param.put("thzbh", thzbh);
		return pubPdtthzxxDao.getOne(param);
	}

	/**
	 * 删除通话组
	 * 
	 * @param thzbhs
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubPdtthzxxService#deleltePubPdtthzxx(java.lang.String[])
	 */
	@Override
	public int deleltePubPdtthzxx(String... thzbhs) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("删除通话组 thzbhs = {}", thzbhs);
		}
		return pubPdtthzxxDao.delete(thzbhs);
	}

	/**
	 * 分页查询通话组
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubPdtthzxxService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubPdtthzxx> getListPage(Map<String, Object> map) throws Exception {
		// 默认用户 按最后更新时间排序
		if (map != null && !map.containsKey("sort")) {
			map.put("order", "desc");
			map.put("sort", "gxsj");
		}
		QueryParam queryParam = new QueryParam(map);

		String zzjgdm = null != map.get("zzjgdm") ? map.get("zzjgdm").toString() : null;// 组织机构代码
		if (StringUtils.isNotEmpty(zzjgdm)) {
			queryParam.put("zzjgdm", zzjgdm);
		}
		String thzmc = null != map.get("thzmc") ? map.get("thzmc").toString() : null;// 通话组名称
		if (StringUtils.isNotEmpty(thzmc)) {
			queryParam.addCondition("thzmc", "like", "%" + thzmc + "%");
		}
		String thzlx = null != map.get("thzlx") ? map.get("thzlx").toString() : null;// 通话组类型
		if (StringUtils.isNotEmpty(thzlx)) {
			queryParam.put("thzlx", thzlx);
		}
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;// 使用标志
		if (StringUtils.isNotEmpty(sybz)) {
			queryParam.put("sybz", sybz);
		}
		PageInfo<PubPdtthzxx> pageInfo = pubPdtthzxxDao.getListPage("get", queryParam);
		return pageInfo;
	}

}

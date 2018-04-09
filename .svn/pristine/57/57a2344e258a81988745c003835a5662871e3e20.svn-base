/** 
 * Project Name:service-system 
 * File Name:PubSchlogServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年3月9日 下午2:52:30
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.frame.model.Schlog;
import com.htcf.system.dao.PubSchlogDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubSchlog;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubSchlogService;

/**
 * ClassName: PubSchlogServiceImpl<br/>
 * Function: 定时任务日志服务实现类. <br/>
 * date: 2017年3月9日 下午2:52:30 <br/>
 * 
 * @author wuwei
 */
@Service("pubSchlogService")
public class PubSchlogServiceImpl  implements PubSchlogService {

	private static final Logger logger = LogManager.getLogger(PubSchlogServiceImpl.class);

	/**
	 * pubSchlogDao:定时任务日志数据dao
	 */
	@Autowired
	private PubSchlogDao pubSchlogDao;
	
	/**
	 * pubAppService:应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * 新增定时任务日志
	 * 
	 * @param pubSchlog
	 * @return PubSchlog
	 * @throws Exception
	 * @see com.htcf.system.service.PubSchlogService#addSchlog(com.htcf.system.model.po.PubSchlog)
	 */
	@Override
	public PubSchlog addSchlog(PubSchlog pubSchlog) throws Exception {
		logger.entry("!!!!!!!!!!新增Schlog", JsonUtil.toJsonNonNull(pubSchlog));
		
		try {
			pubSchlog.setSjbb(1L);
			pubSchlogDao.add(pubSchlog);
		} catch (Exception e) {
			// 出现异常，说明任务已经被执行
			return null;
		}
		
		return pubSchlog;
	}

	/**
	 * 修改定时任务日志
	 * 
	 * @param pubSchlog
	 * @return PubSchlog
	 * @throws Exception
	 * @see com.htcf.system.service.PubSchlogService#updateLog(com.htcf.system.model.po.PubSchlog)
	 */
	@Override
	public PubSchlog updateSchlog(PubSchlog pubSchlog) throws Exception {
		logger.entry("!!!!!!!!!!修改Schlog", JsonUtil.toJsonNonNull(pubSchlog));
		pubSchlogDao.update(pubSchlog, "rwzxid");
		return pubSchlog;
	}

	/**
	 * 根据Id获取定时任务日志
	 * 
	 * @param rwzxid
	 * @return PubSchlog
	 * @throws Exception
	 * @see com.htcf.system.service.PubSchlogService#getSchlogByRwzxid(String)
	 */
	@Override
	public PubSchlog getSchlogByRwzxid(String rwzxid) throws Exception {
		logger.entry("!!!!!!!!!!根据ID获取Schlog", rwzxid);
		QueryParam queryParam = new QueryParam();
		queryParam.put("rwzxid", rwzxid);
		PubSchlog pubSchlog = pubSchlogDao.getOne(queryParam);
		if (pubSchlog == null) {
			throw ServiceSystemException.PUBLOG_NOT_EXIST.newInstance("定时任务日志不存在,rwzxid{%s}", rwzxid);
		}
		return pubSchlog;
	}

	/**
	 * 根据日志Id删除定时任务日志
	 * 
	 * @param rwzxids
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubSchlogService#delelteSchlog(String[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteSchlog(String... rwzxids) throws Exception {
		logger.entry("@@@@@@@@@@@@@根据定时任务日志Id删除Schlog", rwzxids);
		int deleteCount = 0;
		for (String rwzxid : rwzxids) {
			getSchlogByRwzxid(rwzxid);//检查是否存在
			deleteCount += pubSchlogDao.delete(rwzxid);
		}
		return deleteCount;
	}
	
	/**
	 * 根据查询条件获取分页列表
	 * 
	 * @param map
	 * @return PageInfo<PubSchlog>
	 * @throws Exception
	 * @see com.htcf.system.service.PubSchlogService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubSchlog> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的Schlog列表", map);
		QueryParam queryParam = new QueryParam(map);
		//任务名称
		String rwmc = null != map.get("rwmc") ? map.get("rwmc").toString() : null;
		if (StringUtils.isNotEmpty(rwmc)) {
			queryParam.addCondition("rwmc", "like", "%" + rwmc + "%");
		}
		//执行ip
		String zxip = null != map.get("zxip") ? map.get("zxip").toString() : null;
		if (StringUtils.isNotEmpty(zxip)) {
			queryParam.addCondition("zxip", "like", "%" + zxip + "%");
		}
		//执行状态
		String zxzt = null != map.get("zxzt") ? map.get("zxzt").toString() : null;
		if (StringUtils.isNotEmpty(zxzt)) {
			queryParam.addCondition("zxzt", "=", zxzt);
		}
		//执行日志的时间   查询大于此时间的
		String zxsjS = null != map.get("zxsjS") ? map.get("zxsjS").toString() : null;
		if (StringUtils.isNotEmpty(zxsjS)) {
			queryParam.addCondition("zxsj", ">", Long.valueOf(zxsjS));
		}
		//执行日志的时间   查询小于此时间的
		String zxsjE = null != map.get("zxsjE") ? map.get("zxsjE").toString() : null;
		if (StringUtils.isNotEmpty(zxsjE)) {
			queryParam.addCondition("zxsj", "<", Long.valueOf(zxsjE));
		}
		//服务代码
		String fwdm = null != map.get("fwdm") ? map.get("fwdm").toString() : null;
		if (StringUtils.isNotEmpty(fwdm)) {
			queryParam.addCondition("fwdm", "like", "%" + fwdm + "%");
		}
		
		String starttime = null != map.get("starttime") ? map.get("starttime").toString() : null;
		String endtime = null != map.get("endtime") ? map.get("endtime").toString() : null;

		if (StringUtil.isNotEmpty(starttime)) {   // 大于开始时间记录
			queryParam.addCondition("cjsj", ">=", DateUtil.getDateTimeFormat(starttime));
		}
		if (StringUtil.isNotEmpty(endtime)) {  // 小于结束时间记录
			queryParam.addCondition("cjsj", "<=", DateUtil.getDateTimeFormat(endtime));
		}
		
		PageInfo<PubSchlog> pageInfo = pubSchlogDao.getListPage("get", queryParam);
		return pageInfo;
	}
//	@Override
//	public PubSchlog addSchlog(Schlog log) throws Exception {
//		// TODO Auto-generated method stub
//		Mapper mapper = new DozerBeanMapper();
//		PubSchlog pubSchlog  = new PubSchlog();
//		mapper.map(log,pubSchlog);
//		return addSchlog(pubSchlog);
//	}

//	@Override
//	public PubSchlog updateSchlog(Schlog log) throws Exception {
//		// TODO Auto-generated method stub
//		Mapper mapper = new DozerBeanMapper();
//		PubSchlog pubSchlog  = new PubSchlog();
//		mapper.map(log,pubSchlog);
//		return updateSchlog(pubSchlog);
//	}


	
}

/** 
 * Project Name:service-system 
 * File Name:PubLogServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年2月18日 上午10:25:54 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubLogDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubAudit;
import com.htcf.system.model.po.PubLog;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuditService;
import com.htcf.system.service.PubLogService;

/**
 * ClassName: PubLogServiceImpl<br/>
 * Function: 日志服务实现类. <br/>
 * date: 2017年2月18日 上午10:25:54<br/>
 * 
 * @author lizhuo
 */
@Service("pubLogService")
public class PubLogServiceImpl implements PubLogService {

	private static final Logger logger = LogManager.getLogger(PubLogServiceImpl.class);

	/**
	 * pubLogDao:日志数据dao
	 */
	@Autowired
	private PubLogDao pubLogDao;
	
	/**
	 * pubAppService:应用服务
	 */
	@Autowired
	private PubAppService pubAppService;
	
	/**
	 * pubAuditService: 审计配置信息方法服务.
	 */
	@Autowired
	private PubAuditService pubAuditService;

	/**
	 * 新增日志
	 * 
	 * @param pubLog
	 * @return PubLog
	 * @throws Exception
	 * @see com.htcf.system.service.PubLogService#addLog(com.htcf.system.model.po.PubLog)
	 */
	@Override
	public PubLog addLog(PubLog pubLog) throws Exception {
		logger.entry("!!!!!!!!!!新增Log", JsonUtil.toJsonNonNull(pubLog));
		pubLog.setRzid(pubLogDao.getSeq());
		// 获取审计配置信息
		PubAudit pubAudit = pubAuditService.getAuditByXtmAndFwlj(pubLog.getXtm(), pubLog.getFwlj());
		// 如果有审计配置则将日志标记为审计日志
		if (pubAudit != null) {
			pubLog.setSjzt("1");
			// 设置操作描述
			pubLog.setCzms(pubAudit.getSjms());
		}
		pubLogDao.add(pubLog);
		return pubLog;
	}
	
	/**
	 * * addAuditLog
	 * 新增日志
	 * @param pubLog 日志
	 * @param msgMap 审计替换信息map
	 * @return PubLog 日志
	 * @throws Exception
	 * @see com.htcf.system.service.PubLogService#addAuditLog(com.htcf.system.model.po.PubLog, java.util.Map)
	 */
	@Override
	public PubLog addAuditLog(PubLog pubLog, Map<String, Object> msgMap) throws Exception {
		logger.entry("!!!!!!!!!!新增Log", JsonUtil.toJsonNonNull(pubLog), JsonUtil.toJsonNonNull(msgMap));
		pubLog.setRzid(pubLogDao.getSeq());
		// 获取审计配置信息
		PubAudit pubAudit = pubAuditService.getAuditByXtmAndFwlj(pubLog.getXtm(), pubLog.getFwlj());
		// 如果有审计配置则将日志标记为审计日志
		if (pubAudit != null) {
			pubLog.setSjzt("1");
			String sjms = "";
			if (StringUtils.isNotEmpty(pubAudit.getSjms())) {
				sjms = pubAudit.getSjms();
			}
			// 设置操作描述
			if (msgMap != null) {
				for (Entry<String, Object> entry : msgMap.entrySet()) {
					// 暂时Object都当做String处理
					sjms = sjms.replaceAll("%" + entry.getKey() + "%", entry.getValue().toString());
				}
			}
			pubLog.setCzms(sjms);
		}
		pubLogDao.add(pubLog);
		return pubLog;
	}

	/**
	 * 修改日志
	 * 
	 * @param pubLog
	 * @return PubLog
	 * @throws Exception
	 * @see com.htcf.system.service.PubLogService#updateLog(com.htcf.system.model.po.PubLog)
	 */
	@Override
	public PubLog updateLog(PubLog pubLog) throws Exception {
		logger.entry("!!!!!!!!!!修改Log", JsonUtil.toJsonNonNull(pubLog));
		pubLogDao.update(pubLog, "rzid");
		return pubLog;
	}

	/**
	 * 根据Id获取日志
	 * 
	 * @param rzid
	 * @return PubLog
	 * @throws Exception
	 * @see com.htcf.system.service.PubLogService#getLogByRzid(long)
	 */
	@Override
	public PubLog getLogByRzid(long rzid) throws Exception {
		logger.entry("!!!!!!!!!!根据ID获取Log", rzid);
		QueryParam queryParam = new QueryParam();
		queryParam.put("rzid", rzid);
		PubLog pubLog = pubLogDao.getOne(queryParam);
		if (pubLog == null) {
			throw ServiceSystemException.PUBLOG_NOT_EXIST.newInstance("日志不存在,rzid{%s}", rzid);
		}
		return pubLog;
	}

	/**
	 * 根据日志Id删除日志
	 * 
	 * @param rzids
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubLogService#delelteLog(long[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteLog(long... rzids) throws Exception {
		logger.entry("@@@@@@@@@@@@@根据日志Id删除Log", rzids);
		int deleteCount = 0;
		for (long rzid : rzids) {
			getLogByRzid(rzid);//检查是否存在
			deleteCount += pubLogDao.delete(rzid);
		}
		return deleteCount;
	}
	
	/**
	 * 根据查询条件获取分页列表
	 * 
	 * @param map
	 * @return PageInfo<PubLog>
	 * @throws Exception
	 * @see com.htcf.system.service.PubLogService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubLog> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的Log列表", map);
		
		//改变日志信息分页查询排序
		if(map.get("order").toString().equals("asc")&&map.get("sort")==null){
			map.put("order", "desc");
			map.put("sort", "cjsj");
		}
		
		QueryParam queryParam = new QueryParam(map);
		String yyid = null != map.get("yyid") ? map.get("yyid").toString() : null;
		if (StringUtil.isNotEmpty(yyid)) {
			PubApp pubApp = pubAppService.getAppByYyid(Long.valueOf(yyid));
			queryParam.addCondition("xtm", "like", "%" + pubApp.getYydm() + "%");
		}
		
		String fwlj = null != map.get("fwlj") ? map.get("fwlj").toString() : null;
		if (StringUtil.isNotEmpty(fwlj)) {
			queryParam.addCondition("fwlj", "like", "%" + fwlj + "%");
		}
		
		String khdip = null != map.get("khdip") ? map.get("khdip").toString() : null;
		if (StringUtil.isNotEmpty(khdip)) {
			queryParam.addCondition("khdip", "like", "%" + khdip + "%");
		}
		
		String zxzt = null != map.get("zxzt") ? map.get("zxzt").toString() : null;
		if (StringUtil.isNotEmpty(zxzt)) {
			queryParam.addCondition("zxzt", "=", zxzt);
		}
		
		String zxsjS = null != map.get("zxsjS") ? map.get("zxsjS").toString() : null;
		if (StringUtil.isNotEmpty(zxsjS)) {
			queryParam.addCondition("zxsj", ">", Long.valueOf(zxsjS));
		}
		
		String zxsjE = null != map.get("zxsjE") ? map.get("zxsjE").toString() : null;
		if (StringUtil.isNotEmpty(zxsjE)) {
			queryParam.addCondition("zxsj", "<", Long.valueOf(zxsjE));
		}
		
		String sjzt = null != map.get("sjzt") ? map.get("sjzt").toString() : null;
		if (StringUtil.isNotEmpty(sjzt)) {
			queryParam.addCondition("sjzt", "=", sjzt);
		}
		
		String czms = null != map.get("czms") ? map.get("czms").toString() : null;
		if (StringUtil.isNotEmpty(czms)) {
			queryParam.addCondition("czms", "like", "%" + czms + "%");
		}
		
		String starttime = null != map.get("starttime") ? map.get("starttime").toString() : null;
		String endtime = null != map.get("endtime") ? map.get("endtime").toString() : null;

		if (StringUtil.isNotEmpty(starttime)) {   // 大于开始时间记录
			queryParam.addCondition("cjsj", ">=", DateUtil.getDateTimeFormat(starttime));
		}
		if (StringUtil.isNotEmpty(endtime)) {  // 小于结束时间记录
			queryParam.addCondition("cjsj", "<=", DateUtil.getDateTimeFormat(endtime));
		}
		
		PageInfo<PubLog> pageInfo = pubLogDao.getListPage("get", queryParam);
		return pageInfo;
	}
	
}

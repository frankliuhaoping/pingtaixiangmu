/** 
 * Project Name:service-system 
 * File Name:PubAuditServiceImpl.java 
 * Package Name: com.htcf.system.service.impl 
 * Date:2017年3月6日 上午11:00:00
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubAuditDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubAudit;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuditService;

/** 
 * ClassName: PubAuditServiceImpl<br/>
 * Function: 审计配置服务实现类. <br/>
 * date: 2017年3月6日 上午11:00:00<br/>
 * 
 * @author wuwei
 */
@Service("pubAuditService")
// TODO 有些方法需要结合缓存操作
public class PubAuditServiceImpl implements PubAuditService {
	
	private static final Logger logger = LogManager.getLogger(PubAuditServiceImpl.class);
	
	/**
	 * pubAuditDao:定时任务Dao
	 */
	@Autowired
	private PubAuditDao pubAuditDao;
	
	/**
	 * pubAppService:应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * addAudit
	 * 新增审计配置
	 * @param pubAudit 审计配置
	 * @return PubAudit 审计配置
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuditService#addAudit(com.htcf.system.model.po.PubAudit)
	 */
	@Override
	public PubAudit addAudit(PubAudit pubAudit) throws Exception {
		logger.entry("!!!!!!!!!!新增审计配置Audit", JsonUtil.toJsonNonNull(pubAudit));
		//生成UUID作为主键
		UUID uuid = UUID.randomUUID();
		pubAudit.setSjid(uuid.toString().replace("-", ""));
		pubAudit.setSjbb(0L);
		pubAuditDao.add(pubAudit);
		return pubAudit;
	}

	/**
	 * updateAudit 
	 * 修改审计配置
	 * @param pubAudit 审计配置
	 * @return PubAudit 审计配置
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuditService#updateAudit(com.htcf.system.model.po.PubAudit)
	 */
	@Override
	public PubAudit updateAudit(PubAudit pubAudit) throws Exception {
		logger.entry("!!!!!!!!!!修改审计配置Audit", JsonUtil.toJsonNonNull(pubAudit));
		pubAuditDao.update(pubAudit, "sjid");
		return pubAudit;
	}
	
	/**
	 * getAuditBySjid
	 * 根据参数名获取审计配置
	 * @param sjid 参数名
	 * @return PubAudit 审计配置
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuditService#getAuditBySjid(java.lang.String)
	 */
	@Override
	public PubAudit getAuditBySjid(String sjid) throws Exception {
		logger.entry("!!!!!!!!!!根据参数名获取审计配置", sjid);
		QueryParam param = new QueryParam();
		param.put("sjid", sjid);
		PubAudit pubAudit = pubAuditDao.getOne(param);
		if(null == pubAudit){
			throw ServiceSystemException.PUBPARAM_NOT_EXIST.newInstance( "审计配置id不存在,sjid{%s}", sjid);
		}
		return pubAudit;
	}
	
	/**
	 * getAuditByXtmAndFwlj
	 * 根据系统名和访问路径查询审计配置信息
	 * 
	 * @param xtm 系统名
	 * @param fwlj 访问路径
	 * @return PubAudit 审计配置信息
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuditService#getAuditByXtmAndFwlj(java.lang.String, java.lang.String)
	 */
	@Override
	public PubAudit getAuditByXtmAndFwlj(String xtm, String fwlj) throws Exception {
		logger.entry("!!!!!!!!!!根据系统名和访问路径获取审计配置", xtm, fwlj);
		QueryParam param = new QueryParam();
		int fwljLength = 0;
		String replaceStr = "";
		if (StringUtils.isNotEmpty(fwlj)) {
			fwljLength = fwlj.split("/").length;
			if (fwljLength == 4) {
				replaceStr += "/" + fwlj.split("/")[3];
			}
		}
		param.put("xtm", xtm);
		param.put("fwlj", fwlj.replace(replaceStr, ""));
		PubAudit pubAudit = pubAuditDao.getOne(param);
		if(null == pubAudit){
			logger.trace("系统名'{}'和访问路径'{}'不存在", xtm, fwlj.replace(replaceStr, ""));
		}
		return pubAudit;
	}
	
	/**
	 * delelteAudit
	 * 根据参数名删除审计配置
	 * @param String... sjids 审计配置参数名
	 * @return int 删除审计配置对象个数
	 * @see com.htcf.system.service.PubAuditService#delelteAudit(java.lang.String[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteAudit(String... sjids) throws Exception {
		logger.entry("!!!!!!!!!!根据参数名删除审计配置", sjids);
		int deleteCount = 0;
		for (String sjid : sjids) {
			getAuditBySjid(sjid);//检查是否存在
			deleteCount += pubAuditDao.delete(sjid);
		}
		return deleteCount;
	}
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubAudit> 分页列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuditService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubAudit> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据查询条件获取分页列表", map);

		QueryParam queryParam = new QueryParam(map);
		//应用ID
		String yyid = null != map.get("yyid") ? map.get("yyid").toString() : null;
		if (StringUtils.isNotEmpty(yyid)) {
			PubApp pubApp = pubAppService.getAppByYyid(yyid);
			queryParam.addCondition("xtm", "like", "%" + pubApp.getYydm() + "%");
		}
		//访问路径
		String fwlj = null != map.get("fwlj") ? map.get("fwlj").toString() : null;
		if (StringUtils.isNotEmpty(fwlj)) {
			queryParam.addCondition("fwlj", "like", "%" + fwlj + "%");
		}
		//数据描述
		String sjms = null != map.get("sjms") ? map.get("sjms").toString() : null;
		if (StringUtils.isNotEmpty(sjms)) {
			queryParam.addCondition("sjms", "like", "%" + sjms + "%");
		}
		//使用标志
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtils.isNotEmpty(sybz)) {
			queryParam.addCondition("sybz", "like", "%" + sybz + "%");
		}
		
		PageInfo<PubAudit> pageInfo = pubAuditDao.getListPage("get", queryParam);
		return pageInfo;
	}

}

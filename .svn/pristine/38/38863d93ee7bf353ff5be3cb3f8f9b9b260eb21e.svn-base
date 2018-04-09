/** 
 * Project Name:facade-system 
 * File Name:PubAuditService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年3月6日 上午11:00:00 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.po.PubAudit;

/** 
 * ClassName: PubAuditService<br/>
 * Function: 审计配置接口方法定义. <br/>
 * date: 2017年3月6日 上午11:00:00 <br/>
 * 
 * @author wuwei
 */
public interface PubAuditService {
	
	/**
	 * addAudit
	 * 新增审计配置信息
	 * @param pubAudit 审计配置信息
	 * @return PubAudit 审计配置信息
	 * @throws Exception
	 */
	PubAudit addAudit(PubAudit pubAudit) throws Exception;
	
	/**
	 * updateAudit 
	 * 修改审计配置信息
	 * @param pubAudit 审计配置信息
	 * @return PubAudit 审计配置信息
	 * @throws Exception
	 */
	PubAudit updateAudit(PubAudit pubAudit) throws Exception;
	
	/**
	 * getAuditBySjid
	 * 根据参数名获取审计配置信息
	 * @param sjid 参数名
	 * @return PubAudit 审计配置信息
	 * @throws Exception
	 */
	PubAudit getAuditBySjid(String sjid) throws Exception;
	
	/**
	 * getAuditByXtmAndFwlj
	 * 根据系统名和访问路径查询审计配置信息
	 * 
	 * @param xtm 系统名
	 * @param fwlj 访问路径
	 * @return PubAudit 审计配置信息
	 * @throws Exception
	 */
	PubAudit getAuditByXtmAndFwlj(String xtm, String fwlj) throws Exception;
	
	/**
	 * delelteAudit 
	 * 根据参数名删除审计配置信息
	 * @param sjids 审计配置信息参数名
	 * @return int 删除审计配置信息对象个数
	 * @throws Exception
	 */
	int delelteAudit(String... sjids) throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubAudit> 分页列表
	 * @throws Exception
	 */
	PageInfo<PubAudit> getListPage(Map<String, Object> map) throws Exception;
}

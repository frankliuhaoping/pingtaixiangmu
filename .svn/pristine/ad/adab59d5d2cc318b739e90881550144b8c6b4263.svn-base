/** 
 * Project Name:facade-system 
 * File Name:PubLogService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年2月18日 上午10:13:38 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.LogService;
import com.htcf.system.model.po.PubLog;

/** 
 * ClassName: PubLogService<br/>
 * Function: 日志服务接口，定义需要进行的日志操作方法. <br/>
 * date: 2017年2月18日 上午10:13:38<br/>
 * 
 * @author lizhuo 
 */
public interface PubLogService extends LogService<PubLog> {
	
	/**
	 * addLog
	 * 新增日志
	 * @param pubLog 日志
	 * @return PubLog 日志
	 * @throws Exception
	 */
	PubLog addLog(PubLog pubLog) throws Exception;
	
	/**
	 * addAuditLog
	 * 新增日志
	 * @param pubLog 日志
	 * @param msgMap 审计替换信息map
	 * @return PubLog 日志
	 * @throws Exception
	 */
	PubLog addAuditLog(PubLog pubLog, Map<String, Object> msgMap) throws Exception;

	/**
	 * updateLog 
	 * 修改日志
	 * @param pubLog 日志
	 * @return PubLog 日志
	 * @throws Exception
	 */
	PubLog updateLog(PubLog pubLog) throws Exception;
	
	/**
	 * getLogByRzid
	 * 根据Id获取日志
	 * @param rzid 日志ID
	 * @return PubLog 日志
	 * @throws Exception
	 */
	PubLog getLogByRzid(String rzid) throws Exception;

	/**
	 * delelteLog 
	 * 根据日志Id删除日志
	 * @param rzids 日志ID
	 * @return int
	 * @throws Exception
	 */
	int delelteLog(String... rzids) throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubLog> 分页列表
	 * @throws Exception
	 */
	public PageInfo<PubLog> getListPage(Map<String, Object> map) throws Exception;

}

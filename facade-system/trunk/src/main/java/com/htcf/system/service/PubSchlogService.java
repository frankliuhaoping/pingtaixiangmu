/** 
 * Project Name:facade-system 
 * File Name:PubSchlogService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年3月9日 下午2:50:30 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.SchlogService;
import com.htcf.system.model.po.PubSchlog;


/** 
 * ClassName: PubSchlogService<br/>
 * Function: 定时任务日志服务接口，定义需要进行的定时任务日志操作方法. <br/>
 * date: 2017年3月9日 下午2:50:30<br/>
 * 
 * @author wuwei
 */
public interface PubSchlogService extends  SchlogService<PubSchlog>{
	
	/**
	 * addSchlog
	 * 新增定时任务日志
	 * @param pubSchlog 定时任务日志
	 * @return PubSchlog 定时任务日志
	 * @throws Exception
	 */
	PubSchlog addSchlog(PubSchlog pubSchlog) throws Exception;

	/**
	 * updateSchlog 
	 * 修改定时任务日志
	 * @param pubSchlog 定时任务日志
	 * @return PubSchlog 定时任务日志
	 * @throws Exception
	 */
	PubSchlog updateSchlog(PubSchlog pubSchlog) throws Exception;
	
	/**
	 * getSchlogByRzid
	 * 根据Id获取定时任务日志
	 * @param rwzxid 定时任务日志ID
	 * @return PubSchlog 定时任务日志
	 * @throws Exception
	 */
	PubSchlog getSchlogByRwzxid(String rwzxid) throws Exception;

	/**
	 * delelteSchlog 
	 * 根据定时任务日志Id删除日志
	 * @param rwzxids 定时任务日志ID
	 * @return int
	 * @throws Exception
	 */
	int delelteSchlog(String... rwzxids) throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubSchlog> 分页列表
	 * @throws Exception
	 */
	public PageInfo<PubSchlog> getListPage(Map<String, Object> map) throws Exception;

}

/** 
 * Project Name:facade-system 
 * File Name:PubScheduleService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年3月2日 下午1:28:00 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.ScheduleService;
import com.htcf.system.model.po.PubSchedule;

/** 
 * ClassName: PubScheduleService<br/>
 * Function: 定时任务接口方法定义. <br/>
 * date: 2017年3月2日 下午1:28:00<br/>
 * 
 * @author wuwei 
 */
public interface PubScheduleService {
	
	/**
	 * addSchedule
	 * 新增定时任务
	 * @param pubSchedule 定时任务
	 * @return PubSchedule 定时任务
	 * @throws Exception
	 */
	PubSchedule addSchedule(PubSchedule pubSchedule) throws Exception;
	
	/**
	 * updateSchedule 
	 * 修改定时任务
	 * @param pubSchedule 定时任务
	 * @return PubSchedule 定时任务
	 * @throws Exception
	 */
	PubSchedule updateSchedule(PubSchedule pubSchedule) throws Exception;
	
	/**
	 * getScheduleByRwid
	 * 根据参数名获取定时任务
	 * @param rwid 参数名
	 * @return PubSchedule 定时任务
	 * @throws Exception
	 */
	public PubSchedule getScheduleByRwid(String rwid) throws Exception;
	
	/**
	 * delelteSchedule 
	 * 根据参数名删除定时任务
	 * @param rwids 定时任务参数名
	 * @return int 删除定时任务对象个数
	 * @throws Exception
	 */
	int delelteSchedule(String... rwids) throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubSchedule> 分页列表
	 * @throws Exception
	 */
	public PageInfo<PubSchedule> getListPage(Map<String, Object> map) throws Exception;
	
	/**
	 * getPubScheduleList
	 * 根据查询条件获取定时任务列表
	 * @param map 查询条件
	 * @return List<PubSchedule> 定时任务列表
	 * @throws Exception
	 */
	public List<PubSchedule> getPubScheduleList(Map<String, Object> map) throws Exception;
}

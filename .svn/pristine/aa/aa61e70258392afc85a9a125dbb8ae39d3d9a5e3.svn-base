/** 
 * Project Name:service-system 
 * File Name:PubScheduleServiceImpl.java 
 * Package Name: com.htcf.system.service.impl 
 * Date:2017年3月2日 下午1:35:00
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubScheduleDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubSchedule;
import com.htcf.system.service.PubScheduleService;

/** 
 * ClassName: PubScheduleServiceImpl<br/>
 * Function: 定时任务服务实现类. <br/>
 * date: 2017年3月2日 下午1:35:00<br/>
 * 
 * @author wuwei
 */
@Service("pubScheduleService")
// TODO 有些方法需要结合缓存操作
public class PubScheduleServiceImpl implements PubScheduleService {
	
	private static final Logger logger = LogManager.getLogger(PubScheduleServiceImpl.class);
	
	/**
	 * pubScheduleDao:定时任务Dao
	 */
	@Autowired
	private PubScheduleDao pubScheduleDao;

	/**
	 * addSchedule
	 * 新增定时任务
	 * @param pubSchedule 定时任务
	 * @return PubSchedule 定时任务
	 * @throws Exception
	 * @see com.htcf.system.service.PubScheduleService#addSchedule(com.htcf.system.model.po.PubSchedule)
	 */
	@Override
	public PubSchedule addSchedule(PubSchedule pubSchedule) throws Exception {
		logger.entry("!!!!!!!!!!新增定时任务Schedule", JsonUtil.toJsonNonNull(pubSchedule));
		//UUID作为定时任务id
		UUID uuid = UUID.randomUUID();
		pubSchedule.setRwid(uuid.toString().replace("-", ""));
		pubSchedule.setSjbb(0L);
		pubScheduleDao.add(pubSchedule);
		return pubSchedule;
	}

	/**
	 * updateSchedule 
	 * 修改定时任务
	 * @param pubSchedule 定时任务
	 * @return PubSchedule 定时任务
	 * @throws Exception
	 * @see com.htcf.system.service.PubScheduleService#updateSchedule(com.htcf.system.model.po.PubSchedule)
	 */
	@Override
	public PubSchedule updateSchedule(PubSchedule pubSchedule) throws Exception {
		logger.entry("!!!!!!!!!!修改定时任务Schedule", JsonUtil.toJsonNonNull(pubSchedule));
		pubScheduleDao.update(pubSchedule, "rwid");
		return pubSchedule;
	}
	
	/**
	 * getScheduleByRwid
	 * 根据参数名获取定时任务
	 * @param rwid 参数名
	 * @return PubSchedule 定时任务
	 * @throws Exception
	 * @see com.htcf.system.service.PubScheduleService#getScheduleByRwid(java.lang.String)
	 */
	@Override
	public PubSchedule getScheduleByRwid(String rwid) throws Exception {
		logger.entry("!!!!!!!!!!根据参数名获取定时任务", rwid);
		QueryParam param = new QueryParam();
		param.put("rwid", rwid);
		PubSchedule pubSchedule = pubScheduleDao.getOne(param);
		if(null == pubSchedule){
			throw ServiceSystemException.PUBPARAM_NOT_EXIST.newInstance( "任务id不存在,rwid{%s}", rwid);
		}
		return pubSchedule;
	}
	
	/**
	 * delelteSchedule
	 * 根据参数名删除定时任务
	 * @param String... rwids 定时任务参数名
	 * @return int 删除定时任务对象个数
	 * @see com.htcf.system.service.PubScheduleService#delelteSchedule(java.lang.String[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteSchedule(String... rwids) throws Exception {
		logger.entry("!!!!!!!!!!根据参数名删除定时任务", rwids);
		int deleteCount = 0;
		for (String rwid : rwids) {
			getScheduleByRwid(rwid);//检查是否存在
			deleteCount += pubScheduleDao.delete(rwid);
		}
		return deleteCount;
	}
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubSchedule> 分页列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubScheduleService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubSchedule> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据查询条件获取分页列表", map);
		QueryParam queryParam = new QueryParam(map);
		//服务代码
		String fwdm = null != map.get("fwdm") ? map.get("fwdm").toString() : null;
		if (StringUtils.isNotEmpty(fwdm)) {
			queryParam.addCondition("fwdm", "like", "%" + fwdm + "%");
		}
		//任务名称
		String rwmc = null != map.get("rwmc") ? map.get("rwmc").toString() : null;
		if (StringUtils.isNotEmpty(rwmc)) {
			queryParam.addCondition("rwmc", "like", "%" + rwmc + "%");
		}
		//类名
		String lm = null != map.get("lm") ? map.get("lm").toString() : null;
		if (StringUtils.isNotEmpty(lm)) {
			queryParam.addCondition("lm", "like", "%" + lm + "%");
		}
		//方法名
		String ffm = null != map.get("ffm") ? map.get("ffm").toString() : null;
		if (StringUtils.isNotEmpty(ffm)) {
			queryParam.addCondition("ffm", "like", "%" + ffm + "%");
		}
		//使用标志
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtils.isNotEmpty(sybz)) {
			queryParam.addCondition("sybz", "like", "%" + sybz + "%");
		}

		PageInfo<PubSchedule> pageInfo = pubScheduleDao.getListPage("get", queryParam);
		return pageInfo;
	}

	/**
	 * getPubScheduleList
	 * 根据查询条件获取定时任务列表
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubScheduleService#getPubScheduleList(java.util.Map)
	 */
	@Override
	public List<PubSchedule> getPubScheduleList(Map<String, Object> map) throws Exception {
		QueryParam queryParam = new QueryParam();
		if(MapUtils.isNotEmpty(map)){
			//服务代码
			String fwdm = null != map.get("fwdm") ? map.get("fwdm").toString() : null;
			if (StringUtils.isNotEmpty(fwdm)) {
				queryParam.addCondition("fwdm", "=", fwdm );
			}
			
			//使用标志
			String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
			if (StringUtils.isNotEmpty(sybz)) {
				queryParam.addCondition("sybz", "=", sybz);
			}
		}
		List<PubSchedule> pubScheduleList = pubScheduleDao.getList(queryParam);
		return pubScheduleList;
	}
}

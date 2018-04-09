/** 
 * Project Name:service-system 
 * File Name:PubParamServiceImpl.java 
 * Package Name: com.htcf.system.service.impl 
 * Date:2017年2月7日 下午1:47:38 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubParamDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubParam;
import com.htcf.system.service.PubParamService;

/** 
 * ClassName: PubParamServiceImpl<br/>
 * Function: 全局参数服务实现类. <br/>
 * date: 2017年2月7日 下午1:47:38<br/>
 * 
 * @author lizhuo 
 */
@Service("pubParamService")
// TODO 有些方法需要结合缓存操作
public class PubParamServiceImpl implements PubParamService {
	
	private static final Logger logger = LogManager.getLogger(PubParamServiceImpl.class);
	
	/**
	 * pubParamDao:全局参数Dao
	 */
	@Autowired
	private PubParamDao pubParamDao;

	/**
	 * addParam
	 * 新增全局参数
	 * @param pubParam 全局参数
	 * @return PubParam 全局参数
	 * @throws Exception
	 * @see com.htcf.system.service.PubParamService#addParam(com.htcf.system.model.po.PubParam)
	 */
	@Override
	public PubParam addParam(PubParam pubParam) throws Exception {
		logger.entry("!!!!!!!!!!新增全局参数Param", JsonUtil.toJsonNonNull(pubParam));
		pubParam.setSjbb(0L);
		pubParamDao.add(pubParam);
		return pubParam;
	}

	/**
	 * updateParam 
	 * 修改全局参数
	 * @param pubParam 全局参数
	 * @return PubParam 全局参数
	 * @throws Exception
	 * @see com.htcf.system.service.PubParamService#updateParam(com.htcf.system.model.po.PubParam)
	 */
	@Override
	public PubParam updateParam(PubParam pubParam) throws Exception {
		logger.entry("!!!!!!!!!!修改全局参数Param", JsonUtil.toJsonNonNull(pubParam));
		pubParamDao.update(pubParam, "csm");
		return pubParam;
	}

	/**
	 * getParamByCsm
	 * 根据参数名获取全局参数
	 * @param csm 参数名
	 * @return PubParam 全局参数
	 * @throws Exception
	 * @see com.htcf.system.service.PubParamService#getParamByCsm(java.lang.String)
	 */
	@Override
	public PubParam getParamByCsm(String csm) throws Exception {
		logger.entry("!!!!!!!!!!根据参数名获取全局参数", csm);
		QueryParam param = new QueryParam();
		param.put("csm", csm);
		PubParam pubParam = pubParamDao.getOne(param);
		if(null == pubParam){
			throw ServiceSystemException.PUBPARAM_NOT_EXIST.newInstance( "参数名不存在,csm{%s}", csm);
		}
		return pubParam;
	}

	/**
	 * delelteParam 
	 * 根据参数名删除全局参数
	 * @param String... csms 全局参数参数名
	 * @return int 删除全局参数对象个数
	 * @see com.htcf.system.service.PubParamService#delelteParam(java.lang.String[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteParam(String... csms) throws Exception {
		logger.entry("!!!!!!!!!!根据参数名删除全局参数", csms);
		int deleteCount = 0;
		for (String csm : csms) {
			getParamByCsm(csm);//检查是否存在
			deleteCount += pubParamDao.delete(csm);
		}
		return deleteCount;
	}

	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubParam> 分页列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubParamService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubParam> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据查询条件获取分页列表", map);
		
		if (map != null && !map.containsKey("order")) {
			map.put("order", map.get("gxsj"));//按更新时间排序
		}

		QueryParam queryParam = new QueryParam(map);
		
		//参数名
		String csm = null != map.get("csm") ? map.get("csm").toString() : null;
		if (StringUtil.isNotEmpty(csm)) {
			queryParam.addCondition("csm", "like", "%" + csm + "%");
		}
		
		//参数值
		String csz = null != map.get("csz") ? map.get("csz").toString() : null;
		if (StringUtil.isNotEmpty(csz)) {
			queryParam.addCondition("csz", "like", "%" + csz + "%");
		}
		
		//参数备注
		String csbz = null != map.get("csbz") ? map.get("csbz").toString() : null;
		if (StringUtil.isNotEmpty(csbz)) {
			queryParam.addCondition("csbz", "like", "%" + csbz + "%");
		}
		
		//使用标志
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtil.isNotEmpty(sybz)) {
			queryParam.put("sybz", sybz);
		}

		PageInfo<PubParam> pageInfo = pubParamDao.getListPage("get", queryParam);
		return pageInfo;
	}

}

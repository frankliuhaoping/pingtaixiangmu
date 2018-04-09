/** 
 * Project Name:service-system 
 * File Name:PubZzjgsyServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年4月7日 下午4:51:43 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.htcf.system.dao.PubZzjgsyDao;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.PubZzjgsy;
import com.htcf.system.service.PubZzjgsyService;

/** 
 * ClassName: PubZzjgsyServiceImpl
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年4月7日 下午4:51:43
 * 
 * @author wei 
 */
@Service("pubZzjgsyService")
public class PubZzjgsyServiceImpl implements PubZzjgsyService {
	
	private static final Logger logger = LogManager.getLogger(PubZzjgsyServiceImpl.class);

	@Autowired
	private PubZzjgsyDao pubZzjgsyDao;

	/**
	 * 
	 * 合并保存组织机构使用关系表
	 * @param pubZzjgsy
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgsyService#mergePubZzjgsy(com.htcf.system.model.po.PubZzjgsy)
	 */
	@Override
	@Transactional
	public void mergePubZzjgsy(PubZzjgsy pubZzjgsy) throws Exception {
		logger.entry("修改合并组织机构使用关系表,zdbh="+pubZzjgsy.getZdbh());
		pubZzjgsyDao.deleteByZdbh(pubZzjgsy.getZdbh());
		String dwdm = pubZzjgsy.getDwdm();
		if(StringUtils.isEmpty(dwdm)){
			return ;
		}
		String[] arr = dwdm.split(",");
		for(String code : arr){
			pubZzjgsy.setDwdm(code);
			pubZzjgsy.setCjsj(new Date());
			pubZzjgsyDao.add(pubZzjgsy);
		}
	}

	/**
	 * 
	 * 根据组织字典编码查询机构代码
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgsyService#queryDwdmByZdbh(java.lang.String)
	 */
	@Override
	public List<String> queryDwdmByZdbh(String zdbh) throws Exception {
		logger.entry("根据组织字典编码查询机构代码,code:"+zdbh);
		return pubZzjgsyDao.queryDwdmByZdbh(zdbh);
	}

	@Override
	public List<PubZzjgBo> queryPubZzjgBoByZdbh(String zdbh,Integer deepType) throws Exception {
		logger.entry("根据组织字典编码code查询对应组织结果数,code:"+zdbh);
		return this.queryPubZzjgBoByZdbh(zdbh, deepType, null);
	}
	
	private List<PubZzjgBo> queryPubZzjgBoByZdbh(String zdbh,Integer deepType,String gxdwdm){
		List<PubZzjg> pubZZjgList = pubZzjgsyDao.queryPubZzjgBoByZdbh(zdbh,gxdwdm);
		if(pubZZjgList == null || pubZZjgList.isEmpty()){
			return null;
		}
		List<PubZzjgBo> pubZzjgBos = new ArrayList<PubZzjgBo>();
		for(PubZzjg pubZzjg : pubZZjgList){
			PubZzjgBo pubZzjgBo = new PubZzjgBo();
			Mapper mapper = new DozerBeanMapper();
			mapper.map(pubZzjg, pubZzjgBo);
			pubZzjgBo.setIsLeaf(false);
			if(1 == deepType){
				List<PubZzjgBo> subList = this.queryPubZzjgBoByZdbh(zdbh, deepType,pubZzjg.getDwdm());
				if(subList == null || subList.isEmpty()){
					pubZzjgBo.setIsLeaf(true);
				}else{
					pubZzjgBo.setChildren(subList);
				}
			} else if(2 == deepType){
				List<PubZzjgBo> subList = this.queryPubZzjgBoByZdbh(zdbh, deepType,pubZzjg.getDwdm());
				if(subList == null || subList.isEmpty()){
					pubZzjgBo.setIsLeaf(true);
				}else{
					pubZzjgBos.addAll(subList);
				}
			}
			pubZzjgBos.add(pubZzjgBo);
		}
		return pubZzjgBos;
	}

}

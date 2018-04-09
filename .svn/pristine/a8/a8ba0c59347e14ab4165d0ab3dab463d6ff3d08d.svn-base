/** 
 * Project Name:facade-system 
 * File Name:SysOrgService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年9月12日 上午11:30:00 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubZzjg;

/** 
 * ClassName: SysOrgService
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月12日 上午11:30:00
 * 
 * @author liuhuan 
 */
public interface SysOrgService {
	/**
	 * 
	 * 分页查询
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	PageInfo<SysOrg> getListPage(Map<String, Object> map) throws Exception;

	/**
	 * 根据ORG_ID查询
	 * 
	 * @param id
	 * @return
	 */
	SysOrg getSysOrgById(String id)throws Exception;

	/**
	 * 查询全部
	 * 
	 * @return
	 */
	List<SysOrg> getList()throws Exception;
	
	/**
	 * 
	 * 根据ids查询所有需要同步的数据
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	List<SysOrg> getBatch(String[] ids)throws Exception;
	
}

/** 
 * Project Name:service-system 
 * File Name:SysUserDao.java 
 * Package Name:com.htcf.system.dao 
 * Date:2017年9月12日 上午9:45:57 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubUser;

/** 
 * ClassName: SysUserDao
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月12日 上午9:45:57
 * 
 * @author liuhuan 
 */
@Repository
public class SysUserDao extends AbstractBaseDao<SysUser> {

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param queryParam
	 * @return
	 */
	public PubUser getPubUserByYhbh(QueryParam queryParam) {
		return sessionTemplate.selectOne("getPubUserByYhbh", queryParam);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param ids
	 * @return
	 */
	public  List<SysUser> getSysUsers(String[] ids) {
		return sessionTemplate.selectList(getStatement("getSysUsers"), ids);
	}
	
}

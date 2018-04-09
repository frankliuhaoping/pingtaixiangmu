/** 
 * Project Name:service-system 
 * File Name:SysOrgDao.java 
 * Package Name:com.htcf.system.dao 
 * Date:2017年9月12日 上午11:20:06 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubZzjg;

/** 
 * ClassName: SysOrgDao
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月12日 上午11:20:06
 * 
 * @author liuhuan 
 */
@Repository
public class SysOrgDao extends AbstractBaseDao<SysOrg> {
	
	
	/**
	 * 批量查询
	 * 
	 * @param ids
	 * @return
	 */
	public List<SysOrg> getSysOrgs(String[] ids) {
			   
		return sessionTemplate.selectList(getStatement("getSysOrgs"), ids);
	}

	
}

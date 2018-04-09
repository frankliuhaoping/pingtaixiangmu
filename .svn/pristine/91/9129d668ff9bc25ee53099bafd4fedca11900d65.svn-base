/** 
 * Project Name:service-system 
 * File Name:PubJqxzsy.java 
 * Package Name:com.htcf.system.dao 
 * Date:2017年10月10日 上午9:41:08 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubJqxzsy;
import com.htcf.system.model.po.PubZzjgsy;

/** 
 * ClassName: PubJqxzsy
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月10日 上午9:41:08
 * 
 * @author liuhuan 
 */
@Repository
public class PubJqxzsyDao  extends AbstractBaseDao<PubJqxzsy>{

	/**
	 *  根据queryParam 查询所有jqxzbh
	 * @param zdbh
	 * @return
	 */
	public List<String> queryJqxzBhByZdbh(String zdbh) {
		return sessionTemplate.selectList(getStatement("queryJqxzBhByZdbh"), zdbh);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param zdbh
	 */
	public int deleteByZdbh(String zdbh) {
		return sessionTemplate.delete(getStatement("deleteByZdbh"), zdbh);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param zdbh
	 * @return
	 */
	public List<PubJqxzdmBo> getPubJqxzByZdbh(String zdbh) {
		return sessionTemplate.selectList(getStatement("getPubJqxzByZdbh"), zdbh);

	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 */
	public PubJqxzdm getPubJqxzdm(QueryParam queryParam) {
		return sessionTemplate.selectOne(getStatement("getPubJqxzdm"), queryParam);
	}
	
	
}

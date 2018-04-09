/** 
 * Project Name:mybatis-generator 
 * File Name:PubZzjgsyDao.java 
 * Package Name:com.htcf.system.dao 
 * Date:2017-2-7 16:05:27 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.PubZzjgsy;

/** 
 * ClassName: PubZzjgsyDao<br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选).<br/>
 * date: 2017年2月7日 下午4:05:36<br/>
 * 
 * @author ZhangGuihua 
 */
@Repository
public class PubZzjgsyDao extends AbstractBaseDao<PubZzjgsy> {

	public void deleteByZdbh(String zdbh){
		
		this.sessionTemplate.delete(getStatement("deleteByZdbh"), zdbh);
	}
	
	public List<String> queryDwdmByZdbh(String zdbh){
		
		return this.sessionTemplate.selectList(super.getStatement("queryDwdmByZdbh"), zdbh);
	}
	
	public List<PubZzjg> queryPubZzjgBoByZdbh(String zdbh, String gxdwdm){
		Map<String,String> reqMap = new HashMap<String, String>();
		reqMap.put("zdbh", zdbh);
		reqMap.put("gxdwdm", gxdwdm);
		return this.sessionTemplate.selectList(super.getStatement("queryPubZzjgBoByZdbh"), reqMap);
	}
	
	

	public List<PubZzjgBo> getAllView(String zdbh){
		
		return this.sessionTemplate.selectList(getStatement("getAllView"),zdbh);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param param
	 * @return
	 */
	public PubZzjg getPubZzjg(QueryParam queryParam) throws Exception {
		return this.sessionTemplate.selectOne(getStatement("getPubZzjgBo"), queryParam);
	}
	
}

package com.htcf.system.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubZzjg;

/**
 * 
 * ClassName: PubZzjgDao <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2017年1月11日 上午10:32:04 <br/> 
 * 
 * @author chensong
 */
@Repository
public class PubZzjgDao extends AbstractBaseDao<PubZzjg> {
	
	/**
	 * 
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public int insertBatch(List<SysOrg> list)throws Exception{
		return sessionTemplate.insert(getStatement("insertBatch"), list);
	}
	/**
	 * 
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public int updateBatch(List<SysOrg> list)throws Exception{
		return sessionTemplate.update(getStatement("updateBatch"), list);
	}
	
}

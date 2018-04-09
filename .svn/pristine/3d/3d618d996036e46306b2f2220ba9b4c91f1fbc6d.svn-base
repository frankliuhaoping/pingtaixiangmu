package com.htcf.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.po.PubApp;

/**
 * ClassName: PubAppDao <br/> 
 * Function: 应用DAO <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016年12月23日 下午1:22:14 <br/> 
 * 
 * @author zhangyingzi 
 */
@Repository
public class PubAppDao extends AbstractBaseDao<PubApp> {

	/**
	 * 
	 * getAppJoinAuthGroupList
	 * 根据查询条件获取关联授权表分组后的应用
	 * @param param 查询条件
	 * @return List<PubApp> 应用列表
	 * @throws Exception List<PubApp>
	 */
	public List<PubApp> getAppJoinAuthGroupList(QueryParam param) throws Exception {
		
		return this.sessionTemplate.selectList(getStatement("getAppJoinAuthGroup"), param);
	};
	
	
}

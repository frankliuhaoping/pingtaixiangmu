package com.htcf.system.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.system.model.po.PubJqxzdm;

/**
 * 
 * ClassName: PubJqxzdmDao <br/> 
 * Function: 警情性质dao <br/> 
 * date: 2016年12月26日 上午11:19:41 <br/> 
 * 
 * @author chenhao
 */
@Repository
public class PubJqxzdmDao extends AbstractBaseDao<PubJqxzdm> {

	/**
	 * 
	 * TODO(获取树形结构 组织机构数据 )
	 * 
	 * @param param
	 * @return List<PubJqxzdm>
	 */
	public List<PubJqxzdm> getNodesJqxzByJqxzbh(Integer len,String jqxzbh){
		Map<String, Object> map = initMapParam(len, jqxzbh); 
		return sessionTemplate.selectList(getStatement("getNodesJqxzByJqxzbh"), map);
	}

	/**
	 * TODO(组织机构查询条件map参数)
	 * 
	 * @param len
	 * @param jqxzbh
	 * @return Map<String,Object>
	 */
	private Map<String, Object> initMapParam(Integer len, String jqxzbh) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jqxzbh", jqxzbh);
		map.put("len", len);
		return map;
	}
	
	/**
	 * 
	 * TODO(组织机构是否存在子节点数据 )
	 * 
	 * @param param
	 * @return List<PubJqxzdm>
	 */
	public Integer isExitsChildJqxz(Integer len,String jqxzbh){
		Map<String, Object> map = initMapParam(len, jqxzbh); 
		Object obj = sessionTemplate.selectOne(getStatement("isExitsChildJqxz"),map);
		if(obj == null){
			return 0;
		}
		return (Integer)obj;
	}
}

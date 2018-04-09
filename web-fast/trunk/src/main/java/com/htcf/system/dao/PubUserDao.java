package com.htcf.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.bo.PubUserBo;
import com.htcf.system.model.po.PubUser;

/**
 * ClassName: PubUserDao <br/> 
 * Function: 用户Dao <br/> 
 * Reason: ADD REASON(可选). <br/> 
 * date: 2016年11月16日 下午3:50:54 <br/> 
 * 
 * @author ZhangGuihua 
 */
@Repository
public class PubUserDao extends AbstractBaseDao<PubUser> {
	
	/**
	 * getListPageBo
	 * 根据查询条件、sqlId获取分页用户列表
	 * @param sqlId 用户xml配置文件sql id名称
	 * @param map 查询条件
	 * @return PageInfo<PubUserBo> 分页用户列表
	 * @throws Exception PageInfo<PubUserBo>
	 */
	public PageInfo<PubUserBo> getListPageBo(String sqlId, Map<String, Object> map) throws Exception{

		QueryParam queryParam = new QueryParam(map);
		PageHelper.startPage(queryParam.getPageNum(), queryParam.getPageSize());
		
		//排序
		if(null != queryParam.getOrder()){
			String order = queryParam.getOrder();
			// 处理使用标志
			if (order.startsWith("sybz")) {
				order = "T." + order;
			}
			PageHelper.orderBy(order);
		}
		
		//处理单位代码逻辑
		if (map.containsKey("ssdwdm")) {
			String ssdwdm = (String) map.get("ssdwdm");
			while (ssdwdm.lastIndexOf("0") == ssdwdm.length() - 1 && ssdwdm.length() > 1) {
				ssdwdm = ssdwdm.substring(0, ssdwdm.lastIndexOf("0"));
			}
			map.put("ssdwdm", ssdwdm);
		}

		List<PubUserBo> list = sessionTemplate.selectList(getStatement(sqlId), map);

		// 用PageInfo对结果进行包装
		PageInfo<PubUserBo> page = new PageInfo<PubUserBo>(list);
		return page;
	}
}

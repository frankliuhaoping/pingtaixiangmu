/** 
 * Project Name:service-system 
 * File Name:SysOrgServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年9月12日 上午11:31:29 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.annotation.DataSource;
import com.htcf.system.dao.SysOrgDao;
import com.htcf.system.database.DataSourceInstances;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.XdhCopyService;

/** 
 * ClassName: SysOrgServiceImpl
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月12日 上午11:31:29
 * 
 * @author liuhuan 
 */
@Service("sysOrgService")
public class SysOrgServiceImpl implements SysOrgService{
	private static final Logger logger = LogManager.getLogger(SysOrgServiceImpl.class);
	
	@Autowired
	private SysOrgDao sysOrgDao;
	@Autowired
	private XdhCopyService xdhCopyService;
	/**
	 * 根据条件获取分页后的sysUser列表,并与中间表判断
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.SysOrgService#getListPage(java.util.Map)
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public PageInfo<SysOrg> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的sysUser列表",JsonUtil.toJsonNonNull(map));
		QueryParam queryParam = new QueryParam(map);
		//数据库查询对应不上需要修改 根据具体需要查询的
		String dwdm = null != map.get("dwdm") ? map.get("dwdm").toString() : null;
		if (StringUtil.isNotEmpty(dwdm)) {
			queryParam.addCondition("ORG_ID", "like", "%" + dwdm + "%");
		}
		
		String dwmc = null != map.get("dwmc") ? map.get("dwmc").toString() : null;
		if (StringUtil.isNotEmpty(dwmc)) {
			queryParam.addCondition("NAME", "like", "%" + dwmc + "%");
		}
		
		PageInfo<SysOrg> pageInfo = sysOrgDao.getListPage("get", queryParam);
		List<SysOrg> list= pageInfo.getList();
		//判断是否存在于中间表
		isTbbs(list);
		pageInfo.setList(list);
		logger.entry(JsonUtil.toJsonNonNull(pageInfo));
		return pageInfo;
	}
	/**
	 * 
	 * 同步标识生成
	 * 是否存在于中间表
	 * @param list
	 * @return
	 * @throws Exception
	 */
	
	public List<SysOrg> isTbbs(List<SysOrg> list) throws Exception{
		for (SysOrg sysOrg : list) {
			//根据数据id和表名 获取中间表数据
			XdhCopy xdhCopy =xdhCopyService.getXdhCopyByDataIdAndType(sysOrg.getDwdm(),DataSourceInstances.TABLE_SYSORG);
			if (xdhCopy == null) {
				//中间表无数据 标识新增
				sysOrg.setTbbs("1");
			}else {
				//中间表有数据,判断与视图数据是否相同
				String json =JsonUtil.toJsonDefaults(sysOrg).hashCode()+"";
				if (json.equalsIgnoreCase(xdhCopy.getData())) {
					//标识  相同
					sysOrg.setTbbs("0");
				}else {
					//标识修改
					sysOrg.setTbbs("2");
				}
			}
		}
		return list;
	}
	
	
	
	/**
	 * 根据主键id 查询对象
	 * @param id
	 * @return
	 * @see com.htcf.system.service.SysOrgService#getSysOrgById(java.lang.String)
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public SysOrg getSysOrgById(String id)	throws Exception {
		QueryParam queryParam = new QueryParam();
		queryParam.put("ORG_ID",id );
		SysOrg sysOrg = sysOrgDao.getOne(queryParam);
		if (sysOrg == null) {
			throw ServiceSystemException.PUBUSER_NOT_EXIST.newInstance("组织机构不存在,dwdm{%s}", id);
		}
		//逻辑判断
		logger.exit(JsonUtil.toJsonNonNull(sysOrg));
		return sysOrg;
	}
	
	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.SysOrgService#getList()
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public List<SysOrg> getList() throws Exception {
		QueryParam param = new QueryParam();
		List<SysOrg>  list = sysOrgDao.getList(param);
		if(list == null){
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("全部组织机构数据获取失败!");
		}
		return list;
	}
	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.SysOrgService#getBatch()
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public List<SysOrg> getBatch(String[] ids) throws Exception {
		List<SysOrg> list = sysOrgDao.getSysOrgs(ids);
		return list;
	}

}

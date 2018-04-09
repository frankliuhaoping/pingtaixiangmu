/** 
 * Project Name:service-system 
 * File Name:XdhCopyServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年9月13日 上午11:47:40 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.annotation.DataSource;
import com.htcf.system.dao.XdhCopyDao;
import com.htcf.system.database.DataSourceInstances;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.PubUserService;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.SysUserService;
import com.htcf.system.service.XdhCopyService;

/** 
 * ClassName: XdhCopyServiceImpl
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月13日 上午11:47:40
 * 
 * @author liuhuan 
 */
@Service("xdhCopyService")
public class XdhCopyServiceImpl implements XdhCopyService {

    //日志
	private static final Logger logger = LogManager.getLogger(XdhCopyServiceImpl.class);

	@Autowired
	private XdhCopyDao xdhCopyDao;
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysOrgService sysOrgService;
	
	@Autowired
	private PubUserService pubUserService;
	
	@Autowired
	private PubZzjgService pubZzjgService;
	
	/**
	 * 新增中间表数据
	 * @param xdhCopy
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.XdhCopyService#addXdhCopy(com.htcf.system.model.po.XdhCopy)
	 */
	@Override
	public XdhCopy addXdhCopy(XdhCopy xdhCopy) throws Exception {
		logger.entry("新增中间表数据"+JsonUtil.toJsonNonNull(xdhCopy));
		//验证数据
		XdhCopy oXdhCopy=getXdhCopyByDataIdAndType(xdhCopy.getData_Id(), xdhCopy.getType());
		if (oXdhCopy != null) {
			throw ServiceSystemException.XDHCOPY_EXIST;
		}
		//生成uuid
		xdhCopy.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		xdhCopyDao.add(xdhCopy);
		return xdhCopy;
	}

	/**
	 * 修改中间表数据
	 * @param xdhCopy
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.XdhCopyService#updateXdhCopy(com.htcf.system.model.po.XdhCopy)
	 */
	@Override
	public XdhCopy updateXdhCopy(XdhCopy xdhCopy) throws Exception {
		logger.entry("修改中间表数据"+JsonUtil.toJsonNonNull(xdhCopy));
		XdhCopy oXdhCopy=getXdhCopyByDataIdAndType(xdhCopy.getData_Id(), xdhCopy.getType());
		if (oXdhCopy == null) {
			throw ServiceSystemException.XDHCOPY_NOT_EXIST;
		}
		xdhCopy.setId(oXdhCopy.getId());
		xdhCopyDao.update(xdhCopy,"id");
		return xdhCopy;
	}

	/**
	 * 根据数据id 和表名 查询数据
	 * @param dataId
	 * @param type
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.XdhCopyService#getXdhCopyByDataIdAndType(java.lang.String, java.lang.String)
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_SYSTEM)
	public XdhCopy getXdhCopyByDataIdAndType(String data_Id, String type) throws Exception {
		QueryParam param =new QueryParam();
		if (StringUtils.isNotEmpty(data_Id)) {
			param.put("DATA_ID", data_Id);
		}
		if (StringUtils.isNotEmpty(type)) {
			param.put("TYPE", type);
		}
		XdhCopy xdhCopy = xdhCopyDao.getOne(param);
		//是否需要逻辑
		return xdhCopy;
	}

	/**
	 * 同步新德汇用户视图表 到中间表和 本地用户表
	 * @param sysUser
	 * @throws Exception
	 * @see com.htcf.system.service.XdhCopyService#synchroSysUser(com.htcf.system.model.bo.SysUser)
	 */
	@Override
	public void synchroSysUser(SysUser sysUser) throws Exception {
		XdhCopy xdhCopy = new XdhCopy();
		xdhCopy.setData_Id(sysUser.getYhbh());
		xdhCopy.setType(DataSourceInstances.TABLE_SYSUSER);
		String json =JsonUtil.toJsonDefaults(sysUser).hashCode()+"";
		xdhCopy.setData(json);
		//根据数据id和表名 查看中间表是否存在数据
		XdhCopy oXdhCopy=getXdhCopyByDataIdAndType(sysUser.getYhbh(),DataSourceInstances.TABLE_SYSUSER);
		//查询user表
		PubUser user = pubUserService.getUserByYhbh(sysUser.getYhbh());
		//sysOrg 转换pubZzjg
		DozerBeanMapper mapper = new DozerBeanMapper();
		PubUser	pubUser= new PubUser();
		mapper.map(sysUser, pubUser);
		
		if (oXdhCopy == null && user == null) {
			addXdhCopy(xdhCopy);
			pubUserService.addUser(pubUser);
		}else {
			updateXdhCopy(xdhCopy);
			pubUserService.updateUser(pubUser);
		}

	}
	
	
	/**
	 * 批量同步组织机构
	 * @param list
	 * @throws Exception
	 * @see com.htcf.system.service.XdhCopyService#synchroBatchSysOrg(java.util.List)
	 */
	@Override
	public void synchroBatchSysUser(List<SysUser> list) throws Exception {
		//存放批量处理的集合
		List<SysUser> insertList= new ArrayList<SysUser>();
		List<SysUser> updateList= new ArrayList<SysUser>();
			for (SysUser  sysUser : list) {
				XdhCopy xdhCopy = new XdhCopy();
				xdhCopy.setData_Id(sysUser.getYhbh());
				//需要设置常量字段
				xdhCopy.setType(DataSourceInstances.TABLE_SYSUSER);
				String json =JsonUtil.toJsonDefaults(sysUser).hashCode()+"";
				xdhCopy.setData(json);
				//查询中间表
				XdhCopy oXdhCopy= getXdhCopyByDataIdAndType(sysUser.getYhbh(),DataSourceInstances.TABLE_SYSUSER);
				//查询user表
				PubUser user = pubUserService.getUserByYhbh(sysUser.getYhbh());
				if (oXdhCopy == null && user == null) {
					addXdhCopy(xdhCopy);
					insertList.add(sysUser);
				}else {
					updateXdhCopy(xdhCopy);
					updateList.add(sysUser);
				}
			}
			pubUserService.insertBatch(insertList);
			pubUserService.updateBatch(updateList);
	}
	
	
	
	
	
	
	

	/**
	 * 同步新德汇组织机构视图到中间表 和 本地组织机构表
	 * @param sysOrg
	 * @throws Exception 
	 * @see com.htcf.system.service.XdhCopyService#synchroSysOrg(com.htcf.system.model.bo.SysOrg)
	 */
	@Override
	public void synchroSysOrg(SysOrg sysOrg) throws Exception {
		
		XdhCopy xdhCopy = new XdhCopy();
		xdhCopy.setData_Id(sysOrg.getDwdm());
		xdhCopy.setType("V_SYS_ORG");
		String json =JsonUtil.toJsonDefaults(sysOrg).hashCode()+"";
		xdhCopy.setData(json);
		if ("0".equals(sysOrg.getGxdwdm())) {
			sysOrg.setGxdwdm(null);
		}
		XdhCopy oXdhCopy= getXdhCopyByDataIdAndType(sysOrg.getDwdm(),"V_SYS_ORG");
		//查询zzjg表
		PubZzjg opubZzjg =  pubZzjgService.getPubZzjgByDwdm(sysOrg.getDwdm());
		//sysOrg 转换pubZzjg
		DozerBeanMapper mapper = new DozerBeanMapper();
		PubZzjg pubZzjg = new PubZzjg();
		mapper.map(sysOrg, pubZzjg);
		
		if (oXdhCopy == null && opubZzjg == null) {
			addXdhCopy(xdhCopy);
			//中间表无数据,就新增
			pubZzjgService.addPubZzjg(pubZzjg);
		}else {
			updateXdhCopy(xdhCopy);
			//有数据就全部覆盖更新
			pubZzjgService.updatePubZzjg(pubZzjg);
			
		}
	}

	/**
	 * 批量同步组织机构
	 * @param list
	 * @throws Exception
	 * @see com.htcf.system.service.XdhCopyService#synchroBatchSysOrg(java.util.List)
	 */
	@Override
	public void synchroBatchSysOrg(List<SysOrg> list) throws Exception {
		//存放批量处理的集合
		List<SysOrg> insertList= new ArrayList<SysOrg>();
		List<SysOrg> updateList= new ArrayList<SysOrg>();
			for (SysOrg  sysOrg : list) {
				
				XdhCopy xdhCopy = new XdhCopy();
				xdhCopy.setData_Id(sysOrg.getDwdm());
				xdhCopy.setType("V_SYS_ORG");
				String json =JsonUtil.toJsonDefaults(sysOrg).hashCode()+"";
				xdhCopy.setData(json);
				if ("0".equals(sysOrg.getGxdwdm())) {
					sysOrg.setGxdwdm(null);
				}
				//查询中间表
				XdhCopy oXdhCopy= getXdhCopyByDataIdAndType(sysOrg.getDwdm(),"V_SYS_ORG");
				//查询zzjg表
				PubZzjg pubZzjg =  pubZzjgService.getPubZzjgByDwdm(sysOrg.getDwdm());
				if (oXdhCopy == null && pubZzjg == null) {
					addXdhCopy(xdhCopy);
					insertList.add(sysOrg);
				}else {
					updateXdhCopy(xdhCopy);
					updateList.add(sysOrg);
				}
			}
			pubZzjgService.insertBatch(insertList);
			pubZzjgService.updateBatch(updateList);
	}
	
	
	

}

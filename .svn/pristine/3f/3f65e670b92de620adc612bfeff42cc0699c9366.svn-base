/** 
 * Project Name:service-system 
 * File Name:SysUserServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017年9月12日 上午9:56:38 
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
import com.htcf.system.dao.SysUserDao;
import com.htcf.system.database.DataSourceInstances;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.SysUserService;
import com.htcf.system.service.XdhCopyService;

/**
 * ClassName: SysUserServiceImpl Function: TODO ADD FUNCTION. Reason: TODO ADD
 * REASON(可选). date: 2017年9月12日 上午9:56:38
 * 
 * @author liuhuan
 */
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {

	private static final Logger logger = LogManager.getLogger(SysUserServiceImpl.class);

	@Autowired
	private SysUserDao sysUserDao;

	@Autowired
	private XdhCopyService xdhCopyService;

	/**
	 * sysUser分页查询
	 * 
	 * @param map
	 * @return
	 * @see com.htcf.system.service.SysUserService#getListPage(java.util.Map)
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public PageInfo<SysUser> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的sysUser列表", JsonUtil.toJsonNonNull(map));
		QueryParam queryParam = new QueryParam(map);
		// 查询条件
		String yhmc = null != map.get("yhmc") ? map.get("yhmc").toString() : null;
		if (StringUtil.isNotEmpty(yhmc)) {
			queryParam.addCondition("XM", "like", "%" + yhmc + "%");
		}
		String lxdh = null != map.get("lxdh") ? map.get("lxdh").toString() : null;
		if (StringUtil.isNotEmpty(lxdh)) {
			queryParam.addCondition("mobile", "like", "%" + lxdh + "%");
		}
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtil.isNotEmpty(sybz)) {
			sybz = sybz.equalsIgnoreCase("y") ? "1" : "0";
			queryParam.addCondition("status", "like", "%" + sybz + "%");
		}
		PageInfo<SysUser> pageInfo = sysUserDao.getListPage("get", queryParam);
		List<SysUser> list = pageInfo.getList();
		// 新德汇的数据需要判断一下 是否存在于中间表
		isTbbs(list);
		pageInfo.setList(list);
		logger.entry(JsonUtil.toJsonNonNull(pageInfo));
		return pageInfo;
	}

	/**
	 * 同步标识生成 是否存在于中间表
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public List<SysUser> isTbbs(List<SysUser> list) throws Exception {
		for (SysUser sysUser : list) {
			// 根据数据id和表名 获取中间表数据
			XdhCopy xdhCopy = xdhCopyService.getXdhCopyByDataIdAndType(sysUser.getYhbh(),
					DataSourceInstances.TABLE_SYSUSER);
			if (xdhCopy == null) {
				// 中间表无数据 现在需要新增
				sysUser.setTbbs("1");
			} else {
				// 中间表有数据,判断与sysuser数据是否相同
				String json = JsonUtil.toJsonDefaults(sysUser).hashCode() + "";
				if (json.equalsIgnoreCase(xdhCopy.getData())) {
					// 相同为0 显示相同
					sysUser.setTbbs("0");
				} else {
					// 不同为2显示修改
					sysUser.setTbbs("2");
				}
			}
		}
		return list;
	}

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.SysUserService#viewSysUserById(java.lang.String)
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public SysUser getSysUserById(String id) throws Exception {
		QueryParam queryParam = new QueryParam();
		// 根据名字查询.
		queryParam.put("USERNAME", id);
		SysUser sysUser = sysUserDao.getOne(queryParam);
		if (sysUser == null) {
			throw ServiceSystemException.PUBUSER_NOT_EXIST.newInstance("用户ID不存在,yhbh{%s}", id);
		}
		// 逻辑判断
		logger.exit(JsonUtil.toJsonNonNull(sysUser));
		return sysUser;
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @return
	 * @see com.htcf.system.service.SysUserService#getList()
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public List<SysUser> getList() throws Exception {
		QueryParam param = new QueryParam();
		List<SysUser> list = sysUserDao.getList(param);
		if (list == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("全部用户数据获取失败!");
		}
		return list;
	}

	/**
	 * 
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@Override
	@DataSource(DataSourceInstances.ORACLE_DGGA110)
	public List<SysUser> getBatch(String[] ids) throws Exception {
		List<SysUser> list = sysUserDao.getSysUsers(ids);
		return list;
	}

}

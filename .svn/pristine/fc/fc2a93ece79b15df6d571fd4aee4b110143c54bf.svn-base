/** 
 * Project Name:facade-system 
 * File Name:XdhCopyService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年9月13日 上午11:36:47 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;

import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.XdhCopy;

/** 
 * ClassName: XdhCopyService
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月13日 上午11:36:47
 * 
 * @author liuhuan 
 */
public interface XdhCopyService {
	/**
	 * 新增中间表数据.
	 *
	 * @param pubZzjg 组织机构
	 * @return PubZzjg
	 * @throws Exception
	 */
	XdhCopy addXdhCopy(XdhCopy xdhCopy) throws Exception;

	/**
	 * 更新中间表数据.
	 *
	 * @param pubZzjg 组织机构
	 * @return PubZzjg
	 * @throws Exception
	 */
	XdhCopy updateXdhCopy(XdhCopy xdhCopy) throws Exception;
	
	/**
	 * 通过dataId和type得到中间表数据.
	 *
	 * @param dwdm 单位代码
	 * @return PubZzjg
	 * @throws Exception
	 */
	XdhCopy getXdhCopyByDataIdAndType(String dataId,String type) throws Exception;

	/**
	 * 同步sysUser
	 * 
	 * @param sysUser
	 */
	void synchroSysUser(SysUser sysUser)throws Exception;
	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param list
	 * @throws Exception
	 */
	void synchroBatchSysUser(List<SysUser> list) throws Exception;
	/**
	 * 
	 * 批量同步sysOrg到组织机构
	 * @param list
	 * @throws Exception
	 */
	void synchroBatchSysOrg(List<SysOrg> list) throws Exception;
	/**
	 * 同步sysOrg
	 * 
	 * @param sysOrg
	 */
	void synchroSysOrg(SysOrg sysOrg)throws Exception;

	
	
	
}

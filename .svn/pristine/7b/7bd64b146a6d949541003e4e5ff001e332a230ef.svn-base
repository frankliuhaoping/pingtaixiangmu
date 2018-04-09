/** 
 * Project Name:facade-system 
 * File Name:SysUserService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年9月12日 上午9:55:05 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.DemoJjdb;
import com.htcf.system.model.po.PubUser;

/**
 * ClassName: SysUserService Function: TODO ADD FUNCTION. Reason: TODO ADD
 * REASON(可选). date: 2017年9月12日 上午9:55:05
 * 
 * @author liuhuan
 */
public interface SysUserService {
	
	
	/**
	 * 
	 * 分页查询
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	PageInfo<SysUser> getListPage(Map<String, Object> map) throws Exception;

	/**
	 * 根据username查询
	 * 
	 * @param id
	 * @return
	 */
	SysUser getSysUserById(String id) throws Exception;

	/**
	 * 查询全部
	 * 
	 * @return
	 * @throws Exception 
	 */
	List<SysUser> getList() throws Exception;

	/**
	 * 批量查询用户
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	List<SysUser> getBatch(String[] ids) throws Exception;
}

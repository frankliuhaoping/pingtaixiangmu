/** 
 * Project Name:facade-system 
 * File Name:PubRyxxService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年2月14日上午9:33:19 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.po.PubRyxx;

/**
 * ClassName: PubRyxxService <br/>
 * Function: 人员信息维护服务接口. <br/>
 * date: 2017年2月14日 上午9:33:19 <br/>
 * 
 * @author chenhao
 */
public interface PubRyxxService {

	/**
	 * 
	 * 新增人员信息
	 * 
	 * @param pubRyxx
	 * @return
	 * @throws Exception PubRyxx
	 */
	PubRyxx addRyxx(PubRyxx pubRyxx) throws Exception;

	/**
	 * 
	 * 修改人员信息
	 * 
	 * @param pubRyxx
	 * @return
	 * @throws Exception PubRyxx
	 */

	PubRyxx upDateRyxx(PubRyxx pubRyxx) throws Exception;

	/**
	 * 
	 * 根据人员编号查看人员信息
	 * 
	 * @param rybh
	 * @return
	 * @throws Exception PubRyxx
	 */

	PubRyxx viewPubRyxxByRybh(String rybh) throws Exception;

	/**
	 * 
	 * 根据人员编号获取人员信息
	 * 
	 * @param rybh
	 * @return
	 * @throws Exception PubRyxx
	 */
	PubRyxx getPubRyxxByRybh(String rybh) throws Exception;

	/**
	 * 
	 * 根据rybhs删除人员信息
	 * 
	 * @param rybhs
	 * @return
	 * @throws Exception int
	 */
	int deleltePubRybh(String... rybhs) throws Exception;

	/**
	 * 
	 * 分页查询
	 * 
	 * @param map
	 * @return
	 * @throws Exception PageInfo<PubRyxx>
	 */

	public PageInfo<PubRyxx> getListPage(Map<String, Object> map) throws Exception;
}

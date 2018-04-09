/** 
 * Project Name:facade-system 
 * File Name:PubGpssbxxService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年6月5日 下午1:24:14 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.po.PubGpssbxx;

/**
 * ClassName: PubGpssbxxService <br/>
 * Function: 处理Gpssbxx表的增删改查操作. <br/>
 * date: 2017年6月5日 下午1:24:14
 * 
 * @author yiqiang
 */
public interface PubGpssbxxService {

	/**
	 * 新增操作
	 * 
	 * @param sbxx 设备信息对象
	 * @return
	 * @throws Exception
	 */
	PubGpssbxx addPubGpssbxx(PubGpssbxx sbxx) throws Exception;

	/**
	 * 
	 * 根据设备id获取设备信息
	 * 
	 * @param sbbh
	 * @return
	 * @throws Exception
	 */
	PubGpssbxx getPubGpssbxxBySbbh(String sbbh) throws Exception;

	/**
	 * gps设备信息分页查询
	 * 
	 * @param map 查询参数
	 * @return
	 */
	PageInfo<PubGpssbxx> getListPage(Map<String, Object> map);

	/**
	 * 
	 * 删除gbs设备信息
	 * 
	 * @param sbbh 设备编码
	 * @return
	 * @throws Exception
	 */
	int deleltePubGpssbxx(String... sbbh) throws Exception;

	/**
	 * 修改gbs设备信息
	 * 
	 * @param sbxx 设备信息对象
	 * @return
	 * @throws Exception
	 */
	PubGpssbxx updatePubGpssbxx(PubGpssbxx sbxx) throws Exception;
	
	/**
	 * 批量添加设备信息
	 * 
	 * @param list
	 * @return
	 */
	int batchAddPubGpssbxx(List<PubGpssbxx> list) throws Exception;

}

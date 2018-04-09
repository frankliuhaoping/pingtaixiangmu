/** 
 * Project Name:facade-system 
 * File Name:PubZzjgService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017-2-7 16:53:49 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.DictService;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.po.PubXtzd;

/**
 * 
 * ClassName: PubXtzdService <br/>
 * Function: 系统字典服务. <br/>
 * date: 2017年2月9日 上午11:04:33 <br/>
 * 
 * @author cs
 */
public interface PubXtzdService extends DictService<PubXtzd>{

	/**
	 * 新增系统字典
	 * 
	 * @param pubXtzd
	 * @return PubXtzd
	 * @throws Exception
	 */
	PubXtzd addPubXtzd(PubXtzd pubXtzd) throws Exception;

	/**
	 * 更新系统字典
	 * 
	 * @param PubXtzd
	 * @return PubXtzd
	 * @throws Exception
	 */
	PubXtzd updatePubXtzd(PubXtzd pubXtzd) throws Exception;

	/**
	 * 通过编号获取字典
	 * 
	 * @param bh
	 * @return PubXtzd
	 * @throws Exception
	 */
	PubXtzd getPubXtzdByBh(String bh) throws Exception;

	/**
	 * 根据编号删除字典
	 *
	 * @param bhs
	 * @throws Exception
	 */
	int deleltePubXtzdByBh(String... bhs) throws Exception;

	/**
	 * 分页获取字典
	 * 
	 * @param map
	 * @return PageInfo<PubXtzd>
	 * @throws Exception
	 */
	public PageInfo<PubXtzd> getListPage(Map<String, Object> map) throws Exception;

	/**
	 * 获取字典List 1. 如果zdbh != null 获取特定的字典编号(zdbh)下的子字典 2. 如果yyid !=null && zdbh
	 * == null 获取yyid下的所有字典 3. 如果yyid == null && zdbh == null
	 * 获取全系统所有字典，非特殊业务不建议调用
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return List<PubXtzd>
	 * @throws Exception
	 */
	public List<PubXtzd> getPubXtzdListByZdbh(String yyid, String zdbh) throws Exception;

	/**
	 * 根据字典编号获取字典
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return PubXtzd
	 * @throws Exception
	 */
	public PubXtzd getPubXtzdByZdbh(String yyid, String zdbh) throws Exception;

	/**
	 * 通过条件查询字典类型
	 * 
	 * @param map
	 * @return PubXtzd
	 * @throws Exception
	 */
	List<PubXtzd> queryListBySearch(Map<String, Object> map) throws Exception;

	/**
	 * 通过字典项名获取字典编号
	 * 
	 * @param zdxm
	 * @return PubXtzd
	 * @throws Exception
	 */
	PubXtzd getPubXtzdByZdxm(String zdxm) throws Exception;

	/**
	 * 通过应用ID，zdbh及deepType获取系统字典树.
	 *
	 * @param yyid 应用ID
	 * @param zdbh 字典编号
	 * @param deepType  0:不加载孙子节点 
	 * 					1:递归加载所有孙子节点（按树型数据结构返回）
	 * 				    2:递归加载所有孙子节点（按并列数据结构返回）
	 * @return List<PubXtzdBo> 系统字典列表
	 * @throws Exception
	 */
	List<PubXtzdBo> getPubXtzdNodesById(String yyid, String zdbh, int deepType) throws Exception;

	/**
	 * selectPubXtzdNodesById 根据查询条件获取树数据
	 * 
	 * @param 查询参数
	 * @return List&lt;PubXtzdBo&gt;
	 * @throws Exception 抛出可能发生的异常
	 */
	List<PubXtzdBo> selectPubXtzdNodesById(String yyid, String zdfbh, String zdbh, String zdxm, String zdxz)
			throws Exception;

	/**
	 * 根据字典编号获取字典
	 * 
	 * @param zdbh
	 * @return PubXtzd
	 * @throws Exception
	 */
	PubXtzd getPubXtzdByZdbh(String zdbh) throws Exception;

	/**
	 * 获取字典Map</br>
	 * 
	 * 1. 如果zdbh != null 获取特定的字典编号(zdbh)下的子字典 </br> 2. 如果yyid != null && zdbh ==
	 * null 获取yyid下的所有字典 </br> 3. 如果yyid == null && zdbh == null
	 * 获取全系统所有字典，非特殊业务不建议调用</br>
	 * 
	 * 返回值示例： key = system_zzjgsybz value = 组织机构使用标志
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return Map<String,String>
	 * @throws Exception
	 */
	public Map<String, String> getStringMapByZdbh(String yyid, String zdbh) throws Exception;

	/**
	 * 获取字典Map</br>
	 * 
	 * 1. 如果zdbh != null 获取特定的字典编号(zdbh)下的子字典</br> 2. 如果yyid != null &&zdbh ==
	 * null 获取yyid下的所有字典 </br> 3. 如果yyid == null && zdbh == null</br>
	 * 获取全系统所有字典，非特殊业务不建议调用</br>
	 * 
	 * 返回值示例： key = system_zzjgsybz value = PubXtzd
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return Map<String,PubXtzd>
	 * @throws Exception
	 */
	public Map<String, PubXtzd> getPubXtzdMapByZdbh(String yyid, String zdbh) throws Exception;

	/**
	 * getCountByZdfbh 根据zdfbh获取子资源数量
	 * 
	 * @param zdfbh
	 * @return int 子资源数量
	 * @throws Exception
	 */
	public int getCountByZdfbh(String yyid, String zdfbh) throws Exception;
}

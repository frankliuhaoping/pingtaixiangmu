/** 
 * Project Name:facade-system 
 * File Name:PubJqxzService.java 
 * Package Name:com.htcf.system.service 
 * Date:2016年12月21日下午3:48:55 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;

/**
 * ClassName: PubJqxzService<br/>
 * Function: 警情性质服务接口. <br/>
 * date: 2016年12月21日下午3:48:55<br/>
 * 
 * @author chenhao
 */
public interface PubJqxzService {

	/**
	 * 新增警情性质
	 * 
	 * @param pubJqxzdm
	 * @return PubJqxzdm
	 * @throws Exception
	 */
	PubJqxzdm addJqxz(PubJqxzdm pubJqxzdm) throws Exception;

	/**
	 * 修改
	 * 
	 * @param pubJqxzdm
	 * @return PubJqxzdm
	 * @throws Exception
	 */
	PubJqxzdm upDateJqxz(PubJqxzdm pubJqxzdm) throws Exception;

	/**
	 * 根据jqxzbh查看PubJqxzdm
	 * 
	 * @param jqxzbh
	 * @return PubJqxzdm
	 * @throws Exception
	 */
	PubJqxzdm viewPubJqxzByJqxzbh(String jqxzbh) throws Exception;

	/**
	 * 
	 * 根据jqxzbh获取PubJqxzdm
	 * 
	 * @param jqxzbh
	 * @return PubJqxzdm
	 * @throws Exception
	 */
	PubJqxzdm getPubJqxzByJqxzbh(String jqxzbh) throws Exception;

	/**
	 * 
	 * 根据jqbhs删除PubJqxzdm
	 * 
	 * @param jqxzbhs
	 * @return int
	 * @throws Exception
	 */
	int deleltePubJqxz(String... jqxzbhs) throws Exception;

	/**
	 * 
	 * 分页查询
	 * 
	 * @param map
	 * @return PageInfo<PubJqxzdm>
	 * @throws Exception
	 */
	public PageInfo<PubJqxzdm> getListPage(Map<String, Object> map) throws Exception;

	/**
	 * 通过警情性质编号及deepType获取资源树.
	 *
	 
	 * @param bzjqxzbh标准警情现在编号
	 * @param deepType 0:不加载孙子节点
	 * 			1：递归加载所有孙子节点（按树型数据结构返回） 
	 * 			2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return List<PubJqxzdmBo> 资源列表
	 * @throws Exception
	 */
	public List<PubJqxzdmBo> getNodesJqxzByJqxzbh(String jqxzbh, Integer deepType)throws Exception;
	/**
	 * 获取警情性质Map 
	 * 
	 * @param bzjqxzbh
	 * @return
	 * @throws Exception Map<String,String>
	 */
	public Map<String, PubJqxzdm> getStringMap(String bzjqxzbh);

	/**
	 * 根据标准警情编号来获取PubJqxzdm
	 * 根据bzjqxzbh获取PubJqxzdm
	 * 
	 * @param jqxzbh
	 * @return PubJqxzdm
	 * @throws Exception
	 */
	PubJqxzdm getPubJqxzBybzjqxzbh(String bzjqxzbh) throws Exception;

	/**
	 * getJqxzBybh TODO(根据标准警情性质编号查询对应警情性质集合)
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return List&lt;PubJqxzdm&gt; 返回查询的数据以List的方式
	 */
	List<PubJqxzdm> getJqxzBybh(String string);

	/**
	 * 根据标准警情性质父编号获取警情性质列表
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return List&lt;PubJqxzdm&gt; 返回一个警情性质集合
	 * @throws Exception 抛出可能发生的异常
	 */
	List<PubJqxzdm> getPubJqxzBybzjqxzbh2(String string);
	
	/**
	 * getJqxzByBzjqxzbh
	 * 根据标准警情性质编号返回对应数据所处等级和数据
	 * @param bzjqxzbh   标准警情性质编号
	 * @return Map&lt;String, PubJqxzdmBo&gt;
	 * @throws Exception  抛出可能发生的异常
	 */
	Map<String, PubJqxzdmBo> getJqxzByBzjqxzbh(String bzjqxzbh)throws Exception;
}

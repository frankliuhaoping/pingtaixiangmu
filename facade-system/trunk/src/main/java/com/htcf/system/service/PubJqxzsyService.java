/** 
 * Project Name:facade-system 
 * File Name:PubJqxzsyService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年10月9日 下午3:25:28 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;

import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubJqxzsy;

/** 
 * ClassName: PubJqxzsyService
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月9日 下午3:25:28
 * 
 * @author liuhuan 
 */

public interface PubJqxzsyService {

	/**
	 * 根据zdbh查询jqxzbh集合
	 * 
	 * @param zdbh
	 * @return
	 */
	List<String> queryJqxzBhByZdbh(String zdbh) throws Exception;

	/**
	 * 新增方法(页面保存的字符串 拆分为jqxzbh 新增到jqxzsy表中)
	 * 
	 * @param pubJqxzsy
	 */
	void addPubJqxzsy(PubJqxzsy pubJqxzsy) throws Exception;

	/**
	 * 根据zdbh查询jqxzdm集合
	 * 
	 * @param zdbh
	 * @return
	 */
	List<PubJqxzdmBo> getPubJqxzByZdbh(String zdbh)throws Exception;
	
	
	
	/**
	 * 根据zdbh 和bzjqfbh 下的子节点集合
	 * @param zdbh  字典编号
	 * @param bzjqxzbh   标准警情父级bh
	 * @param deepType 0:不加载孙子节点 
	 *                 1：递归加载所有孙子节点（按树型数据结构返回）
	 *                 2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return
	 * @throws Exception
	 */
	List<PubJqxzdmBo> getPubJqxzByZdbh(String zdbh,String bzjqxzbh,int deepType)throws Exception;
	/**
	 * 根据zdbh获取配置  覆盖到bh
	 * 
	 * @param zdbh
	 * @param bh
	 * @param yhzh 创建人
	 */
	void copyPubjqxzsy(String zdbh, String bh, String yhzh)throws Exception ;

	/**
	 * 根据zdbh,jqxzbh 获取pubjqxzdm
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 */
	PubJqxzdm getPubJqxzdm(String zdbh, String jqxzbh) throws Exception;

	/**
	 * 获取警情性质使用级别
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 */
	int getPubJqxzsyLevel(String zdbh, String jqxzbh) throws Exception;

	/**
	 * 构建树形结构
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	List<PubJqxzdmBo> createTree(String zdbh) throws Exception;

	/**
	 * 根据jqxzbh
	 * 构建树形结构下子节点
	 * 
	 * @param zdbh
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	List<PubJqxzdmBo> createTree(String zdbh, String jqxzbh) throws Exception;
	
	
	
}

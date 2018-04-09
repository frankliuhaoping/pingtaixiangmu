/** 
 * Project Name:facade-system 
 * File Name:PubZzjgsyService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年4月7日 下午4:49:17 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;

import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.PubZzjgsy;

/** 
 * ClassName: PubZzjgsyService  <br>
 * Function: 组织机构使用service接口.   <br>
 * date: 2017年4月7日 下午4:49:17 <br>
 * 
 * @author wei  <br>
 */
public interface PubZzjgsyService {

	/**
	 * 合并保存组织机构使用关系表
	 * 
	 * @param pubZzjgsy   组织机构使用PO
	 * @throws Exception  抛出可能发生的异常
	 */
	public void mergePubZzjgsy(PubZzjgsy pubZzjgsy) throws Exception;
	
	/**
	 * 
	 * 根据组织字典编码查询机构代码
	 * 
	 * @param zdbh   字典编号
	 * @return List&lt;String&gt;  返回的组织机构代码集合
	 * @throws Exception 抛出可能发生的异常
	 */
	public List<String> queryDwdmByZdbh(String zdbh) throws Exception;
	
	/**
	 * 
	 * 根据组织字典编码code查询对应组织结果数
	 * 
	 * @param zdbh 字典编号
	 * @param deepType
	 * 		   0:不加载孙子节点 
	 *         1：递归加载所有孙子节点（按树型数据结构返回）
	 *         2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return List&lt;PubZzjgBo&gt; 返回组织机构Bo集合
	 * @throws Exception  抛出可能发生的异常
	 */
	@Deprecated
	public List<PubZzjgBo> queryPubZzjgBoByZdbh(String zdbh,Integer deepType) throws Exception;
	
	/**
	 * queryPubZzjgBoByZdbh
	 * TODO(查询组织机构BO，根据对应的字典编号，需要返回的结构类型，gxdwdm 管辖单位代码（父编号）返回数据)
	 * 
	 * @param zdbh     字典编号
	 * @param deepType 需要返回的数据类型
	 * 		           0:不加载孙子节点 
	 *                 1：递归加载所有孙子节点（按树型数据结构返回）
	 *                 2：递归加载所有孙子节点（按并列数据结构返回）
	 * @param gxdwdm   管辖单位代码（父编号）
	 * @return   List&lt;PubZzjgBo&gt; 返回组织机构Bo集合
	 * @throws  Exception  抛出可发生的异常
	 * @see com.htcf.system.service.PubZzjgsyService#queryPubZzjgBoByZdbh(java.lang.String,java.lang.Integer,java.lang.String)
	 */
	@Deprecated
	public List<PubZzjgBo> queryPubZzjgBoByZdbh(String zdbh,Integer deepType,String gxdwdm)throws Exception;

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param zdbh
	 * @param bh
	 * @throws Exception
	 */
	void copyPubZzjgsy(String zdbh, String bh,String cjr) throws Exception;

	/**
	 * 根据单位代码获取当前组织机构级别
	 * 
	 * @param pubZzjgbo
	 * @return
	 * @throws Exception
	 */
	int getPubZzjgsyLevel(String dwdm, String zdbh) throws Exception;

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param dwdm
	 * @param zdbh
	 * @return
	 * @throws Exception
	 */
	PubZzjg getPubZzjg(String dwdm, String zdbh) throws Exception;
	/**
	 * 查询zzjgsyBo
	 * 根据字典编号  和单位代码  和deepType 返回对应数据
	 * @param zdbh  字典编号
	 * @param dwdm  单位代码
	 * @param deepType 需要返回的数据类型 返回当前单位代码下的子集合
	 * 		           0:不加载孙子节点   
	 *                 1：递归加载所有孙子节点（按树型数据结构返回）
	 *                 2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return
	 * @throws Exception 
	 */
	public List<PubZzjgBo> getPubZzjgBoByZdbh(String zdbh, String dwdm, Integer deepType) throws Exception;
	
}

/** 
 * Project Name:facade-system 
 * File Name:PubResService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017-2-7 16:46:17 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.htcf.frame.service.ResService;
import com.htcf.system.model.bo.PubResBo;
import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubUser;

/** 
 * ClassName: PubResService <br/> 
 * Function: 资源Service <br/> 
 * Reason: ADD REASON(可选). <br/> 
 * date: 2016年12月1日 下午3:24:26 <br/> 
 * 
 * @author chenshizhe 
 */
public interface PubResService extends ResService<PubRes>{

	/**
	 * 添加资源.
	 *
	 * @param pubRes 资源
	 * @return PubRes 资源
	 * @throws Exception
	 */
	PubRes addRes(PubRes pubRes) throws Exception;

	/**
	 * 更新资源.
	 *
	 * @param pubRes 资源
	 * @return PubRes 资源
	 * @throws Exception
	 */
	PubRes updateRes(PubRes pubRes) throws Exception;


	/**
	 * 通过资源id查找资源.
	 *
	 * @param zyid 资源id
	 * @return PubRes 资源
	 * @throws Exception
	 */
	PubRes getResByZyid(String zyid) throws Exception;

	/**
	 * 删除资源.
	 *
	 * @param zyid 资源ID
	 * @return int
	 * @throws Exception
	 */
	int delelteRes(String... zyid) throws Exception;
	
	/**
	 * 通过应用ID，资源ID及deepType获取资源树.
	 *
	 * @param yyid 应用ID
	 * @param zyid 资源ID
	 * @param deepType 0:不加载孙子节点
	 * 			1：递归加载所有孙子节点（按树型数据结构返回） 
	 * 			2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return List<PubResBo> 资源列表
	 * @throws Exception
	 */
	List<PubResBo> getPubResNodesById(String yyid, String zyid, int deepType) throws Exception;

	/**
	 * 根据用户、应用ID查询资源菜单列表.
	 *
	 * @param pubUser 用户
	 * @param yyid 应用ID
	 * @return List<PubRes> 菜单资源列表
	 * @throws Exception
	 */
	public List<PubRes> getResListByUserAndYyid(PubUser pubUser,String yyid) throws Exception;
	
	/**
	 * getResList
	 * 根据条件查询资源列表.
	 *
	 * @param map 查询条件
	 * @return List<PubRes> 资源列表
	 * @throws Exception
	 */
	public List<PubRes> getResList(Map<String, Object> map) throws Exception;
	
	/**
	 * getResPermissions
	 * 根据用户、应用ID查询权限资源.
	 *
	 * @param pubUser 用户
	 * @param yyid 应用ID
	 * @return Set<String> 权限资源
	 * @throws Exception
	 */
	public Set<String> getResPermissions(PubUser pubUser,String yyid) throws Exception;

	/**
	 * 根据角色id 获取zyid 集合
	 * 
	 * @param jsid
	 * @return
	 */
	List<String> checkZyids(String jsid)throws Exception;

	/**
	 *根据用户、应用ID 资源类型id 查询资源菜单列表.
	 * 
	 * @param pubUser
	 * @param yyid
	 * @param zylx
	 * @return
	 * @throws Exception
	 */
	List<PubRes> getResListByUserAndYyid(PubUser pubUser, String yyid, Integer zylx) throws Exception;
}

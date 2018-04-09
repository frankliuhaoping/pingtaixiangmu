/** 
 * Project Name:facade-system 
 * File Name:PubAuthService.java 
 * Package Name:com.htcf.system.service 
 * Date:2016年12月1日下午3:23:54 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Autherved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubUser;


/** 
 * ClassName: PubAuthService <br/> 
 * Function: 授权Service <br/> 
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月1日 下午3:23:54 <br/> 
 * 
 * @author chenshizhe 
 */
public interface PubAuthService {
	
	/**
	 * addAuth
	 * 添加授权
	 * @param pubAuth 授权
	 * @return PubAuth 授权
	 * @throws Exception
	 */
	PubAuth addAuth(PubAuth pubAuth) throws Exception;

	/**
	 * getAuthBySqid
	 * 根据授权ID获取
	 * @param sqid 授权ID
	 * @return PubAuth 授权
	 * @throws Exception
	 */
	PubAuth getAuthBySqid(String sqid) throws Exception;

	/**
	 * delelteAuth
	 * 根据授权ID删除
	 * @param sqid 授权ID
	 * @return int
	 * @throws Exception
	 */
	int deleteAuth(String... sqid) throws Exception;
	
	/**
	 * getAuthList
	 * 根据查询条件获取授权列表
	 * @param map 查询条件
	 * @return List<PubAuth> 授权列表
	 * @throws Exception
	 */
	List<PubAuth> getAuthList(Map<String, Object> map) throws Exception;
	
	/**
	 * addAuthList
	 * 批量添加授权
	 * @throws Exception
	 */
	void addAuthList(List<PubAuth> pubAuthList) throws Exception;
	
	/**
	 * delelteAuthSet
	 * 批量删除授权
	 * @param sqids 授权ID
	 * @return int
	 * @throws Exception
	 */
	int deleteAuthBySet(Set<String> sqids) throws Exception;
	
	/**
	 * delSqidAndAddAuth
	 * 根据传递授权集合删除后,添加授权集合信息
	 * @param sqidList 授权
	 * @param pubAuthList 授权列表
	 * @throws Exception
	 */
	void delSqidAndAddAuth(Set<String> sqidList, List<PubAuth> pubAuthList) throws Exception;
	
	/**
	 * saveUserAuth
	 * 用户管理授权(根据用户ID,删除在新角色中不存在的原角色授权,新增在原角色中不存在的新角色授权)
	 * @param nJsids 新角色ID
	 * @param oJsids 原角色ID
	 * @param yhbh 用户ID
	 * @param pubUser 登陆用户
	 * @throws Exception
	 */
	public void saveUserAuth(String[] nJsids,String[] oJsids,String yhbh,PubUser pubUser) throws Exception;
	
	/**
	 * saveAndDelAuth
	 * 角色管理授权(根据角色ID,删除在新用户中不存在的原用户授权,新增在原用户中不存在的新用户授权)
	 * @param jsid 角色Id
	 * @param oyhbhs 原用户编号
	 * @param yhbhs_new 新用户编号
	 * @param pubUser 登陆用户
	 * @throws Exception
	 */
	public void saveAndDelAuth(String jsid, List<String> oyhbhs, List<String> yhbhs_new, PubUser pubUser) throws Exception;
}

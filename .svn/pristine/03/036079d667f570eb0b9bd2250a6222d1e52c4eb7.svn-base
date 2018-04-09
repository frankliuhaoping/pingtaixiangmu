/** 
 * Project Name:facade-system 
 * File Name:PubRoleService.java 
 * Package Name:com.htcf.system.service 
 * Date:2016年12月1日下午3:25:04 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Roleerved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.bo.PubRoleBo;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;


/** 
 * ClassName: PubRoleService <br/> 
 * Function: 角色  Service <br/> 
 * Reason:ADD REASON(可选). <br/> 
 * date: 2016年12月1日 下午3:25:04 <br/> 
 * 
 * @author chenshizhe 
 */
public interface PubRoleService {
	
	/**
	 * 
	 * addRole
	 * 新增角色
	 * @param pubRole 角色
	 * @return PubRole 角色
	 * @throws Exception PubRole
	 */
	PubRole addRole(PubRole pubRole) throws Exception;
	
	/**
	 * 
	 * addRole
	 * 复制角色
	 * @param pubRole 角色
	 * @return PubRole 角色
	 * @throws Exception
	 */
	PubRole copyRole(PubRole pubRole) throws Exception;

	/**
	 * 
	 * updateRole
	 * 修改角色 
	 * @param pubRole 角色
	 * @return PubRole 角色
	 * @throws Exception
	 */
	PubRole updateRole(PubRole pubRole) throws Exception;

	/**
	 * 
	 * getRoleByJsid
	 * 根据角色ID获取角色
	 * @param jsid 角色ID
	 * @return PubRole 角色
	 * @throws Exception
	 */
	PubRole getRoleByJsid(String jsid) throws Exception;

	/**
	 * getListPage
	 * 根据查询条件获取分页角色
	 * @param map 查询条件
	 * @return PageInfo<PubRole> 分页角色列表
	 * @throws Exception
	 */
	public PageInfo<PubRole> getListPage(Map<String, Object> map) throws Exception;
	
	/**
	 * getListPageBo
	 * 根据查询条件关联应用获取分页角色
	 * @param map 查询条件
	 * @return PageInfo<PubRole> 分页角色列表
	 * @throws Exception
	 */
	public PageInfo<PubRoleBo> getListPageBo(Map<String, Object> map) throws Exception;
	
	/**
	 * getRoleListByUserAndYyid
	 * 根据用户、应用ID查询角色列表
	 * @param pubUser 用户
	 * @param yyid 应用ID
	 * @return List<PubRole> 角色列表
	 * @throws Exception
	 */
	public List<PubRole> getRoleListByUserAndYyid(PubUser pubUser,String yyid) throws Exception;
	
	/**
	 * delelteRoles
	 * 根据角色ID删除角色
	 * @param jsids 角色ID
	 * @return int
	 * @throws Exception
	 */
	int delelteRoles(String... jsids) throws Exception;
	
	/**
	 * getPubRole
	 * 根据资源ID与应用ID查询角色列表
	 * @param zyid 源ID
	 * @param yyid 应用ID
	 * @return List<PubRole> 角色列表
	 * @throws Exception
	 */
	public List<PubRole> getPubRoleList(String zyid,String yyid) throws Exception;
	
	/**
	 * getZyidByJsids(根据角色ID 集合 获取资源ID 集合)
	 * 
	 * @param jsids
	 * @return
	 * @throws Exception
	 */
	public List<String> getZyidsByJsids(Set<String> jsids) throws Exception;
	
	/**
	 * 查询所有角色
	 * 
	 * @return
	 * @throws Exception
	 */
	List<PubRole> getAll()throws Exception;

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param zyid
	 * @param jsid
	 * @return
	 * @throws Exception
	 */
	int addPubRoleRes(String zyid, String jsid) throws Exception;

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param jsid
	 */
	int deleteRoleRes(String jsid);
	
}

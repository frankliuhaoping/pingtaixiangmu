/** 
 * Project Name:facade-system 
 * File Name:PubUserService.java 
 * Package Name:com.htcf.system.service 
 * Date:2016年12月1日下午3:25:22 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Usererved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.UserService;
import com.htcf.system.model.bo.PubUserBo;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubUser;

/**
 * ClassName: PubUserService <br/>
 * Function: 用户 Service <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月1日 下午3:25:22 <br/>
 * 
 * @author chenshizhe
 */
public interface PubUserService extends UserService<PubUser>{

	/**
	 * addUser 添加用户
	 * 
	 * @param pubUser 用户
	 * @return PubUser 用户
	 * @throws Exception
	 */
	PubUser addUser(PubUser pubUser) throws Exception;

	/**
	 * updateUser 修改用户
	 * 
	 * @param pubUser 用户
	 * @return PubUser 用户
	 * @throws Exception
	 */
	PubUser updateUser(PubUser pubUser) throws Exception;

	/**
	 * getUserByYhbh 根据用户编号获取用户
	 * 
	 * @param yhbh 用户编号
	 * @return PubUser 用户
	 * @throws Exception
	 */
	PubUser getUserByYhbh(String yhbh) throws Exception;

	/**
	 * delelteUser 根据用户ID删除用户
	 * 
	 * @param yhbhs 用户编号
	 * @return int 删除用户个数
	 * @throws Exception
	 */
	int delelteUser(String... yhbhs) throws Exception;

	/**
	 * getAsPage 根据查询条件获取分页用户列表
	 * 
	 * @param map 查询条件
	 * @return PageInfo<PubUser> 分页用户列表
	 * @throws Exception
	 */
	PageInfo<PubUser> getListPage(Map<String, Object> map) throws Exception;

	/**
	 * getUserByYhzh 根据用户账号获取用户
	 * 
	 * @param yhzh 用户账号
	 * @return PubUser 用户
	 */
	PubUser getUserByYhzh(String yhzh) throws Exception;

	/**
	 * 
	 * getPubUser 根据用户账号、密码获取用户
	 * 
	 * @param yhzh 用户账号
	 * @param yhmm 用户密码
	 * @return PubUser 用户
	 * @throws Exception
	 */
	PubUser getPubUser(String yhzh, String yhmm) throws Exception;

	/**
	 * resetPwd 根据用户编号重置密码
	 * 
	 * @param yhbh 用户编号
	 * @return PubUser 用户
	 * @throws Exception
	 */
	PubUser resetPwd(String yhbh) throws Exception;
	
	/**
	 * 修改密码
	 * 
	 * @param yhbh 用户编号
	 * @param newPass 新的密码
	 * @return PubUser 用户
	 * @throws Exception
	 */
	PubUser changePwd(String yhbh, String newPass) throws Exception;

	/**
	 * getListPageBo 根据查询条件获取分页关联授权用户列表
	 * 
	 * @param map 查询条件
	 * @return PageInfo<PubUserBo> 分页用户列表
	 * @throws Exception
	 */
	PageInfo<PubUserBo> getListPageBo(Map<String, Object> map) throws Exception;
	
	List<PubUser> getAll () throws Exception;
	
	/**
	 * getUserAndRolePageInfo(根据查询条件获取分页关联用户的角色)
	 * 
	 * @param map
	 * @return PageInfo<PubUserBo> 分页用户对应的所有角色
	 * @throws Exception
	 */
	PageInfo<PubUserBo> getUserAndRolePageInfo(Map<String, Object> map) throws Exception;
	
	/**
	 * getUserByYyid(根据条件查询所有用户列表)
	 * 
	 * @param yyid
	 * @return
	 * @throws Exception
	 */
	List<PubUserBo> getAllUserByYyid(long yyid) throws Exception;

	/**
	 *  批量更新
	 * @param updateList
	 */
	int updateBatch(List<SysUser> updateList)throws Exception;

	/**
	 * 批量新增
	 * @param insertList
	 */
	int insertBatch(List<SysUser> insertList)throws Exception;

}

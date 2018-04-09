/** 
 * Project Name:facade-system 
 * File Name:PubAppService.java 
 * Package Name:com.htcf.system.service 
 * Date:2016年12月1日下午3:23:34 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.model.App;
import com.htcf.frame.service.AppService;
import com.htcf.system.model.po.PubApp;

/**
 * ClassName: PubAppService <br/>
 * Function: 应用 Service <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月1日 下午3:23:34 <br/>
 * 
 * @author chenshizhe
 */
public interface PubAppService extends AppService<PubApp> {

	/**
	 * addApp
	 * 新增应用
	 * @param pubApp 应用
	 * @return PubApp 应用
	 * @throws Exception
	 */
	PubApp addApp(PubApp pubApp) throws Exception;

	/**
	 * updateApp 
	 * 修改应用
	 * @param pubApp 应用
	 * @return PubApp 应用
	 * @throws Exception
	 */
	PubApp updateApp(PubApp pubApp) throws Exception;
	
	/**
	 * getAppByYyid
	 * 根据Id获取应用
	 * @param yyid 应用ID
	 * @return PubApp 应用
	 * @throws Exception
	 */
	PubApp getAppByYyid(String yyid) throws Exception;

	/**
	 * delelteApp 
	 * 根据应用Id删除应用
	 * @param yyids 应用ID
	 * @return int
	 * @throws Exception
	 */
	int delelteApp(String... yyids) throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubApp> 分页列表
	 * @throws Exception
	 */
	public PageInfo<PubApp> getListPage(Map<String, Object> map) throws Exception;

	/**
	 * getAppByYydm
	 * 根据应用代码获取应用
	 * @param yydm 应用代码
	 * @return PubApp 应用
	 * @throws Exception
	 */
	public PubApp getAppByYydm(String yydm) throws Exception;

	/**
	 * 
	 * getAppByYymc
	 * 根据应用名称获取应用
	 * @param yymc 应用名称
	 * @return PubApp 应用
	 * @throws Exception PubApp
	 */
	public PubApp getAppByYymc(String yymc) throws Exception;
	
	/**
	 * getAppJoinAuthGroupList
	 * 根据查询条件获取关联授权表分组后的应用
	 * @param map 查询条件
	 * @return List<PubApp> 应用列表
	 * @throws Exception
	 */
	public List<PubApp> getAppJoinAuthGroupList(Map<String, Object> map) throws Exception;

	/**
	 * getAppList 
	 * 根据查询条件查询应用列表
	 * @param map 查询条件
	 * @return List<PubApp> 应用列表
	 * @throws Exception
	 */
	public List<PubApp> getAppList(Map<String, Object> map) throws Exception;
}

/** 
 * Project Name:facade-system 
 * File Name:PubParamService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年2月7日 下午1:35:30 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.ParamService;
import com.htcf.system.model.po.PubParam;

/** 
 * ClassName: PubParamService<br/>
 * Function: 全局参数接口方法定义. <br/>
 * date: 2017年2月7日 下午1:35:30<br/>
 * 
 * @author lizhuo 
 */
public interface PubParamService extends ParamService<PubParam> {
	
	/**
	 * addParam
	 * 新增全局参数
	 * @param pubParam 全局参数
	 * @return PubParam 全局参数
	 * @throws Exception
	 */
	PubParam addParam(PubParam pubParam) throws Exception;

	/**
	 * updateParam 
	 * 修改全局参数
	 * @param pubParam 全局参数
	 * @return PubParam 全局参数
	 * @throws Exception
	 */
	PubParam updateParam(PubParam pubParam) throws Exception;
	
	/**
	 * getParamByCsm
	 * 根据参数名获取全局参数
	 * @param csm 参数名
	 * @return PubParam 全局参数
	 * @throws Exception
	 */
	public PubParam getParamByCsm(String csm) throws Exception;
	
	/**
	 * delelteParam 
	 * 根据参数名删除全局参数
	 * @param csms 全局参数参数名
	 * @return int 删除全局参数对象个数
	 * @throws Exception
	 */
	int delelteParam(String... csms) throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubParam> 分页列表
	 * @throws Exception
	 */
	public PageInfo<PubParam> getListPage(Map<String, Object> map) throws Exception;
	
}

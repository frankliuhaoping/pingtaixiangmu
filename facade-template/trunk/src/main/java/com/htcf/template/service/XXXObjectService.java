/** 
 * Project Name:facade-template 
 * File Name:XXXObjectService.java 
 * Package Name:com.htcf.template.service 
 * Date:2017-2-24 16:26:41 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.template.service;


/**
 * ClassName: XXXObjectService <br/>
 * Function: 根据具体的需求定义服务的接口 <br/>
 * date: 2016年12月1日 下午3:23:34 <br/>
 * 
 * @author chenshizhe
 */
public interface XXXObjectService {

	/**
	 * addXXXObject
	 * 新增XXX
	 * @param xxxObject
	 * @return XXXObject
	 * @throws Exception
	 
	XXXObject addXXXObject(XXXObject xxxObject) throws Exception;*/

	/**
	 * updateXXXObject 
	 * 修改XXX
	 * @param xxxObject
	 * @return XXXObject
	 * @throws Exception
	
	XXXObject updateXXXObject(XXXObject xxxObject) throws Exception; */
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<XXXObject> 分页列表
	 * @throws Exception PageInfo<XXXObject>
	 
	public PageInfo<XXXObject> getListPage(Map<String, Object> map) throws Exception;*/
}

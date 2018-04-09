/** 
 * Project Name:service-system 
 * File Name:DynamicDataSource.java 
 * Package Name:com.htcf.system.database 
 * Date:2017年10月18日 下午4:33:28 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.database;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/** 
 * ClassName: DynamicDataSource
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月18日 下午4:33:28
 * 
 * @author liuhuan 
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * @return
	 * @see org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource#determineCurrentLookupKey()
	 */
	@Override
	protected Object determineCurrentLookupKey() {
		 // 从自定义的位置获取数据源标识
		return DynamicDataSourceHolder.getDataSource();
	}

}

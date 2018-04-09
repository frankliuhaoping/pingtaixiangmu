/** 
 * Project Name:service-system 
 * File Name:DynamicDataSourceHolder.java 
 * Package Name:com.htcf.system.database 
 * Date:2017年10月18日 下午4:34:25 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.database;

/** 
 * ClassName: DynamicDataSourceHolder
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月18日 下午4:34:25
 * 
 * @author liuhuan 
 */
public class DynamicDataSourceHolder {
	/**
	 * 注意：数据源标识保存在线程变量中，避免多线程操作数据源时互相干扰
	 */
	private static final ThreadLocal<String> THREAD_DATA_SOURCE = new ThreadLocal<String>();
	
	
	public static String getDataSource(){
		return THREAD_DATA_SOURCE.get();
	}
	
	public static void setDataSource(String dataSource){
		THREAD_DATA_SOURCE.set(dataSource);
	}
	
	public static void clearDataSource(){
		THREAD_DATA_SOURCE.remove();
	}
}

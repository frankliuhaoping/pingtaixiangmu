/** 
 * Project Name:facade-system 
 * File Name:CacheStatisticBo.java 
 * Package Name:com.htcf.system.model.bo 
 * Date:2017-2-7 16:02:55 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.bo;

import java.io.Serializable;
import java.util.Set;

/** 
 * ClassName: CacheStatisticBo<br/>
 * Function: 缓存统计业务类. <br/>
 * date: 2017年2月7日 下午4:03:02<br/>
 * 
 * @author lizhuo 
 */
public class CacheStatisticBo implements Serializable{

	/** 
	 * serialVersionUID:serialVersionUID. 
	 */
	private static final long serialVersionUID = -6607345655629645409L;
	
	/** 
	 * cacheName:cache 名称. 
	 */
	private String cacheName;
	
	/** 
	 * objectCount:缓存总对象数. 
	 */
	private Long objectCount;
	
	/** 
	 * memorySize:占用内存大小
	 */
	private String memorySize;
	
	/** 
	 * ipAddresses:ip地址. 
	 */
	private Set<String> ipAddresses;
	
	/**
	 * @return the ipAddresses
	 */
	public Set<String> getIpAddresses() {
		return ipAddresses;
	}

	/**
	 * @param ipAddresses the ipAddresses to set
	 */
	public void setIpAddresses(Set<String> ipAddresses) {
		this.ipAddresses = ipAddresses;
	}

	public String getMemorySize() {
		return memorySize;
	}

	public void setMemorySize(String memorySize) {
		this.memorySize = memorySize;
	}

	/**
	 * getCacheName
	 * 
	 * @return String
	 */
	public String getCacheName() {
		return cacheName;
	}

	/**
	 * setCacheName
	 * 
	 * @param cacheName
	 */
	public void setCacheName(String cacheName) {
		this.cacheName = cacheName;
	}

	/**
	 * getObjectCount
	 * 
	 * @return long
	 */
	public long getObjectCount() {
		return objectCount;
	}

	/**
	 * setObjectCount
	 * 
	 * @param objectCount 
	 */
	public void setObjectCount(long objectCount) {
		this.objectCount = objectCount;
	}

}

/** 
 * Project Name:service-system 
 * File Name:SystemServiceException.java 
 * Package Name:com.htcf.system.exception 
 * Date:2016年12月8日下午2:06:43 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.exception;

import com.htcf.frame.exception.BaseExcetpion;


/**
 * ClassName: SystemServiceException <br/>
 * Function: 系统服务异常定义. <br/>
 * date: 2016年12月8日 下午2:06:43 <br/>
 * 
 * @author chenshizhe
 */
public class ServiceSystemException extends BaseExcetpion {
	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * PUBRES_NOT_EXIST:授权的资源不存在
	 */
	public static final ServiceSystemException PUBRES_NOT_EXIST = new ServiceSystemException(10010001, "授权的资源不存在");

	/**
	 * PUBRES_NOT_MATCH_APP:授权的资源超出应用范围
	 */
	public static final ServiceSystemException PUBRES_NOT_MATCH_APP = new ServiceSystemException(10010002,"授权的资源超出应用范围");
	
	/**
	 * PUBRES_NOT_EXIST:授权的资源不存在
	 */
	public static final ServiceSystemException PUBAPP_NOT_EXIST = new ServiceSystemException(10010003, "应用不存在");
	
	/**
	 * PUBUSER_EXIST:用户已存在
	 */
	public static final ServiceSystemException PUBUSER_EXIST = new ServiceSystemException(10010004, "用户已存在");
	
	/**
	 * PUBUSER_NOT_EXIST:用户不存在
	 */
	public static final ServiceSystemException PUBUSER_NOT_EXIST = new ServiceSystemException(10010005, "用户不存在");
	
	/**
	 * PUBAUTH_NOT_EXIST:授权不存在
	 */
	public static final ServiceSystemException PUBAUTH_NOT_EXIST = new ServiceSystemException(10010006, "授权不存在");
	
	/**
	 * PUBAUTH_EXIST:授权已存在
	 */
	public static final ServiceSystemException PUBAUTH_EXIST = new ServiceSystemException(10010007, "授权已存在");
	
	/**
	 * PUBROLE_NOT_EXIST:角色不存在
	 */
	public static final ServiceSystemException PUBROLE_NOT_EXIST = new ServiceSystemException(10010008, "角色不存在");
	
	/**
	 * PUBAPP_EXIST:应用资源已存在
	 */
	public static final ServiceSystemException PUBAPP_EXIST = new ServiceSystemException(10010009, "应用资源已存在");

	/**
	 * PUBRES_EXIST:资源已存在
	 */
	public static final ServiceSystemException PUBRES_EXIST = new ServiceSystemException(10010010, "资源已存在");
	
	/**
	 * PUBFILE_EXIST:文件已存在
	 */
	public static final ServiceSystemException PUBFILE_EXIST = new ServiceSystemException(10010010, "文件已存在");
	
	/**
	 * PUBFILE_NOT_EXIST:文件不存在
	 */
	public static final ServiceSystemException PUBFILE_NOT_EXIST = new ServiceSystemException(10010010, "文件不存在");
	
	/**
	 * PUBPARAM_EXIST:全局参数已存在
	 */
	public static final ServiceSystemException PUBPARAM_EXIST = new ServiceSystemException(10010010, "全局参数已存在");
	
	/**
	 * PUBPARAM_NOT_EXIST:全局参数不存在
	 */
	public static final ServiceSystemException PUBPARAM_NOT_EXIST = new ServiceSystemException(10010010, "全局参数不存在");
	
	/**
	 * PUBPLOG_EXIST:日志已存在
	 */
	public static final ServiceSystemException PUBLOG_EXIST = new ServiceSystemException(10010010, "日志已存在");
	
	/**
	 * PUBLOG_NOT_EXIST:日志不存在
	 */
	public static final ServiceSystemException PUBLOG_NOT_EXIST = new ServiceSystemException(10010010, "日志不存在");
	
	/**
	 * XDHCOPY_EXIST 中间表数据已存在
	 */
	public static final ServiceSystemException 	XDHCOPY_EXIST = new ServiceSystemException(10010010, "数据已存在");
	/**
	 * XDHCOPY_NOT_EXIST 中间表数据不存在
	 */
	public static final ServiceSystemException XDHCOPY_NOT_EXIST = new ServiceSystemException(10010010, "数据不存在");
	
	


	public ServiceSystemException() {
	}

	public ServiceSystemException(int code, String msgFormat, Object... args) {
		super(code, msgFormat, args);
	}

	public ServiceSystemException(int code, String msg) {
		super(code, msg);
	}
	
	//public ServiceSystemException(Throwable cause, int code, String msgFormat, Object... args) {
	//	super(cause, code, msgFormat, args);
	//}

	/**
	 * 实例化异常
	 * 
	 * @param msgFormat
	 * @param args
	 * @return ServiceSystemException
	 */
	public ServiceSystemException newInstance(String msgFormat, Object... args) {
		return new ServiceSystemException(this.code, msgFormat, args);
	}

	public ServiceSystemException print() {
		// log.info("==>BizException, code:" + this.code + ", msg:" + this.msg);
		return new ServiceSystemException(this.code, this.msg);
	}
}

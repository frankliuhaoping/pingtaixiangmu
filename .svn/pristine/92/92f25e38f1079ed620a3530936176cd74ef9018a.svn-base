/** 
 * Project Name:facade-template 
 * File Name:ServiceTemplateException.java 
 * Package Name:com.htcf.template.excetpion 
 * Date:2017-2-24 16:26:14 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.template.excetpion;

import com.htcf.frame.base.exception.BaseExcetpion;

/**
 * ClassName: ServiceTemplateException <br/>
 * Function: 系统服务异常定义. <br/>
 * date: 2016年12月8日 下午2:06:43 <br/>
 * 
 * @author chenshizhe
 */
public class ServiceTemplateException extends BaseExcetpion {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * PUBRES_NOT_EXIST:授权的资源不存在
	 */
	public static final ServiceTemplateException PUBRES_NOT_EXIST = new ServiceTemplateException(10010001, "授权的资源不存在");

	/**
	 * PUBRES_NOT_MATCH_APP:授权的资源超出应用范围
	 */
	public static final ServiceTemplateException PUBRES_NOT_MATCH_APP = new ServiceTemplateException(10010002,"授权的资源超出应用范围");

	public ServiceTemplateException() {
	}

	public ServiceTemplateException(int code, String msgFormat, Object... args) {
		super(code, msgFormat, args);
	}

	public ServiceTemplateException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * 实例化异常
	 * 
	 * @param msgFormat
	 * @param args
	 * @return ServiceTemplateException
	 */
	public ServiceTemplateException newInstance(String msgFormat, Object... args) {
		return new ServiceTemplateException(this.code, msgFormat, args);
	}

	public ServiceTemplateException print() {
		// log.info("==>BizException, code:" + this.code + ", msg:" + this.msg);
		return new ServiceTemplateException(this.code, this.msg);
	}
}

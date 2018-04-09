/** 
 * Project Name:web-template 
 * File Name:WebTemplateException.java 
 * Package Name:com.htcf.template.web.excepiton 
 * Date:2017-2-24 16:24:42 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.template.web.excepiton;

import com.htcf.frame.base.exception.BaseExcetpion;


public class WebTemplateException extends BaseExcetpion {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * websystem异常
	 */
	public static final WebTemplateException WEB_SYSTEM = new WebTemplateException(30010001, "WebTemplate异常");
	
	public static final WebTemplateException WEB_SETTING = new WebTemplateException(30010002, "WebTemplate设置异常");

	public WebTemplateException() {
	}

	public WebTemplateException(int code, String msgFormat, Object... args) {
		super(code, msgFormat, args);
	}

	public WebTemplateException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * 实例化异常
	 * 
	 * @param msgFormat
	 * @param args
	 * @return
	 */
	public WebTemplateException newInstance(String msgFormat, Object... args) {
		return new WebTemplateException(this.code, msgFormat, args);
	}

	public WebTemplateException print() {
		return new WebTemplateException(this.code, this.msg);
	}
}
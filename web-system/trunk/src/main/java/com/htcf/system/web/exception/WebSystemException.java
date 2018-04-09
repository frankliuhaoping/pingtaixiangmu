package com.htcf.system.web.exception;

import com.htcf.frame.exception.BaseExcetpion;



public class WebSystemException extends BaseExcetpion {
	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * websystem异常
	 */
	public static final WebSystemException WEB_SYSTEM = new WebSystemException(30010001, "websystem异常");

	public static final WebSystemException WEB_SETTING = new WebSystemException(30010002, "websystem设置异常");

	public WebSystemException() {
	}

	public WebSystemException(int code, String msgFormat, Object... args) {
		super(code, msgFormat, args);
	}

	public WebSystemException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * 实例化异常
	 * 
	 * @param msgFormat
	 * @param args
	 * @return
	 */
	public WebSystemException newInstance(String msgFormat, Object... args) {
		return new WebSystemException(this.code, msgFormat, args);
	}

	public WebSystemException print() {
		return new WebSystemException(this.code, this.msg);
	}
}
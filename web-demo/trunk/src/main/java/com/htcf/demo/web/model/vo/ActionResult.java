/** 
 * Project Name:common-web 
 * File Name:ActionResult.java 
 * Package Name:com.htcf.frame.web.model.vo 
 * Date:2016-12-27 12:41:10 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.demo.web.model.vo;

import java.io.Serializable;

/**
 * ClassName: ActionResult <br/>
 * Function: 记录请求的结果信息. <br/>
 * date: 2016年12月7日 下午2:58:38 <br/>
 * 
 * @author lizhuo
 */
public class ActionResult implements Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * status:结果状态.
	 */
	private ActionResultStatus status;
	
	/**
	 * statusCode:状态代码.
	 */
	private Integer statusCode;

	/**
	 * errCode:错误代码.
	 */
	private Integer errCode;

	/**
	 * errTrace:错误跟踪信息.
	 */
	private String errTrace;

	/**
	 * errMsg:错误信息.
	 */
	private String errMsg = "";

	/**
	 * uri:uri地址.
	 */
	private String uri = "";

	/**
	 * data:需要返回的数据.
	 */
	private Object data;

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public ActionResultStatus getStatus() {
		return status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(ActionResultStatus status) {
		this.status = status;
	}

	/**
	 * Gets the uri.
	 *
	 * @return the uri
	 */
	public String getUri() {
		return uri;
	}

	/**
	 * Sets the uri.
	 *
	 * @param uri the new uri
	 */
	public void setUri(String uri) {
		this.uri = uri;
	}

	/**
	 * Gets the data.
	 *
	 * @return the data
	 */
	public Object getData() {
		return data;
	}

	/**
	 * Sets the data.
	 *
	 * @param data the new data
	 */
	public void setData(Object data) {
		this.data = data;
	}

	/**
	 * 添加status信息.
	 *
	 * @param status the status
	 * @return the action result builder
	 */
	public static ActionResultBuilder withStatus(ActionResultStatus status) {
		createActionResult().withStatus(status);
		return builder;
	}

	/**
	 * 添加 message信息.
	 *
	 * @param message the message
	 * @return the action result builder
	 */
	public static ActionResultBuilder withMessage(String message) {
		createActionResult().withMessage(message);
		return builder;
	}

	/**
	 * 添加uri信息.
	 *
	 * @param uri the uri
	 * @return the action result builder
	 */
	public static ActionResultBuilder withUri(String uri) {
		createActionResult().withUri(uri);
		return builder;
	}

	/**
	 * 添加data信息.
	 *
	 * @param data the data
	 * @return the action result builder
	 */
	public static ActionResultBuilder withData(Object data) {
		createActionResult().withData(data);
		return builder;
	}

	/**
	 * 设置status为成功.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder success() {
		return withStatus(ActionResultStatus.SUCCESS);
	}

	/**
	 * 设置status为服务器错误.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder serverError() {
		return withStatus(ActionResultStatus.INTERNAL_SERVER_ERROR);
	}

	/**
	 * 设置status为错误请求.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder badRequest() {
		return withStatus(ActionResultStatus.BAD_REQUEST);
	}

	/**
	 * 设置status为没有权限.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder unauthorized() {
		return withStatus(ActionResultStatus.UNAUTHORIZED);
	}

	/**
	 * 设置status为禁止.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder forbidden() {
		return withStatus(ActionResultStatus.FORBIDDEN);
	}

	/**
	 * 设置status为不可接收.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder notAcceptable() {
		return withStatus(ActionResultStatus.NOT_ACCEPTABLE);
	}

	/**
	 * 设置status为登录超时.
	 *
	 * @return the action result builder
	 */
	public static ActionResultBuilder loginTimeout() {
		return withStatus(ActionResultStatus.LOGIN_TIMEOUT);
	}

	/**
	 * Gets the status code.
	 *
	 * @return the status code
	 */
	public int getStatusCode() {
		return status.getStatusCode();
	}

	/**
	 * The builder. 构造器
	 */
	private static ActionResultBuilder builder;

	/**
	 * Creates the action result.
	 *
	 * @return the action result builder
	 */
	private static ActionResultBuilder createActionResult() {
		builder = ActionResultBuilder.newInstance();
		return builder;
	}

	/**
	 * The Class ActionResultBuilder.
	 *
	 * @author lizhuo
	 */
	public static class ActionResultBuilder {

		/**
		 * The action result.
		 */
		private ActionResult actionResult;

		/**
		 * 通过构造函数实例化一个ActionResult.
		 */
		protected ActionResultBuilder() {
			actionResult = new ActionResult();
		}

		/**
		 * 添加uri.
		 *
		 * @param uri the uri
		 * @return the action result builder
		 */
		public ActionResultBuilder withUri(String uri) {
			actionResult.setUri(uri);
			return builder;
		}

		/**
		 * 添加 status.
		 *
		 * @param status the status
		 * @return the action result builder
		 */
		public ActionResultBuilder withStatus(ActionResultStatus status) {
			actionResult.setStatus(status);
			return builder;
		}

		/**
		 * 添加 message.
		 *
		 * @param errMsg the err msg
		 * @return the action result builder
		 */
		public ActionResultBuilder withMessage(String errMsg) {
			actionResult.setErrMsg(errMsg);
			return builder;
		}

		/**
		 * 添加 data.
		 *
		 * @param data the data
		 * @return the action result builder
		 */
		public ActionResultBuilder withData(Object data) {
			actionResult.setData(data);
			return builder;
		}

		/**
		 * 创建新的实例.
		 *
		 * @return the action result builder
		 */
		protected static ActionResultBuilder newInstance() {
			return new ActionResultBuilder();
		}

		/**
		 * 返回构建的ActionResult.
		 *
		 * @return the action result
		 */
		public ActionResult build() {
			return actionResult;
		}
	}

	/**
	 * ActionResultStatus枚举.
	 *
	 * @author lizhuo
	 */
	public enum ActionResultStatus {

		/**
		 * 成功.
		 */
		SUCCESS(200, "SUCCESS"),

		/**
		 * 服务器内部错误.
		 */
		INTERNAL_SERVER_ERROR(500, "INTERNAL_SERVER_ERROR"),

		/**
		 * 错误请求.
		 */
		BAD_REQUEST(400, "BAD_REQUEST"),

		/**
		 * 不可接收.
		 */
		NOT_ACCEPTABLE(406, "NOT_ACCEPTABLE"),

		/**
		 * 没有权限.
		 */
		UNAUTHORIZED(401, "UNAUTHORIZED"),

		/**
		 * 禁止.
		 */
		FORBIDDEN(403, "FORBIDDEN"),

		/**
		 * 登录超时.
		 */
		LOGIN_TIMEOUT(425, "LOGIN_TIMEOUT");

		/**
		 * 状态代码.
		 */
		private final int code;

		/**
		 * 原因描述.
		 */
		private final String reason;

		/**
		 * 构造ActionResultStatus.
		 *
		 * @param statusCode the status code
		 * @param reasonPhrase the reason phrase
		 */
		ActionResultStatus(final int statusCode, final String reasonPhrase) {
			this.code = statusCode;
			this.reason = reasonPhrase;
		}

		/**
		 * Gets the status code.
		 *
		 * @return the status code
		 */
		public int getStatusCode() {
			return code;
		}

		/**
		 * Gets the reason phrase.
		 *
		 * @return the reason phrase
		 */
		public String getReasonPhrase() {
			return toString();
		}

		/**
		 * 重写toString，返回原因描述.
		 *
		 * @return the string
		 * @see java.lang.Enum#toString()
		 */
		@Override
		public String toString() {
			return reason;
		}

		/**
		 * 通过状态的代码信息返回对象.
		 *
		 * @param statusCode the numerical status code
		 * @return the matching Status or null is no matching Status is defined
		 */
		public static ActionResultStatus fromStatusCode(final int statusCode) {
			for (ActionResultStatus s : ActionResultStatus.values()) {
				if (s.code == statusCode) {
					return s;
				}
			}
			return null;
		}
	}

	/**
	 * Gets the errCode.
	 *
	 * @return the errCode
	 */
	public Integer getErrCode() {
		return errCode;
	}

	/**
	 * Sets the errCode.
	 *
	 * @param errCode the new errCode
	 */
	public void setErrCode(Integer errCode) {
		this.errCode = errCode;
	}

	/**
	 * Gets the errTrace.
	 *
	 * @return the errTrace
	 */
	public String getErrTrace() {
		return errTrace;
	}

	/**
	 * Sets the errTrace.
	 *
	 * @param errTrace the new errTrace
	 */
	public void setErrTrace(String errTrace) {
		this.errTrace = errTrace;
	}

	/**
	 * Gets the errMsg.
	 *
	 * @return the errMsg
	 */
	public String getErrMsg() {
		return errMsg;
	}

	/**
	 * Sets the errMsg.
	 *
	 * @param errMsg the new errMsg
	 */
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

}

/** 
 * Project Name:web-system 
 * File Name:LoginController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2016-12-813:53:56 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ClassName: LoginController <br/>
 * Function: LoginController. <br/>
 * date: 2016年12月3日 下午1:02:36 <br/>
 * 
 * @author lizhuo
 */
@Controller
public class LoginController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(LoginController.class);

	/**
	 * 登录逻辑处理
	 *
	 * @param req the req
	 * @param model the model
	 * @return String
	 */
	@RequestMapping(value = "/login")
	public String showLoginForm(HttpServletRequest request, HttpServletResponse response) {

		logger.entry("-------登录逻辑处理");
		String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (LockedAccountException.class.getName().equals(exceptionClassName)) {
			error = "用户账号已被锁定，请联系系统管理员！";
		} else if (exceptionClassName != null) {
			error = "其他错误：" + exceptionClassName;
		}
		request.setAttribute("error", error);
		String fallbackUrl = (String) request.getParameter("fallbackUrl");
		// source不为空时为外部系统请求
		String source = (String) request.getParameter("source");
		if (fallbackUrl != null && !fallbackUrl.equals("")) {
			request.setAttribute("fallbackUrl", fallbackUrl);
		}
		if (error == null) {
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				try {
					if (StringUtils.isNotBlank(fallbackUrl)) {
						// 	清除JessionId
						fallbackUrl = fallbackUrl.split(";")[0];
						Map <String, Object> queryParams = new HashMap <String, Object> ();
						queryParams.put("sid", subject.getSession().getId());
						WebUtils.issueRedirect(request, response, fallbackUrl, queryParams);
//						WebUtils.redirectToSavedRequest(request, response, fallbackUrl + "?sid=" + subject.getSession().getId());
					} else {
						if (StringUtils.isEmpty(source)) {
							response.sendRedirect(request.getContextPath() + "/index");
						} else {
							// 将sid返回
							PrintWriter out = response.getWriter();
			    			out.write("success:" + subject.getSession().getId());
			    			out.flush();
			    			out.close();
						}
						
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				/*Cookie cookie = new Cookie("sid", null);
				cookie.setPath("/");
				response.addCookie(cookie);*/
			}
		}
		return "login";
	}
	
	@RequestMapping(value = "/sidUrl")
	public String sidUrl(HttpServletRequest req, HttpServletResponse response) {
		String sid = req.getParameter("sid");
		req.setAttribute("sid", sid);
		return "sidUrl";
	}

}

/** 
 * Project Name:web-system 
 * File Name:ServerFormAuthenticationFilter.java 
 * Package Name:com.htcf.system.web.shiro.filter 
 * Date:2016-12-813:53:56 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.shiro;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.util.StringUtils;

/**
 * ClassName: ServerFormAuthenticationFilter <br/>
 * Function: ServerFormAuthenticationFilter 验证通过后处理页面跳转. <br/>
 * date: 2016年12月3日 下午1:04:02 <br/>
 * 
 * @author lizhuo
 */
public class ServerFormAuthenticationFilter extends FormAuthenticationFilter {

	/**
	 * logger: 日志记录.
	 */
	private static final Logger logger = LogManager.getLogger(ServerFormAuthenticationFilter.class);

	/**
	 * 验证通过时处理页面跳转.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws Exception the exception
	 * @see org.apache.shiro.web.filter.authc.AuthenticationFilter#issueSuccessRedirect(javax.servlet.ServletRequest,
	 *      javax.servlet.ServletResponse)
	 */
	protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {

		String fallbackUrl = request.getParameter("fallbackUrl");
		// 没有fallbackUrl
		if (StringUtils.isEmpty(fallbackUrl)) {
			String source = request.getParameter("source");
			HttpServletRequest httprequest = (HttpServletRequest) request;
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			if (StringUtils.isEmpty(source)) {
				fallbackUrl = getSuccessUrl();
				httpResponse.sendRedirect(httprequest.getContextPath() + fallbackUrl);
			} else {
				Subject subject = getSubject(request, response);
				Session session = subject.getSession(false);
				PrintWriter out = httpResponse.getWriter();
				out.write("success:" + session.getId());
				out.flush();
				out.close();
			}
			// 有fallbackUrl，跳转并加上sid
		} else {
			Subject subject = getSubject(request, response);
			// 获取当前的session id
			Session session = subject.getSession(false);
			// 清除JessionId
			fallbackUrl = fallbackUrl.split(";")[0];
			// fallbackUrl += "?sid=" + session.getId();
			// WebUtils.redirectToSavedRequest(request, response, fallbackUrl);
			// WebUtils.issueRedirect(request, response, fallbackUrl);
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("sid", session.getId());
			WebUtils.issueRedirect(request, response, fallbackUrl, queryParams);
		}
	}

	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		logger.entry();
		HttpServletRequest httpRequest = WebUtils.toHttp(request);
		HttpServletResponse httpResponse = WebUtils.toHttp(response);
		// 是ajax请求
		if ("XMLHttpRequest".equalsIgnoreCase(httpRequest.getHeader("X-Requested-With"))) {
			// 保存当前请求并重定向到登录界面
			httpResponse.setHeader("htcfAjaxStatus", "timeout");
			saveRequest(httpRequest);
		}
		return super.onAccessDenied(request, response);
	}
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		logger.entry();
		String formUsername = request.getParameter("username");
		
		if (!StringUtils.isEmpty(formUsername)) {
			Subject subject = SecurityUtils.getSubject();
			if (subject.getPrincipal() != null) {
				if (!formUsername.equals(subject.getPrincipal().toString())) {
					//该业务主要是处理已登录的情况下，换一个用户名再次登录的情况
					
					String formPassword = request.getParameter("password");
					AuthenticationToken token = new UsernamePasswordToken(formUsername, formPassword);
					try {
						subject.login(token);
					} catch (Exception e) {
						request.setAttribute("shiroLoginFailure", e.getClass().getName());
					}
					
					return true;
				}
			}
		}
		
		
		// TODO Auto-generated method stub
		return super.isAccessAllowed(request, response, mappedValue);
	}

}

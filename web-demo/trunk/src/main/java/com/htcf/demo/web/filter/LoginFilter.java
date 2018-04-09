//package com.htcf.demo.web.filter;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.commons.lang3.StringUtils;
//import org.apache.shiro.web.util.WebUtils;
//
//import com.htcf.demo.web.util.HttpUtil;
//
//
//public class LoginFilter implements Filter {
//	/**
//	 * TODO(这里用一句话描述这个方法的作用)
//	 * 
//	 * @param filterConfig
//	 * @throws ServletException void
//	 */
//	/** 
//	 * loginUrl:平台登录地址. 
//	 */
//	private static String loginUrl = "http://192.168.0.133:8080/web-system/login";
//	
//	/** 
//	 * getUserUrl:平台获取用户信息请求. 
//	 */
//	private static String getUserUrl = "http://192.168.0.133:8080/web-system/getPubUser";
//	
//	
//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//		// TODO Auto-generated method stub
//	}
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
//			ServletException {
//		// 无需过滤的路径写在这里
////		if (path.indexOf("/login.jsp") > -1) {
////			chain.doFilter(servletRequest, servletResponse);
////			return;
////		}
//		
//		// 获得在下面代码中要用的request,response,session对象
//		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		HttpServletResponse httpResponse = (HttpServletResponse) response;
//		HttpSession session = httpRequest.getSession();
//		// 获得用户请求的URI
//		String path = httpRequest.getRequestURI();
//		// System.out.println(path);
//		
//		
//		// 获取sid
//		String sid = WebUtils.getCleanParam(request, "sid");
//		if (StringUtils.isNotBlank(sid)) {
//			//说明从平台重定向过来，需要设置cookie
//			setCookie(sid, httpResponse);
//		}
//		
//		String userResult = HttpUtil.doPost(getUserUrl, null, httpRequest);
//		
//		// 判断如果没有取到人员信息,就跳转到登陆页面
//		if (userResult == null || "".equals(userResult)) {
//			Map<String, String> loginMap = new HashMap<String, String> ();
//			
//			// 获取请求地址
//			String url = httpRequest.getRequestURL().toString();
//			loginMap.put("source", "guangfen");
//			loginMap.put("fallbackUrl", url);
//			// 跳转到登陆页面
//			WebUtils.issueRedirect(request, response, loginUrl, loginMap);
//
//		} else {
//			// 已经登陆,继续此次请求
//			chain.doFilter(request, response);
//		}
//	}
//	
//	private void setCookie(String sid,ServletResponse response){
//		// 这个sid有可能是伪造的，需要去平台判断是否有效
//		boolean remoteIsValid = true;//sessionService.checkSessionKey(sid);
//		if (remoteIsValid) {
//			// sid是有效的，不管现有的值，都进行强制同步cookie中的sid值
//			Cookie cookie = new Cookie("sid", sid);
//			cookie.setMaxAge(-1);
//			cookie.setPath("/");
//			HttpServletResponse httpResponse = WebUtils.toHttp(response);
//			httpResponse.addCookie(cookie);
//		}
//	}
//
//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//	}
//}
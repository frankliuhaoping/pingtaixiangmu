/** 
 * Project Name:common-web 
 * File Name:IndexController.java 
 * Package Name:com.htcf.frame.web.controller 
 * Date:2017-2-24 16:24:50 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.demo.web.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.htcf.demo.web.init.PrivilegeEnum;
import com.htcf.demo.web.model.po.PubApp;
import com.htcf.demo.web.model.po.PubRes;
import com.htcf.demo.web.model.po.PubUser;
import com.htcf.demo.web.model.vo.ActionResult;
import com.htcf.demo.web.model.vo.MenuItem;
import com.htcf.demo.web.util.HttpUtil;
import com.htcf.demo.web.util.JsonUtil;

/**
 * ClassName: IndexController <br/>
 * Function: IndexController <br/>
 * 
 * date: 2016年12月3日 下午1:02:54 <br/>
 * 
 * @author lizhuo
 */
@Controller
public class IndexController {
	
	/** 
	 * logger:The Constant logger. 
	 */
	private static final Logger logger = LogManager.getLogger(IndexController.class);
	
	/** 
	 * loginUrl:平台登录地址. 
	 */
	private String loginUrl = "http://192.168.0.133:8080/web-system/login";
	
	/** 
	 * getUserUrl:平台获取用户信息请求. 
	 */
	private String getUserUrl = "http://192.168.107.3:8080/web-system/getPubUser";
	
	/** 
	 * getPubAppsUrl:平台获取应用列表请求. 
	 */
	private String getPubAppsUrl = "http://192.168.107.3:8080/web-system/getPubApps";
	
	/** 
	 * getPubResUrl:平台获取资源信息请求. 
	 * 
	 * 需要传递app_code信息，这里由平台进行配置
	 * 
	 */
	private String getPubResUrl = "http://192.168.107.3:8080/web-system/getPubRes";
	
	/** 
	 * updatePasswordUrl:平台更新密码. 
	 */
	private String updatePasswordUrl = "http://192.168.107.3:8080/web-system/updatePassword";
	
	/** 
	 * logoutUrl:平台退出登录请求. 
	 */
	private String logoutUrl = "http://192.168.107.3:8080/web-system/logout";
	
	/** 
	 * appCode:当前系统在平台中对应的code，需要在平台进行设置. 
	 */
	private String appCode = "qwgl";
	
	/**
	 * 登录逻辑处理
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> loginMap = new HashMap<String, String> ();
		// 设置用户名密码及source
		loginMap.put("username", "qwadmin");
		loginMap.put("password", "888888");
		// 必须设置source为guangfen 才能接收到sid
		loginMap.put("source", "guangfen");
		String loginResult = HttpUtil.doPost(loginUrl, loginMap, request);
		System.out.println(loginResult);
		
		// 有sid时处理
		if (StringUtils.isNotBlank(loginResult) && loginResult.startsWith("success:")) {
			// 将sid设置到cookie，这里必须进行设置，否则所有访问请求都会被平台拦截到登录
			Cookie cookie = new Cookie("sid", loginResult.replaceAll("success:", ""));
			cookie.setPath("/");
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		} else {
			// 登录失败
			//TODO进行处理
		}
	}
	
	@RequestMapping("/query")
	public void query(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("query");
//		String sid = request.getParameter("sid");
//		if (StringUtils.isNotBlank(sid)) {
//			// 将sid设置到cookie，这里必须进行设置，否则所有请求都会被平台拦截到登录
//			Cookie cookie = new Cookie("sid", sid);
//			cookie.setPath("/");
//			cookie.setMaxAge(-1);
//			response.addCookie(cookie);
//		}
	}
	
	
	@RequestMapping("/login1")
	public void login1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> loginMap = new HashMap<String, String> ();
		// 设置用户名密码及source
		
		loginMap.put("username", "qwadmin");
		loginMap.put("password", "888888");
		// 必须设置source为guangfen 才能接收到sid
		loginMap.put("source", "guangfen");
		loginMap.put("fallbackUrl", "http://192.168.1.192:8081/web-demo/haha");
		//String loginResult = doPost(loginUrl, loginMap, request);
		//System.out.println(loginResult);
		
		
		WebUtils.issueRedirect(request, response, loginUrl, loginMap);
		
		// 有sid时处理
//		if (StringUtils.isNotBlank(loginResult) && loginResult.startsWith("success:")) {
//			// 将sid设置到cookie，这里必须进行设置，否则所有访问请求都会被平台拦截到登录
//			Cookie cookie = new Cookie("sid", loginResult.replaceAll("success:", ""));
//			cookie.setPath("/");
//			cookie.setMaxAge(-1);
//			response.addCookie(cookie);
//		} else {
//			// 登录失败
//			//TODO进行处理
//		}
	}

	/**
	 * 平台的主页. 通过用户信息和系统应用id获取对应的资源 将获取的资源分类并传到前端展示<br/>
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/index1")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 从request中获取用户信息
		PubUser pubUser = null;
		
		// 获取平台返回来的sid
		String sid = request.getParameter("sid");
		request.setAttribute("sid", sid);
		// 有sid时处理
		if (StringUtils.isNotBlank(sid)) {
			// 将sid设置到cookie，这里必须进行设置，否则所有请求都会被平台拦截到登录
			Cookie cookie = new Cookie("sid", sid);
			cookie.setPath("/");
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}
		
		// 验证用户 
		/********* 获取用户 ***********/
		String userResult = HttpUtil.doPost(getUserUrl, null, request);
		/********* 获取用户 ***********/
		
		// 是否需要跳登录页面标志
		boolean jumpLoginFlag = false;
		if (StringUtils.isNotEmpty(userResult)) {
			// 解析返回的结果转成ActionResult
			ActionResult actionResult = (ActionResult)JsonUtil.toObjectByTypeReference(userResult, new TypeReference<ActionResult>(){});
			String jsonData = JsonUtil.toJsonNonNull(actionResult.getData());
			// 将data转成pubUser
			pubUser = (PubUser)JsonUtil.toObjectByTypeReference(jsonData, new TypeReference<PubUser>(){});
			
			/********* 获取可访问资源***********/
			// 通过用户信息和系统应用id获取该用户在系统中的可访问资源
			List<PubRes> pubResList = new ArrayList<PubRes>();
			Map <String, String> map = new HashMap<String, String> ();
			// 设置app_code信息
			map.put("app_code", appCode);
			String pubResResult = HttpUtil.doPost(getPubResUrl, map, request);
			/********* 获取可访问资源***********/
			if (StringUtils.isNotEmpty(userResult)) {
				ActionResult pubResActionResult = (ActionResult)JsonUtil.toObjectByTypeReference(pubResResult, new TypeReference<ActionResult>(){});
				String resJsonData = JsonUtil.toJsonNonNull(pubResActionResult.getData());
				// 将data转成PubRes List对象
				pubResList = (List<PubRes>)JsonUtil.toObjectByTypeReference(resJsonData, new TypeReference<List<PubRes>>(){});
				// 定义目录项
				List<MenuItem> navMenuItems = new ArrayList<MenuItem>();
				// 将资源信息转成目录项，用于前端展示
				Map<String, List<MenuItem>> menuMap = generateMenuItemTree(pubResList);
				// 将目录项分成菜单目录项和用户目录项
				// 菜单目录项主要用于左侧的菜单显示
				navMenuItems = menuMap.get(PrivilegeEnum.MENU.toString());
				if (null != navMenuItems) {
					// 设置首页
					if (CollectionUtils.isNotEmpty(navMenuItems)) {
						boolean hasHome = false;
						// 获取第一个有url的菜单项作为首页
						for (MenuItem menuItem : navMenuItems) {
							if (StringUtils.isNotBlank(menuItem.getUrl())) {
								hasHome = true;
								menuItem.setActive(true);
								break;
							}
						}

						// 如果没有url，则将第一个菜单项作为首页
						if (!hasHome) {
							MenuItem first = navMenuItems.get(0);
							if (null != first) {
								first.setActive(true);
							}
						}
					}
				}
				
				/********* 获取可访问的其他系统  ***********/
				String pubAppsResult = HttpUtil.doPost(getPubAppsUrl, null, request);
				/********* 获取可访问的其他系统  ***********/
				if (StringUtils.isNotEmpty(pubAppsResult)) {
					ActionResult pubAppsActionResult = (ActionResult)JsonUtil.toObjectByTypeReference(pubAppsResult, new TypeReference<ActionResult>(){});
					String appsJsonData = JsonUtil.toJsonNonNull(pubAppsActionResult.getData());
					// 将data转成PubRes List对象
					List<PubApp> pubAppList = (List<PubApp>)JsonUtil.toObjectByTypeReference(appsJsonData, new TypeReference<List<PubApp>>(){});
					// 将可访问系统传回页面显示
					request.setAttribute("pubAppList", pubAppList);
				}
				
				// 将用户编号传回页面
				request.setAttribute("userId", pubUser.getYhbh());
				// 将用户名称传回页面
				request.setAttribute("userName", pubUser.getYhmc());
				// 将菜单目录项传回页面
				request.setAttribute("navMenus", navMenuItems);
			}
		} else {
			jumpLoginFlag = true;
		}
		
		// TODO 这段逻辑需要加到自己对应的拦截器里处理，没有拿到用户时需要跳回平台登录页面 
		if (jumpLoginFlag) {
			// 获取当前请求地址
			String url = request.getRequestURL().toString();
			if (url.contains("jsessionid")) {
				int endIndex = url.indexOf(";jsessionid");
				url = url.substring(0, endIndex);
			}
			// 跳转到平台登录页面，并将当前请求地址url传递给平台
			response.sendRedirect(loginUrl + "?fallbackUrl=" + url);
		}
		return "index";
	}
	
	/**
	 * 退出登录，调用平台的logout并将当前系统的地址传给平台
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/********* 退出系统 ***********/
		HttpUtil.doPost(logoutUrl, null, request);
		/********* 退出系统 ***********/
		// 退出清空cookie
		Cookie cookie = new Cookie("sid", "");
		cookie.setPath("/");
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
		// 强制跳index1页面,首页
		String url = request.getRequestURL().toString().replace("/logout", "/index1");
		// 跳转到平台登录页面，并将当前请求地址url传递给平台
		response.sendRedirect(loginUrl + "?fallbackUrl=" + url);
	}
	
	/**
	 * 修改密码
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/updatePassword")
	@ResponseBody
	public String updatePassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/********* 修改密码 ***********/
		Map <String, String> map = new HashMap<String, String> ();
		// 获取表单的旧密码
		String oldPass = request.getParameter("oldPwd");
        // 获取表单的新密码
        String newPass = request.getParameter("newPwd");
        // 设置新旧密码到map中
		map.put("oldPwd", oldPass);
		map.put("newPwd", newPass);
		String updatePasswordResult = HttpUtil.doPost(updatePasswordUrl, map, request);
		/********* 修改密码 ***********/
		return updatePasswordResult;
	}

	/**
	 * generateMenuItemTree. 通过资源信息构建出菜单目录项和用户目录项
	 *
	 * @param menuList the menu list
	 * @return Map<String,List<MenuItem>> 目录map
	 */
	public static Map<String, List<MenuItem>> generateMenuItemTree(List<PubRes> menuList) {
		Map<String, List<MenuItem>> map = new HashMap<String, List<MenuItem>>();
		if (CollectionUtils.isNotEmpty(menuList)) {
			// 定义菜单目录
			List<MenuItem> navMenus = new ArrayList<MenuItem>();
			// 定义操作目录
			List<MenuItem> operatingMenus = new ArrayList<MenuItem>();
			// 定义用户目录
			List<MenuItem> userMenus = new ArrayList<MenuItem>();
			// 遍历所有目录项进行处理
			for (PubRes node1 : menuList) {
				MenuItem node11 = pubRes2MenuItem(node1);
				if (0 != node1.getZylx()) {
					if (node1.getZylx() == 1) {
						navMenus.add(node11);
					}
				}
			}
			// 生成菜单目录项
			navMenus = generateMenuItems(navMenus);
			// 对所有目录项进行排序
			sortMenuItem(navMenus);
			sortMenuItem(operatingMenus);
			sortMenuItem(userMenus);
			// 将菜单目录放到map MENU中
			map.put(PrivilegeEnum.MENU.toString(), navMenus);
			// 将操作目录放到map OPERATING中
			map.put(PrivilegeEnum.OPERATING.toString(), operatingMenus);
		}
		return map;
	}

	/**
	 * 生成目录项.
	 * 
	 *
	 * @param nodes the nodes
	 * @return List<MenuItem>
	 */
	public static List<MenuItem> generateMenuItems(List<MenuItem> nodes) {
		List<MenuItem> nodeList = new ArrayList<MenuItem>();
		// 遍历所有节点进行处理
		for (MenuItem node1 : nodes) {
			boolean mark = false;
			for (MenuItem node2 : nodes) {
				// 对父节点进行处理
				if (null != node1.getParent() && node1.getParent().equals(node2.getId())) {
					mark = true;
					if (node2.getChildren() == null)
						node2.setChildren(new ArrayList<MenuItem>());
					node2.getChildren().add(node1);
					break;
				}
			}
			// 添加节点
			if (!mark) {
				nodeList.add(node1);
			}
		}
		return nodeList;
	}

	/**
	 * 权限转出目录item.
	 * 
	 * @param pubRes 资源
	 * @return MenuItem 目录项
	 */
	private static MenuItem pubRes2MenuItem(PubRes pubRes) {
		if (null != pubRes) {
			// 将资源对象转换成目录项
			MenuItem menuItem = new MenuItem();
			menuItem.setId(pubRes.getZyid() + "");
			menuItem.setTitle(pubRes.getZymc());
			menuItem.setIconClass(pubRes.getZytb());
			menuItem.setUrl(pubRes.getZyurl());
			menuItem.setOrder(pubRes.getPxdm());
			menuItem.setParent(pubRes.getZyfid() == 0 ? "" : pubRes.getZyfid() + "");
			return menuItem;
		}
		return null;
	}

	/**
	 * 对目录item进行排序.
	 *
	 * @param navMenuItems 目录项list
	 */
	public static void sortMenuItem(List<MenuItem> navMenuItems) {
		if (CollectionUtils.isNotEmpty(navMenuItems)) {
			// 对目录项排序
			Collections.sort(navMenuItems);
			for (MenuItem menuItem : navMenuItems) {
				if (CollectionUtils.isNotEmpty(menuItem.getChildren())) {
					Collections.sort(menuItem.getChildren());
				}
			}
		}
	}

	
}

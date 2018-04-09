/** 
 * Project Name:web-system 
 * File Name:CacheManagerRestController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年2月14日 上午11:33:22 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.common.bo.ElementBo;
import com.htcf.frame.base.model.RestResult;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.bo.CacheStatisticBo;

/**
 * ClassName: CacheManagerRestController<br/>
 * Function: 通过CacheManagerRestService去调用各个应用的缓存，并进行管理. <br/>
 * date: 2017年2月14日 上午11:33:22<br/>
 * 
 * @author lizhuo
 */
@Controller
@RequestMapping("/cacheManager")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class CacheManagerController {

	private static final Logger logger = LogManager.getLogger(CacheManagerController.class);

	private static String mimeType = "application/x-www-form-urlencoded";
	private static String charset = "UTF-8";

	/**
	 * 返回到cacheManagerRest index界面.
	 *
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/index")
	public String index() {
		// TODO 需要根据后台配置的CacheManagerRestService返回列表数据
		logger.entry("-------返回到cacheManagerRest index界面");
		return "/cacheManager/cacheManager_index";
	}

	/**
	 * 获取所有数据生成json格式传回.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getData")
	@ResponseBody
	public String getData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------获取数据生成json格式传回");
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "getListPage";
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}

		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		// 处理返回的统计数据
		List<CacheStatisticBo> list = new ArrayList<CacheStatisticBo>();
		if (restResult.getStatus().getStatusCode() == 200) {
			if (restResult.getData() != null) {
				String jsonData = JsonUtil.toJsonNonNull(restResult.getData());
				list = (List<CacheStatisticBo>) JsonUtil.toObjectByTypeReference(jsonData,
						new TypeReference<List<CacheStatisticBo>>() {
						});
			}
		} else {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}
		return JsonUtil.toJsonNonNull(list);
	}

	/**
	 * 查看缓存
	 * 
	 * @param cacheName 缓存名称
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/view/{cacheName}")
	public String view(@PathVariable String cacheName, HttpServletRequest request) throws Exception {
		logger.entry("-------查看具体缓存Element列表界面");
		request.setAttribute("cacheName", cacheName);
		return "/cacheManager/cacheManager_view";
	}

	/**
	 * 获取分页数据生成json格式传回.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "getElementPageList";

		// 生成需要传递的parameters
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("cacheName", request.getParameter("cacheName")));
		parameters.add(new BasicNameValuePair("offset", request.getParameter("offset")));
		parameters.add(new BasicNameValuePair("limit", request.getParameter("limit")));

		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}
		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		// 处理返回的分页数据
		PageResult<ElementBo> pageResult = new PageResult<ElementBo>(new ArrayList<ElementBo>(), 0);
		if (restResult.getStatus().getStatusCode() == 200) {
			if (restResult.getData() != null) {
				String jsonData = JsonUtil.toJsonNonNull(restResult.getData());
				PageInfo<ElementBo> pageInfo = (PageInfo<ElementBo>) JsonUtil.toObjectByTypeReference(jsonData,
						new TypeReference<PageInfo<ElementBo>>() {
						});
				pageResult = new PageResult<ElementBo>(pageInfo.getList(), (int) pageInfo.getTotal());
			}
		} else {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}

		return JsonUtil.toJsonNonNull(pageResult);
	}

	/**
	 * 删除单条缓存.
	 *
	 * @param cacheName 缓存名称
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/delete/{cacheName}")
	@ResponseBody
	public String delete(@PathVariable String cacheName, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.entry("-------删除单条缓存");
		ActionResult ar = ActionResult.success().build();
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "deleteCaches";

		// 生成需要传递的parameters
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("cacheNames", cacheName));

		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}
		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		if (restResult.getStatus().getStatusCode() != 200) {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除缓存.
	 *
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------批量删除缓存");
		ActionResult ar = ActionResult.success().build();
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "deleteCaches";

		// 生成需要传递的parameters
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		String[] cacheNames = request.getParameterValues("id[]");
		if (null != cacheNames && cacheNames.length > 0) {
			for (String cacheName : cacheNames) {
				parameters.add(new BasicNameValuePair("cacheNames", cacheName));
			}
		}

		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}
		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		if (restResult.getStatus().getStatusCode() != 200) {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除单条缓存Element.
	 * 
	 * @param cacheName 缓存名字
	 * @param objectKey 具体缓存key
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteDetails/{cacheName}/{objectKey}")
	@ResponseBody
	public String deleteDetails(@PathVariable String cacheName, @PathVariable String objectKey,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------删除单条缓存Element");
		ActionResult ar = ActionResult.success().build();
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "deleteElements";

		// 生成需要传递的parameters
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("cacheName", cacheName));
		parameters.add(new BasicNameValuePair("keys", objectKey));

		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}
		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		if (restResult.getStatus().getStatusCode() != 200) {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}
		return JsonUtil.toJsonNonNull(ar);
	}
	
	/**
	 * 查看单条缓存Element.
	 * 
	 * @param cacheName 缓存名字
	 * @param objectKey 具体缓存key
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/viewDetail/{cacheName}/{objectKey}")
	public String viewDetail(@PathVariable String cacheName, @PathVariable String objectKey,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------查看单条缓存Element");
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "getElementBo";

		// 生成需要传递的parameters
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("cacheName", cacheName));
		parameters.add(new BasicNameValuePair("objectKey", objectKey));

		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}
		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		if (restResult.getStatus().getStatusCode() != 200) {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}
		// 设置cacheName 到前端
		request.setAttribute("cacheName", cacheName);
		request.setAttribute("cacheManagerDetail", JsonUtil.toJsonNonNull(restResult.getData()));
		return "/cacheManager/cacheManager_view_detail";
	}

	/**
	 * 批量删除缓存Element.
	 * 
	 * @param cacheName 缓存名称
	 * @param request the request
	 * @param response the response
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/deleteBatchDetails/{cacheName}")
	@ResponseBody
	public String deleteBatchDetails(@PathVariable String cacheName, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.entry("-------批量删除缓存");
		ActionResult ar = ActionResult.success().build();
		// TODO　通过页面传递的值来查找url，目前先写死
		String serviceUrl = "http://localhost:8888/service-system/cacheManager/" + "deleteElements";

		// 生成需要传递的parameters
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		String[] keys = request.getParameterValues("id[]");
		if (null != keys && keys.length > 0) {
			for (String key : keys) {
				parameters.add(new BasicNameValuePair("keys", key));
			}
		}
		parameters.add(new BasicNameValuePair("cacheName", cacheName));

		HttpResponse httpResponse = excuteHttpRequest(serviceUrl, parameters, mimeType, charset);
		String result = getServiceResult(httpResponse);

		// 没有任何结果返回当做异常处理
		if (StringUtil.isEmpty(result)) {
			return JsonUtil.toJsonNonNull(generateActionResult(response, serviceUrl));
		}
		RestResult restResult = (RestResult) JsonUtil.toObjectByTypeReference(result, new TypeReference<RestResult>() {
		});
		if (restResult.getStatus().getStatusCode() != 200) {
			// 当做exception返回
			response.setHeader("htcfAjaxStatus", "exception");
			return result;
		}

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 生成url无法访问的ActionResult
	 * 
	 * @param response HttpServletResponse，用于设置exception的head
	 * @param serviceUrl 服务URL地址
	 * @return ActionResult
	 */
	private ActionResult generateActionResult(HttpServletResponse response, String serviceUrl) {
		response.setHeader("htcfAjaxStatus", "exception");
		ActionResult ar = ActionResult.badRequest().build();
		ar.setErrMsg("访问rest service错误");
		ar.setErrTrace(serviceUrl + "地址没有返回response");
		return ar;
	}

	/**
	 * apache httpclient发送post请求
	 * 
	 * @param serviceUrl 请求地址
	 * @param parameters 请求参数
	 * @param mimeType 请求文件类型
	 * @param charset 请求字符集
	 * @throws Exception 异常
	 */
	private HttpResponse excuteHttpRequest(String serviceUrl, List<NameValuePair> parameters, String mimeType,
			String charset) throws Exception {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(serviceUrl);
		EntityBuilder builder = EntityBuilder.create();
		builder.setContentType(ContentType.create(mimeType, charset));
		builder.setParameters(parameters);
		HttpEntity entity = builder.build();
		httpPost.setEntity(entity);
		HttpResponse response = httpClient.execute(httpPost);
		return response;
	}

	/**
	 * 获取reponse返回的结果
	 * 
	 * @param httpResponse
	 * @return String
	 * @throws Exception
	 */
	private String getServiceResult(HttpResponse httpResponse) throws Exception {
		String result = "";
		HttpEntity responseEntity = httpResponse.getEntity();
		if (responseEntity != null) {
			// 将响应内容转换为字符串
			result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
		}
		return result;
	}

}
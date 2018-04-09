package com.htcf.demo.web.util;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

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

import com.htcf.demo.web.controller.IndexController;

public class HttpUtil {
	
	/** 
	 * logger:The Constant logger. 
	 */
	private static final Logger logger = LogManager.getLogger(HttpUtil.class);
	/**
	 * java发送post请求，这里主要用于访问平台获取基础数据
	 * 
	 * 当返回的结果为空字符串时，意味着没通过平台验证，不能调用平台的方法获取数据；
	 * 
	 * 当有返回结果时，所有的返回值都是ActionResult的json字符串。
	 * 
	 * @param url 访问url地址
	 * @param params 访问参数
	 * @param request HttpServletRequest请求
	 * @return String
	 */
	public static String doPost(String url, Map<String, String> params, HttpServletRequest request) {
		// 构建httpclient
		CloseableHttpClient httpClient = HttpClients.createDefault();
		// 构建httppost
		HttpPost httpPost = new HttpPost(url);
		// 构建EntityBuilder
		EntityBuilder builder = EntityBuilder.create();
		// 设置ContentType为默认的application/x-www-form-urlencoded
		builder.setContentType(ContentType.create("application/x-www-form-urlencoded"));
		// 构建请求参数 NameValuePair
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		if (params != null) {
			for (Map.Entry<String, String> entry : params.entrySet()) {
				parameters.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}
		}

		// 先从request中查看是否有sid
		String sid = request.getParameter("sid");
		if (StringUtils.isEmpty(sid)) {
			// 通过request请求获取cookie的sid
			Cookie cookie = org.springframework.web.util.WebUtils.getCookie(request, "sid");
			if (cookie != null) {
				sid = cookie.getValue();
			}
		}

		// 如果有sid则设置到header中传递，调用平台的服务要用sid进行验证
		if (StringUtils.isNotEmpty(sid)) {
			httpPost.setHeader("Cookie", "sid=" + sid);
		}

		// 将所有参数设置都builder中
		builder.setParameters(parameters);
		// 构建HttpEntity
		HttpEntity entity = builder.build();
		// 设置entity到httppost
		httpPost.setEntity(entity);
		HttpResponse response;
		String result = "";
		try {
			// 执行httppost请求，并用httpResponse接收
			response = httpClient.execute(httpPost);
			// 获取response的HttpEntity对象
			HttpEntity responseEntity = response.getEntity();
			if (responseEntity != null) {
				// 将响应内容转换为字符串
				result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
			}
			logger.info("访问平台得到结果：" + result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭httpclient
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}

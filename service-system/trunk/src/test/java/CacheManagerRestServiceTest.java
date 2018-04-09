import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

/** 
 * Project Name:service-system 
 * File Name:CacheManagerRestServiceTest.java 
 * Package Name: 
 * Date:2017年2月13日 下午2:34:11 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: CacheManagerRestServiceTest<br/>
 * Function: 缓存管理restful服务测试. <br/>
 * date: 2017年2月13日 下午2:34:11<br/>
 * 
 * @author lizhuo 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CacheManagerRestServiceTest extends BasicTest {
	
	@Test
	public void t01TestGetListPage() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://localhost:8888/service-system/cacheManager/getListPage");
		EntityBuilder builder = EntityBuilder.create();
        builder.setContentType(ContentType.create("application/x-www-form-urlencoded", "UTF-8"));
        List<NameValuePair> parameters = new ArrayList<NameValuePair>();
        builder.setParameters(parameters);
        HttpEntity entity = builder.build();
        httpPost.setEntity(entity);
        HttpResponse response;
		try {
			response = httpClient.execute(httpPost);
			HttpEntity responseEntity = response.getEntity();
	        String result = "";
	        if (responseEntity != null) {
	            // 将响应内容转换为字符串
	            result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
	        }
	        System.out.println(result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Test
	public void t02TestGetElementPageList() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://localhost:8888/service-system/cacheManager/getElementPageList");
        EntityBuilder builder = EntityBuilder.create();
        builder.setContentType(ContentType.create("application/x-www-form-urlencoded", "UTF-8"));
        // 类似浏览器表单提交，对应input的name和value
        List<NameValuePair> parameters = new ArrayList<NameValuePair>();
        parameters.add(new BasicNameValuePair("cacheName", "sessionCache"));
        parameters.add(new BasicNameValuePair("offset", "0"));
        parameters.add(new BasicNameValuePair("limit", "10"));
        builder.setParameters(parameters);
        HttpEntity entity = builder.build();
        httpPost.setEntity(entity);
        HttpResponse response;
		try {
			response = httpClient.execute(httpPost);
	        HttpEntity responseEntity = response.getEntity();
	        String result = "";
	        if (responseEntity != null) {
	            // 将响应内容转换为字符串
	            result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
	        }
	        System.out.println(result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Test
	public void t03TestDeleteCaches() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://localhost:8888/service-system/cacheManager/deleteCaches");
		EntityBuilder builder = EntityBuilder.create();
        builder.setContentType(ContentType.create("application/x-www-form-urlencoded", "UTF-8"));
        List<NameValuePair> parameters = new ArrayList<NameValuePair>();
        parameters.add(new BasicNameValuePair("cacheNames", "sessionCache"));
        parameters.add(new BasicNameValuePair("cacheNames", "pubResCache"));
        builder.setParameters(parameters);
        HttpEntity entity = builder.build();
        httpPost.setEntity(entity);
        HttpResponse response;
		try {
			response = httpClient.execute(httpPost);
			HttpEntity responseEntity = response.getEntity();
	        String result = "";
	        if (responseEntity != null) {
	            // 将响应内容转换为字符串
	            result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
	        }
	        System.out.println(result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Test
	public void t03TestDeleteElements() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://localhost:8888/service-system/cacheManager/deleteElements");
		EntityBuilder builder = EntityBuilder.create();
        builder.setContentType(ContentType.create("application/x-www-form-urlencoded", "UTF-8"));
        List<NameValuePair> parameters = new ArrayList<NameValuePair>();
        parameters.add(new BasicNameValuePair("cacheName", "sessionCache"));
        parameters.add(new BasicNameValuePair("keys", "662d062a-6a73-4a58-9db8-7efda77bdc7a"));
        builder.setParameters(parameters);
        HttpEntity entity = builder.build();
        httpPost.setEntity(entity);
        HttpResponse response;
		try {
			response = httpClient.execute(httpPost);
			HttpEntity responseEntity = response.getEntity();
	        String result = "";
	        if (responseEntity != null) {
	            // 将响应内容转换为字符串
	            result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
	        }
	        System.out.println(result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}

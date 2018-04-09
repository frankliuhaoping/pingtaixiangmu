/** 
 * Project Name:common-base 
 * File Name:JsonUtil.java 
 * Package Name:com.htcf.frame.base.util 
 * Date:2016-12-27 16:17:34 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.demo.web.util;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * ClassName: JsonUtil 
 * Function: Json工具类 
 * date: 2016年12月13日 上午10:27:08 .
 *
 * @author chenshizhe
 */
public class JsonUtil {
	
	/**
	 * logger: 日志记录.
	 */
	private static final Logger logger = LogManager.getLogger(JsonUtil.class);
	
	/**
	 * jsonMapper1: 默认objectMapper.
	 */
	private static final ObjectMapper jsonMapper1 = new ObjectMapper();
	
	/**
	 * jsonMapper2: 会输出null值的objectMapper.
	 */
	private static final ObjectMapper jsonMapper2 = new ObjectMapper().setSerializationInclusion(Include.NON_NULL);

	/**
	 * 使用jackson的标准格式输出json,不输出null值.
	 *
	 * @param object the object
	 * @return json字符串
	 */
	public static String toJsonNonNull(Object object) {
		String result = "";
		try {
			result = jsonMapper2.writeValueAsString(object);
		} catch (JsonProcessingException e) {
			logger.error("JSON转换出错", e);
			throw new RuntimeException("JSON转换出错");
		}
		logger.debug("" + result);
		return result;
	}

	/**
	 * 使用jackson的标准格式输出json,会输出null值.
	 *
	 * @param object the object
	 * @return json字符串
	 */
	public static String toJsonDefaults(Object object) {
		String result = "";
		try {
			result = jsonMapper1.writeValueAsString(object);
		} catch (JsonProcessingException e) {
			logger.error("JSON转换出错", e);
			throw new RuntimeException("JSON转换出错");
		}
		logger.debug("" + result);
		return result;
	}
	
	/**
	 * 根据json字符串转成TypeReference制定的对象
	 * 
	 * XXX restResult = (RestResult)JsonUtil.toObjectByTypeReference(result, new TypeReference<XXX>(){});
	 * List<XXX> list = (List<XXX>)JsonUtil.toObjectByTypeReference(jsonData, new TypeReference<List<XXX>>(){});
	 * 
	 * @param json json字符串
	 * @param valueType 需要转换的类型
	 * @return <T>Object 需要转成的对象
	 */
	public static <T>Object toObjectByTypeReference(String json, TypeReference<T> valueTypeRef) {
		Object object = null;
		try {
			object = jsonMapper1.readValue(json, valueTypeRef);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return object;
	}
}

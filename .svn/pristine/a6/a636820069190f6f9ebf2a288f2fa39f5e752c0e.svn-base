/** 
 * Project Name:service-system 
 * File Name:DataSourceAspect.java 
 * Package Name:com.htcf.system.interceptor 
 * Date:2017年10月19日 下午2:35:57 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.interceptor;

import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import com.htcf.system.annotation.DataSource;
import com.htcf.system.database.DataSourceInstances;
import com.htcf.system.database.DynamicDataSourceHolder;


/** 
 * ClassName: DataSourceAspect
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月19日 下午2:35:57
 * 
 * @author liuhuan 
 */
@Component
@Aspect
public class DataSourceAspect {
	private static Logger logger = LoggerFactory.getLogger(DataSourceAspect.class);
	
	@Pointcut("execution(* com.htcf.system.service.impl..*.*(..)) && @annotation(com.htcf.system.annotation.DataSource)")
	public void serviceMethod(){
	}
	
	@Before(value="serviceMethod()")
	public void before(JoinPoint joinPoint){
		MethodSignature methodSignature =  (MethodSignature) joinPoint.getSignature();
		Method method = methodSignature.getMethod();
		DataSource dataSource = method.getAnnotation(DataSource.class);
		DynamicDataSourceHolder.setDataSource(dataSource.value());
		logger.debug("{}.{}动态切换数据源至:{}",joinPoint.getTarget().getClass(),method.getName(),dataSource.value());
	}
	
	@After(value="serviceMethod()")
	public void after(JoinPoint joinPoint){
		DynamicDataSourceHolder.setDataSource(DataSourceInstances.ORACLE_SYSTEM);
	}
	
}

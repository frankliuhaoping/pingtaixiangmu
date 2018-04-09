/** 
 * Project Name:service-system 
 * File Name:ServiceSystemExceptionAspect.java 
 * Package Name:com.htcf.system.exception 
 * Date:2017年3月14日上午10:29:30 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.exception;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.stereotype.Component;

import com.htcf.frame.core.exception.CoreException;
import com.htcf.system.exception.ServiceSystemException;

/** 
 * ClassName: ServiceSystemExceptionAspect <br/> 
 * Function: 服务异常处理切面，进行异常类型转换  <br/> 
 * date: 2017年3月14日 上午10:29:30 <br/> 
 * 
 * @author chenshizhe 
 */
@Aspect
@Component
public class ServiceSystemExceptionAspect {

	/**
	 * Service method.
	 */
	@Pointcut("execution(* com.htcf.system.service.impl..*.*(..))")
	public void serviceMethod() {
	};

	@AfterThrowing(pointcut = "serviceMethod()", throwing = "ex")
	public void afterThrowing(Exception ex) {
		if (ex instanceof ServiceSystemException) {
			// 本身是ServiceSystemException 无需转换
			throw (ServiceSystemException) ex;
		} else if (ex instanceof CoreException) {
			// 本身是CoreException 进行转换
			CoreException exception = (CoreException) ex;
			throw new ServiceSystemException(exception.getCode(), exception.getMessage());
		} else if (ex instanceof OptimisticLockingFailureException) {
			// 本身是OptimisticLockingFailureException 进行转换
			OptimisticLockingFailureException exception = (OptimisticLockingFailureException) ex;
			throw new ServiceSystemException(00011001, exception.getMessage());
		}
		//如果不是这几种异常类型，则不进行特殊处理，直接让dubbo处理com.alibaba.dubbo.rpc.filter.ExceptionFilter
	}
}

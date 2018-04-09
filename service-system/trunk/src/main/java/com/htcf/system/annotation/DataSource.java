/** 
 * Project Name:service-system 
 * File Name:DataSource.java 
 * Package Name:com.htcf.system.annotation 
 * Date:2017年10月18日 下午4:26:58 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
 * ClassName: DataSource
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月18日 下午4:26:58
 * 
 * @author liuhuan 
 */
/**
 * ElementType.TYPE 用于描述用于描述类、接口(包括注解类型) 或enum声明
 * ElementType.METHOD 用于描述方法
 * RetentionPolicy.RUNTIME 在运行时有效（即运行时保留
 * 
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataSource {
	String value() default "";
}

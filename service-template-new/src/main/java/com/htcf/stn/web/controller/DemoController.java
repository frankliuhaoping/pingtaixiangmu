/** 
 * Project Name:service-jcj 
 * File Name:DemoController.java 
 * Package Name:com.htcf.jcj.web.controller 
 * Date:2017年8月23日 上午9:22:40 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.stn.web.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.htcf.frame.base.util.ExceptionHelper;
import com.htcf.frame.util.FworkHelper;
import com.htcf.system.model.po.PubUser;

/** 
 * ClassName: DemoController
 * Function: TODO ADD FUNCTION. 
 * Reason: 用于演示
 * date: 2017年8月23日 上午9:22:40
 * 
 * @author huangligui 
 */
@RestController
@RequestMapping("/demo")
@Api(description="Demo,主要用于演示")
public class DemoController {

	@RequestMapping(value = "/getMap",method={RequestMethod.GET,RequestMethod.POST})
	@ApiOperation(value="返回一个map", notes="如果有传入map,返回传入的map")
	@ApiImplicitParam(name="param",paramType="body",required=false,defaultValue="{k:1,k:2}")
	public Map getMap(@RequestBody(required=false) Map param)
	{
		if( param == null || param.isEmpty() )
		{
			param = new HashMap();
			param.put("key1", "1");
			param.put("key2", "2");
			param.put("key3", "3");
			param.put("key4", "4");
		}
		return param;
	}
	
	@RequestMapping(value = "/getList",method={RequestMethod.GET,RequestMethod.POST})
	@ApiOperation(value="返回一个List", notes="如果有传入List,返回传入的List")
	@ApiImplicitParam(name="list",paramType="body",required=false,defaultValue="[{k:1,k2:2}]")
	public List getList(@RequestBody(required=false) List<Map> list)
	{
		if( list == null || list.isEmpty())	
		{
			list = new ArrayList();
			list.add(getMap(null));
			list.add(getMap(null));
			list.add(getMap(null));
			list.add(getMap(null));
		}
		return list;		
	}
	
	@RequestMapping(value = "/getString",method={RequestMethod.GET,RequestMethod.POST})
	@ApiOperation(value="返回一个str", notes="如果有传入str,返回传入的str")
	public String getString(String str)
	{
		if( str == null )
			str = "123";
		return str;
	}
	@RequestMapping(value = "/getUser",method={RequestMethod.GET,RequestMethod.POST})
	@ApiOperation(value="返回当前登录用户", notes="返回当前登录用户")
	public PubUser getUser()
	{
		return FworkHelper.getUser();
	}
	
	@RequestMapping(value = "/queryUser",method={RequestMethod.GET})
	@ApiOperation(value="query提交一个user", notes="使用url参数提交")
	public PubUser queryUser(PubUser user)
	{
		return user;
	}
	
	@RequestMapping(value = "/jsonbodyUser",method={RequestMethod.POST})
	@ApiOperation(value="body提交一个user", notes="使用json的方式提交")
	public PubUser jsonbodyUser(@RequestBody PubUser user)
	{
		return user;
	}
	
	@RequestMapping(value = "/date",method={RequestMethod.GET})
	@ApiOperation(value="返回一个日期", notes="返回一个日期")
	public Date date(Date d)
	{
		return new java.sql.Date(System.currentTimeMillis());
	}
	
	@RequestMapping(value = "/dateTime",method={RequestMethod.GET})
	@ApiOperation(value="返回一个时间", notes="返回一个时间")
	public Date dateTime(Date d)
	{
		return new Timestamp(System.currentTimeMillis());
	}
}

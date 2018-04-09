/** 
 * Project Name:facade-system 
 * File Name:PubPdtthzxxService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年6月6日 下午2:17:54 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.po.PubPdtthzxx;

/**
 * ClassName: PubPdtthzxxService <br/>
 * Function: 通话组服务接口. <br/>
 * date: 2017年6月6日 下午2:17:54 <br/>
 * 
 * @author yiqiang
 */
public interface PubPdtthzxxService {
	/**
	 * 
	 * 新增通话组
	 */
	PubPdtthzxx addPubPdtthzxx(PubPdtthzxx pdtthzxx) throws Exception;

	/**
	 * 修改通话组
	 */
	PubPdtthzxx updatePubPdtthzxx(PubPdtthzxx pdtthzxx) throws Exception;

	/**
	 * 根据thzbh获取通话组
	 */
	PubPdtthzxx getPdtthzxxByThzbh(String thzbh) throws Exception;

	/**
	 * 删除通讯组
	 */
	int deleltePubPdtthzxx(String... thzbhs) throws Exception;

	/**
	 * 分页查询分页组信息
	 */
	public PageInfo<PubPdtthzxx> getListPage(Map<String, Object> map) throws Exception;
}

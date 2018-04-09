/** 
 * Project Name:facade-system 
 * File Name:PubZzjgService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017-2-7 16:53:49 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.OrgService;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubZzjg;

/**
 * 
 * ClassName: PubZzjgService <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016年12月20日 下午5:17:09 <br/> 
 * 
 * @author cs
 */
public interface PubZzjgService extends OrgService<PubZzjg> {

	/**
	 * 新增组织机构.
	 *
	 * @param pubZzjg 组织机构
	 * @return PubZzjg
	 * @throws Exception
	 */
	PubZzjg addPubZzjg(PubZzjg pubZzjg) throws Exception;

	/**
	 * 更新组织机构.
	 *
	 * @param pubZzjg 组织机构
	 * @return PubZzjg
	 * @throws Exception
	 */
	PubZzjg updatePubZzjg(PubZzjg pubZzjg) throws Exception;
	
	/**
	 * 通过单位代码查看组织机构.
	 *
	 * @param dwdm 单位代码
	 * @return PubZzjg
	 * @throws Exception
	 */
	PubZzjg viewPubZzjgByDwdm(String dwdm) throws Exception;
	

	/**
	 * 通过单位代码获取组织机构.//TODO　和viewPubZzjgByDwdm有什么区别？
	 *
	 * @param dwdm 单位代码
	 * @return PubZzjg
	 * @throws Exception
	 */
	PubZzjg getPubZzjgByDwdm(String dwdm) throws Exception;

	/**
	 * 根据单位代码删除组织机构.
	 *
	 * @param dwdms 
	 * @throws Exception
	 */
	int deleltePubZzjg(String... dwdms) throws Exception;
	
	
	/**
	 * Gets the list page.
	 *
	 * @param map the map
	 * @return the list page
	 * @throws Exception PageInfo<PubZzjg>
	 */
	PageInfo<PubZzjg> getListPage(Map<String, Object> map) throws Exception;
	
	
	/**
	 * 获取树形结构 组织机构数据.
	 *
	 * @param dwdm the dwdm
	 * @param deepType the deep type
	 * @return List<PubZzjgBo>
	 */
	List<PubZzjgBo> getNodesZzjgByDwdm(String dwdm,Integer deepType)throws Exception;

	/**
	 * 
	 * getNodesZzjgByDwdm
	 * 递归加载所有孙子节点单位代码
	 * @param dwdm 单位代码
	 * @return Set<String> 单位代码
	 */
	public Set<String> getNodesZzjgByDwdm(String dwdm) throws Exception;
	
	/**
	 * 根据单位类别查找组织机构信息
	 * 
	 * @param dwlb 单位类别
	 * @return
	 */
	public List<PubZzjg> getPubZzjgByDwlb(String dwlb) throws Exception;
	
	/**
	 * 根据管辖单位代码获取组织机构
	 * 
	 * @param gxdwdm
	 * @return List<PubZzjg>
	 */
	public List<PubZzjg> getListByGxdwdm(String gxdwdm) throws Exception;

	/**
	 * 批量新增
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	int insertBatch(List<SysOrg> list) throws Exception;
	/**
	 * 批量更新
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param list
	 * @return
	 */
	int updateBatch(List<SysOrg>list) throws Exception;


}

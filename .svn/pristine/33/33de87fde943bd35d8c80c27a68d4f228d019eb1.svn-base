/** 
 * Project Name:facade-system 
 * File Name:PubFileService.java 
 * Package Name:com.htcf.system.service 
 * Date:2017年1月18日 上午10:14:31 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.service.FileService;
import com.htcf.system.model.po.PubFile;

/** 
 * ClassName: PubFileService <br/>
 * Function: 处理文件表的增删改查操作. <br/>
 * date: 2017年1月18日 上午10:14:31<br/>
 * 
 * @author lizhuo 
 */
public interface PubFileService extends FileService<PubFile> {
	
	/**
	 * addFile
	 * 新增文件
	 * @param pubFile 文件
	 * @return PubFile 文件
	 * @throws Exception
	 */
	PubFile addFile(PubFile pubFile) throws Exception;

	/**
	 * updateFile 
	 * 修改文件
	 * @param pubFile 文件
	 * @return PubFile 文件
	 * @throws Exception
	 */
	PubFile updateFile(PubFile pubFile) throws Exception;
	
	/**
	 * 用户上传附件后，将附件内容保存到对应的表中
	 * 需要回写文件服务进行修改
	 * 
	 * @param cclj 存储路径
	 * @param sszb 所属主表
	 * @param sybz 使用标志
	 * @return PubFile
	 * @throws Exception
	 */
	PubFile updateFile(String cclj, String sszb, String sybz) throws Exception;
	
	/**
	 * 用户上传附件后，将附件内容保存到对应的表中
	 * 需要回写文件服务进行修改
	 * 修改多个附件
	 * 
	 * @param ccljs 多个存储路径，用','分割
	 * @param sszb 所属主表
	 * @param sybz 使用标志
	 * @return List<PubFile> 多个附件
	 * @throws Exception
	 */
	List<PubFile> updateFiles(String ccljs, String sszb, String sybz) throws Exception;
	
	/**
	 * getFileByCclj
	 * 根据Id获取文件
	 * @param cclj 文件存储路径
	 * @return PubFile 文件
	 * @throws Exception
	 */
	PubFile getFileByCclj(String cclj) throws Exception;

	/**
	 * delelteFile 
	 * 根据文件存储路径删除文件
	 * @param ccljs 文件存储路径
	 * @return int
	 * @throws Exception
	 */
	int delelteFile(String... ccljs) throws Exception;
	
	/**
	 * delelteNoUseFile 
	 * 根据使用标志批量删除没有使用的文件
	 * @return int
	 * @throws Exception
	 */
	int delelteNoUseFile() throws Exception;
	
	/**
	 * getListPage
	 * 根据查询条件获取分页列表
	 * @param map 查询条件
	 * @return PageInfo<PubFile> 分页列表
	 * @throws Exception
	 */
	public PageInfo<PubFile> getListPage(Map<String, Object> map) throws Exception;

}

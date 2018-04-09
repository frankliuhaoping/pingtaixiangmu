/** 
 * Project Name:service-system 
 * File Name:PubFileServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2017-1-18 10:36:58 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.model.FastDFSClient;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.frame.model.File;
import com.htcf.frame.model.Log;
import com.htcf.system.dao.PubFileDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubFile;
import com.htcf.system.service.PubFileService;

/**
 * ClassName: PubFileServiceImpl<br/>
 * Function: 文件处理具体实现. <br/>
 * date: 2017年1月18日 上午10:34:30<br/>
 * 
 * @Fileor lizhuo
 */
@Service("pubFileService")
public class PubFileServiceImpl  implements PubFileService {

	private static final Logger logger = LogManager.getLogger(PubFileServiceImpl.class);

	@Autowired
	private PubFileDao pubFileDao;

	/**
	 * 新增文件.
	 *
	 * @param pubFile 文件
	 * @return PubFile 文件
	 * @throws Exception the exception
	 * @see com.htcf.system.service.PubFileService#addFile(com.htcf.system.model.po.PubFile)
	 */
	@Override
	public PubFile addFile(PubFile pubFile) throws Exception {
		logger.entry("!!!!!!!!!!新增文件", JsonUtil.toJsonNonNull(pubFile));
		pubFileDao.add(pubFile);
		return pubFile;
	}

	/**
	 * 更新文件.
	 *
	 * @param pubFile 文件
	 * @return PubFile 文件
	 * @throws Exception the exception
	 * @see com.htcf.system.service.PubFileService#updateFile(com.htcf.system.model.po.PubFile)
	 */
	@Override
	public PubFile updateFile(PubFile pubFile) throws Exception {
		logger.entry("!!!!!!!!!!修改文件", JsonUtil.toJsonNonNull(pubFile));
		pubFileDao.update(pubFile, "cclj");
		return pubFile;
	}

	/**
	 * 通过存储路径查找文件.
	 *
	 * @param cclj 存储路径
	 * @return PubFile 文件
	 * @throws Exception the exception
	 * @see com.htcf.system.service.PubFileService#getFileByCclj(java.lang.String)
	 */
	@Override
	public PubFile getFileByCclj(String cclj) throws Exception {
		logger.entry("!!!!!!!!!!根据存储路径cclj获取文件", cclj);
		QueryParam queryParam = new QueryParam();
		queryParam.put("cclj", cclj);
		PubFile pubFile = pubFileDao.getOne(queryParam);
		if (null == pubFile) {
			throw ServiceSystemException.PUBFILE_NOT_EXIST.newInstance("文件不存在,cclj{%s}", cclj);
		}
		return pubFile;
	}

	/**
	 * 根据存储路径删除单个文件
	 * 
	 * @param cclj 存储路径
	 * @return int 删除文件数
	 * @throws Exception the exception
	 */
	private int delelteFile(String cclj) throws Exception {
		logger.entry("!!!!!!!!!!根据存储路径删除文件");
		getFileByCclj(cclj);
		FastDFSClient fastDFSClient = new FastDFSClient();
		fastDFSClient.deleteFile(cclj);
		return pubFileDao.delete(cclj);
	}

	/**
	 * 通过存储路径批量删除文件
	 *
	 * @param ccljs 存储路径
	 * @return int 删除文件数
	 * @throws Exception the exception
	 * @see com.htcf.system.service.PubFileService#delelteFile(java.lang.String[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteFile(String... ccljs) throws Exception {
		logger.entry("!!!!!!!!!!删除文件", ccljs);
		int deleteCount = 0;
		for (int i = 0; i < ccljs.length; i++) {
			getFileByCclj(ccljs[i]);
			deleteCount += delelteFile(ccljs[i]);
		}
		return deleteCount;
	}

	/**
	 * 批量删除没有使用的文件.
	 *
	 * @return int
	 * @throws Exception the exception
	 * @see com.htcf.system.service.PubFileService#delelteNoUseFile()
	 */
	@Override
	public int delelteNoUseFile() throws Exception {
		// TODO 通过定时任务删除没有使用的文件
		return 0;
	}

	/**
	 * 通过查询条件返回分页信息.
	 *
	 * @param map 查询条件map
	 * @return PageInfo<PubFile> 文件页面信息
	 * @throws Exception the exception
	 * @see com.htcf.system.service.PubFileService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubFile> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的文件列表");

		if (map != null && !map.containsKey("order")) {
			map.put("order", map.get("cjsj"));
		}

		QueryParam queryParam = new QueryParam(map);
		String wjm = null != map.get("wjm") ? map.get("wjm").toString() : null;
		if (StringUtil.isNotEmpty(wjm)) {
			queryParam.addCondition("wjm", "like", "%" + wjm + "%");
		}

		String wjgs = null != map.get("wjgs") ? map.get("wjgs").toString() : null;
		if (StringUtil.isNotEmpty(wjgs)) {
			queryParam.addCondition("wjgs", "like", "%" + wjgs + "%");
		}

		// 使用开始时间和结束时间来查询
		String starttime = null != map.get("starttime") ? map.get("starttime").toString() : null;
		String endtime = null != map.get("endtime") ? map.get("endtime").toString() : null;

		if (StringUtil.isNotEmpty(starttime)) {   // 大于开始时间记录
			queryParam.addCondition("cjsj", ">=", DateUtil.getDateTimeFormat(starttime));
		}
		if (StringUtil.isNotEmpty(endtime)) {  // 小于结束时间记录
			queryParam.addCondition("cjsj", "<=", DateUtil.getDateTimeFormat(endtime));
		}

		PageInfo<PubFile> pageInfo = pubFileDao.getListPage("get", queryParam);

		return pageInfo;
	}

	/**
	 * 用户上传附件后，将附件内容保存到对应的表中 需要回掉文件服务进行修改
	 * 
	 * @param cclj 存储路径
	 * @param sszb 所属主表
	 * @param sybz 使用标志
	 * @return PubFile
	 * @throws Exception
	 * @see com.htcf.system.service.PubFileService#updateFile(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public PubFile updateFile(String cclj, String sszb, String sybz) throws Exception {
		PubFile pubFile = getFileByCclj(cclj);
		// 更新所属主表
		pubFile.setSszb(sszb);
		// 更新使用标志
		pubFile.setSybz(sybz);
		return updateFile(pubFile);
	}

	/**
	 * 用户上传附件后，将附件内容保存到对应的表中 需要回掉文件服务进行修改 修改多个附件
	 * 
	 * @param ccljs 多个存储路径，用','分割
	 * @param sszb 所属主表
	 * @param sybz 使用标志
	 * @return List<PubFile> 多个附件
	 * @throws Exception
	 * @see com.htcf.system.service.PubFileService#updateFiles(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<PubFile> updateFiles(String ccljs, String sszb, String sybz) throws Exception {
		List<PubFile> pubFiles = new ArrayList<PubFile>();
		for (String cclj : ccljs.split(",")) {
			pubFiles.add(updateFile(cclj, sszb, sybz));
		}
		return pubFiles;
	}

//	@Override
//	public PubFile addFile(File file) throws Exception {
//		// TODO Auto-generated method stub
//		Mapper mapper = new DozerBeanMapper();
//		PubFile pubfile  = new PubFile();
//		mapper.map(file, file);
//		return addFile(pubfile);
//	}

//	@Override
//	public PubFile updateFile(File file) throws Exception {
//		// TODO Auto-generated method stub
//		Mapper mapper = new DozerBeanMapper();
//		PubFile pubfile  = new PubFile();
//		mapper.map(file, pubfile);
//		return updateFile(pubfile);
//	}


}

/** 
 * Project Name:service-system 
 * File Name:PubFileServiceTest.java 
 * Package Name: 
 * Date:2017-2-7 14:57:09 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.dao.PubFileDao;
import com.htcf.system.model.po.PubFile;
import com.htcf.system.service.impl.PubFileServiceImpl;

/**
 *  
 * ClassName: PubFileServiceTest <br/> 
 * Function: 测试文件服务方法. <br/> 
 * date: 2017-2-7 14:57:09 <br/> 
 *
 * @author lizhuo
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubFileServiceTest extends BasicTest {
	
	/**
	 * 文件服务方法
	 */
	@Autowired
	private PubFileServiceImpl pubFileServiceImpl;
	
	@Autowired
	private PubFileDao pubFileDao;
	
	/**
	 * 测试新增文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t01AddFile() throws Exception {
		PubFile pubFile = new PubFile();
		pubFile.setCjrxm("cjrxm");
		pubFile.setCjsj(new Date ());
		pubFile.setCclj("contractFile");
		pubFile.setWjgs("jpg");
		pubFile.setWjm("test");
		pubFile.setSszb("sszb");
		pubFile = pubFileServiceImpl.addFile(pubFile);
		
		logger.info(pubFile);
	}

	/**
	 * 测试查找文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetFile() throws Exception {
		PubFile pubFile = pubFileServiceImpl.getFileByCclj("contractFile");
		logger.info(pubFile);
	}
	
	
	/**
	 * 测试更新文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03UpdateFile() throws Exception {
		PubFile pubFile = new PubFile();
		pubFile.setCjrxm("cjrxm");
		pubFile.setCjsj(new Date ());
		pubFile.setCclj("contractFile");
		pubFile.setWjgs("jpg");
		pubFile.setWjm("test121313");
		pubFile.setSszb("sszb");
		pubFileServiceImpl.updateFile(pubFile);
		logger.info(pubFile);
	}
	
	/**
	 * 测试删除文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04DeleteFile() throws Exception {
		logger.info(pubFileDao.delete("contractFile"));
	}
	
	/**
	 * 测试删除文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04DeleteFile2() throws Exception {
		String[] files ={"group1/M00/00/11/wKgAX1m7fsiAAu3lAAQiEPawvtk870.gif"};
		pubFileServiceImpl.delelteFile(files);
		
	}
	
}

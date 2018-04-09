import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.po.PubLog;
import com.htcf.system.service.impl.PubLogServiceImpl;

/** 
 * Project Name:service-system 
 * File Name:PubLogServiceTest.java 
 * Package Name: 
 * Date:2017年2月18日 上午11:09:47 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: PubLogServiceTest<br/>
 * Function: 日志服务测试类. <br/>
 * date: 2017年2月18日 上午11:09:47<br/>
 * 
 * @author lizhuo 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubLogServiceTest extends BasicTest {
	
	/**
	 * 日志参数服务方法
	 */
	@Autowired
	private PubLogServiceImpl pubLogServiceImpl;
	
	private static String rzid = "758654";
	
	/**
	 * 测试新增日志
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t01AddLog() throws Exception {
		PubLog pubLog = new PubLog();
		pubLog.setCjrxm("cjrxm");
		pubLog.setCjsj(new Date ());
		pubLog.setXtm("/web-system");
		pubLog.setFwlj("/pubRole/index");
		pubLog = pubLogServiceImpl.addLog(pubLog);
		rzid = pubLog.getRzid();
		logger.info(pubLog);
	}

	/**
	 * 测试查找日志
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetLog() throws Exception {
		PubLog pubLog = pubLogServiceImpl.getLogByRzid(rzid);
		logger.info(pubLog.getXtm());
	}
	
	
	/**
	 * 测试更新日志
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03UpdateLog() throws Exception {
		PubLog pubLog = new PubLog();
		pubLog.setRzid(rzid);
		pubLog.setCjrxm("liuhuan");
		pubLog.setCjsj(new Date ());
		pubLogServiceImpl.updateLog(pubLog);
		logger.info(pubLog);
	}
	
	/**
	 * 测试删除日志
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04DeleteLog() throws Exception {
		logger.info(pubLogServiceImpl.delelteLog(rzid));
	}

}

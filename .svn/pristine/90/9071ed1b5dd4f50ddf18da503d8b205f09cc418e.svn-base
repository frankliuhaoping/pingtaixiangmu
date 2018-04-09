import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.po.PubAudit;
import com.htcf.system.service.impl.PubAuditServiceImpl;

/** 
 * Project Name:service-system 
 * Param Name:PubAuditServiceTest.java 
 * Package Name: 
 * Date:2017年3月6日 上午11:10:00 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: PubAuditServiceTest<br/>
 * Function: 审计配置服务方法测试. <br/>
 * date: 2017年3月6日 上午11:10:00<br/>
 * 
 * @author wuwei 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubAuditServiceTest extends BasicTest {
	
	/**
	 * 审计配置服务方法
	 */
	@Autowired
	private PubAuditServiceImpl pubAuditServiceImpl;
	
	private static String sjid = "ff3e174720a54d6abf66292a20667d65";
	
	/**
	 * 测试新增文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t01AddAudit() throws Exception {
		PubAudit pubAudit = new PubAudit();
		pubAudit.setXtm("xtm");
		pubAudit.setFwlj("fwlj");
		pubAudit.setSjms("sjms");
		pubAudit.setPxdm(new Long(0));
		pubAudit.setSybz("Y");
		pubAudit.setCjrxm("cjrxm");
		pubAudit.setCjsj(new Date ());
		pubAudit.setGxrxm("gxrxm");
		pubAudit.setGxsj(new Date ());
		pubAudit = pubAuditServiceImpl.addAudit(pubAudit);
		
		sjid = pubAudit.getSjid();
		String outJson = jsonMapper.writeValueAsString(pubAudit);
		logger.info(outJson);
	}
	
	/**
	 * 测试查找文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetAudit() throws Exception {
		PubAudit pubAudit = pubAuditServiceImpl.getAuditBySjid(sjid);
		logger.info(pubAudit);
	}

	/**
	 * 测试修改文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t03UpdateAudit() throws Exception{
		PubAudit pubAudit = new PubAudit();
		pubAudit.setSjid(sjid);
		pubAudit.setXtm("xtm11");
		pubAudit = pubAuditServiceImpl.updateAudit(pubAudit);
		String outJson = jsonMapper.writeValueAsString(pubAudit);
		logger.info(outJson);
	}

	/**
	 * 测试删除文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04DeleteAudit() throws Exception {
		logger.info(pubAuditServiceImpl.delelteAudit(sjid));
	}
}

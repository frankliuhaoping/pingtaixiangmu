import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.po.PubParam;
import com.htcf.system.service.impl.PubParamServiceImpl;

/** 
 * Project Name:service-system 
 * Param Name:PubParamServiceTest.java 
 * Package Name: 
 * Date:2017年2月7日 下午2:56:02 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: PubParamServiceTest<br/>
 * Function: 全局参数服务方法测试. <br/>
 * date: 2017年2月7日 下午2:56:02<br/>
 * 
 * @author lizhuo 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubParamServiceTest extends BasicTest {
	
	/**
	 * 全局参数服务方法
	 */
	@Autowired
	private PubParamServiceImpl pubParamServiceImpl;
	
	/**
	 * 测试新增文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t01AddParam() throws Exception {
		PubParam pubParam = new PubParam();
		pubParam.setCsm("csm");
		pubParam.setCsbz("csbz");
		pubParam.setCsz("csz");
		pubParam.setCjrxm("cjrxm");
		pubParam.setCjsj(new Date ());
		pubParam = pubParamServiceImpl.addParam(pubParam);
		
		logger.info(pubParam);
	}

	/**
	 * 测试查找文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetParam() throws Exception {
		PubParam pubParam = pubParamServiceImpl.getParamByCsm("csm");
		logger.info(pubParam);
	}
	
	
	/**
	 * 测试更新文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03UpdateParam() throws Exception {
		PubParam pubParam = new PubParam();
		pubParam.setCsm("csm");
		pubParam.setCsbz("csbz");
		pubParam.setCsz("csz12");
		pubParam.setCjrxm("cjrxm");
		pubParam.setCjsj(new Date ());
		pubParamServiceImpl.updateParam(pubParam);
		logger.info(pubParam);
	}
	
	/**
	 * 测试删除文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04DeleteParam() throws Exception {
		logger.info(pubParamServiceImpl.delelteParam("csm"));
	}

}

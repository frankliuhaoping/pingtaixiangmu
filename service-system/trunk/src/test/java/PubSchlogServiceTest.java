///** 
// * Project Name:service-system 
// * File Name:PubSchlogServiceTest.java 
// * Package Name: 
// * Date:2017年3月9日 下午3:10:30
// * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
// * 
// */
//import java.util.Date;
//
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runners.MethodSorters;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.htcf.frame.model.Schlog;
//import com.htcf.frame.service.SchlogService;
//import com.htcf.system.model.po.PubSchlog;
//import com.htcf.system.service.impl.PubSchlogServiceImpl;
//
///** 
// * ClassName: PubSchlogServiceTest<br/>
// * Function: 定时任务日志服务测试类. <br/>
// * date: 2017年3月9日 下午3:10:30<br/>
// * 
// * @author wuwei
// */
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class PubSchlogServiceTest extends BasicTest {
//	
//	/**
//	 * 定时任务日志参数服务方法
//	 */
//	@Autowired
//	private PubSchlogServiceImpl pubSchlogServiceImpl;
//	
//	private static String rwzxid = "";
//	
//	/**
//	 * 测试新增定时任务日志
//	 *
//	 * @throws Exception the exception
//	 */
//	@Test
//	public void t01AddSchlog() throws Exception {
//		PubSchlog pubSchlog = new PubSchlog();
//		pubSchlog.setFwdm("fwdm");
//		pubSchlog.setRwmc("rwmc");
//		pubSchlog.setCjsj(new Date ());
//		pubSchlog = pubSchlogServiceImpl.addSchlog(pubSchlog);
//		rwzxid = pubSchlog.getRwzxid();
//		logger.info(pubSchlog);
//	}
//	@Test
//	public void t01AddPubSchlog() throws Exception {
//		Schlog schlog = new Schlog();
//		schlog.setFwdm("fwdm");
//		schlog.setRwmc("rwmc");
//		schlog.setCjsj(new Date ());
//		logger.info(pubSchlogServiceImpl.addSchlog(schlog));
//	}
////	/**
////	 * 测试查找定时任务日志
////	 * 
////	 * @throws Exception
////	 */
////	@Test
////	public void t02GetSchlog() throws Exception {
////		PubSchlog pubSchlog = pubSchlogServiceImpl.getSchlogByRwzxid(rwzxid);
////		logger.info(pubSchlog);
////	}
////	
////	
////	/**
////	 * 测试更新定时任务日志
////	 * 
////	 * @throws Exception
////	 */
////	@Test
////	public void t03UpdateSchlog() throws Exception {
////		PubSchlog pubSchlog = new PubSchlog();
////		pubSchlog.setRwzxid(rwzxid);
////		pubSchlog.setRwmc("rwmc111");
////		pubSchlog.setCjsj(new Date ());
////		pubSchlogServiceImpl.updateSchlog(pubSchlog);
////		logger.info(pubSchlog);
////	}
////	
////	/**
////	 * 测试删除定时任务日志
////	 * 
////	 * @throws Exception
////	 */
////	@Test
////	public void t04DeleteSchlog() throws Exception {
////		logger.info(pubSchlogServiceImpl.delelteSchlog(rwzxid));
////	}
//
//}

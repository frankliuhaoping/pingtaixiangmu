import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.po.PubSchedule;
import com.htcf.system.service.impl.PubScheduleServiceImpl;

/** 
 * Project Name:service-system 
 * Param Name:PubScheduleServiceTest.java 
 * Package Name: 
 * Date:2017年3月2日 下午1:45:00 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: PubScheduleServiceTest<br/>
 * Function: 定时任务服务方法测试. <br/>
 * date: 2017年3月2日 下午1:45:00<br/>
 * 
 * @author wuwei 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubScheduleServiceTest extends BasicTest {
	
	/**
	 * 定时任务服务方法
	 */
	@Autowired
	private PubScheduleServiceImpl pubScheduleServiceImpl;
	
	private static String rwid = "";
	
	/**
	 * 测试新增文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t01AddSchedule() throws Exception {
		PubSchedule pubSchedule = new PubSchedule();
		pubSchedule.setFwdm("fwdm");
		pubSchedule.setRwmc("rwmc");
		pubSchedule.setCron("cron");
		pubSchedule.setCronms("cronms");
		pubSchedule.setRwms("rwms");
		pubSchedule.setLm("lm");
		pubSchedule.setFfm("ffm");
		pubSchedule.setPxdm(new Long(0));
		pubSchedule.setSybz("Y");
		pubSchedule.setCjr("cjrxm");
		pubSchedule.setCjsj(new Date ());
		pubSchedule.setGxr("gxrxm");
		pubSchedule.setGxsj(new Date ());
		pubSchedule = pubScheduleServiceImpl.addSchedule(pubSchedule);
		
		rwid = pubSchedule.getRwid();
		String outJson = jsonMapper.writeValueAsString(pubSchedule);
		logger.info(outJson);
	}
	
	/**
	 * 测试查找文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetSchedule() throws Exception {
		PubSchedule pubSchedule = pubScheduleServiceImpl.getScheduleByRwid(rwid);
		logger.info(pubSchedule);
	}

	/**
	 * 测试修改文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t03UpdateSchedule() throws Exception{
		PubSchedule pubSchedule = new PubSchedule();
		pubSchedule.setRwid(rwid);
		pubSchedule.setFwdm("fwdm11");
		pubSchedule = pubScheduleServiceImpl.updateSchedule(pubSchedule);
		String outJson = jsonMapper.writeValueAsString(pubSchedule);
		logger.info(outJson);
	}

	/**
	 * 测试删除文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04DeleteSchedule() throws Exception {
		logger.info(pubScheduleServiceImpl.delelteSchedule(rwid));
	}
	
//	/**
//	 * 测试获取定时任务list
//	 * 
//	 * @throws Exception
//	 */
//	@Test
//	public void t05GetPubScheduleList() throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		//map = null;
//		pubScheduleServiceImpl.getPubScheduleList(map);
//	}
}

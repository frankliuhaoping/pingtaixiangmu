import java.util.Date;
import java.util.UUID;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.druid.support.json.JSONUtils;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.system.model.po.PubGpssbxx;
import com.htcf.system.service.impl.PubGpssbxxServiceImpl;

/** 
 * Project Name:service-system 
 * File Name:PubGpssbxxServiceTest.java 
 * Package Name: 
 * Date:2017年6月5日 下午1:41:24 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/**
 * ClassName: PubGpssbxxServiceTest <br/>
 * Function: gps设备信息 <br/>
 * date: 2017年6月5日 下午1:41:24
 * 
 * @author yiqiang
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubGpssbxxServiceTest extends BasicTest {

	@Autowired
	private PubGpssbxxServiceImpl pubGpssbxxService;

	/**
	 * 测试新增日志
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void addPubGpssbxx_Test() throws Exception {
		PubGpssbxx gpssbxx = new PubGpssbxx();
		gpssbxx.setSbbh(UUID.randomUUID().toString().replaceAll("-", ""));
		gpssbxx.setSbmc("设备名称");
		gpssbxx.setZzjgdm("组织机构代码");
		gpssbxx.setZzjgmc("组织机构名称");
		gpssbxx.setSblx("1");
		gpssbxx.setSbzt("1");
		gpssbxx.setSbztgxsj(new Date());
		gpssbxx.setLxdh("18123123123");
		gpssbxx.setBdrybh("绑定人员编号");
		gpssbxx.setBdrymc("绑定人员名称");
		gpssbxx.setSzthz("所在通话组");
		gpssbxx.setSzthzgxsj(new Date());// 所在通话组更新时间
		gpssbxx.setGzzt("1");
		gpssbxx.setGzztsm("工作状态说明");
		gpssbxx.setGzztgxsj(new Date());
		gpssbxx.setStglzt("正常");
		gpssbxx.setStglztsm("手台管理状态说明");
		gpssbxx.setStglztgxsj(new Date());
		gpssbxx.setCjr("admin");
		gpssbxx.setCjsj(new Date());
		gpssbxx.setGxr("admin");
		gpssbxx.setGxsj(new Date());
		gpssbxx.setSybz("1");

		pubGpssbxxService.addPubGpssbxx(gpssbxx);
	}

	@Test
	public void deleltePubGpssbxx_Test() throws Exception {
		String[] sbbhs = { "123123" };
		pubGpssbxxService.deleltePubGpssbxx(sbbhs);
	};

	@Test
	public void getPubGpssbxxBySbbh_Test() throws Exception {
		PubGpssbxx pubGpssbxx = pubGpssbxxService.getPubGpssbxxBySbbh("929724315f1d404d9200b18a5353c526");

		logger.info(JsonUtil.toJsonNonNull(pubGpssbxx));
	};

}

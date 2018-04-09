/** 
 * Project Name:service-system 
 * File Name:PubResServiceTest.java 
 * Package Name: 
 * Date:2016年12月3日上午10:15:57 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
import java.util.Date;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.htcf.system.cache.PubResCache;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubResBo;
import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubUserService;
import com.htcf.system.service.impl.PubResServiceImpl;

/**
 * ClassName: PubResServiceTest <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年12月3日 上午10:15:57 <br/>
 * 
 * @author chenshizhe
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubResServiceTest extends BasicTest {
	@Autowired
	private PubResServiceImpl pubResServiceImpl;

	@Autowired
	private PubResCache pubResCache;
	
	@Autowired
	private PubUserService pubUserService;
	private static String zyid = "";

	@Test
	public void t01AddApp() throws Exception {
		PubRes pubRes = new PubRes();
		pubRes.setZymc("菜单1");
		pubRes.setCjsj(new Date());
		pubRes.setGxsj(new Date());
		pubRes = pubResServiceImpl.addRes(pubRes);
		zyid = pubRes.getZyid();
		String outJson = jsonMapper.writeValueAsString(pubRes);
		logger.info(outJson);
	}

	@Test
	public void t02GetAppByZyid() throws Exception {
		zyid="995";
		PubRes pubRes = pubResServiceImpl.getResByZyid(zyid);

		String outJson = jsonMapper.writeValueAsString(pubRes);
		logger.info(outJson);
	}

	@Test
	public void t03Update() throws Exception {
		PubRes pubRes = new PubRes();
		zyid="1003";
		pubRes.setZyid(zyid);
		pubRes.setZymc("菜单4");
		pubRes.setZylx(1);
		pubRes.setYyid("662");
		pubRes = pubResServiceImpl.updateRes(pubRes);

		String outJson = jsonMapper.writeValueAsString(pubRes);
		logger.info(outJson);
	}

	@Test
	public void t05GetPubResNodesById() throws Exception {
		List<PubResBo> nodes = pubResServiceImpl.getPubResNodesById("1", "0",1);

		String outJson = jsonMapper.writeValueAsString(nodes);
		logger.info(outJson);
	}
	
	
	@Test
	public void t06GetFzyids() throws Exception {
		zyid="990";
		
		PubRes pubRes = pubResServiceImpl.getResByZyid(zyid);
		if (StringUtils.isEmpty(pubRes.getZyfid())) {
			logger.info("zyfid为空");
			throw ServiceSystemException.PUBRES_NOT_EXIST;
		}
		PubRes p = pubResServiceImpl.getResByZyid(pubRes.getZyfid());
		String outJson = jsonMapper.writeValueAsString(pubRes);
		String outJson1 = jsonMapper.writeValueAsString(p);
		logger.info(outJson);
		logger.info(outJson1);

	}
	
	//
	@Test
	public void t07GetFzyids() throws Exception {
		String zyids="0/843/847/";
		// 根据zyids 方法为private
		// pubResServiceImpl.getFzyidsStr;

//		String outJson = jsonMapper.writeValueAsString(pubRes);
//		logger.info(outJson);
	}

	@Test
	public void t09delete() throws Exception {
		zyid="2d6f74d40e6a421984d29b29e125fe86";
		int i = pubResServiceImpl.delelteRes(zyid);

		String outJson = jsonMapper.writeValueAsString(i);
		logger.info(outJson);
	}

	@Test
	public void t10cache() throws Exception {

		PubRes pubRes = new PubRes();

		pubRes.setZyid("111");
		pubRes.setZymc("菜单2");

		PubRes pubRes1 = new PubRes();

		pubRes1.setZyid("112");
		pubRes1.setZymc("菜单3");

		pubResCache.put(pubRes.getZyid(), pubRes);
		pubResCache.put(pubRes1.getZyid(), pubRes1);

		String outJson = jsonMapper.writeValueAsString(pubResCache.getSize());
		logger.info(outJson);
	}
	
	
	@Test
	public void t11delete() throws Exception {
		PubUser pubUser =pubUserService.getUserByYhbh("cjtest2");
		String yyid="481";
		List<PubRes> pubResList =pubResServiceImpl.getResListByUserAndYyid(pubUser, yyid,4);
		logger.info(jsonMapper.writeValueAsString(pubResList));
	}    
	
	
	@Test
	public void t12getByjsid()throws Exception{
		List<String> list=pubResServiceImpl.checkZyids("625");
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
		
	}
	/**
	 * 
	 * 测试获取级别
	 * 
	 * @throws Exception
	 */
	@Test
	public void t13getResLevel()throws Exception{
		zyid="1133";
		PubRes pubRes=  pubResServiceImpl.getResByZyid(zyid);
		int i=  pubResServiceImpl.getResLevel(pubRes);
		logger.info(i);
	}
}

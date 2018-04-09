import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.service.PubJqxzService;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.impl.PubJqxzServiceImpl;

/** 
 * Project Name:service-system 
 * File Name:PubJqxzServicrTest.java 
 * Package Name: 
 * Date:2016年12月21日下午4:48:59 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/**
 * ClassName: PubJqxzServicrTest <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年12月21日 下午4:48:59 <br/>
 * 
 * @author htcf
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubJqxzServicrTest extends BasicTest {
	String jqxzbh = "321323";
	@Autowired
	private PubJqxzService pubJqxzService;

	@Autowired
	private PubJqxzServiceImpl PubJqxzServiceImpl;
	
	
	
	
	@Test
	public void t01AddJqxz() throws Exception {
		PubJqxzdm pubJqxzdm = new PubJqxzdm();
		pubJqxzdm.setJqxzbh("3213231");
		pubJqxzdm.setJqxzjc("儿童失踪案");
		pubJqxzdm.setJqxzjcpym("etsza");
		pubJqxzdm.setJqxzqc("儿童失踪案");
		pubJqxzdm.setBzjqxzbh("3213231");
		pubJqxzdm.setBzjqxzmc("儿童失踪案");
		
		pubJqxzdm = pubJqxzService.addJqxz(pubJqxzdm);
		String outJson = jsonMapper.writeValueAsString(pubJqxzdm);
		logger.info(outJson);

	}
	 /**
	  * 更新
	  * TODO(这里用一句话描述这个方法的作用)
	  * 
	  * @throws Exception
	  */
	 @Test
	 public void t02upDateJqxz() throws Exception {
	 PubJqxzdm pubJqxzdm = new PubJqxzdm();
	 pubJqxzdm.setJqxzbh(jqxzbh);
	 pubJqxzdm.setJqxzjc("周奕伟失");
	 pubJqxzdm = pubJqxzService.upDateJqxz(pubJqxzdm);
	 String outJson = jsonMapper.writeValueAsString(pubJqxzdm);
	 logger.info(outJson);
	
	 }
	 @Test
	 public void viewPubJqxzByJqxzbh() throws Exception {
	
	 PubJqxzdm pubJqxzdm = pubJqxzService.getPubJqxzByJqxzbh(jqxzbh);
	 String outJson = jsonMapper.writeValueAsString(pubJqxzdm);
	 logger.info(outJson);
	
	 }

	 @Test
	 public void deleltePubJqxz() throws Exception {
	 String[] array = new String[] {jqxzbh};
	 int i = pubJqxzService.deleltePubJqxz(array);
	 logger.info(i);
	
	 }

	@Test
	public void getListPage() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", "10");
		map.put("limit", "10");
		PageInfo<PubJqxzdm> pageInfo = pubJqxzService.getListPage(map);
		String outJson = jsonMapper.writeValueAsString(pageInfo);
		logger.info(outJson);

	}
	
	@Test
	public void getListPage1() throws Exception {
		List<PubJqxzdm> allList = pubJqxzService.getJqxzBybh("");
		
		System.out.println(allList.size());
		List<PubJqxzdm> list =  pubJqxzService.getPubJqxzBybzjqxzbh2("");
		System.out.println(list.size());
		System.out.println(allList.size());
		
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
	}
	
	@Test
	public void getListPage2() throws Exception {
//		List<PubJqxzdm> allList = pubJqxzServiceImpl.getJqxzBybh("");
//		System.out.println(allList.size());
		
		//PubJqxzdm pubJqxzdm = pubJqxzService.getPubJqxzBybzjqxzbh("01010110");
		Map map=pubJqxzService.getJqxzByBzjqxzbh("01010110");
		
		String outJson1 = jsonMapper.writeValueAsString(map);
		logger.info(map);
//	s
//		PubJqxzdmBo pubJqxzdmBo = new PubJqxzdmBo();
//
//		// 属性复制
//		Mapper mapper = new DozerBeanMapper();
//		mapper.map(pubJqxzdm, pubJqxzdmBo);
//		
//		pubJqxzdmBo.setLevel(1);
		
	
	}
	@Test
	public void getNodesJqxzByJqxzbh() throws Exception {
	PubJqxzServiceImpl.init();
	List<PubJqxzdmBo> list = pubJqxzService.getNodesJqxzByJqxzbh("19000000", 1);
	String outJson = jsonMapper.writeValueAsString(list);
	logger.info(outJson);
	}
	
	
}

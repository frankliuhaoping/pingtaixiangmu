import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.service.PubJqxzsyService;
import com.htcf.system.service.impl.PubJqxzServiceImpl;
import com.htcf.system.service.impl.PubJqxzsyServiceImpl;

/** 
 * Project Name:service-system 
 * File Name:PubJqxzsyServiceTest.java 
 * Package Name: 
 * Date:2017年10月10日 下午2:05:53 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: PubJqxzsyServiceTest
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年10月10日 下午2:05:53
 * 
 * @author liuhuan 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubJqxzsyServiceTest extends BasicTest {
	
	@Autowired
	private PubJqxzsyServiceImpl pubJqxzsyServiceImpl;
	
	@Autowired
	private PubJqxzServiceImpl pubJqxzServiceImpl;
	@Test
	public void t01queryJqxzBhByZdbh() throws Exception {
		long startTime = System.currentTimeMillis(); // 获取开始时间  
		List<String> list=pubJqxzsyServiceImpl.queryJqxzBhByZdbh("system_jqxzsybz_jcj1");
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
		long endTime = System.currentTimeMillis(); // 获取结束时间  
        System.out.println("程序运行时间： " + (endTime - startTime) + "ms"); 
	}
	/**
	 * 根据zdbh查询数据库中jqxz对象集合
	 * 再去缓存中根据jqxzbh 得到缓存中数据
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02getJqxzByZdbh() throws Exception {
		pubJqxzServiceImpl.init();
		long startTime = System.currentTimeMillis(); // 获取开始时间  
		List<PubJqxzdmBo> list=pubJqxzsyServiceImpl.getPubJqxzByZdbh("system_jqxzsybz_jcj4");
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
		long endTime = System.currentTimeMillis(); // 获取结束时间  
        System.out.println("程序运行时间： " + (endTime - startTime) + "ms"); 
	}
	/**
	 * 获取树形结构
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03createTree() throws Exception {
		long startTime = System.currentTimeMillis(); // 获取开始时间  
		String a= null;
		List<PubJqxzdmBo> list=	pubJqxzsyServiceImpl.createTree("system_jqxzsybz_jcj4","");
//		List<PubJqxzdmBo> list=	pubJqxzsyServiceImpl.createTree("system_jqxzsybz_jcj1");
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
        long endTime = System.currentTimeMillis(); // 获取结束时间  
        logger.info(list.size());
        System.out.println("程序运行时间： " + (endTime - startTime) + "ms");  
		
	}
	
	/**
	 * 缓存获取
	 * 获取树形结构2 测试map
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03createTree2() throws Exception {
		pubJqxzServiceImpl.init();
		long startTime = System.currentTimeMillis(); // 获取开始时间  
		List<PubJqxzdmBo> list = pubJqxzsyServiceImpl.getPubJqxzByZdbh("system_jqxzsybz_jcj1","",1);
//		Map<String,List<PubJqxzdmBo>> map = PubJqxzsyServiceImpl.getJqxzMap(list);
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
		long endTime = System.currentTimeMillis(); // 获取结束时间  
        System.out.println("程序运行时间： " + (endTime - startTime) + "ms");  
		
	}
	
	@Test
	public void t04getPubJqxzdm() throws Exception{
		
		PubJqxzdm p= pubJqxzsyServiceImpl.getPubJqxzdm("system_jqxzsybz_jcj1","01000000");
		String outJson = jsonMapper.writeValueAsString(p);
		logger.info(outJson);
	}

}



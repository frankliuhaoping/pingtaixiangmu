import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.system.database.DataSourceInstances;
import com.htcf.system.database.DynamicDataSourceHolder;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.service.PubUserService;
import com.htcf.system.service.SysUserService;
import com.htcf.system.service.XdhCopyService;
import com.htcf.system.service.impl.SysUserServiceImpl;

/** 
 * Project Name:service-system 
 * File Name:SysUserServiceTest.java 
 * Package Name: 
 * Date:2017年9月12日 上午11:16:26 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: SysUserServiceTest
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月12日 上午11:16:26
 * 
 * @author liuhuan 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class SysUserServiceTest extends BasicTest {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserServiceImpl sysUserServiceImpl;
	@Autowired
	private PubUserService pubUserService;
	@Autowired
	private XdhCopyService XdhCopyService;
	@Test
	public void t01getListPage()throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", "0");
		map.put("limit", "100");
		PageInfo<SysUser> pageInfo =sysUserService.getListPage(map);
		List<SysUser> list = pageInfo.getList();
		for (SysUser sysUser : list) {
			logger.info(sysUser.getUserId());
		}
		logger.info(JsonUtil.toJsonNonNull(list));
	}
	
	@Test
	public void t02getOne()throws Exception{
//		PubUser s=sysUserService.getPubUserByYhbh("admin");
//		PubUser pub=pubUserService.getUserByYhbh("admin");
//		if (pub ==null) {
//			pubUserService.addUser(s);
//		}else {
//			pubUserService.updateUser(s);
//		}
//		logger.info(JsonUtil.toJsonNonNull(s));
	}
	
	@Test
	public void t03getList()throws Exception{
		//DynamicDataSourceHolder.setDataSource(DataSourceInstances.ORACLE_DGGA110);
//		List<SysUser> list =  sysUserServiceImpl.getList();
//		logger.info(JsonUtil.toJsonNonNull(list.size()));
		
	}
	//单条同步 bug
	@Test
	public void t02getList()throws Exception{
		SysUser s=	sysUserServiceImpl.getSysUserById("admin");
		XdhCopyService.synchroSysUser(s);
	}
	//批量同步
	@Test
	public void t04getList()throws Exception{
		//DynamicDataSourceHolder.setDataSource(DataSourceInstances.ORACLE_DGGA110);
//		List<SysUser> list =  sysUserServiceImpl.getList();
//		logger.info(JsonUtil.toJsonNonNull(list.size()));
		String [] ids={"admin","150001","tetst1112","test"};
		List<SysUser> list = sysUserServiceImpl.getBatch(ids);
		XdhCopyService.synchroBatchSysUser(list);
		
	}
}

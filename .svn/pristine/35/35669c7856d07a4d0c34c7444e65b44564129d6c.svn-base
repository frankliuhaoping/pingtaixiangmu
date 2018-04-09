import java.util.List;

import org.dozer.DozerBeanMapper;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.frame.base.util.JsonUtil;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.model.po.XdhCopy;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.SysUserService;
import com.htcf.system.service.XdhCopyService;
import com.htcf.system.service.impl.PubZzjgServiceImpl;
import com.htcf.system.service.impl.TaskServiceImpl;

/** 
 * Project Name:service-system 
 * File Name:XdhCopyServiceTest.java 
 * Package Name: 
 * Date:2017年9月15日 上午11:04:30 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */

/** 
 * ClassName: XdhCopyServiceTest
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月15日 上午11:04:30
 * 
 * @author liuhuan 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class XdhCopyServiceTest extends BasicTest {
	@Autowired
	private XdhCopyService xdhCopyService;
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysOrgService sysOrgService;
	
	@Autowired
	private PubZzjgServiceImpl pubZzjgService;
	
	@Autowired
	private TaskServiceImpl taskServiceImpl;
	/**
	 * 中间表添加数据
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t01addXdhCopy()throws Exception{
		//sysorg 数据存入到 中间表
		SysOrg sysOrg=sysOrgService.getSysOrgById("441900700400");
		String json =JsonUtil.toJsonDefaults(sysOrg).hashCode()+"";
		XdhCopy xdhCopy = new XdhCopy();
		xdhCopy.setData_Id(sysOrg.getDwdm());
		xdhCopy.setData(json);
		xdhCopy.setType("V_SYS_ORG");
		try {
			xdhCopyService.addXdhCopy(xdhCopy);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
	}
	
	
	@Test
	public void t02UpdataXdhCopy()throws Exception{
		SysOrg sysOrg=sysOrgService.getSysOrgById("441900S05200");
		String json =JsonUtil.toJsonDefaults(sysOrg);
		XdhCopy xdhCopy = new XdhCopy();
		xdhCopy.setData_Id(sysOrg.getDwdm());
		xdhCopy.setData("修改数据");
		xdhCopy.setType("V_SYS_ORG");
		try {
			xdhCopyService.updateXdhCopy(xdhCopy);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}
	
	//批量同步
	@Test
	public void t03BatchList()throws Exception{
		long startTime = System.currentTimeMillis();//开始时间
		List<SysOrg> list= sysOrgService.getList();
		xdhCopyService.synchroBatchSysOrg(list);
		long endTime = System.currentTimeMillis(); // 获取结束时间  
	    System.out.println("程序运行时间： " + (endTime - startTime) + "ms");  

	}
	//定时任务
	@Test
	public void t04addXdhCopy()throws Exception{
//		taskServiceImpl.synchroSysUser();
		taskServiceImpl.synchroSysOrg();
	}
	
	@Test
	public void t05addXdhCopy()throws Exception{
		
//		pubZzjgService.init();
		SysOrg sysOrg=sysOrgService.getSysOrgById("441900S05200");
		// 创建拷贝对象
//		DozerBeanMapper mapper = new DozerBeanMapper();
//		PubZzjg pubZzjg = new PubZzjg();
//		mapper.map(sysOrg, pubZzjg);
//		logger.info("pubZzjg"+JsonUtil.toJsonNonNull(pubZzjg));

		xdhCopyService.synchroSysOrg(sysOrg);
	}
	
	
	
}	

import java.lang.reflect.Field;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.bo.SysUser;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.service.PubZzjgService;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.XdhCopyService;

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
public class SysOrgServiceTest extends BasicTest {
	@Autowired
	private SysOrgService sysOrgService;	
	
	@Autowired
	private PubZzjgService pubZzjgService;
	
	@Autowired
	private XdhCopyService XdhCopyService;
	@Test
	public void t01getListPage()throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", "0");
		map.put("limit", "10");
		PageInfo<SysOrg> pageInfo =sysOrgService.getListPage(map);
		List<SysOrg> list = pageInfo.getList();
		logger.info(JsonUtil.toJsonNonNull(list));
	}
	
	@Test
	public void t02getSysOrg()throws Exception{
//		625939258
//		PubZzjg p= pubZzjgService.getPubZzjgByDwdm("441900700400");
//		PubZzjg pubZzjg = sysOrgService.getPubZzjgByDwdm("441900700400");
//		if (p == null) {
//			pubZzjgService.addPubZzjg(pubZzjg);
//		}else {
//			pubZzjgService.updatePubZzjg(pubZzjg);
//		}
		
		
//		pubZzjgService.updatePubZzjg((PubZzjg)sysOrg);
//		String json =JsonUtil.toJsonDefaults(sysOrg).hashCode()+"";
//		logger.info(json);
	}
	//查询全部
	@Test
	public void t03getList()throws Exception{
		List<SysOrg> list= sysOrgService.getList();
		logger.info(list.size());
	}
	//批量查询
	@Test
	public void t04getList()throws Exception{
		String [] ids={"441900700104","441900700300","441900700200","233"};
		List<SysOrg> list= sysOrgService.getBatch(ids);
		logger.info(JsonUtil.toJsonNonNull(list));
		logger.info(list.size());
	}
	
	//单条同步
	@Test
	public void t03add()throws Exception{
		SysOrg  sysOrg= sysOrgService.getSysOrgById("441900000000");
		XdhCopyService.synchroSysOrg(sysOrg);
	}
}

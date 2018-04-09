/** 
 * Project Name:service-system 
 * File Name:PubResServiceTest.java 
 * Package Name: 
 * Date:2016年12月3日上午10:15:57 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubRoleService;
import com.htcf.system.service.impl.PubRoleServiceImpl;

/**
 * ClassName: PubResServiceTest <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年12月3日 上午10:15:57 <br/>
 * 
 * @author chenshizhe
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubRoleServiceTest extends BasicTest {

	@Autowired
	private PubRoleService pubRoleService;
	
	@Autowired
	private PubResService pubResService;
	
	private static String jsid = "";
	private static String zyid = "";
	private static String yyid = "";
	@Test
	public void t01AddApp() throws Exception {
		PubRole pubRole = new PubRole();
		pubRole.setYyid("1");
		pubRole.setJsmc("角色1");
		pubRole.setCjsj(new Date());
		pubRole.setGxsj(new Date());
		//pubRole.setZyids("111,112");
		pubRole = pubRoleService.addRole(pubRole);
		jsid = pubRole.getJsid();
		String outJson = jsonMapper.writeValueAsString(pubRole);
		logger.info(outJson);
	}
	@Test
	public void t02GetAppByZyid() throws Exception {
		jsid="1";
		PubRole pubRole = pubRoleService.getRoleByJsid(jsid);
		
		String outJson = jsonMapper.writeValueAsString(pubRole);
		logger.info(outJson);
	}
	
	
	//必定报错 pubRole为空   但数据已经修改
	//指定Id 来修改数据
	@Test
	public void t03Update() throws Exception {
		PubRole pubRole = new PubRole();
		jsid="d626c3ead4e643cf872846e8555c0c16";
		pubRole.setJsid(jsid);
		pubRole.setJsmc("角色3");
		pubRole.setCjrxm("ce");
		pubRole = pubRoleService.updateRole(pubRole);
		String outJson = jsonMapper.writeValueAsString(pubRole);
		logger.info(outJson);
	}

	//
	//
	//
	// @Test
	// public void t05GetPubResNodesById() throws Exception {
	// List<PubResTree> nodes = pubResServiceImpl.getPubResNodesById(0);
	// System.out.println(nodes.size());
	// }
	//
	//
	// @Test
	// public void t06GetFzyids() throws Exception {
	// PubRes pubRes = pubResService.getResByZyid(zyid);
	// //String nodes = pubResServiceImpl.getFzyidsStr(pubRes);
	// }
	//
//	 @Test
//	 public void t07GetFzyids() throws Exception {
//	 PubRes pubRes = pubResService.getResByZyid("1");
//	 //int i= pubResServiceImpl.getResLevel(pubRes);
//	 }
	//
	

	
	@Test
	public void t19delete() throws Exception {
		jsid="625";
		int i = pubRoleService.delelteRoles(jsid);
		logger.info(i);
	}
	
	/**
	 * 脚本
	 * 把角色表数据  插入到角色权限表
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t20addRoleRes()throws Exception{
		List<PubRole> list=	 pubRoleService.getAll();
		for (PubRole pubRole : list) {
				List<String> zyids=pubResService.checkZyids(pubRole.getJsid());
				for (String zyid : zyids) {
					pubRoleService.addPubRoleRes(zyid,pubRole.getJsid());
				}
				
				//zyids有空
		/*	if (StringUtils.isNotEmpty(pubRole.getZyids())) {
					String []zyids=	pubRole.getZyids().split(",");
				
					for (int i = 0; i < zyids.length; i++) {
						map.put("zyid", zyids[i]);
						pubRoleServiceImpl.addPubRoleRes(map);
				}
				String outJson = jsonMapper.writeValueAsString(pubRole);
				logger.info(outJson);	
			}*/
			
		}
	}
	
	//根据集合jsids 得到zyid集合 存放的是字符串用,分隔
	 @Test
	 public void getZyidByJsids() throws Exception {
		 Set <String> jsids = new HashSet<String>();
		 jsids.add("624");
		 jsids.add("625");
		 List<String> list=pubRoleService.getZyidsByJsids(jsids);
		 String outJson = jsonMapper.writeValueAsString(list);
		 logger.info(outJson);
	 }
	 
	 /**
	  * 根据资源ID与应用ID  查询角色列表
	  * 
	  * @throws Exception
	  */
	 @Test
	 public void getPubRoleList()throws Exception{
		 zyid="329";
		 yyid="1";
		 List<PubRole> list= pubRoleService.getPubRoleList(zyid, yyid);
		 String outJson = jsonMapper.writeValueAsString(list);
		 logger.info(outJson);
	 }
	 /**
	  * 根据用户id和yyid 得到角色列表
	  * 
	  * @throws Exception
	  */
	 @Test
	 public void getRoleListByUserAndYyid()throws Exception{
		 PubUser pubUser = new PubUser();
		 pubUser.setYhbh("10000");
		 yyid="481";
		 List<PubRole> list=pubRoleService.getRoleListByUserAndYyid(pubUser, yyid);
		 String outJson = jsonMapper.writeValueAsString(list);
		 logger.info(outJson);
	 }
	 /**
	  * 测试复制角色
	  * TODO(这里用一句话描述这个方法的作用)
	  * 
	  * @throws Exception
	  */
	 @Test
	 public void copyRole() throws Exception{
		 PubRole pubRole = new PubRole();
		 pubRole.setJsid("561");
		 pubRole = pubRoleService.copyRole(pubRole);
		 String outJson = jsonMapper.writeValueAsString(pubRole);
		 logger.info(outJson);
	 }
}

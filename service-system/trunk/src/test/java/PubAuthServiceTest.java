import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jboss.netty.util.internal.ConcurrentHashMap;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.impl.PubAppServiceImpl;
import com.htcf.system.service.impl.PubAuthServiceImpl;
import com.htcf.system.service.impl.PubRoleServiceImpl;
import com.htcf.system.service.impl.PubUserServiceImpl;

/**
 * 
 * ClassName: PubAuthServiceTest <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016年12月9日 上午11:34:23 <br/> 
 * 
 * @author zhangyingzi 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubAuthServiceTest extends BasicTest {

	@Autowired
	private PubAuthServiceImpl pubAuthServiceImpl;
	@Autowired
	private PubUserServiceImpl pubUserServiceImpl;
	@Autowired
	private PubAppServiceImpl pubAppServiceImpl;
	@Autowired
	private PubRoleServiceImpl pubRoleServiceImpl;

	private static String sqid = "1346";
	
	private static String yhbh = "";
	private static String yyid = "";
	private static String jsid = "";
	
	/**
	 * 测试授权
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	//@Transactional(rollbackFor = Exception.class)
	public void t01AddAuth() throws Exception{
		PubAuth pubAuth = new PubAuth();
		PubUser pubUser = new PubUser();
		pubUser.setYhzh("测试授权添加tst13");
		pubUser.setYhmm("123456");
		pubUser.setYhmc("测试授权添加tst3");
		pubUser.setXzqh("442000");
		pubUser = pubUserServiceImpl.addUser(pubUser);
		
		PubApp pubApp = new PubApp();
		pubApp.setYymc("测试授权添加应用3");
		pubApp.setCjsj(new Date());
		pubApp.setGxsj(new Date());;
		pubApp = pubAppServiceImpl.addApp(pubApp);
		
		PubRole pubRole=new PubRole();
		pubRole.setYyid("1");
		pubRole.setJsmc("授权角色测试1");
		pubRole.setCjsj(new Date());
		pubRole.setGxsj(new Date());
		pubRoleServiceImpl.addRole(pubRole);
		
		
		pubAuth.setYyid(yyid);
		pubAuth.setJsid(pubRole.getJsid());
		pubAuth.setCjsj(new Date());
		pubAuth.setYhbh(pubUser.getYhbh());
		PubAuth p=pubAuthServiceImpl.addAuth(pubAuth);
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("yyid", pubAuth.getYyid());
		List<PubAuth> puAuths = pubAuthServiceImpl.getAuthList(map);
		jsid = puAuths.get(0).getJsid();
		sqid = puAuths.get(0).getSqid();
		logger.info(jsid+"------"+sqid);
	}
	
	@Test
	public void t02GetAuthByYyid() throws Exception {
		
		PubAuth pubAuth = pubAuthServiceImpl.getAuthBySqid(sqid);
		String outJson = jsonMapper.writeValueAsString(pubAuth);
		
		logger.info(outJson);
	}
	
	
	/**
	 * 测试多个删除   只是单一删除
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03DelelteAuth() throws Exception {
		sqid ="783";
		yhbh="测试授权添加tst13";
		
		int i = pubAuthServiceImpl.deleteAuth(sqid);
		pubUserServiceImpl.delelteUser(yhbh);
		pubRoleServiceImpl.delelteRoles(jsid);
		pubAppServiceImpl.delelteApp(yyid);
		logger.info(i);
	}
	
	
}

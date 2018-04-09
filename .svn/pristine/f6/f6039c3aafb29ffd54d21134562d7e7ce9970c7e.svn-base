import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.impl.PubAppServiceImpl;
import com.htcf.system.service.impl.PubResServiceImpl;
import com.htcf.system.service.impl.PubUserServiceImpl;

/**
 * 
 * ClassName: PubUserServiceTest <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016年12月9日 上午10:43:12 <br/> 
 * 
 * @author zhangyingzi 
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubUserServiceTest extends BasicTest{

	@Autowired
	private PubUserServiceImpl pubUserServiceImpl;
	
	@Autowired
	private PubAppServiceImpl pubAppServiceImpl;
	@Autowired
	private PubResServiceImpl pubResServiceImpl;
	
	
	private static String yhbh = "test--3";
	
	@Test
	public void t01AddUser() throws Exception {
		PubUser pubUser = new PubUser();
		pubUser.setYhzh("test--3");
		pubUser.setYhmm("123456");
		pubUser.setYhmc("test--3");
		pubUser = pubUserServiceImpl.addUser(pubUser);
		yhbh = pubUser.getYhbh();

		String outJson = jsonMapper.writeValueAsString(pubUser);
		logger.info(outJson);
	}
	
	@Test
	public void t02UpdateUser() throws Exception{
		PubUser pubUser = new PubUser();
		pubUser.setYhbh(yhbh);
		pubUser.setYhmc("ts1");
		pubUser = pubUserServiceImpl.updateUser(pubUser);
		String outJson = jsonMapper.writeValueAsString(pubUser);
		logger.info(outJson);
	}
	
	@Test
	public void t03GetUserByYhbh() throws Exception{
		PubUser pubUser = pubUserServiceImpl.getUserByYhbh("liuhuan");
		String outJson = jsonMapper.writeValueAsString(pubUser);
		logger.info(outJson);
	}
	
	@Test
	public void t04GetAsPage() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", "10");
		map.put("limit", "10");
//		map.put("pkiid", "441900197409113022");
		PageInfo<PubUser> pageInfo = pubUserServiceImpl.getListPage(map);
		String outJson = jsonMapper.writeValueAsString(pageInfo);
		logger.info(outJson);
	}
	

	@Test
	public void t05DelelteUser() throws Exception{
		int i = pubUserServiceImpl.delelteUser(yhbh);
		logger.info(i);
	}
	
	
	@Test
	public void t06GetPubUserByYhzhAndYhmm() throws Exception{

//		PubUser pubUser = pubUserServiceImpl.getPubUser("test3", "123456");
//		logger.info(jsonMapper.writeValueAsString(pubUser));
//		
//		PubApp pubApp = pubAppServiceImpl.getAppByYydm("729bfd0d-c397-4746-afca-15c14df47c52");
//		logger.info(jsonMapper.writeValueAsString(pubApp));
//		
//		List<PubRes> pubResList = pubResServiceImpl.getResListByUserAndYyid(pubUser,pubApp.getYyid());
//		logger.info(jsonMapper.writeValueAsString(pubResList));
	}
	
}

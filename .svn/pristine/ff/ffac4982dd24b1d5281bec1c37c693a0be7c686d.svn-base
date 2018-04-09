import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.service.impl.PubAppServiceImpl;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubAppServiceTest extends BasicTest {
	@Autowired
	private PubAppServiceImpl PubAppServiceImpl;
	
	private static String yyid = "0" ;
	
	/**
	 * 
	 * 测试新增应用
	 * 
	 * @throws Exception
	 */
	@Test
	public void t01AddApp() throws Exception {
		PubApp pubApp = new PubApp();
		pubApp.setYymc("应用9");
		pubApp.setYydm("ts9");
		//必填cjsj gxsj  yyid自动生成uuid
		pubApp.setCjsj(new Date());
		pubApp.setGxsj(new Date());
		pubApp.setCjrxm("超级管理员");;
		pubApp = PubAppServiceImpl.addApp(pubApp);
		yyid = pubApp.getYyid();
		String outJson = jsonMapper.writeValueAsString(pubApp);
		logger.info(outJson);
	}
	/**
	 * 根据yyid查询应用
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetAppByYyid() throws Exception {
		yyid ="662";
		PubApp pubApp = PubAppServiceImpl.getAppByYyid(yyid);
		String outJson = jsonMapper.writeValueAsString(pubApp);
		logger.info(outJson);
	}
	/**
	 * 
	 * 更新应用
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03UpdateApp() throws Exception {
		yyid="2a86ad311da148219a1be3ead6f99cbc";
		PubApp pubApp = new PubApp();
		pubApp.setYyid(yyid);
		pubApp.setYymc("测试更新应用");
		pubApp.setGxsj(new Date());
		pubApp.setGxrxm("测试员");
		pubApp = PubAppServiceImpl.updateApp(pubApp);
		String outJson = jsonMapper.writeValueAsString(pubApp);
		logger.info(outJson);
	}
	
	
	/**
	 * 根据应用代码查询 应用
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04getAppYyidByYydm() throws Exception{
		yyid="1";
		PubApp app = PubAppServiceImpl.getAppByYyid(yyid);
		PubApp pubApp = PubAppServiceImpl.getAppByYydm(app.getYydm());
		String outJson = jsonMapper.writeValueAsString(pubApp);
		logger.info(outJson);
	}
	/**
	 * 根据yyid 删除应用 可批量删除
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t05delelteApp() throws Exception {
		PubApp pubApp = new PubApp();
		pubApp.setYymc("应用9");
		pubApp.setYydm("ts9");
		//必填cjsj gxsj  yyid自动生成uuid
		pubApp.setCjsj(new Date());
		pubApp.setGxsj(new Date());
		pubApp.setCjrxm("超级管理员");;
		pubApp = PubAppServiceImpl.addApp(pubApp);
		yyid = pubApp.getYyid();
		int i = PubAppServiceImpl.delelteApp(yyid);
		logger.info(i);

	}
	/**
	 * 分页查询测试
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t06getAsPage() throws Exception {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("offset", "10");
		map.put("limit", "10");
		

		PageInfo<PubApp> pageInfo = PubAppServiceImpl.getListPage(map);

		String outJson = jsonMapper.writeValueAsString(pageInfo);
		logger.info(outJson);
	}
	
	/**
	 * 根据查询条件获取关联授权表分组后的应用
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t07GetAppJoinAuthGroupList() throws Exception{
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("a.yhbh", "26");
		map.put("t.sybz", "Y");
		List<PubApp> pubAppList = PubAppServiceImpl.getAppJoinAuthGroupList(map);
		String outJson = jsonMapper.writeValueAsString(pubAppList);
		logger.info(outJson);
	}
	
	
	/**
	 * 根据条件查询应用列表
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t08getAppList() throws Exception{
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("yhbh", "6");
		List<PubApp> pubAppList = PubAppServiceImpl.getAppList(map);
		String outJson = jsonMapper.writeValueAsString(pubAppList);
		logger.info(outJson);
	}
	
	
}

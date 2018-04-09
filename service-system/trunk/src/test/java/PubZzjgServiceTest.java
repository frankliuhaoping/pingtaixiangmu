import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.htcf.system.dao.PubZzjgDao;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.service.SysOrgService;
import com.htcf.system.service.impl.PubZzjgServiceImpl;
import com.htcf.system.service.impl.PubZzjgsyServiceImpl;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubZzjgServiceTest extends BasicTest {
	
	@Autowired
	private PubZzjgServiceImpl pubZzjgServiceImpl;
	
	@Autowired
	private PubZzjgsyServiceImpl pubZzjgsyServiceImpl;
	@Autowired
	private PubZzjgDao pubZzjgDao;
	
	@Autowired
	private SysOrgService sysOrgService;
	/**
	 * 
	 *  新增组织机构
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t01AddPubZzjg() throws Exception {
		PubZzjg pubZzjg = new PubZzjg();

		pubZzjg.setDwdm("440600010101");
		pubZzjg.setDwmc("指挥中心办公室0101");
		pubZzjgServiceImpl.addPubZzjg(pubZzjg);
		
		String outJson = jsonMapper.writeValueAsString(pubZzjg);
		logger.info(outJson);
	}

	/**
	 * 
	 *  修改组织机构
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t02UpdatePubZzjg() throws Exception {
		PubZzjg pubZzjg = new PubZzjg();
		pubZzjg.setDwdm("222222");
		pubZzjg.setDwmc("测试2!!!");

		pubZzjg = pubZzjgServiceImpl.updatePubZzjg(pubZzjg);

		String outJson = jsonMapper.writeValueAsString(pubZzjg);
		logger.info(outJson);
	}
	
	/**
	 * 
	 *  根据单位代码获取组织机构
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t03GetPubZzjgByDwdm() throws Exception {

		PubZzjg pubZzjg = pubZzjgServiceImpl.getPubZzjgByDwdm("222222");
		String outJson = jsonMapper.writeValueAsString(pubZzjg);
		logger.info(outJson);
	}
	
	
	/**
	 * 
	 * 根据单位代码删除组织机构
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t04DeleltePubZzjg() throws Exception {
		
		int i = pubZzjgServiceImpl.deleltePubZzjg("111111");
		logger.info(i);

	}
	
	/**
	 * 
	 *  根据多个单位代码删除组织机构
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t05DelelteAllPubZzjg() throws Exception {
		String[] str = {"222222","3333333"};
		int i = pubZzjgServiceImpl.deleltePubZzjg(str);
		logger.info(i);

	}

	/**
	 * 
	 * 根据条件获取分页后的组织机构列表
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t06GetListPage() throws Exception {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("offset", "0");
		map.put("limit", "10");
		

		PageInfo<PubZzjg> pageInfo = pubZzjgServiceImpl.getListPage(map);

		String outJson = jsonMapper.writeValueAsString(pageInfo);
		logger.info(outJson);
	}
	
	/**
	 * 
	 * TODO(获取树形结构 组织机构数据)
	 * 
	 * @throws Exception void
	 */
	@Test
	public void t07GetNodesZzjgByDwdm() throws Exception{
		/**
		 * 注意: 以下六条数据 没有根节点    查询所有组织机构时,查询不出来
		 * [{"dwdm":"98033014","dwmc":"高明区更合供电抢修","dhhm":"88846228","pxdm":0,"children":[]},{"dwdm":"98033015","dwmc":"高明区荷城满记开锁","dhhm":"88285555","pxdm":0,"children":[]},{"dwdm":"98033016","dwmc":"高明区永利拖车","dhhm":"88222018","pxdm":0,"children":[]},{"dwdm":"98033017","dwmc":"高明区的士台","dhhm":"88281000","pxdm":0,"children":[]},{"dwdm":"98033018","dwmc":"高明区环保投诉热线","dhhm":"88883340,12369","pxdm":0,"children":[]},{"dwdm":"98033019","dwmc":"高明区行政执法热线","dhhm":"88828960,12319","pxdm":0,"children":[]}]
		 */
		pubZzjgServiceImpl.init();
		List<PubZzjgBo> pubZzjgBoList = pubZzjgServiceImpl.getNodesZzjgByDwdm(null,2);
		
//		List<PubZzjgBo> list = pubZzjgServiceImpl.getagetAllZzjg(null, null);
//		for(int i = 0; i < pubZzjgBoList.size();i ++){
//			if(list.contains(pubZzjgBoList.get(i))){
//				list.remove(pubZzjgBoList.get(i));
//			}
//		}
//		
//		if(list != null && list.size() > 0){
//			String outJson1 = jsonMapper.writeValueAsString(list);
//			logger.info(outJson1);
//		}
		logger.info(pubZzjgBoList.size());
		logger.info(jsonMapper.writeValueAsString(pubZzjgBoList));
	}

	@Test
	public void testZzjgsy()throws Exception{
		logger.info(System.currentTimeMillis());
		List<PubZzjgBo> list = pubZzjgsyServiceImpl.queryPubZzjgBoByZdbh("system_zzjgsybz_jcj1", 1, "441900000000");
		logger.info(System.currentTimeMillis());
		String outJson = jsonMapper.writeValueAsString(list);
		System.out.println(outJson);
	}
	
	
	
//	@Test
//	public void testZzjgsy1()throws Exception{
//		logger.info(System.currentTimeMillis());
//		List<PubZzjgBo> list =pubZzjgServiceImpl.getNodesZzjgByDwdmView("system_zzjgsybz_jcj1", 2);
//		logger.info(System.currentTimeMillis());
//		String outJson = jsonMapper.writeValueAsString(list);
//		System.out.println(outJson);
//	}
//	
	
	
	@Test
	public void testZzjgsy2()throws Exception{
		logger.info(System.currentTimeMillis());

		List<PubZzjgBo> list = pubZzjgsyServiceImpl.queryPubZzjgBoByZdbh("system_zzjgsybz_jcj1", 2);
		String outJson = jsonMapper.writeValueAsString(list);
		System.out.println(outJson);
	}
	
	
	/**
	 * 根据dwdm,zdbh 获取当前组织结构使用级别
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03getPubZzjgsyLevel() throws Exception {
		String dwdm="441900540000";
		String zdbh="system_zzjgsybz_jcj2";
		int level=pubZzjgsyServiceImpl.getPubZzjgsyLevel(dwdm,zdbh);
		logger.info(level);
	}
	
	
	//批量新增
	@Test
	public void t04InsertBatch() throws Exception {
	long startTime = System.currentTimeMillis();	
	List<SysOrg> list = sysOrgService.getList();
	int i = pubZzjgServiceImpl.insertBatch(list);
	logger.info(i);
	long endTime = System.currentTimeMillis(); // 获取结束时间  
    System.out.println("程序运行时间： " + (endTime - startTime) + "ms");  
	}
		
	//批量更新
	@Test
	public void t04UpdateBatch() throws Exception {
	long startTime = System.currentTimeMillis();	
	List<SysOrg> list = sysOrgService.getList();
	int i = pubZzjgServiceImpl.updateBatch(list);
	logger.info(i);
	long endTime = System.currentTimeMillis(); // 获取结束时间  
    System.out.println("程序运行时间： " + (endTime - startTime) + "ms");  
	}	
}

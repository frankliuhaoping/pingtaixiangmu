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
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.service.impl.PubZzjgServiceImpl;
import com.htcf.system.service.impl.PubZzjgsyServiceImpl;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubZzjgsyServiceTest extends BasicTest {

	@Autowired
	private PubZzjgsyServiceImpl pubZzjgsyServiceImpl;

	@Autowired
	private PubZzjgServiceImpl pubZzjgServiceImpl;

	@Test
	public void testZzjgsy2() throws Exception {
		logger.info(System.currentTimeMillis());
		List<PubZzjgBo> list = pubZzjgsyServiceImpl.queryPubZzjgBoByZdbh("system_zzjgsybz_jcj1", 2);
		String outJson = jsonMapper.writeValueAsString(list);
		System.out.println(outJson);
	}

	@Test
	public void testZzjgsy3() throws Exception {
		logger.info(System.currentTimeMillis());
		List<PubZzjgBo> list = pubZzjgsyServiceImpl.queryPubZzjgBoByZdbh("system_zzjgsybz_jcj1", 1);
		String outJson = jsonMapper.writeValueAsString(list);
		System.out.println(outJson);
	}

	/**
	 * 根据dwdm,zdbh 获取当前组织结构使用级别 TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t03getPubZzjgsyLevel() throws Exception {
		String dwdm = "441900000000";
		String zdbh = "system_zzjgsybz_cxtj";
		int level = pubZzjgsyServiceImpl.getPubZzjgsyLevel(dwdm, zdbh);
		logger.info(level);
	}

	/**
	 * 各种获取数据 TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @throws Exception
	 */
	@Test
	public void t04getPubJqxzByZdbh() throws Exception {
		pubZzjgServiceImpl.init();
		long startTime = System.currentTimeMillis();
		String dwdm = "441900525200";
		String zdbh = "system_zzjgsybz_ksh";
		int deepType = 0;
		List<PubZzjgBo> list = pubZzjgsyServiceImpl.getPubZzjgBoByZdbh(zdbh, dwdm, deepType);
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(list.size());
		logger.info(outJson);
		long endTime = System.currentTimeMillis(); // 获取结束时间
		System.out.println("程序运行时间： " + (endTime - startTime) + "ms");

	}

}

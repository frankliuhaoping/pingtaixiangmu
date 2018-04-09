import java.util.Date;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.service.impl.PubXtzdServiceImpl;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PubXtzdServiceTest extends BasicTest{
	@Autowired
	private PubXtzdServiceImpl pubXtzdServiceImpl;
	
	private static String bh = "4bc59356b91d480e90190e6ccd8ae14e";
	
	/**
	 * 测试新增文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t01AddXtzd() throws Exception {
		PubXtzd pubXtzd = new PubXtzd();
		pubXtzd.setYyid("1");
		pubXtzd.setZdbh("zdbh");
		pubXtzd.setZdxm("zdxm");
		pubXtzd.setZdxz("zdxz");
		pubXtzd.setSjms("sjms");
		pubXtzd.setPxdm(new Long(0));
		pubXtzd.setSybz("Y");
		pubXtzd.setCjsj(new Date());
		pubXtzd.setGxsj(new Date());
		pubXtzd = pubXtzdServiceImpl.addPubXtzd(pubXtzd);
		
		bh = pubXtzd.getBh();
		String outJson = jsonMapper.writeValueAsString(pubXtzd);
		logger.info(bh);
	}
	
	/**
	 * 测试查找文件
	 * 
	 * @throws Exception
	 */
	@Test
	public void t02GetXtzd() throws Exception {
		PubXtzd pubXtzd = pubXtzdServiceImpl.getPubXtzdByBh(bh);
		logger.info(pubXtzd);
	}

	/**
	 * 测试修改文件
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void t03UpdateXtzd() throws Exception{
		PubXtzd pubXtzd = new PubXtzd();
		pubXtzd.setBh(bh);
		pubXtzd.setZdbh("zdbh11");
		pubXtzd = pubXtzdServiceImpl.updatePubXtzd(pubXtzd);
		String outJson = jsonMapper.writeValueAsString(pubXtzd);
		logger.info(outJson);
	}


	@Test
	public void t04DeleteXtzd() throws Exception {
		logger.info(pubXtzdServiceImpl.deleltePubXtzdByBh(bh));
	}
	
	@Test
	public void t03getList() throws Exception{
		PubXtzd pubXtzd = new PubXtzd();
		pubXtzd.setZdbh("zdbh11");
		List<PubXtzd> list= pubXtzdServiceImpl.getPubXtzdListByZdbh("1", "system_zylx");
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
	}
	
	
	@Test
	public void t05getStringMapByZdbh() throws Exception {
		logger.info(pubXtzdServiceImpl.getStringMapByZdbh("1", "system_test_01"));
		
		logger.info(pubXtzdServiceImpl.getStringMapByZdbh(null, null));
		
		//logger.info(pubXtzdServiceImpl.getStringMap(1L, "system_test_01"));
	}
	
	@Test
	public void t06getStringMapByZdbh() throws Exception {
		logger.info(pubXtzdServiceImpl.getStringMapByZdbh("1", "system_test_01"));
		
		logger.info(pubXtzdServiceImpl.getStringMapByZdbh("1", null));
		
		//logger.info(pubXtzdServiceImpl.getStringMap(1L, "system_test_01"));
	}
	
	@Test
	public void t07getPubXtzdNodesById()throws Exception{
		String yyid ="1";
		String zdfbh="";
		int deepType= 0;
		List<PubXtzdBo> list = pubXtzdServiceImpl.getPubXtzdNodesById(yyid, zdfbh, deepType);
		String outJson = jsonMapper.writeValueAsString(list);
		logger.info(outJson);
	}
}

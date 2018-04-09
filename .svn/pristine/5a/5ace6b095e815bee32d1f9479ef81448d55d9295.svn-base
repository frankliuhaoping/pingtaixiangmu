import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.system.dao.DemoJjdbDao;
import com.htcf.system.model.po.DemoJjdb;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class DemoJjdbTest extends BasicTest {
	
	private static final Logger logger = LogManager.getLogger(DemoJjdbTest.class);

	@Autowired
	private DemoJjdbDao demoJjdbDao;
	

	@Test
	public void test(){
		DemoJjdb dj = new DemoJjdb();
		dj.setJjdbh("232");
		demoJjdbDao.add(dj);
		//System.out.println("dssssssdsd");
		//demoUserService.add();
		//demoUserService.getAll();
		//demoUserService.getPageInfo();
		//demoUserService.transfer();
//		System.out.println(demoUserService.getAll());
		//System.out.println(realDemoUserService.findByLoginAccount("admin"));
		//System.out.println(realDemoUserService.findPrivilegeByRole(0));
	}
}

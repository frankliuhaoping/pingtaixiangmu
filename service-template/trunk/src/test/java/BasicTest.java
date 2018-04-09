
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author chenshizhe
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-context.xml")
public class BasicTest {
	
	Logger logger = LogManager.getLogger(BasicTest.class);
	
	ObjectMapper jsonMapper = new ObjectMapper().setSerializationInclusion(Include.NON_NULL);
	
	@Test
	public void basicTest() throws Exception {
		
		System.out.println("basicTest---------------");
	}

}

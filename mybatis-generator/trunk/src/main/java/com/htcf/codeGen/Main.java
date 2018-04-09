package com.htcf.codeGen;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.htcf.codeGen.bean.Table;

public class Main {
	public static void main(String[] args) {
		//数据库连接参数
		String url = "192.168.0.2:1521:cf110";
		String userName = "dgga110";
		String pwd = "110110";
		
		//模板替换参数
		Map<String,String> templReplace = new HashMap<String,String>();
		templReplace.put("tableName", "T_PUB_APP");
		templReplace.put("seqName", "SEQ_PUB_APP");
		templReplace.put("entityName", "PubApp");
		templReplace.put("comment", "用户");
		templReplace.put("priKey", "YYID");
		
		//生成的路径，目录必须先存在
		String generatorPath = "d:/test/";
		
		//如果替换了模板也需要修改对应的文件
		String bo = Main.class.getResource("/template/PubAppBo.java").getFile();
		String po = Main.class.getResource("/template/PubAppDao.java").getFile();
		String mapper = Main.class.getResource("/template/PubAppMapper.xml").getFile();
		
		AppService service = new AppService();
		
		try {
			//取表
			List<Table> tables = service.getTables(url, userName, pwd);
			//生成POJO
			service.tablesToPojos(tables, generatorPath+"/po/", "com.htcf.system.model.po");
			//根据模板生成代码
//			service.geneCodeByTempl(tables, templReplace, "d:/test/templ/PubAppBo.java", "d:/test/target/bo/", "Bo.java");
//			service.geneCodeByTempl(tables, templReplace, "d:/test/templ/PubAppDao.java", "d:/test/target/dao/", "Dao.java");
//			service.geneCodeByTempl(tables, templReplace, "d:/test/templ/PubAppMapper.xml", "d:/test/target/mapper/", "Mapper.xml");
		
			//Test.class.getResource("/javaapplication/file3.txt").getFile()
			
			
			service.geneCodeByTempl(tables, templReplace, bo, generatorPath+"/bo/", "Bo.java");
			service.geneCodeByTempl(tables, templReplace, po, generatorPath+"/dao/", "Dao.java");
			service.geneCodeByTempl(tables, templReplace, mapper, generatorPath+"/mapper/", "Mapper.xml");

		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("complete");
	}

}

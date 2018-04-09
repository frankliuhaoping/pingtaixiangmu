package com.htcf.codeGen;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.htcf.codeGen.bean.Col;
import com.htcf.codeGen.bean.Table;

public class AppService {
	public List<Table> getTables(String url, String userName, String pwd) throws Exception {
		DbUtils.loadDriver("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@"+url, userName, pwd); // orcl实例名,用户名,密码
		try {
			//查所有表名及注释
			List<Table> tableList = this.query(conn, 
					"select table_name name, comments " +
					"from user_tab_comments " +
					"where table_type = 'TABLE' " +
					"order by table_name", Table.class);
			
			//将字段组装到表中
			for(Table table : tableList) {
				table.setClzName(this.toClzName(table.getName()));//表名 -> 实体名
				if(table.getComments() == null) {
					table.setComments("");
				}
				
				//表名 --> 序列名
				table.setSeqName("SEQ_"+table.getName().substring(table.getName().indexOf("_")+1));
				
				//查该表下的字段
				StringBuffer sql = new StringBuffer();
				sql.append("select "
						+ "t.table_name tableName, "
						+ "t.column_name name, "
						+ "t.data_type dataType, "
						+ "t.data_length length, "
						+ "t.data_precision precision, "
						+ "t.data_scale scale, "
						+ "t2.comments ");
				sql.append("from user_tab_columns t ");
				sql.append("left join user_col_comments t2 on t2.table_name=t.TABLE_NAME and t2.column_name=t.COLUMN_NAME ");
				sql.append("where 1=1 and t.table_name = '"+table.getName()+"' ");
				sql.append("order by t.table_name, t.column_id");
				List<Col> colList = this.query(conn, sql.toString(), Col.class);
				
				for(Col col : colList) {
					if (mapType(col) != null) {
						col.setJavaType(mapType(col));//字段类型 -> java类型
						col.setPropName(this.toPropName(col.getName()));//字段名 -> 属性名
						if(col.getComments() == null) {
							col.setComments("");
						}
					}
				}
				
				table.setPriKey(colList.get(0).getName());
				table.setColList(colList);
				
			}
			return tableList;
		} finally {
			conn.close();
		}
	}

	/**
	 * 将tables转化位实体类s
	 * @param tables
	 * @param dir
	 */
	public void tablesToPojos(List<Table> tables, String dir, String tarPackage) {
		for(Table table : tables) {
			String strPackage = "package "+tarPackage+";\n\n";
			String strImport = "import java.io.Serializable;\n";
			StringBuffer sbProps = new StringBuffer("\n");
			StringBuffer sbFuncs = new StringBuffer("\n");
			
			sbProps.append("/** "+table.getComments()+" */\n");
			sbProps.append("public class "+table.getClzName()+" implements Serializable{\n");
			for(Col col : table.getColList()) {
				sbProps.append("\tprivate "+col.getJavaType()+" "+col.getPropName()+"; //"+col.getComments()+"\n");
				if (col.getJavaType() == null) {
					continue;
				}
				if(col.getJavaType().equals("Date") && !strImport.contains("java.util.Date")) {
					strImport += "import java.util.Date;\n";
				}
				sbFuncs.append(this.genGetterAndSetter(col));
			}
			sbFuncs.append("}\n");
			
			String txt = strPackage + strImport + sbProps + sbFuncs;
			this.writeFile(dir+table.getClzName()+".java", txt);
		}
	}
	
	/**
	 * 根据模板生成代码
	 * @param tables 表s
	 * @param replace 替换参数
	 * @param templFilePath 模板文件路径
	 * @param targetDir 目标路径
	 * @param suffix 后缀，如 "Dao.java", "Mapper.xml"
	 */
	public void geneCodeByTempl(List<Table> tables, Map<String, String> replace, String templFilePath, String targetDir, String suffix) {
		for(Table table : tables) {
			File file = new File(templFilePath);
			if(!file.exists()) {
				continue;
			}
			
			//取模板文本
			String txt = this.readFile(file);
			
			//替换内容
			txt = txt.replaceAll(replace.get("comment"), table.getComments());//实体类的注释
			txt = txt.replaceAll(replace.get("entityName"), table.getClzName());//实体类名
			txt = txt.replaceAll(replace.get("tableName"), table.getName());//表名
			txt = txt.replaceAll(replace.get("seqName"), table.getSeqName());//序列名
			txt = txt.replaceAll(replace.get("priKey"), table.getPriKey());//主键字段
			
			//写文本
			this.writeFile(targetDir + table.getClzName() + suffix, txt);
		}
	}
	
	
	//-------------privates------------
	/**
	 * 由字段映射出java数据类型
	 * @param col
	 * @return
	 */
	private String mapType(Col col) throws Exception {
		String javaType = null;
		if("NUMBER".equals(col.getDataType())) {
			if(col.getScale() == null) {
				javaType = "Long";
			} else {
				if(col.getScale() != 0) {
					javaType = "Double";
				} else {
					if (col.getPrecision() != null) {
						if(col.getPrecision() < 8) {
							javaType = "Integer";
						} else {
							javaType = "Long";
						}
					} else {
						return null;
					}
				}
			}
		} else if("NVARCHAR2".equals(col.getDataType())) {
			javaType = "String";
		} else if("VARCHAR2".equals(col.getDataType())) {
			javaType = "String";
		} else if("CHAR".equals(col.getDataType())) {
			javaType = "String";
		} else if("CLOB".equals(col.getDataType())) {
			javaType = "String";
		} else if("FLOAT".equals(col.getDataType())) {
			javaType = "Double";
		} else if("DATE".equals(col.getDataType())) {
			javaType = "Date";
		} else if(col.getDataType().startsWith("TIMESTAMP")) {
			javaType = "Date";
		}
		if(javaType == null) {
			throw new Exception("无法映射Java数据类型,"+col.getDataType());
		}
		return javaType;
	}
	/**
	 * 表名转实体类名
	 */
	private String toClzName(String tableName) {
		String str = tableName.toLowerCase();
		if(str.startsWith("t_") || str.startsWith("T_")) {
			str = str.substring(2);
		}
		str = upperFirst(str);
		while(str.contains("_")) {
			int i = str.indexOf("_");
			str = str.substring(0, i) + upperFirst(str.substring(i+1));
		}
		return str;
	}
	
	/**字段名转为属性名*/
	private String toPropName(String colName) {
		String str = colName.toLowerCase();
		while(str.contains("_")) {
			int i = str.indexOf("_");
			str = str.substring(0, i) + upperFirst(str.substring(i+1));
		}
		return str;
	}
	
	/**
	 * 转首字母大写
	 * @param str
	 * @return
	 */
	private String upperFirst(String str) {
		return str.substring(0, 1).toUpperCase()+str.substring(1);
	}

	/**
	 * 创建getter & setter
	 * @param propName
	 * @param type
	 * @return
	 */
	private String genGetterAndSetter(Col col) {
		String propName = col.getPropName();
		String type = col.getJavaType();
		String comment = col.getComments();
		
		StringBuffer bf = new StringBuffer();
		bf.append("\t/** "+comment+" */\n");
		bf.append("\tpublic void set"+upperFirst(propName)+"("+type+" "+propName+") {\n");
		bf.append("\t	this."+propName+" = "+propName+";\n");
		bf.append("\t}\n");
		bf.append("\t/** "+comment+" */\n");
		bf.append("\tpublic "+type+" get"+upperFirst(propName)+"() {\n");
		bf.append("\t	return "+propName+";\n");
		bf.append("\t}\n");
		
		return bf.toString();
	}
	
	/**
	 * 读文本
	 * @param filePath
	 * @return
	 */
	private String readFile(File file) {
		String txt = null;
		//取模板文本
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			byte[] bytes = new byte[(int)file.length()];
			fis.read(bytes);
			txt = new String(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return txt;
	}
	
	/**
	 * 写文本
	 * @param filePath
	 * @param txt
	 */
	private void writeFile(String filePath, String txt) {
		//如果目录不存在则自动创建
		String dir = filePath.substring(0, filePath.lastIndexOf("/"));
		File file =new File(dir);
		if(!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		
		//写文本
		FileWriter fw = null;
		try {
			fw = new FileWriter(new File(filePath));
			fw.write(txt);
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 查询数据
	 * @param <T>
	 * @param conn
	 * @param sql
	 * @param clz
	 * @param sqlParam
	 */
	private <T> List<T> query(Connection conn, String sql, Class<T> clz, Object...sqlParam) throws SQLException {   
        QueryRunner qr = new QueryRunner();
        System.out.println("==> "+sql);
        List<T> list = qr.query(conn, sql, new BeanListHandler<T>(clz), sqlParam);
        System.out.println("<== "+list.size());
        return list;
	}

}

package com.java;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactory {
	
	public static org.apache.ibatis.session.SqlSessionFactory ssf;
	
	static {
		try {
			String resource = "com/java/MybatisConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			ssf = (org.apache.ibatis.session.SqlSessionFactory) new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static org.apache.ibatis.session.SqlSessionFactory getSession(){
		return ssf;
	}
}

package com.java.common;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClientManager {
	public static SqlSessionFactory ssf;
	
	static{
		try {
			String resource = "MybatisConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			ssf = (SqlSessionFactory) new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSession(){
		return ssf;
	}
}

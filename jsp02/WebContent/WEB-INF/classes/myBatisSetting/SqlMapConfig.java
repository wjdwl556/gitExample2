package myBatisSetting;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class SqlMapConfig {
    //�ۼ��� sqlMapConfig.xml ��üȭ �ϴ� Ŭ����
	
   private static SqlSessionFactory sqlsession;
   
   static{
	  try {
		  
		String resource ="./myBatisSetting/sqlMapConfig.xml";
		  Reader reader = Resources.getResourceAsReader(resource); 
		  sqlsession = new SqlSessionFactoryBuilder().build(reader);
		  reader.close();
		  
	 
	  } catch (IOException e) {
		  
		e.printStackTrace();
		throw new RuntimeException("�ʱ�ȭ ����: "+ e);
	
	  }
   }
   
   public static SqlSessionFactory getSqlMapInstance(){
	
	   return sqlsession;
   }
   
}







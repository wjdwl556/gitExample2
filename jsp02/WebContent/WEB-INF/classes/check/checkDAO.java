package check;

import myBatisSetting.SqlMapConfig;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class checkDAO {

	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession; 
	
	public checkDAO() {
		
		sqlsession = sessionf.openSession(true); 
		
	}
	
	
	public String selectid(String param) {
		
		
		String result = sqlsession.selectOne("selectid",param);
		
		
		return result;
	}

}

package gi.offline.studymbr.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		String resource =  "gi/offline/studymbr/db/studymbr-config.xml";
		Reader reader = null;
		
		try {
			
			reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception e) {
			System.out.println("[ERROR] : SqlMapConfig");
			e.printStackTrace();
		}finally {
			try {
				reader.close();
			} catch (IOException e) {
				System.out.println("[ERROR] : reader close");
				e.printStackTrace();
			}
		}
		return sqlSessionFactory;
		
		
	}
	
	

}

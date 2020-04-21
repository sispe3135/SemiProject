package gi.offline.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import gi.offline.study.db.SqlMapConfig;
import gi.offline.study.dto.giStudyDto;

public class giStudyDao extends SqlMapConfig{
	
	private String namespace = "gi.offline.study.mapper.";
	
	public int insertOffStudy(giStudyDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			
			if(res > 0) {
				session.commit();
			}
			
		}catch(Exception e) {
			System.out.println("[ERROR] : insertOffStudy");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return res;		
		
	}
	
	// 날짜를 클릭했을 때 일정을 받아오는 역할
	public List<giStudyDto> getCalList(String stdId, String yyyyMMdd){
		
		
		
		SqlSession session = null;
		List<giStudyDto> list = null;
		giStudyDto dto = new giStudyDto();
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			
			dto.setStdId(stdId);
			dto.setStdDt(yyyyMMdd);
			
			list = session.selectList(namespace+"getCalList", dto);
			
		}catch(Exception e) {
			System.out.println("[ERROR] : getCalList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		
		return list;
	}
	
	// 달력에 일정을 띄우는 역할
	// 3개 일정 보여주기 + row_number() sql
		public List<giStudyDto> getCalViewList(String stdId, String stdDt){
			
			SqlSession session = null;
			List<giStudyDto> list = null;
			giStudyDto dto = new giStudyDto();
			
			try {
				
				session = getSqlSessionFactory().openSession(true);
				
				dto.setStdId(stdId);
				dto.setStdDt(stdDt);
				
				list = session.selectList(namespace+"getCalViewList", dto);
				
			}catch(Exception e) {
				System.out.println("[ERROR] : getCalViewList");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			
			return list;
		}
		
		// ajax
		// DB 글 갯수 들고오는 메소드
		// 마우스 포인터하면 풍선처럼 나오는거
		public int getCalViewCount(String stdId, String stdDt) {
			
			SqlSession session = null;
			giStudyDto dto = new giStudyDto();
			int res = 0;
			
			try {
				
				session = getSqlSessionFactory().openSession(false);
				
				dto.setStdId(stdId);
				dto.setStdDt(stdDt);
				
				res = session.selectOne(namespace+"getCalViewCount", dto);
				
				if(res > 0) {
					session.commit();
				}
				
			}catch(Exception e) {
				System.out.println("[ERROR] : getCalViewList");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return res;
		}
	
}

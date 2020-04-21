package gi.offline.studymbr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import gi.offline.studymbr.db.SqlMapConfig;
import gi.offline.studymbr.dto.giStdMbrDto;
import gi.online.dto.giOnlineDto;



public class giStdMbrDao extends SqlMapConfig{
	
	private String namespace = "gi.offline.studymbr.mapper.";
	
	
	
	// 날짜를 클릭했을 때 일정을 받아오는 역할
	public List<giStdMbrDto> getCalViewListById(String Id, String stdDt){
		
		
		
		SqlSession session = null;
		List<giStdMbrDto> list = null;
		giStdMbrDto dto = new giStdMbrDto();
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			
			dto.setId(Id);
			dto.setStdDt(stdDt);
			
			list = session.selectList(namespace+"getCalViewListById", dto);
			
		}catch(Exception e) {
			System.out.println("[ERROR] : getCalViewListByID");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		
		return list;
	}
	// 날짜를 클릭했을 때 일정을 받아오는 역할
		public List<giStdMbrDto> getCalList(String Id, String yyyyMMdd){
			
			
			
			SqlSession session = null;
			List<giStdMbrDto> list = null;
			giStdMbrDto dto = new giStdMbrDto();
			
			try {
				
				session = getSqlSessionFactory().openSession(true);
				
				dto.setId(Id);
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
		
		
		// 채팅방 참여 함수
		public int offlineJoin(giStdMbrDto dto) {
			
			SqlSession session = null;
			int res = 0;
			
			try {
				
				session = getSqlSessionFactory().openSession(false);
				res = session.insert(namespace+"offlinejoin", dto);
				
				if(res > 0) {
					session.commit();
				}
		
						
				
			}catch(Exception e) {
				System.out.println("[ERROR] : offlinejoin");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return res;
		}
		
		public giStdMbrDto getOffSeq(giStdMbrDto dto) {
			
			SqlSession session = null;
			
			giStdMbrDto seqDto = null;
			
			try {
				
				session = getSqlSessionFactory().openSession(true);
				
				seqDto = session.selectOne(namespace+"getOffSeq", dto);
				
			}catch(Exception e) {
				System.out.println("[ERROR] : getOffSeq");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			
			
			
			return seqDto;
		}
		
		// 참가할 수 있는 방의 정보를 받아오는 역할
		public List<giStdMbrDto> offlineListAll() {
			SqlSession session = null;
			List<giStdMbrDto> list = null;
			
			try {
				session=getSqlSessionFactory().openSession(true);
				list=session.selectList(namespace+"offlineListAll");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("ERROR : offlineListAll");
			}finally {
				session.close();
			}
			
			
			return list;
		}
		
		public giStdMbrDto offlineDetail(int seq) {
			
			SqlSession session = null;
			
			giStdMbrDto seqDto = null;
			
			try {
				
				session = getSqlSessionFactory().openSession(true);
				
				seqDto = session.selectOne(namespace+"offlineDetail", seq);
				
			}catch(Exception e) {
				System.out.println("[ERROR] : offlineDetail");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			
			
			
			return seqDto;
		}
		
		// 오프라인 방번호를 통해 사람들의 아이디 리스트를 받아온다
		public List<giStdMbrDto> offStdMbrList(int seq){
			
			
			
			SqlSession session = null;
			List<giStdMbrDto> list = null;
		
			
			try {
				
				session = getSqlSessionFactory().openSession(true);
				list = session.selectList(namespace+"offStdMbrList", seq);
				
			}catch(Exception e) {
				System.out.println("[ERROR] : offStdMbrList");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return list;
		}
	
}

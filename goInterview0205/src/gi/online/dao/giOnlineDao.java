package gi.online.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import gi.offline.study.dto.giStudyDto;
import gi.online.db.SqlMapConfig;
import gi.online.dto.giOnlineDto;



public class giOnlineDao extends SqlMapConfig{
	
	private String namespace = "gi.online.mapper.";
	
	
	
	// 날짜를 클릭했을 때 일정을 받아오는 역할
	public List<giOnlineDto> getCalViewListById(String Id, String chatStDt){
		
		
		
		SqlSession session = null;
		List<giOnlineDto> list = null;
		giOnlineDto dto = new giOnlineDto();
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			
			dto.setId(Id);
			dto.setChatStDt(chatStDt);
			
			list = session.selectList(namespace+"getCalViewListById", dto);
			
		}catch(Exception e) {
			System.out.println("[ERROR] : getCalViewListByID");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		
		return list;
	}
	// 채팅방 만드는 함수
	public int insertOnlineChat(giOnlineDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			
			if(res > 0) {
				session.commit();
			}
	
					
			
		}catch(Exception e) {
			System.out.println("[ERROR] : insertOnlineChat");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return res;		
		
	}
	// 채팅방 참여 함수
	public int onlineJoin(giOnlineDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"onlinejoin", dto);
			
			if(res > 0) {
				session.commit();
			}
	
					
			
		}catch(Exception e) {
			System.out.println("[ERROR] : onlinejoin");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public giOnlineDto getChatSeq(giOnlineDto dto) {
		
		SqlSession session = null;
		
		giOnlineDto seqDto = null;
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			
			seqDto = session.selectOne(namespace+"getChatSeq", dto);
			
		}catch(Exception e) {
			System.out.println("[ERROR] : getChatSeq");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		
		
		return seqDto;
	}
	
// HASHMAP으로 하기!!!
	
	// 날짜를 클릭했을 때 일정을 받아오는 역할
	public List<giOnlineDto> getChatList(String Id, String yyyyMMdd){
		
		
		
		SqlSession session = null;
		List<giOnlineDto> list = null;
		giOnlineDto dto = new giOnlineDto();
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			
			dto.setId(Id);
			dto.setChatStDt(yyyyMMdd);
			
			list = session.selectList(namespace+"getChatList", dto);
			
		}catch(Exception e) {
			System.out.println("[ERROR] : getChatList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	
	
	// 참가할 수 있는 방의 정보를 받아오는 역할
	public List<giOnlineDto> onlineListAll() {
		SqlSession session = null;
		List<giOnlineDto> list = null;
		
		try {
			session=getSqlSessionFactory().openSession(true);
			list=session.selectList(namespace+"onlineListAll");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : onlineListAll");
		}finally {
			session.close();
		}
		
		
		return list;
	}
	
}

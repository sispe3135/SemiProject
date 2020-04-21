package gi.user.dao;

import org.apache.ibatis.session.SqlSession;
import gi.user.db.SqlMapConfigPay;
import gi.user.dto.MemberDto;

public class KakaoPayDao extends SqlMapConfigPay{
	
	private String namespace = "com.pay.mapper.";
	public int updatePay(MemberDto dto) {
		
		SqlSession session =null;
		int res = 0;
		
		try {
			
			session = getSqlSessionFactory().openSession(true); 
			res=session.update(namespace+"updatePay",dto);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("ERROR : kakaoPayDao : update");
			
		} finally {
			session.close();
		}
		
		return res;
	}

	public MemberDto dalCnt(String id) {
		
		SqlSession session =null;
		MemberDto dto = new MemberDto();
		
		try {
			
			session = getSqlSessionFactory().openSession(true); 
			dto=session.selectOne(namespace+"selectDalCnt", id);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("ERROR : kakaoPayDao : dalCnt");
			
		} finally {
			session.close();
		}
		
		return dto;
		
	}
	

}

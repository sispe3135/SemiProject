package gi.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gi.qna.db.SqlMapConfig;
import gi.qna.dto.giQnaDto;

public class giQnaDao extends SqlMapConfig {

	private String namespace = "gi.qna.db.qnaListMapper.";
	
	public List<giQnaDto> selectQnaList(Map<String, Object> params){
		SqlSession session = null;
		List<giQnaDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"selectQnaList", params);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectQnaList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public int cntQnaList(){
		SqlSession session = null;
		int cntRow = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			cntRow = session.selectOne(namespace+"cntQnaList");
		} catch (Exception e) {
			System.out.println("[ERROR] : cntQnaList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cntRow;
	}

	public giQnaDto selectQnaOne(int qSeq) {
		SqlSession session = null;
		giQnaDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(namespace+"selectQnaOne", qSeq);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectQnaOne");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insert(giQnaDto dto) {
		SqlSession session = null;
		int res = 0;

		if(dto.getqOriFileNm() == null) {
			dto.setqOriFileNm("");
			dto.setqSaveFileNm("");
			dto.setqSavePath("");
		}
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"insertQnaOne", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insert");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;
	}
	
	public int update(giQnaDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"updateQnaAnswer", dto);
		} catch(Exception e) {
			System.out.println("[ERROR] : update");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

}

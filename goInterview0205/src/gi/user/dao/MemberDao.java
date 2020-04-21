package gi.user.dao;



import gi.user.db.SqlMapConfig;
import gi.user.dto.MemberDto;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
//import static gi.user.db.JDBCTemplate.*;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSession;


public class MemberDao extends SqlMapConfig{
	private String namespace = "com.login.mapper.";
	/*
	 * 관리자 기능
	 * 1. 회원 전체 정보(탈퇴 회원 포함)
	 * 2. 회원 전체 정보(탈퇴 회원 미포함)
	 * 3. 회원 등급 조정
	 */


	
	
	/*
	 * 유저 기능
	 * 1. 아이디 중복체크 
	 * 2. 회원가입	
	 * 3. 로그인
	 * 4. 내 정보 조회
	 * 5. 내 정보 수정
	 * 6. 회원 탈퇴(update: myenabled y->n)
	 */
	public List<MemberDto> selectListAll() {
		SqlSession session=null;
		List<MemberDto> list=null;
	    InputStream inputStream=null;
	    
	    String resource = "gi/user/db/login-config.xml";

		try {
		
			inputStream = Resources.getResourceAsStream(resource);
			session=getSqlSessionFactory().openSession(true);
			list=session.selectList(namespace+"selectListAll");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}

		return list;
	}
	
	public MemberDto login(MemberDto dto) {
		//int myno=Integer.parseInt(seq);
		SqlSession session =null;
		MemberDto res = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res=session.selectOne(namespace+"login",dto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ERROR : login");
		} finally {
			session.close();
		}
		
		
		return res;
	}

	
	public MemberDto selectOne(int id_seq) {
		//int myno=Integer.parseInt(seq);
		SqlSession session =null;
		MemberDto res = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res=session.selectOne(namespace+"selectOne",id_seq);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ERROR : selectone");
		} finally {
			session.close();
		}
		
		
		return res;
	}
	
	public MemberDto selectOnebyID(String id) {
		SqlSession session =null;
		MemberDto res = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res=session.selectOne(namespace+"selectOnebyID",id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ERROR : selectone");
		} finally {
			session.close();
		}
		
		
		return res;
	}
	

	public MemberDto idChk(String id){
		//int no=Integer.parseInt(id_seq );
		//int myno=Integer.parseInt(seq);
		SqlSession session =null;
		MemberDto res = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res=session.selectOne(namespace+"idChk",id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ERROR : selectone");
		} finally {
			session.close();
		}
		
		
		return res;
	}

	public int insert(MemberDto dto) {
		System.out.println("호출했음");
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"insert", dto);
			System.out.println("세션에 담김");
			if(res > 0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	// 회원 삭제 - 사실은 가입여부 바꾸고 원인을 적어준다.
	public int updateout(MemberDto dto) {
		SqlSession session =null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true); // default : false - 
			res=session.update(namespace+"updateout",dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ERROR : updateout");
		} finally {
			session.close();
		}
		
		return res;
	}
	
	

	
	public int update(MemberDto dto) {
		SqlSession session=null;
		int res=0;
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			res=session.update(namespace+"updatebyID",dto);
			System.out.println(res);
		
		} catch (Exception e) {
			System.out.println("ERROR : update");
			// TODO: handle exception
		}finally {
			session.close();
		}
		return res;	
	}
	
	public MemberDto findMyno(String id) {
		SqlSession session=null;
		MemberDto res=null;
		
		try {
			
			session=getSqlSessionFactory().openSession(true);
			res=session.selectOne(namespace+"findmyno",id);
			System.out.println(res);
		
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return res;	
	}
	
	
	public List<MemberDto> selectMbrAll(){
		SqlSession session = null;
		List<MemberDto> list=null;
		
		try {
			session=getSqlSessionFactory().openSession(true);
			list=session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : selectList");
		}finally {
			session.close();
		}
		
		return list;
	}
	

	
}

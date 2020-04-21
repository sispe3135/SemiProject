package gi.user.biz;

import java.util.List;

import gi.user.dao.MemberDao;
import gi.user.dto.MemberDto;



public class MemberBiz {
	
	private MemberDao dao=new MemberDao();
	
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}
	
//	public List<MemberDto> selectListAll(){
//		return dao.selectListAll();
//	}
//	public List<MemberDto> selectListEnabled(){
//		return dao.selectListEnabled();
//	}
	
	public MemberDto selectOne(int id_seq) {
		return dao.selectOne(id_seq);
	}
	
//	public int updateRole(int id_seq, String id_gubun) {
//		
//		return dao.updateRole(id_seq, id_gubun);
//	}
	
	public MemberDto idChk(String id) {
		return dao.idChk(id);
		
	}
	
	public int insert(MemberDto dto) {
		return dao.insert(dto);
	}
	
	
	public int updateout(MemberDto dto) {
		return dao.updateout(dto);
	}
	
	public MemberDto selectOnebyID(String id) {
		return dao.selectOnebyID(id);
	}
	
	public int update(MemberDto dto) {
		return dao.update(dto);
	}
	
	public MemberDto findMyno(String id) {
		return dao.findMyno(id);
	}
	public List<MemberDto> selectListAll(){
		return dao.selectListAll();
	}
	
	public List<MemberDto> selectMbrAll(){
		return dao.selectMbrAll();
	}
}

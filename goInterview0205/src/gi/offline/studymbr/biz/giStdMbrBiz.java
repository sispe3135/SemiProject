package gi.offline.studymbr.biz;

import java.util.List;


import gi.offline.studymbr.dao.giStdMbrDao;
import gi.offline.studymbr.dto.giStdMbrDto;




public class giStdMbrBiz {
	giStdMbrDao dao=new giStdMbrDao();
	
	public List<giStdMbrDto> getCalViewListById(String Id, String stdDt){
		return dao.getCalViewListById(Id, stdDt);
		
	}
	
	public List<giStdMbrDto> getCalList(String Id, String yyyyMMdd){
		return dao.getCalList(Id, yyyyMMdd);
	}
	
	public int offlineJoin(giStdMbrDto dto) {
		return dao.offlineJoin(dto);
	}
	
	public giStdMbrDto getOffSeq(giStdMbrDto dto) {
		return dao.getOffSeq(dto);
		
	}
	
	public List<giStdMbrDto> offlineListAll() {
		return dao.offlineListAll();
		
	}
	
	public giStdMbrDto offlineDetail(int seq) {
		return dao.offlineDetail(seq);
	}
	public List<giStdMbrDto> offStdMbrList(int seq){
		return dao.offStdMbrList(seq);
	}
	
}

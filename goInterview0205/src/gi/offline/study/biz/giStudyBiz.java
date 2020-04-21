package gi.offline.study.biz;

import java.util.List;

import gi.offline.study.dao.giStudyDao;
import gi.offline.study.dto.giStudyDto;


public class giStudyBiz {
	private giStudyDao dao=new giStudyDao();
	
	public int insertOffStudy(giStudyDto dto) {
		return dao.insertOffStudy(dto);
	}
	public List<giStudyDto> getCalList(String stdId, String yyyyMMdd){
		return dao.getCalList(stdId, yyyyMMdd);
	}
	public List<giStudyDto> getCalViewList(String stdId, String stdDt){
		
		return dao.getCalViewList(stdId, stdDt);
	}
	
	public int getCalViewCount(String stdId, String stdDt) {
		return dao.getCalViewCount(stdId, stdDt);
	}
}

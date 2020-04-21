package gi.qna.biz;

import gi.qna.dao.giQnaDao;
import gi.qna.dto.giQnaDto;

public class giQnaBiz {

	giQnaDao dao = new giQnaDao();
	
	public giQnaDto selectQnaOne(int qSeq) {
		return dao.selectQnaOne(qSeq);
	}
	
	
	
	public int insert(giQnaDto dto) {
		return dao.insert(dto);
	}
	
	public int update(giQnaDto dto) {
		return dao.update(dto);
	}
	
	
}

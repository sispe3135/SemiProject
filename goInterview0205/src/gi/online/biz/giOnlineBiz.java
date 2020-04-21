package gi.online.biz;

import java.util.List;



import gi.online.dao.giOnlineDao;
import gi.online.dto.giOnlineDto;




public class giOnlineBiz {
	giOnlineDao dao=new giOnlineDao();
	
	public List<giOnlineDto> getCalViewListById(String Id, String chatStDt){
		return dao.getCalViewListById(Id, chatStDt);
		
	}
	public int insertOnlineChat(giOnlineDto dto) {
		return dao.insertOnlineChat(dto);
	}
	public int onlineJoin(giOnlineDto dto) {
		return dao.onlineJoin(dto);
	}
	public giOnlineDto getChatSeq(giOnlineDto dto) {
		return dao.getChatSeq(dto);
	}
	
	public List<giOnlineDto> getChatList(String Id, String yyyyMMdd){
		return dao.getChatList(Id, yyyyMMdd);
	}
	
	public List<giOnlineDto> onlineListAll() {
		return dao.onlineListAll();
	}
	
/*	
	public List<giStdMbrDto> getCalList(String Id, String yyyyMMdd){
		return dao.getCalList(Id, yyyyMMdd);
	}
*/	
}

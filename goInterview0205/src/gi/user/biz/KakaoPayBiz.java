package gi.user.biz;

import gi.user.dao.KakaoPayDao;
import gi.user.dto.MemberDto;

public class KakaoPayBiz {
	
	private KakaoPayDao dao = new KakaoPayDao();
	
	public int updatePay(MemberDto dto) {
		return dao.updatePay(dto);
	}
	public MemberDto dalCnt(String id) {
		return dao.dalCnt(id);
	}

}

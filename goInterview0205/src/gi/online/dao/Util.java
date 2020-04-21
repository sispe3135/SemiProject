package gi.online.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import gi.offline.study.dto.*;
import gi.online.dto.giOnlineDto;

public class Util {

	// 12
	private String todates;

	public String getTodates() {
		return todates;
	}

	public void setTodates(String mdate) {
		System.out.println(mdate + "  Util setTodates1");
		// 202001221123을 2020-01-22 11:23:00 으로 변환
		// yyyy-MM-dd hh:mm:ss

		String m = mdate.substring(0, 4) + "-" + mdate.substring(4, 6) + "-" + mdate.substring(6, 8) + " "
				+ mdate.substring(8, 10) + ":" + mdate.substring(10).trim() + ":00";
		System.out.println(m + "    Util setTodates2");

		// formatting date -> text
		// parsing text -> date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");

		// valueOf() -> parsing to Type of String
		// m => milliseconds ??
		//
		Timestamp tm = Timestamp.valueOf(m);
		todates = sdf.format(tm);

	}

	// 달력의 토요일/일요일/평일 색상 설정
	public static String fontColor(int date, int dayOfWeek) {

		// dayOfWeek : 요일
		// date 날짜

		String color = "";
		// 요일판단
		// 토요일
		if ((dayOfWeek - 1 + date) % 7 == 0) {
			color = "blue";
			// 일요일
		} else if ((dayOfWeek - 1 + date) % 7 == 1) {
			color = "red";
			// 평일
		} else {
			color = "black";
		}

		return color;
	}

	// 한자리 문자를 앞에 0을 붙여 두글자로 만들어 줌
	public static String isTwo(String msg) {
		return msg.length() < 2 ? "0" + msg : msg;
	}

	public static String getCalView(int i, List<giOnlineDto> clist) {

	//	String d = isTwo(i + "");
		String d= isTwo(Integer.toString(i));
		String res = "";

		for (giOnlineDto dto : clist) {
			if (dto.getChatStDt().substring(6, 8).equals(d)) {
				res += "<p>" + ((dto.getChatTitle().length() > 6) ? dto.getChatTitle().substring(0, 6) + "..." : dto.getChatTitle())
						+ "</p>";
			}
		}

		return res;
	}
}

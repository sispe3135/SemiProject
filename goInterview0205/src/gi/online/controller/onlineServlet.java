package gi.online.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gi.offline.study.dao.Util;
import gi.online.biz.giOnlineBiz;
import gi.online.dto.giOnlineDto;
import gi.user.biz.MemberBiz;
import gi.user.dto.MemberDto;

@WebServlet(urlPatterns = {"/onlinecalonly","/onlineMake","/onlineInsert","/onlinecallist","/onlineListAll","/onlineChatJoin"})
public class onlineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getRequestURI();
		MemberBiz bizmem = new MemberBiz();
		giOnlineBiz biz = new giOnlineBiz();
		HttpSession session = request. getSession();
		
		
		if(command.endsWith("/onlinecalonly")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id=loginDto.getId();
				MemberDto dto = bizmem.selectOnebyID(id);
				request.setAttribute("dto", dto);
				dispatch("onlineCal.jsp",request,response);
			}
			
		} else if(command.endsWith("/onlineMake")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				request.setAttribute("dto", loginDto);
				dispatch("onlineMake.jsp",request,response);
			}
			
		
		// 온라인 모임(TB_CHAT) 만들고 동시에 참여하기 (TB_CHAT_MBR)	
		} else if(command.endsWith("/onlineInsert")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			String title = request.getParameter("title");
			int memberNum = Integer.parseInt(request.getParameter("memberNum"));
			String daytime = request.getParameter("date");
			String ymd = daytime.replace("-", "");
			System.out.println("ymd : "+ymd);
			String time = request.getParameter("time");
			System.out.println("time : "+time);
			String hm = time.replace(":","");
			String date = ymd+hm;
			System.out.println(date);
			
			String context = request.getParameter("context");
			giOnlineDto dto = new giOnlineDto();
			dto.setChatTitle(title);
			dto.setChatMgr(loginDto.getId());
			dto.setChatStDt(date);
			dto.setChatStat("R");
			dto.setChatNum(memberNum);
			
			int res = biz.insertOnlineChat(dto);
			if(res>0) {
				System.out.println("온라인 모임생성");
			} else {
				System.out.println("온라인 모임 생성실패");
			}
			System.out.println("online모임 만들기 끝");
			
			giOnlineDto getSeqDto = new giOnlineDto();
			getSeqDto.setChatMgr(loginDto.getId());
			getSeqDto.setChatStDt(date);
			
			
			giOnlineDto seqDto = biz.getChatSeq(getSeqDto);
			System.out.println("seq : "+seqDto.getChatSeq());
			seqDto.setId(loginDto.getId());
			
			
			int mbrJoinRes = biz.onlineJoin(seqDto);
			if(mbrJoinRes>0) {
				jsResponse("온라인 모임 만든사람도 참여 성공", "onlinecalonly", response);
			} else {
				jsResponse("온라인 모임 만든사람이 참여 실패", "onlinecalonly", response);
			}
			System.out.println("online모임 만들고 참여하기 끝");
			
			
			
		} else if(command.endsWith("/onlinecallist")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id = loginDto.getId();
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
				
				List<giOnlineDto> list = biz.getChatList(id, yyyyMMdd);
				request.setAttribute("list", list);
				dispatch("onlinelist.jsp??year="+year+"&month="+month+"&date="+date+"", request, response);
				System.out.println("---onlinecallist servlet----");
			}
			
			
		} else if(command.endsWith("/onlineListAll")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				List<giOnlineDto> list = biz.onlineListAll();
				request.setAttribute("list", list);
				dispatch("onlineScroll.jsp",request,response);
				System.out.println("--onlineListAll servlet 완료--");
			}
		} else if(command.endsWith("/onlineChatJoin")) {
//			//채팅방 시작 날짜
//			String chatStDt = request.getParameter("chatStDt");
//			//채팅방 번호 => roomId
//			int roomSeq = Integer.parseInt(request.getParameter("chatSeq"));
//			//채팅방 join하는 id
//			String userId = request.getParameter("userId");
//			
//			System.out.println("날짜: "+chatStDt);
//			System.out.println("방 번호: "+roomSeq);
//			System.out.println("유저 아이디: "+userId);
			
			//request.setAttribute("roomSeq", roomSeq);
			//request.setAttribute("userId", userId);
			
			
			response.sendRedirect("http://192.168.110.225:8086");
//			?roomSeq="+roomSeq+"&userId"+userId
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request,response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
	public void jsResponse(String msg,String url,HttpServletResponse response) throws IOException {
		String s="<script type='text/javascript'> alert('"+msg+"'); location.href='"+url+"';</script>";
		PrintWriter out=response.getWriter();
		out.println(s);
		out.flush(); // 이거 왜 해주는 지 찾아보기!
	}

	

}

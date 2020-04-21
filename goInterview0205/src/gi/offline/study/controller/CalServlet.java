package gi.offline.study.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gi.offline.study.biz.giStudyBiz;
import gi.offline.study.dao.giStudyDao;
import gi.offline.study.dao.Util;
import gi.offline.study.dto.giStudyDto;
import gi.offline.studymbr.biz.giStdMbrBiz;
import gi.offline.studymbr.dto.giStdMbrDto;
import gi.online.biz.giOnlineBiz;
import gi.online.dto.giOnlineDto;
import gi.user.biz.MemberBiz;
import gi.user.dto.MemberDto;

@WebServlet(urlPatterns = {"/calendar","/calList"})
public class CalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getRequestURI();
		
		giStdMbrBiz offbiz = new giStdMbrBiz();
		giOnlineBiz onbiz = new giOnlineBiz();
		MemberBiz bizmem = new MemberBiz();
		HttpSession session = request. getSession();
		
		if(command.endsWith("/calendar")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id = loginDto.getId();
				MemberDto dto = bizmem.selectOnebyID(id);
				System.out.println(dto.getId()+" stdmbr servlet에서는 인식된다.");
				request.setAttribute("dto", dto);
				dispatch("Profile_Cal.jsp",request,response);
			}
		
		}else if(command.endsWith("/calList")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id = loginDto.getId();
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				
				String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
				System.out.println("yyyyMMdd : " + yyyyMMdd);
				
				List<giStdMbrDto> offlist = offbiz.getCalList(id, yyyyMMdd);
				List<giOnlineDto> onlist = onbiz.getChatList(id, yyyyMMdd);
				System.out.println("offlist :" + offlist);
				System.out.println("onlist : "+onlist);
				Map<String, List<?>> list = new HashMap<String, List<?>>();
				list.put("offlist",offlist);
				list.put("onlist", onlist);
				request.setAttribute("list", list);
				dispatch("calList.jsp?year="+year+"&month="+month+"&date="+date+"", request, response);
			}
			
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

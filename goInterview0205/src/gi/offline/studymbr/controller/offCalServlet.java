package gi.offline.studymbr.controller;

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

import gi.offline.study.biz.giStudyBiz;
import gi.offline.study.dao.Util;
import gi.offline.study.dto.giStudyDto;
import gi.offline.studymbr.biz.giStdMbrBiz;
import gi.offline.studymbr.dto.giStdMbrDto;
import gi.online.dto.giOnlineDto;
import gi.user.biz.MemberBiz;
import gi.user.dto.MemberDto;

@WebServlet(urlPatterns = {"/offcallist","/offcalonly","/offlineMake","/offlineInsert","/offlineListAll","/offdetail"})
public class offCalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getRequestURI();
		giStdMbrBiz biz = new giStdMbrBiz();
		giStudyBiz bizstd = new giStudyBiz();
		MemberBiz bizmem = new MemberBiz();
		HttpSession session = request. getSession();
		
		
		
		
		
		if(command.endsWith("/offcalonly")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id=loginDto.getId();
				MemberDto dto = bizmem.selectOnebyID(id);
				request.setAttribute("dto", dto);
				dispatch("offlineCal.jsp",request,response);
			}
		}else if(command.endsWith("/offdetail")) {
			int stdSeq = Integer.parseInt(request.getParameter("seq"));
			giStdMbrDto dto = biz.offlineDetail(stdSeq);
			System.out.println("stdid : "+dto.getStdId());
			request.setAttribute("stdDto", dto);
			dispatch("offlineDetail.jsp",request,response);
		
		}else if(command.endsWith("/offcallist")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			String id = loginDto.getId();
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			
			String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
			System.out.println("id : "+id +" yyyyMMdd : "+yyyyMMdd);
			
			List<giStdMbrDto> list = biz.getCalList(id, yyyyMMdd);
			System.out.println("list의 크기 : "+list.size());
			
			
			
			request.setAttribute("list", list);
			dispatch("offlineList.jsp?year="+year+"&month="+month+"&date="+date+"", request, response);
			System.out.println("-----여기까지  offcallist servelt-----");
			
		} else if(command.endsWith("/offlineMake")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				request.setAttribute("dto", loginDto);
				dispatch("offlineMake.jsp",request,response);
			}
			
		} else if(command.endsWith("/offlineInsert")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("세션이 만료되었습니다..", "mainView.jsp", response);
			} else {
				String ht=request.getParameter("studytime");
				String title=request.getParameter("title");
				String id = loginDto.getId();
				int stdMbrNumber= Integer.parseInt(request.getParameter("memberNum"));
				String context =request.getParameter("context");
				String daytime = request.getParameter("date");
				String ymd = daytime.replace("-", "");
				System.out.println("ymd : "+ymd);
				String time = request.getParameter("time");
				System.out.println("time : "+time);
				String hm = time.replace(":","");
				String date = ymd+hm;
				System.out.println("date : "+ date );
				
				giStudyDto dto = new giStudyDto();
				dto.setStdTitle(title);
				dto.setStdContents(context);
				dto.setStdDt(date);
				dto.setStdId(id);
				dto.setStdStat("R");
				dto.setStdShowYn("Y");
				dto.setStdMbrNum(stdMbrNumber);
				
				
				
				int res = bizstd.insertOffStudy(dto);
				if(res>0) {
					System.out.println("오프라인 모임 만들기 성공");
				} else {
					System.out.println("오프라인 모임 만들기 실패");
				}
				
				giStdMbrDto getSeqDto = new giStdMbrDto();
				getSeqDto.setStdId(loginDto.getId());
				getSeqDto.setStdDt(date);
				
				giStdMbrDto seqDto = biz.getOffSeq(getSeqDto);
				System.out.println("seq : "+seqDto.getStdSeq());
				seqDto.setId(loginDto.getId());
				
				int mbrJoinRes = biz.offlineJoin(seqDto);
				if(mbrJoinRes>0) {
					jsResponse("오프라인 모임 만든사람도 참여 성공", "offcalonly", response);
				} else {
					jsResponse("오프라인  모임 만든사람이 참여 실패", "offecalonly", response);
				}
				System.out.println("off모임 만들고 참여하기 끝");
			}
			
		} else if(command.endsWith("/offlineListAll")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if (loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				List<giStdMbrDto> list = biz.offlineListAll();
				request.setAttribute("list", list);
				dispatch("offlineScroll.jsp",request,response);
				System.out.println("--offlineListAll servlet 완료--");
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

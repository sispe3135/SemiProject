package gi.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import gi.user.biz.MemberBiz;
import gi.user.dto.MemberDto;



@WebServlet(urlPatterns = {"/login","/kakaologin","/googlelogin","/idchk","/logout","/insert","/deleteup","/updateup","/updateres","/telesend"})
public class LoginsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getRequestURI();
		MemberBiz biz=new MemberBiz();
		
		HttpSession session = request.getSession();
		
		if(command.endsWith("/login")){

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			MemberDto dto=new MemberDto();
			
			dto.setId(id);
			dto.setPw(pw);

			
			dto=biz.login(dto);

//			request.setAttribute("selfdto", dto);
			if(dto!=null){
				//session scope에 담기
				session = request.getSession();

				
				session.setAttribute("dto", dto);
				//10분동안 활동이 없으면  session의 값 무효화
				//(default는 30분, 음수이면 무제한)
				session.setMaxInactiveInterval(60*60);
				System.out.println(dto.getIdGubun());
				System.out.println("로그인들어감");
				if(dto.getIdGubun().equals("ADMIN")){
					response.sendRedirect("adminMemberSearch");
				}else if(dto.getIdGubun().equals("USER")){
////////////////////////////////////////////////여기 건드는거 노노/////////////////////////////////////////////////////////	
					response.sendRedirect("mainView.jsp?id="+dto.getId());		
///////////////////////////////////////////여기 건드는거 노노/////////////////////////////////////////////////////////
				}
			}
			else{
				jsResponse("로그인실패했습니다", "mainView.jsp", response);
			}
		// 카카오 로그인	
		}else if(command.endsWith("/kakaologin")){
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");	
			String test = request.getParameter("test");	
			System.out.println(id);
			MemberDto dto=new MemberDto();
			int id_seq=0;
			try {
				id_seq = biz.idChk(id).getIdSeq();
				System.out.println(id_seq);
				dto = biz.selectOne(id_seq);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				dto =null;
			}

			String id_gubun=null;
			if(dto!=null){
				id_gubun=dto.getIdGubun();
			}

			if(id_gubun==null){

				request.setAttribute("id", id);
				request.setAttribute("pw", pw);
				request.setAttribute("email", pw);
				request.setAttribute("myorder", "insert");
				System.out.println(id);
				dispatch("googleregister.jsp", request, response);
					
			}else if(id_gubun.equals("N")){
				request.setAttribute("id", id);
				request.setAttribute("pw", pw);
				request.setAttribute("myorder", "updateres");
				request.setAttribute("id_seq", id_seq);
				
				dispatch("googleregister.jsp", request, response);
				
			}else if(id_gubun!=null){
				//session scope에 담기
				session = request.getSession();

				
				session.setAttribute("dto", dto);
				//10분동안 활동이 없으면  session의 값 무효화
				//(default는 30분, 음수이면 무제한)
				session.setMaxInactiveInterval(10*60);
				
				if(dto.getIdGubun().equals("ADMIN")){
					response.sendRedirect("admin_Qna_List.jsp");			
				} else if(dto.getIdGubun().equals("USER")){
			

///////////////////////////////////////////여기 건드는거 노노/////////////////////////////////////////////////////////
					response.sendRedirect("mainView.jsp?id="+dto.getId());		
///////////////////////////////////////////여기 건드는거 노노/////////////////////////////////////////////////////////
				}		
			}

		// 구글 로그인	
		}else if(command.endsWith("/googlelogin")){
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");	
			String test = request.getParameter("test");	
			System.out.println(id);
			MemberDto dto=new MemberDto();
			int id_seq=0;
			try {
				id_seq = biz.idChk(id).getIdSeq();
				System.out.println(id_seq);
				dto = biz.selectOne(id_seq);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				dto =null;
			}

			String id_gubun=null;
			if(dto!=null){
				id_gubun=dto.getIdGubun();
			}

			if(id_gubun==null){

				request.setAttribute("id", id);
				request.setAttribute("pw", pw);
				request.setAttribute("email", pw);
				request.setAttribute("myorder", "insert");
				System.out.println(id);
				dispatch("googleregister.jsp", request, response);
					
			}else if(id_gubun.equals("N")){
				request.setAttribute("id", id);
				request.setAttribute("pw", pw);
				request.setAttribute("myorder", "updateres");
				request.setAttribute("id_seq", id_seq);
				
				dispatch("googleregister.jsp", request, response);
				
			}else if(id_gubun!=null){
				//session scope에 담기
				session = request.getSession();

				
				session.setAttribute("dto", dto);
				//10분동안 활동이 없으면  session의 값 무효화
				//(default는 30분, 음수이면 무제한)
				session.setMaxInactiveInterval(10*60);
				
				if(dto.getIdGubun().equals("ADMIN")){
					response.sendRedirect("admin_Qna_List.jsp");			
				} else if(dto.getIdGubun().equals("USER")){
			

///////////////////////////////////////////여기 건드는거 노노/////////////////////////////////////////////////////////
					response.sendRedirect("mainView.jsp?id="+dto.getId());		
///////////////////////////////////////////여기 건드는거 노노/////////////////////////////////////////////////////////
				}		
			}
		// 로그아웃	
		}else if(command.endsWith("/logout")){
			session = request.getSession();
			session.invalidate();
			jsResponse("로그아웃", "mainView.jsp", response);
			
		// 아이디 체크
		} else if (command.endsWith("/idchk")){
			String id=request.getParameter("id");
			System.out.println(id);
			
			String res;
			try {
				res = biz.idChk(id).getId();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				res=null;
			}
			System.out.println(res);
			boolean idnotused=true;//사용된적이 없다
			if(res!=null){
				idnotused=false;//사용되었다
			}
			
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		// 회원가입?	
		}else if(command.endsWith("/insert")){
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");

			String tgYn=request.getParameter("tgYn");
			String tgNo=request.getParameter("tgNo");
			
			double Longitude =	Double.parseDouble(request.getParameter("Longitude"));
			double Latitude = Double.parseDouble(request.getParameter("Latitude"));
			System.out.println(Longitude +" / "+ Latitude);
			MemberDto dto=new MemberDto("USER", 0, id,pw,email,phone,tgNo,tgYn,"Y",null,null,0,Latitude, Longitude);
			int res=biz.insert(dto);
			if(res>0){
				jsResponse("회원가입성공", "mainView.jsp", response);
		
			}else{
				jsResponse("회원가입실패", "mainView.jsp", response);
			}

		// 회원정보 수정
		}else if(command.endsWith("/updateup")){
			int id_seq=Integer.parseInt(request.getParameter("id_seq"));
			MemberDto dto=biz.selectOne(id_seq);
			request.setAttribute("dto", dto);
			dispatch("updateform.jsp", request, response);
		
		}else if(command.endsWith("/updateres")){
			int id_seq=Integer.parseInt(request.getParameter("id_seq"));
			MemberDto dto=biz.selectOne(id_seq);
			System.out.println("시작"+dto);
			dto.setTgNo(request.getParameter("tg_no"));
			dto.setTgYn(request.getParameter("tg_yn"));
			dto.setPhone(request.getParameter("phone"));
			dto.setEmail(request.getParameter("email"));
			System.out.println("끝"+dto);
			int res=biz.update(dto);
			if(res>0){
				jsResponse("수정성공", "mainView.jsp", response);
		
			}else{
				jsResponse("수정실패", "mainView.jsp", response);
			}
		}else if(command.endsWith("/telesend")){

			List<MemberDto> teleMembers=biz.selectListAll();
			ArrayList<String> teleNos= new ArrayList<String>(); 
			MemberDto teleMember=new MemberDto();
			for(int i=0;i<teleMembers.size();i++){
				teleMember= teleMembers.get(i);
				String teleNo=teleMember.getTgNo();
				System.out.println(teleNo);
				teleNos.add(i, teleNo);
			}
			
			request.setAttribute("dataNav", "telegram");
			request.setAttribute("teleNos", teleNos);
			dispatch("admin_Telegram.jsp", request, response);
			
		}
			
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		doGet(request, response);
	}
	
	protected void dispatch(String url,HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	public void jsResponse(String msg,String url,HttpServletResponse response) throws IOException {
		String s="<script type='text/javascript'> alert('"+msg+"'); location.href='"+url+"';</script>";
		PrintWriter out=response.getWriter();
		out.println(s);
		out.flush(); // 이거 왜 해주는 지 찾아보기!
	}
}

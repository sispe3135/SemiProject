	package gi.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import gi.user.biz.KakaoPayBiz;
import gi.user.biz.MemberBiz;

import gi.user.dto.MemberDto;




@WebServlet(urlPatterns = {"/modhome","/update","/delete","/deleteres","/pay", "/payHistory", "/dalCnt", "/adminMemberSearch"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String command = request.getRequestURI();
		
		MemberBiz biz=new MemberBiz();
		KakaoPayBiz kakaoBiz = new KakaoPayBiz();
		
		HttpSession session = request.getSession();
		
		System.out.println("<" + command + ">");
		
		if(command.endsWith("/modhome")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			System.out.println("로그인 객체"+loginDto);
			if(loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id = loginDto.getId();
				MemberDto dto = biz.selectOnebyID(id);
				System.out.println(dto.getId()+" servlet에서는 인식된다.");
				request.setAttribute("dto", dto);
				dispatch("Profile_modify.jsp",request,response);
			} 
		
		} else if(command.endsWith("/update")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			MemberDto dto = biz.selectOnebyID(id);
			dto.setPw(password);
			dto.setEmail(email);
			dto.setPhone(phone);
			int res = biz.update(dto);
			if(res > 0) {
				jsResponse("수정성공", "modhome", response);
				
			} else {
				jsResponse("수정실패", "modhome", response);
				
			}
//			dto = dao.selectOne(id);
//			request.setAttribute("dto", dto);
//			dispatch("Profile_modify.jsp",request,response);
		} else if(command.endsWith("/delete")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			System.out.println("로그인 객체"+loginDto);
			if(loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id = loginDto.getId();
				MemberDto dto = biz.selectOnebyID(id);
				System.out.println(dto.getId()+" servlet에서는 인식된다.");
				request.setAttribute("dto", dto);
				dispatch("Profile_Delete.jsp",request,response);
			}
		} else if(command.endsWith("/deleteres")) {
			String outRs = request.getParameter("outrs");
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			if(loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				String id = loginDto.getId();
				MemberDto dto = biz.selectOnebyID(id);
				dto.setOutRs(outRs);
				int res = biz.updateout(dto);
				if(res > 0) {
					jsResponse("삭제성공", "logout", response);
				} else {
					jsResponse("삭제실패", "delete", response);
				}
			}
			
			
////////////////////////////////////////////////카카오페이/////////////////////////////////////////////////////////			
		}else if(command.endsWith("/pay")) {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK "+"5a1165ef6051e7935afe4e54f600a831");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoInput(true);
			connection.setDoOutput(true);
			
			String partner_order_id = "2020semi3goInterview";
			String partner_user_id = request.getParameter("id");
			System.out.println(partner_user_id);
			
			//아이템
			String dal = "달풍선";
			
			//수량
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			//부가세 
			int tax_free_amount = (int)((quantity*100)*0.1);
			
			//가격 
			int total_amount = (quantity * 100) - (tax_free_amount);
			System.out.println("총 가격 : " +total_amount);
			
			
			
			Map<String, Object> payment = new HashMap<String, Object>();
			payment.put("cid", "TC0ONETIME");
			payment.put("partner_order_id", partner_order_id);
			payment.put("partner_user_id", partner_user_id);
			payment.put("item_name", dal);
			payment.put("quantity", quantity);
			payment.put("total_amount", total_amount);
			payment.put("tax_free_amount", tax_free_amount);
			payment.put("approval_url", "http://localhost:8787/goInterview0205/approval.jsp");
			payment.put("cancel_url", "http://localhost:8787/goInterview0205/cancel.jsp");
			payment.put("fail_url", "http://localhost:8787/goInterview0205/fail.jsp");
			
			
			String string = new String();
			for(Entry<String, Object> elem : payment.entrySet()) {
				string += (elem.getKey() + "=" + elem.getValue() + "&");
			}
			
			
			
			connection.getOutputStream().write(string.getBytes());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			
			JSONParser parser = new JSONParser();
			System.out.println(parser+"parser");
				
				try {
					
//					Object tmp = parser.parse(in);
					JSONObject tmp = (JSONObject)parser.parse(in);
					System.out.println(tmp.get("tid"));
					
					String tid = (String) tmp.get("tid");
					//request.setAttribute("tid", tid);
					//response.sendRedirect("approval.jsp?tid="+tid);
					session.setAttribute("tid", tid);
					
					//System.out.println("json 확인");
					//System.out.println(obj.get("http://localhost:8787/goInterview01_20/kakaoPage.jsp"));
					
					//String successUrl = (String)obj.get("http://localhost:8787/goInterview01_20/kakaoPage.jsp");
					//System.out.println(successUrl+"bbbbbbbbbb");
					
					
					request.setAttribute("kakao", tmp);
					dispatch("kakaoPage.jsp",request,response);
					
					MemberDto dto = new MemberDto();
					String id = request.getParameter("id");
					dto.setId(id);
					dto.setDalCnt(quantity);
					int res = kakaoBiz.updatePay(dto);
					
					
					
					//request.setAttribute("dto", dto);
					//dispatch("dalView.jsp", request, response);
					
					if(res > 0) {
						jsResponse("달풍선 업데이트 성공", "dalView.jsp", response);
						System.out.println("달풍선 갯수 : " + quantity + " / 달풍선을 dto에 담은거 : " + dto.getDalCnt());
					} else {
						jsResponse("달풍선 업데이트 실패", "mypage.jsp", response);
					}
					
					
					
				} catch (Exception e) {
					System.out.println(e+"jalsdfjlsadj");
					e.printStackTrace();
				}
			
			//JsonElement element = JsonParser.parseReader(in);
			//JsonObject obj = element.getAsJsonObject();
				
		}else if(command.endsWith("/payHistory")) {
			//String cid = "TC0ONETIME";
			String tid = request.getParameter("tid");
			//System.out.println("tid : ");
			
			URL url = new URL("https://kapi.kakao.com/v1/payment/order");
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK "+"5a1165ef6051e7935afe4e54f600a831");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoInput(true);
			connection.setDoOutput(true);
			
			Map<String, Object> payment = new HashMap<String, Object>();
			payment.put("cid", "TC0ONETIME");
			payment.put("tid", tid);
			
			String string = new String();
			for(Entry<String, Object> elem : payment.entrySet()) {
				string += (elem.getKey() + "=" + elem.getValue() + "&");
				
			}
			
			connection.getOutputStream().write(string.getBytes());
			System.out.println(string + " : string");
			
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			System.out.println("in : " + in);
			
			JSONParser parser = new JSONParser();
			System.out.println(parser+" : parser");
			
			try {
				
				Object tmp = (Object)parser.parse(in);
				System.out.println(tmp);
				
				request.setAttribute("payHistory", tmp);
				
				dispatch("payHistory.jsp",request,response);
				
			} catch (Exception e) {
				System.out.println(e+"jalsdfjlsadj");
				e.printStackTrace();
			}
			
////////////////////////////////////////////////카카오페이 여기까지/////////////////////////////////////////////////////////	
			
		}else if(command.endsWith("/dalCnt")) {
			MemberDto loginDto =(MemberDto)session.getAttribute("dto");
			System.out.println("로그인 객체"+loginDto);
			if(loginDto==null) {
				jsResponse("로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				MemberDto dto = kakaoBiz.dalCnt(loginDto.getId());
				
				request.setAttribute("dto", dto);
				dispatch("dalView.jsp", request, response);
			}
			
//			어드민 회원조회
		}else if(command.endsWith("/adminMemberSearch")) {
			
			List<MemberDto> list = biz.selectMbrAll();
			
			request.setAttribute("list", list);
			request.setAttribute("dataNav", "member");
			dispatch("admin_Member_Search.jsp", request, response);
		}
		
		
		
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

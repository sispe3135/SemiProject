package gi.qna.controller;

import java.io.File;
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


import com.oreilly.servlet.MultipartRequest;

import gi.qna.biz.giQnaBiz;
import gi.qna.dao.giQnaDao;
import gi.qna.dto.giQnaDto;
import gi.user.dto.MemberDto;
import gi.util.fileUpload.MyFileRenamePolicy;
import gi.util.paging.Paging;

/**
 * Servlet implementation class QnaServlet
 */
@WebServlet(urlPatterns = {"/qnaList", "/qnaWriteForm", "/qnaWriteRes", "/qnaDetail", "/adminQnaList", "/adminQnaAnswer", "/adminQnaAnswerUpdate"})
public class QnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		Paging paging = new Paging();	
		if ( request.getParameter("page") == null ) {
			paging.setCurPage(1);
		} else {
			paging.setCurPage(Integer.parseInt(request.getParameter("page").toString()));
		}
		
		System.out.println(paging.getBeginRow() + ", " + paging.getEndRow());
		
		String command = request.getRequestURI();
		System.out.println("<" + command + ">");
		
		giQnaBiz biz = new giQnaBiz();
		giQnaDao dao = new giQnaDao();

		Map<String, Object> params = new HashMap<String, Object>();

		HttpSession session = request.getSession();		
		MemberDto loginDto = (MemberDto)session.getAttribute("dto");
		
		if(command.endsWith("/qnaList")) {
			if (loginDto==null) {
				jsResponse("관리자 로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				request.setAttribute("id", loginDto.getId());
				params.put("beginRow", paging.getBeginRow());
				params.put("endRow", paging.getEndRow());
				
				List<giQnaDto> list = dao.selectQnaList(params);
				int cntRow = dao.cntQnaList();
				
				paging.setTotalRow(cntRow);
				paging.makeBlock(paging.getCurPage());
				
				request.setAttribute("list", list);
				request.setAttribute("paging", paging );
				dispatch("QnA_List.jsp", request, response);
			}
			
			
		}else if(command.endsWith("/qnaWriteForm")) {
			if (loginDto==null) {
				jsResponse("관리자 로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				request.setAttribute("id", loginDto.getId());
				dispatch("QnA_WriteForm.jsp", request, response);
			}
			
			
		}else if(command.endsWith("/qnaWriteRes")) {
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/saveDir");
			File Folder = new File(saveDir);
			if(!Folder.exists()) {
				try {
					Folder.mkdir();
					System.out.println("saveDir 생성");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			MultipartRequest multipartRequest = new MultipartRequest(request, saveDir, 1024*1024*50, "utf-8", new MyFileRenamePolicy());
			
			String id = loginDto.getId();
			String title = multipartRequest.getParameter("title");
			String pw = multipartRequest.getParameter("pw");
			String content = multipartRequest.getParameter("content");
			String oriFileNm = multipartRequest.getOriginalFileName("file");
			String saveFileNm = multipartRequest.getFilesystemName("file");
			
			System.out.println("id:" + id);
			System.out.println("title:" + title);
			System.out.println("pw:" + pw);
			System.out.println("content:" + content);
			System.out.println("oriFileNm:" + oriFileNm);
			System.out.println("saveFileNm:" + saveFileNm);
			System.out.println(saveDir);
			
			giQnaDto dto = new giQnaDto();
			dto.setId(id);
			dto.setqTitle(title);
			dto.setqPw(pw);
			dto.setqContents(content);
			dto.setqOriFileNm(oriFileNm);
			dto.setqSaveFileNm(saveFileNm);
			dto.setqSavePath(saveDir);
			
			int res = biz.insert(dto);
			
			if (res > 0) {
				jsResponse("입력 성공", "qnaList", response);
			} else {
				jsResponse("입력 실패", "qnaList", response);
			}
			
		}else if(command.endsWith("/qnaDetail")) {
			if (loginDto==null) {
				jsResponse("관리자 로그인이 필요합니다.", "mainView.jsp", response);
			} else {
				int qSeq = Integer.parseInt(request.getParameter("qSeq"));
				giQnaDto dto = biz.selectQnaOne(qSeq);
				request.setAttribute("dto", dto);
				System.out.println(dto.getqStat());
				boolean bool = dto.getqStat().equals("R");
				System.out.println(bool);
				if(bool) {
					dispatch("QnA_Detail_R.jsp", request, response);
					
				} else {
					dispatch("QnA_Detail_E.jsp", request, response);
					
				}
			}
			
			
			
//			adminQna 페이지 시작
		}else if(command.endsWith("/adminQnaList")) {
			if(!loginDto.getIdGubun().equals("ADMIN")) {
				jsResponse("관리자가 아닙니다.", "qnaList", response);	// 합친다음에, 마이페이지로 보내도록 수정
			}else {
				params.put("beginRow", paging.getBeginRow());
				params.put("endRow", paging.getEndRow());
				
				List<giQnaDto> list = dao.selectQnaList(params);
				int cntRow = dao.cntQnaList();
				
				paging.setTotalRow(cntRow);
				paging.makeBlock(paging.getCurPage());
				
				request.setAttribute("list", list);
				request.setAttribute("paging", paging );
				request.setAttribute("dataNav", "qnaList");
				dispatch("admin_Qna_List.jsp", request, response);
			}
			
		}else if(command.endsWith("/adminQnaAnswer")) {			
			int qSeq = Integer.parseInt(request.getParameter("qSeq"));
			giQnaDto dto = biz.selectQnaOne(qSeq);
			request.setAttribute("dto", dto);
			request.setAttribute("adminId", loginDto.getId());
			request.setAttribute("dataNav", "qnaAnswer");
			dispatch("admin_Qna_Answer.jsp", request, response);
			
		}else if(command.endsWith("/adminQnaAnswerUpdate")) {
			int qSeq = Integer.parseInt(request.getParameter("qSeq"));
			String reContent = request.getParameter("reContent");
			String adminId = request.getParameter("adminId");
			
			giQnaDto dto = new giQnaDto();
			dto.setReContents(reContent);
			dto.setReId(adminId);
			dto.setqSeq(qSeq);
			
			int res = biz.update(dto);
			
			if(res > 0) {
				jsResponse("입력성공", "adminQnaList", response);
			}else {
				jsResponse("입력실패", "adminQnaAnswer", response);
			}
			
			
		}
	 	
	}  
  	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('" + msg + "');"
						+ "location.href='" + url + "';"
								+ "</script>";
		PrintWriter out = response.getWriter();
		out.println(s);
				
	}
	
}

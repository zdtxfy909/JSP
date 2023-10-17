package com.mystudy.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

public class searchCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// search 요청 처리(화면전환 : 입력폼 / 검색목록)
		// 전달된 파라미터값 확인
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println(">>> SearchCommand idx : " + idx);
		System.out.println(">>> SearchCommand keyword : " + keyword);
		
		//화면분기처리
		if (keyword == null || keyword.trim().equals("")) {
			//null이나 빈문자열이면 검색창으로 되돌아가기
			return "search.jsp";
		}
		
		//DB연동, 데이터 검색 처리
		List<EmployeeVO> list = EmployeeDAO.getSearch(idx, keyword);
		request.setAttribute("list", list);
		
		return "searchList.jsp"; //최종응답페이지
	}
	
}

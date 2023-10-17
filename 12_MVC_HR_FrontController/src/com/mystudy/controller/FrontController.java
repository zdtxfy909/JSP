package com.mystudy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

//@WebServlet("/controller")
public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행 ------");
		String type = request.getParameter("type");
		System.out.println("> type : " + type); //작업타입이 list다 or dept다
		
		if ("list".equals(type)) {
			//1. DB연결하고 데이터 가져오기
			List<EmployeeVO> list = EmployeeDAO.getList();
			
			//2. 응답페이지(list.jsp)에 전달
			request.setAttribute("list", list);
			
			//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}
		if ("dept".equals(type)) {
			request.getRequestDispatcher("dept.jsp").forward(request, response);
		}
		if ("deptList".equals(type)) {
			String deptno = request.getParameter("deptno");
			
			//2. DB에서 해당부서(deptno)에 있는 직원 조회(DAO사용)
			List<EmployeeVO> list = EmployeeDAO.getDeptList(deptno);
			
			//3. 조회된 데이터를 응답페이지(deptList.jsp)에서 사용토록 scope에 저장
			request.setAttribute("list", list);
			
			//4. 응답페이지(deptList.jsp)로 위임 처리
			request.getRequestDispatcher("deptList.jsp").forward(request, response);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행 ------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}

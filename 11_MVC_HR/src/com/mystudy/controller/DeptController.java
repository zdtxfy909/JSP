package com.mystudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dept")
public class DeptController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("dept.jsp").forward(request, response);
	}
	
}

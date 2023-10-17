package com.mystudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.command.DeptCommand;
import com.mystudy.command.DeptListCommand;
import com.mystudy.command.FullnameCommand;
import com.mystudy.command.ListCommand;
import com.mystudy.command.searchCommand;

@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행 ------");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		Command command = null;
		if ("list".equals(type)) {
			command = new ListCommand();
		}
		if ("dept".equals(type)) {
			command = new DeptCommand();
		}
		if ("deptList".equals(type)) {
			command = new DeptListCommand();
		}
		if ("fullname".equals(type)) {
			command = new FullnameCommand();
		}
		if ("search".equals(type)) {
			command = new searchCommand();
		}
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행 ------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}

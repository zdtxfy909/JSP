<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션 초기화(무효화) --%>
<%
	//세션 초기화(무효화)
	session.invalidate();
	//세션을 무효화시키고 다시 작업을 하려고 할 때 사용?

	//재요청 처리
	response.sendRedirect("ex01_session.jsp"); //시작페이지로 돌아가기
	
%>
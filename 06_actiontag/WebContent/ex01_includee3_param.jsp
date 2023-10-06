<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>    
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>

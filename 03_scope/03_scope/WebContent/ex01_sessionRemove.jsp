<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 데이터 삭제(remove) --%>    
<%
	//설정값을 변경
	//session.setAttribute("attr_age", "33"); 
	//---> session에 설정된 속성값을 변경(attr_age의 값을 33으로)
	
	//속성값을 삭제
	session.removeAttribute("attr_age"); //설정된 속성자체를 삭제
	
	//세션에 저장된 데이터명 확인
	Enumeration<String> names = session.getAttributeNames();
	//Enumeration 컨트롤 + 스페이스로 import 구문 추가
	while (names.hasMoreElements()) {
		//있으면 사용
		System.out.println(":: 저장명 : " + names.nextElement());
	} //attr_age 삭제되서 attr_name 하나만 저장되어 있음을 확인할 수 있다
	
	//재요청 처리
	response.sendRedirect("ex01_session.jsp"); //시작페이지로 돌아가기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
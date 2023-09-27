<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	//로그인 성공여부 확인
	String login_chk = (String) session.getAttribute("login_chk");
	System.out.println(">>> login login_chk : " + login_chk);
	//null이 올 수 있다
	if (login_chk == null) { //새로운 로그인(최초 로그인 or 세션초기화 됐을 때 )

%>
	<h2>로그인</h2>
	<form action="ex02_loginProc.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<input type="submit" value="로그인">
	</form>
	
<%
	} else if ("ok".equals(login_chk)) {
		String id = (String) session.getAttribute("id");
%>
	<h2><%=id %>님 로그인 성공!!! 환영합니다~~</h2>	
	<a href="ex02_logout.jsp">로그아웃</a> 
	<!-- 로그아웃 처리 안 하면 세션때문에 계속 이 상태로 있음 -->
<% 
	} else { //로그인 실패시 처리
		session.invalidate();
		response.sendRedirect("ex02_loginFailMessage.jsp");
	}
%>		
</body>
</html>
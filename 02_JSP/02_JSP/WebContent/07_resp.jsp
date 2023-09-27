<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 화면에 표시 --%> 
<%
	String username = request.getParameter("username");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>

</head>
<body>
	<h1>회원가입 정보(07_resp.jsp)</h1>
	<ul>
		<li>이름 : <%=username %></li>
		<li>아이디 : <%=userid %></li>
		<li>암호 : <%=pwd %></li>
		<li>확인 암호 : <%=pwd2 %></li>
		<li>이메일 : <%=email %></li>
		<li>성별 : <%=gender %></li>
		
		<li>취미 : <%=hobbies %></li>
		<li>취미(배열데이터 사용) : 
<%
		if (hobbies == null) { 
			out.print("선택취미 없음");
		} else {
			for (String hobby : hobbies) {
				out.print(hobby + " ");
			}
		}
%>
		</li>
		
		
	</ul>
</body>
</html>
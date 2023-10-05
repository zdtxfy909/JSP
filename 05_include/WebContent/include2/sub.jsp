<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브페이지</title>
</head>
<body>
	<h1>서브페이지[sub.jsp]</h1>
	<a href="main.jsp">메인페이지로 이동</a>
	<h2>서브페이지 내용</h2>
	<p>...............</p>
	<p>...............</p>
	<p>...............</p>
	<p>...............</p>
	<hr><hr>
<%!
	//선언부 : 서블릿의 필드영역에 작성되는 코드
	int globalNum = 0;
%>
<%
	//스크립트릿 : 서블릿 service() 메소드에 작성되는 코드
	int localNum = 0;
	localNum++;
	out.print("<h2>localNum : " + localNum + "</h2>");
	
	globalNum++;
	out.print("<h2>globalNum : " + globalNum + "</h2>");
%>
	
	<%@ include file="footer.jspf" %>
	<hr>
	
	<footer>
	서울특별시 강남구 테헤란로 124 4층 (역삼동, 삼원타워)사업자등록번호 : 172-87-02395통신판매업신고번호 : 제2022-서울강남-02346호
	설립자 : (주)아이티윌기관명 : 아이티윌(직업능력개발훈련시설)<br>
	대표자 : 조인형TEL : 02-6255-8002FAX : 02-569-8069
	개인정보책임자 : 심덕수이메일 : admin@itwill.co.kr
	</footer>
</body>
</html>
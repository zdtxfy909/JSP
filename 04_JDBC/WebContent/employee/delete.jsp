<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터로 DB데이터 삭제처리 후 페이지 전환 
	삭제할 데이터 : 이름, 금액, 날짜(SYSDATE)
	정상처리 후 : list.jsp 이동 처리
	예외발생시 : 현재 페이지에 오류메세지 보여주기
--%>
<%
	//1. 파라미터 값 추출(sabun, name, pay)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	System.out.println("삭제 sabun : " + sabun);
	
	//2. DB 데이터 삭제
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	int result = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtil.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = JdbcUtil.getConnection();
		
		//3. SQL 실행을 위한 준비(SQL문 작성)
		String sql = "";
			sql += "DELETE FROM EMPLOYEE ";
			sql += " WHERE SABUN = ? ";
		
		//3-1. SQL문 실행을 위해 prepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		
		//3-2. SQL 문장의 ? 위치에 값 설정(매칭, 대입)
		pstmt.setInt(1, sabun);
		
		//4-1. SQL문 실행
		result = pstmt.executeUpdate(); //int값을 리턴 
		System.out.println("삭제처리건수 : " + result);
		
		//4-2. SQL 실행결과에 대한 처리
		if(result > 0) {
			response.sendRedirect("list.jsp");
		}
		if(result == 0) {//SQL문 정상실행되었지만 데이터 없음
%>
		<script>
			alert("[수정실패] 대상이 없어서 수정하지 못했습니다.\n
					 + "목록 페이지로 이동합니다.");
			location.href("list.jsp"); //페이지 이동
		</script>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt);
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 페이지</title>
</head>
<body>
	<h1>[오류]사원 삭제 실패</h1>
	<p>수정처리를 하지 못했습니다.<br>
	담당자(8282)에게 연락하세요.</p>
	
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>
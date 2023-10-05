<%@page import="java.util.ArrayList"%>
<%@page import="com.mystudy.vo.EmployeeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- JDBC 프로그램으로 DB데이터를 가져와서 화면 출력 --%>    
<%
	//JDBC 프로그래밍 
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB데이터 저장용 변수를 선언
	List<EmployeeVO> list = null;
	int cnt = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = ""
				+ "SELECT SABUN, NAME, REGDATE, PAY "
				+ "  FROM EMPLOYEE "
				+ " ORDER BY SABUN ";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL 실행 결과에 대한 처리
		//4-1. SQL문 실행
		rs = pstmt.executeQuery();
		
		list = new ArrayList<EmployeeVO>(); //객체 생성
		
		while (rs.next()) {
			EmployeeVO vo = new EmployeeVO(
					rs.getInt("SABUN"),
					rs.getString("NAME"),
			 		rs.getDate("REGDATE"),
					rs.getInt("PAY"));
			
			list.add(vo);
		}
		rs.close();
		
		//전체 데이터 건수 확인
		rs = pstmt.executeQuery("SELECT COUNT(*) AS CNT FROM EMPLOYEE");
		if (rs.next()) {
			cnt = rs.getInt("CNT");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
</head>
<body>
	<h1>사원목록 [list.jsp]</h1>
	<table border>
		<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
<!-- 
			<tr>
				<td>1001-샘플</td>
				<td>user1</td>
				<td>2023-10-02</td>
				<td>1000</td>
				<td>상세보기</td>
			</tr> 
-->
<%	
		for (EmployeeVO vo : list) { %>
			<tr>
			<td><%=vo.getSabun() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getRegdate() %></td>
			<td><%=vo.getPay() %></td>
			<td>
			<a href="detail.jsp?sabun=<%=vo.getSabun()%>">상세보기</a>
			</td>
		</tr>
<%			
		}
%>
		</tbody>
	</table>	
	<p>전체인원 : <%=cnt %>명</p>
	<p><a href="addForm.jsp">사원등록</a></p>
</body>
</html>





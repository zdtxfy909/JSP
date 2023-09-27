<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--주문한 내역에 따라 계산하고 결과를 표시 --%>
<%
	//주문한 내역에 따라 계산하고 결과를 표시
	//1. 파라미터 값 추출(확인)
	String coffee = request.getParameter("coffee");
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	System.out.println("coffee : " + coffee);
	System.out.println("su : " + su);
	System.out.println("money : " + money);
	if (coffee == null) {
		System.out.println(">> 메뉴선택안됨 coffee : " + coffee);
		response.sendRedirect("08_req_coffee.jsp"); //요청페이지 재요청
		return; //서비스를 중단시킴
	}
	//2. 계산 처리 : 구입금액, 잔액
	//2-1. 메뉴선택에 따른 메뉴명, 단가 확인
	String menu = "선택안됨"; //선택메뉴명
	int danga = 0; //단가
	
	//if (coffee.equals("1")) { 
	//선택값이 없으면 커피의 파라미터명 자체가 안떠서 NullpointException 발생
	if ("1".equals(coffee)) { //예외발생하지 않고 응답페이지에 null값으로 들어감
		menu = "아메리카노";
		danga = 3000;
	} else if ("2".equals(coffee)) {
		menu = "카페모카";
		danga = 3500;
	} else if ("3".equals(coffee)) {
		menu = "에스프레소";
		danga = 2500;
	} else if ("4".equals(coffee)) {
		menu = "카페라떼";
		danga = 4000;
	} 
	
	//2-2. 구입금액(total), 잔액(change) 계산 처리
	int total = 0; //구입금액
	int change = 0; //잔액
	//구입금액 (단가*수량)
	total = danga * su;
	//잔액 (입금액-구입금액)	
	change = money - total;
	
	//3. 결과 표시
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답-08_resp.jsp)</h2>
	<ul>
		<li>커피종류 : <%=menu %></li>
		<li>단가 : <%=danga %>원</li>
		<li>수량 : <%=su %></li>
		<li>구입금액 : <%=total %>원</li>
		<li>입금액 : <%=money %>원</li>
		<li>잔액 : <%=change %>원</li>
		
	</ul>
<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원(단가 * 수량)
	-------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
 --%>	
	
</body>
</html>
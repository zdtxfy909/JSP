<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리</title>
</head>
<body>
	<h2>성적처리(05_req_sungjuk.html)</h2>
	<form action="05_resp.jsp">
		<p>이름 : <input type="text" name="name" value="홍길동"></p>
		<p>국어 : <input type="number" name="kor" value="100"></p>
		<p>영어 : <input type="number" name="eng" value="90"></p>
		<p>수학 : <input type="number" name="math" value="82"></p>
		<input type="submit" value="결과보기">
		<input type="reset" value="초기화">
	</form>
	
</body>
</html>
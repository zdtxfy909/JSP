<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(요청시작)액션 forward</title>
</head>
<body>
	<h1>(요청시작)액션 forward</h1>
	<h2>[ ex02_action_forward.jsp ]</h2>
	<form action="ex02_first.jsp" method="post">
		이름 : <input type="text" name="name" value="hong"><br>
		나이 : <input type="text" name="age" value="28">
		<input type="submit" value="보내기">
	</form>
</body>
</html>
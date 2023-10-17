<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름으로검색</title>
</head>
<body>
	<h1>이름으로검색 [ dept.jsp ]</h1>
	<form action="controller" method=post>
	  	성명 : <input type="text" name="name">
	  	<input type="submit" value="이름으로 검색">
	  	<input type="hidden" name="type" value="fullname">
	</form>
</body>
</html>
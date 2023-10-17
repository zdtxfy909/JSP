<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서코드검색</title>
</head>
<body>
	<h1>부서코드검색 [ dept.jsp ]</h1>
	<form action="controller" method=post> <!-- get 방식도 가능 -->
	  	부서코드 : <input type="text" name="deptno">
	  	<input type="submit" value="부서코드로 검색">
	  	<input type="hidden" name="type" value="deptList">
	</form>
	
	<!-- <form action="controller?type=deptList" method="post">
	  	부서코드 : <input type="text" name="deptno">
	  	<input type="submit" value="부서코드로 검색">
	</form> -->
</body>
</html>
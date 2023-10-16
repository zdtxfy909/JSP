<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_search() {
		//location.href = "list.jsp"; //jsp파일과 직접 연결
		location.href = "list"; //컨트롤러와 연결
	}
	
	function dept_search() {
		location.href = "dept"; //컨트롤러와 연결
	}
</script>
</head>
<body>
	<h1>작업선택 [ index.jsp ]</h1>
	<button onclick="all_search()">전체보기(list)</button>
	<button onclick="dept_search()">부서코드검색(dept)</button>
	
</body>
</html>
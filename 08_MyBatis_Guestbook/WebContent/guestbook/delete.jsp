<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면(요청)</title>
</head>
<body>
	
<div id="container">
	<h2>방명록 : 삭제화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<form action="delete_ok.jsp" method="post">
	<table>
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd">
					<input type="submit" value="삭 제">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
	
</body>
</html>
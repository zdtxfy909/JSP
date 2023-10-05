<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script>
	function sel_all(frm){ //전체데이터 조회
		frm.action = "selectAll.jsp";
		frm.submit();
	}
	function sel_one(frm){ //ID로 검색
		frm.action = "selectOneID.jsp";
		frm.submit();
	}
	
</script>
</head>
<body>
	<form>
		<table border>
		<thead>
			<tr>
				<th colspan="2">회원정보</th>
			</tr>		
		</thead>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="0"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="전체검색" onclick="sel_all(this.form)">
					<input type="button" value="검색(ID)" onclick="sel_one(this.form)">
				</td>
			</tr>
		</tfoot>
		</table>
	</form>
</body>
</html>
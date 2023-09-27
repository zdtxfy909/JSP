<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문</title>
<script>
//(개인실습) 자바스크립트로 값체크하고 서버로 전송하지 않게 처리
	function checkValue(){
		alert("checkValue() 실행~~");
		//alert("입금액 : " + document.frm.money.value);
		let vForm = document.frm;
		if (vForm.money.value <= 0) {
			alert("입금액이 없습니다.");
			return false;
		}
	
	}
</script>
</head>
<body>
	<h1>커피주문(요청-08_req_coffee.jsp)</h1>
	<form name="frm" action="08_resp.jsp">
		<input type="radio" name="coffee" value="1">아메리카노(3000원)<br>
		<input type="radio" name="coffee" value="2">카페모카(3500원)<br>
		<input type="radio" name="coffee" value="3">에스프레소(2500원)<br>
		<input type="radio" name="coffee" value="4">카페라떼(4000원)<br>
		<hr>
		수량 : <input type="number" name="su" value="1"><br>
		입금액 : <input type="number" name="money" value="0"><br>
		
		<input type="submit" value="주문처리">
		<!--<input type="button" value="주문처리" onclick="checkValue()">-->
	</form>
	
</body>
</html>
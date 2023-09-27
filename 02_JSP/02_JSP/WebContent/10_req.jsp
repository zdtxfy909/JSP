<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청</title>
</head>
<body>
	<h1>요청(10_req.jsp - 응답 forward)</h1>
	<form>
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="text" name="pwd"><br>
		
		<input type="button" value="포워딩(forward)" onclick="send_forward(this.form)">
		<!-- this 넣으면 이벤트 발생 객체 button이 넘어간다 
			this.form 넣으면 form 객체를 넘겨줌
		-->
	</form>
	
<script>
	function send_forward(frm){
		alert(">> send_forward(frm) 실행 frm : " + frm);
		frm.action = "10_resp_forward.jsp";
		//위임하면 요청 url 변경되지 않는다
		frm.submit(); //submit 함수 호출해야 submit 처리됨
	}
</script>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function send_go() {
		alert(">> send_go() 실행");
		alert("-" + document.frm.username.value + "-"); 
		//frm 속성 username의 value찾을 수 있음
		if (document.frm.username.value.trim() == "") {
			//trim() 메소드 안 쓰면 스페이스바 넣으면 입력된걸로 처리됨
			alert("이름을 입력하세요");
			document.frm.username.value = ""; //value값 빈문자열 지워줌
			document.frm.username.focus(); 
			//함수호출. 입력할 수 있도록 포커스를 username으로 보냄
			return false; //함수실행종료(서버쪽 전송처리 안함)
		}
		
		let vForm = document.frm;
		console.log("vForm id : " + vForm.getAttribute("id") + 
					", name: " + vForm.getAttribute("name"));
		//form에 있는 속성 id값, name값
		if (vForm.userid.value.trim().length < 1) { 
			//userid가 최소 1글자 이하일 경우
			alert("아이디를 입력하세요");
			vForm.userid.value = "";
			vForm.userid.focus();
			return false; //서버쪽으로 전송 안함
		}
		if (vForm.pwd.value.trim().length < 1) { 
			//pwd가 최소 1글자 이하일 경우
			alert("암호를 입력하세요");
			vForm.pwd.value = "";
			vForm.pwd.focus();
			return false; //서버쪽으로 전송 안함
		}
		if (vForm.pwd2.value.trim().length < 1) { 
			//pwd2가 최소 1글자 이하일 경우
			alert("확인암호를 입력하세요");
			vForm.pwd2.value = "";
			vForm.pwd2.focus();
			return false; //서버쪽으로 전송 안함
		}
		if (vForm.pwd.value != vForm.pwd2.value) {
			//암호와 확인암호가 다를 경우
			alert("암호가 다릅니다.\n확인 후 다시 입력하세요");
			vForm.pwd.value = "";
			vForm.pwd2.value = "";
			vForm.pwd.focus();
			return false;
		}
		console.log("vForm.gender : " + vForm.gender); //2개가 선택됨
		let genders = vForm.gender;
		let checked = false; //초기값 false
		for (let gender of genders) {
			console.log(gender.value + " : " + gender.checked);
			if (gender.checked) checked = true;
		}
		if (!checked) {
			alert("<성별> 확인이 안되었습니다.\n선택해주세요.");
			return;
		}
		
		vForm.action = "07_resp.jsp" //응답페이지 설정 동적처리
		vForm.submit(); //서버에 전송처리
	}
</script>
</head>
<body>
	<h1>회원가입(07_req_signup.jsp)</h1>
	<form name="frm" id="signupForm">
		<fieldset>
		<legend>회원가입</legend>
		<p>이름 : <input type="text" name="username"></p>
		<p>아이디 : <input type="text" name="userid"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<p>암호확인 : <input type="password" name="pwd2"></p>
		<p>이메일 : <input type="email" name="email"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="남" class="gender">남
			<input type="radio" name="gender" value="여" class="gender">여
		</p>
		<p>취미 :
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		<input type="button" value="회원가입" onclick="send_go()">
		<input type="reset" value="초기화">
		</fieldset>
	</form>	
</body>
</html>		
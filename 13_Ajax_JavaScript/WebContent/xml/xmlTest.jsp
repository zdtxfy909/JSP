<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
	<hr>
<script>
	/* XMLHttpRequest.readyState : 데이터 전달 결과 상태를 표시한다
	0 : 객체를 생성하고 open을 안한 상태
	1 : open 상태지만 send는 안한 상태
	2 : send 진행한 상태지만 데이터가 발견되지 않은 상태
	3 : 일부 데이터만 받은 상태(데이터를 받는 중)
	4 : 데이터를 전부 응답 받은 상태
	
	XMLHttpRequest.status : 응답 결과 값
	200(성공), 4xx(클라이언트 오류), 5xx(서버측 오류 - 개발자 실수)
	*************/
	//JavaScript 에서 Ajax를 사용할 때 XMLHttpRequest 객체 사용
	//1. XMLHttpRequest 객체 생성하기
	let xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		console.log("readyState : " + xhr.readyState + 
				", status : " + xhr.status); //상태값이 바뀔 때마다 실행
		if (xhr.readyState == 4 && xhr.status == 200) { 
			//정상 응답 완료한 상태
			console.log(">>> 정상처리완료~~ status : " + xhr.status);
			console.log(xhr.responseXML); //XML파일이 넘어옴
			
			// XML 데이터 추출
			let xml = xhr.responseXML;
			let names = xml.getElementsByTagName("name");
			let prices = xml.getElementsByTagName("price");
			console.log(names); //innerHTML 또는 childNodes 사용 가능
			
			//데이터 사용
			let htmlTag = "";
			for (let i = 0; i < names.length; i++) {
				let name = names[i].childNodes[0].nodeValue;
				let price = prices[i].innerHTML;
				htmlTag += "<h2>" + name + " : " + price + "</h2>";
			} 
			document.body.innerHTML += htmlTag;
			
		} else if (xhr.readyState == 4 && xhr.status != 200) {
			console.log(">>> 오류발생~~ status : " + xhr.status);
		}
	};
	
	//2. open("전송방식", "요청정보", 비동기여부)
	xhr.open("GET", "data.xml", true) //요청정보 잘못 쓰면 404 뜸
	
	//3. send() 실행
	xhr.send();
	
</script>
	
</body>
</html>
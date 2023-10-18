<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	//$(document).ready(funtion(){});
	//$().ready(function(){});
	//$(function(){});
	$(document).ready(function(){
		$("#getDataBtn").click(ajaxGetXmlMembers);
		//단축이벤트 방식 + 콜백함수 사용
	});
	function ajaxGetXmlMembers(){
		alert(">> ajaxGetXmlMembers() 실행~~");
		
		$.ajax("getXmlMembers", { //url만 첫번째 파라미터로 넣기 가능
			//url : "getXmlMembers", //컨트롤러 요청명
			type : "get", //method와 같음
			dataType : "xml", //응답받을 데이터의 타입. 형식이 xml이다.
			success : function(respData){
				alert(">> 성공");
				console.log(respData);
				
				//XML 데이터 사용 tbody 영역에 tr 만들어 넣기
				let htmlTag = "";
				//member태그만 추출 (멤버태그만 담긴 배열을 받음)
				$(respData).find("member").each(function(){
					//데이터 하나하나 꺼내기 text() 대신 html() 사용 가능
					//console.log($(this).find("idx").text());
					//console.log($(this).find("name").text());
					htmlTag += "<tr>";
					htmlTag += "<td>" + $(this).find("idx").text() + "</td>";
					htmlTag += "<td>" + $(this).find("name").text() + "</td>";
					htmlTag += "<td>" + $(this).find("age").text() + "</td>";
					htmlTag += "<td>" + $(this).find("addr").text() + "</td>";
					htmlTag += "<td>" + $(this).find("regdate").text() + "</td>";
					htmlTag += "</tr>";
				}); 
				$("#tbody").html(htmlTag); //tbody에 적용
				
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert(">> Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
		});
	}
</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
	<button id="getDataBtn">Ajax - XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>홍길동(샘플)</td>
				<td>27</td>
				<td>서울</td>
				<td>2023-10-17</td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>
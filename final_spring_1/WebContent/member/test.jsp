<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test - WebContent</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	/* AJAX 기능 테스트용 코드 */
	$(document).ready(function(){
		console.log("완료");
		$('#in').blur(function(){
			console.log('안ㄴ녕ㅇ');
			$.ajax({
				url: '${pageContext.request.contextPath}/member/ajaxTest.nds',
				type: 'get',
				success: function(data){
					console.log(data);
					// 위에서 적은 url 요청의 결과로 받아오는 data
					// pase 작업이 필요하다. (그냥 꺼내 쓸 수 없음)
					let data1 = JSON.parse(data);
					console.log(data1.data);
					$('.ajax').text(data1.data);
				}
			})		
		})
	})
</script>
</head>
<body>
	<h1 class="ajax">환경 구축 테스트 페이지입니다.</h1>
	<input id="in" type="text"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script type="text/javascript">
	function change(){
		alert("버튼클릭");
		$('.child').removeClass('hidden');
	}
</script>
<style>
  body{
    padding: 0;
    margin: 0;
  }
  header{
    height: 15vh;
    background-color: yellow;
  }
  .panel {
    height: 85vh;
  }
  .one {
    width: 20vw;
    background-color: aquamarine;
  }
  .two {
    width: 80vw;
    background-color: lightpink;
  }
  .parent{
    display: flex;
  }
  .child {
  	width: 500px;
  	height: 500px;
  	background-color: orange;
  }
  .hidden {
  	display: none;
  }
</style>
</head>
<body>
	<header>
	 헤더입니다.
	</header>
  <div class="parent">
    <div class="one panel">
      메뉴부분입니다.
    </div>
    <div class="two panel">
      바뀔 페이지입니다.
      <button onclick="change()">바꾸기</button>
      <div class="child hidden">
      	<jsp:include page="child1.jsp"></jsp:include>
      </div>
    </div>
  </div>
</body>
</html>
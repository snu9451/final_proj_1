<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0" />
	<!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
	<%@ include file="../mainPage/source_h.jsp" %>
	<script src="../mainPage/assets/vendor/jquery/jquery.min.js"></script>
	<%@ include file="../mainPage/chatroomList-script.jsp" %>
	<!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<link rel="stylesheet" href="../mainPage/chatroomList.css">

<title>채팅방 목록</title>
</head>
<body>
	<form id="destForm" action="chatroom.jsp" method="post">
		<input type="hidden" name="roomKey" id="roomKey">
		<input type="hidden" name="nickname" id="nickname">
		<input type="hidden" name="dest" id="dest">
	</form>
	<div class="wrapper">
		<div class="roomList">&nbsp&nbsp<i class="fas fa-comments-dollar"></i>&nbsp&nbsp채팅방 목록</div>
        <div class="col s3">
        	<ul class="collection"></ul>
        </div>
    </div>
    
    
    <div style="background-color: #536a8a; text-align:center; display:inline-block;  padding-top:15%;" id="preloader">
      <div>
      <img id="nds_img" style="width:30%; height:30%; border-radius: 50%;" src="../common/assets/img/mybro_logo.png" alt="mybro_favicon">		
      	<h1 class="nds">
			내 동생<span style="color:#ffc37b">.</span>
		</h1></div>
    </div>
</body>
</html>
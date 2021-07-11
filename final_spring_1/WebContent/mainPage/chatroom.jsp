<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0" />
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%--   <%@ include file="../mainPage/source_h.jsp" %> --%>
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <%@ include file="../mainPage/chatroom-script.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../mainPage/chatroom.css">
<!-- Font Awesome-->
<script src="https://kit.fontawesome.com/a2c0486048.js" crossorigin="anonymous"></script>
<!-- Favicons -->
<link href="../common/assets/img/mybro_favicon.png" rel="icon">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<link href="../mainPage/assets/css/style.css" rel="stylesheet">
<link href="../itemPage/assets/css/style.css" rel="stylesheet">
<link href="../mainPage/assets/css/main_page.css" rel="stylesheet">
<link href="../common/assets/css/header.css" rel="stylesheet">
<link href="../common/assets/vendor/aos/aos.css" rel="stylesheet">
<title></title>
</head>
<body>
	<div class="wrapper">

   		<div class="roomName">상대방	
   		</div>
   			<div class="col s3">
	   			<div>
	   				<div class="notice_wrapper">
	   				<div>
		        		<div class="notice">
					      <div class="left">
					          <div><i class="fas fa-arrow-circle-left prev"></i></div>
					      </div>
					      <div class="center">
				          	<div class="center_text">
					            <div class="item">심부름 물품 : insert here</div>
					            <div class="price_list">
						            <div class="price_name">물품가 : \
						            	<input class="price" min="0" type="number"/>
							            <button type="button" disabled="true" id="btn_confirm" class="btn btn-success btn-sm">확인</button>
						            </div>
					            </div>
					            <div>
					            </div>
					            <div class="errand_price">심부름 값 : insert here</div>
				          	</div>
					      </div>
					      <span class="center1">
					            <i id="check1" class="fas fa-check-circle iconCheck"></i>
					            <i id="check2" class="fas fa-check-circle iconCheck"></i>
					      </span>
				          <div class="right">
					          <div><i class="fas fa-arrow-circle-right next"></i></div>
				          </div>
			        	</div>
	   				</div>
			          	 <div id="notice_button">
			          	  	<button class="btn btn-sm" type="button">
					   	  		<i class="fas fa-bars"></i>
					   		</button>
			         	  </div>
		        	</div>
	   				<div class="notice_wrapper1">
	   				<div>
		        		<div class="notice1"></div>
	   				</div>
			          	 <div id="notice_button1">
			          	  	<button class="btn btn-sm" type="button">
					   	  		<i class="fas fa-bars"></i>
					   		</button>
			         	  </div>
		        	</div>
		        	<!-- <div class="btn_collapse">
						
		        	</div> -->
   				</div>
          	<!-- insert here : 대화 공지사항 -->
          	<ul class="collection"></ul>
       		</div>
	    <div class="wrapper_input" align="center">
	    	<input type="file" id="input_file" accept="image/*"/>
	    	<img src="../mainPage/insert_photo.png" id="img_insert"/>
		    <input id="input_msg" maxlength='200' onkeyup="if (window.event.keyCode == 13) sendMsg();">
		    <button type="button" id="btn_msg" class="btn btn-warning btn-sm">전송</button>
	    </div>
    </div>
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
    <!-- ver 4.0 v -->
  <script src="../mainPage/assets/vendor/jquery/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <!-- Vendor JS Files -->
  <script src="../mainPage/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>
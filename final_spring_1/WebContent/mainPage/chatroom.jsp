<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0" />
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
  <%@ include file="../mainPage/source_h.jsp" %>
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <%@ include file="../mainPage/chatroom-script.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css"> -->
<link rel="stylesheet" href="../mainPage/chatroom.css">
<title></title>
</head>
<body>
	<div class="wrapper">
   		<div class="roomName">상대방</div>
   			<div class="col s3">
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
					            <button type="button" disabled="true" id="btn_confirm" class="btn btn-success sm">확인</button>
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
          	<!-- insert here : 대화 공지사항 -->
          	<ul class="collection"></ul>
       		</div>
	    <div class="wrapper_input" align="center">
	    	<input type="file" id="input_file" accept="image/*"/>
	    	<img src="../mainPage/insert_photo.png" id="img_insert"/>
		    <input id="input_msg" maxlength='200' onkeyup="if (window.event.keyCode == 13) sendMsg();">
		    <button type="button" id="btn_msg" class="btn btn-warning sm">전송</button>
	    </div>
    </div>
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
    <!-- ver 4.0 v -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="../mainPage/assets/vendor/jquery/jquery.min.js"></script>
  <script src="../mainPage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Vendor JS Files -->
  <script src="../mainPage/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="../mainPage/assets/vendor/php-email-form/validate.js"></script>
  <script src="../mainPage/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="../mainPage/assets/vendor/counterup/counterup.min.js"></script>
  <script src="../mainPage/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="../mainPage/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../mainPage/assets/vendor/venobox/venobox.min.js"></script>
  <script src="../mainPage/assets/vendor/aos/aos.js"></script>
  
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>
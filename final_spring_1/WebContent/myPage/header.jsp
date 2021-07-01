<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>BizLand Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
<!--   <link href="assets/img/favicon.png" rel="icon"> -->
<!--   <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

<!--   <!-- Font Awesome --> -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/> -->

<!--   <!-- Google Fonts --> -->
<!--   <link -->
<!--     href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" -->
<!--     rel="stylesheet"> -->
<!--   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet"> -->

<!--   <!-- Vendor CSS Files --> -->
<!--   <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!--   <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet"> -->
<!--   <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"> -->
<!--   <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet"> -->
<!--   <link href="assets/vendor/venobox/venobox.css" rel="stylesheet"> -->
<!--   <link href="assets/vendor/aos/aos.css" rel="stylesheet"> -->

<!--   <!-- Template Main CSS File --> -->
<!--   <link href="assets/css/myInfo.css" rel="stylesheet"> -->

</head>

<body>
	<!-- ============================= Header Section ========================= -->
	<header id="header" class="fixed-top d-flex align-items-end">
		<!-- drop down -->
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="category_drop" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Dropdown button</button>
			<div class="dropdown-menu" aria-labelledby="category_drop">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a> <a
					class="dropdown-item" href="#">Something else here</a>
			</div>
		</div>

		<!-- End drop down  -->
		<div class="container d-flex align-items-center">
			<img class="myBro__logo mr-2" src="assets/img/mybro_favicon1.png"
				alt="mybro_favicon">
			<h1 class="logo mr-auto main__title">
				<a href="main_page.jsp">내 동생<span>.</span></a>
			</h1>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<!-- 비회원 로그인시 나타나는 nav bar -->
<%
	// 로그인 중이 아닐 때
// 	Map<String, Object> login = new HashMap<>();
// 	String mem_nickname = null;
// 	mem_nickname = null;
	if(session.getAttribute("login") == null){
%>
					<div>
						<li><a id="h_login" href="#" data-toggle="modal"
							data-target="#logIn">로그인</a></li>
						<li><a href="#" data-toggle="modal" data-target="#signInForm">회원가입</a></li>
						<li><a href="#" data-toggle="modal"
							data-target="#report_user">모달test</a></li>
						<button type="button" class="btn btn-outline-light btnTest">BtnTest</button>
					</div>
<%
	// 로그인 중일 때
	} else if(session.getAttribute("login") != null){
// 		login = (Map<String, Object>)session.getAttribute("login");
// 		mem_nickname = login.get("MEM_NICKNAME").toString();
%>
					<!-- 회원 로그인시 나타나는 nav bar -->
					<div>
						<li><span>심부름하기</span> <input type="checkbox" id="switch1"
							name="switch1" class="input__on-off"> <label
							for="switch1" class="label__on-off"> <span class="marble"></span>
								<span class="on">on</span> <span class="off">off</span>
						</label></li>
						<li><a class="nav-link" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="icofont-envelope-open"></i>
								<span class="badge badge-danger badge-counter">0</span>
						</a></li>
						<li><a href=""><%=mem_nickname%></a></li>
						<li><a href="">상품판매</a></li>
						<li><a href="">코인충전</a></li>
						<li><a id="h_myPage" style="cursor:pointer;">마이페이지</a></li>
						<li><a id="h_logout" style="cursor:pointer;">로그아웃</a></li>
					</div>
<%
	}
%>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	  <!-- ver 4.0 v -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
  integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <!-- Vendor JS Files -->
  <!--
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
	<script src="assets/js/myInfo.js"></script>
	
	<!-- ============================= End Header Section ========================= -->
	<!-- Login Modal -->
	<div class="modal fade" id="logIn" tabindex="-1" role="dialog"
		aria-labelledby="logIn" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLongTitle">로그인</h3>
					<button id="login_close" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center d-flex justify-content-center">
					<div
						class="col-12 log__box d-flex flex-column justify-content-center">
						<form id="f_login" class="">
							<div class="form-row col-12 ">
								<div class="col-9 d-flex flex-column">
									<input name="mem_email" class="form-control mb-2 w-100"
										type="text" placeholder="id를 입력해주세요."> <input
										name="mem_pw" class="form-control mb-2 w-100" type="password"
										placeholder="password를 입력해주세요.">
								</div>
								<div class="col-3">
									<button id="nds_login_button"
										class="btn btn-primary ml-1 text-center h-100 w-100"
										type="button">로그인</button>
								</div>
							</div>
							<div class="form-row justify-content-center col-12">
								<div class="custom-control custom-checkbox col-4">
									<input name="isSavedIdChecked" type="checkbox"
										class="custom-control-input" id="saveId"> <label
										class="custom-control-label" for="saveId">ID 저장</label>
								</div>
								<div class="custom-control custom-checkbox col-4">
									<input name="isAutoLoginChecked" type="checkbox"
										class="custom-control-input" id="autoLogin"> <label
										class="custom-control-label" for="autoLogin">자동로그인</label>
								</div>
							</div>
						</form>
						<a id="issueTempPw" href="#" data-toggle="modal"
							data-target="#tempPW" class="col-12 mb-2">비밀번호를 잊으셨나요??</a>
						<button class="btn btn-info p-2">네이버로그인</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
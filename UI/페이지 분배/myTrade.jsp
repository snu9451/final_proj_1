<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>BizLand Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<script>
	function sellAction() {
		console.log("판매내역");
		$.ajax({
			url : "myTrade2.jsp",//session.invalidate()-세션값 모두 날림
			success : function(data) {//@data-json,xml,html,text
				$("#trade_sell").html(data);
				console.log("판매내역");
			},
			error : function(e) {//@param-XMLHttpRequest

			}
		});
	}
	function buyAction() {
		console.log("구매내역");
		$.ajax({
			url : "myTrade3.jsp",//session.invalidate()-세션값 모두 날림
			success : function(data) {//@data-json,xml,html,text
				$("#trade_buy").html(data);
				console.log("구매내역");
			},
			error : function(e) {//@param-XMLHttpRequest

			}
		});
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="left_bar.jsp"></jsp:include>

	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="trade_top">
				<span></span> <span></span> <span></span> <span></span> 
				<a class="total_trade buy active" href="javascript:buyAction()"> <span id="trade_buy"><h4 class="all_rec">구매내역</h4></span></a> 
				<span class="divider_rec"></span> 
				<a class="total_trade sell" href="javascript:sellAction()"> <span id="trade_sell"><h4 class="all_rec">판매내역</h4></span></a> 
				<span></span> <span></span> <span></span> <span></span>
			</div>
			<div class="trade_bottom">

				<!-- 중고거래 내역보기(구매내역 테이블) -->
				
				
			</div>
		</div>
	</div>





		<!-- ver 4.0 v -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>

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
		<script src="assets/js/main.js"></script>
</body>

</html>
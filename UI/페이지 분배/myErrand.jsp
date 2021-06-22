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

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="left_bar.jsp"></jsp:include>
	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="errand_top">
				<span></span> <span></span> <span></span> <span></span> <span
					class="total_errand request active">
					<h4 class="all_rec">내가 요청한 심부름</h4>
				</span> <span class="divider_rec"></span> <span
					class="total_errand response">
					<h4 class="all_rec">내가 수행한 심부름</h4>
				</span> <span></span> <span></span> <span></span> <span></span>
			</div>
			<div class="trade_bottom">

				<!-- 심부름 내역보기(내가 요청한 심부름 테이블) -->
				<span class="total_rec coin2"> 전체 : (inserthere) </span>
				<table class="errand_tb" id="products">
					<form action="" id="setRows">
						<input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
					</form>
					<thead>
						<tr>
							<th scope="cols" width="9%">선택</th>
							<th scope="cols" width="12%">구분</th>
							<th scope="cols" width="22%">날짜</th>
							<th scope="cols" width="30%">제목</th>
							<th scope="cols" width="15%">가격</th>
							<th scope="cols" width="12%">닉네임</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td><span class="badge rounded-pill bg-warning text-dark">진행
									중</span></td>
							<td>2021-06-19 12:49</td>
							<td>내가요청한심부름내가요청한심부름내가요청한심부름내가요청한심부름</td>
							<td>70000원</td>
							<td>기설123</td>
						</tr>
						<tr>
							<td><button type="button"
									class="btn btn-outline-danger btn-smq">X</button></td>
							<td><span class="badge rounded-pill bg-danger text-white">요청
									중</span></td>
							<td>글번호 inserthere</td>
							<td>글번호 inserthere</td>
							<td>글번호 inserthere</td>
							<td>글번호 inserthere</td>
						</tr>
						<tr>
							<td><div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="customCheck1"> <label class="custom-control-label"
										for="customCheck1"></label>
								</div></td>
							<td><span class="badge bg-secondary text-white">완료</span></td>
							<td>글번호 inserthere</td>
							<td>customCheck1 for문 돌려야함 customCheck1 for문 돌려야함
								customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문
								돌려야함</td>
							<td>글번호 inserthere</td>
							<td>글번호 inserthere</td>
						</tr>
						<tr>
							<td><div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="customCheck1"> <label class="custom-control-label"
										for="customCheck1"></label>
								</div></td>
							<td><span class="badge bg-secondary text-white">완료</span></td>
							<td>글번호 inserthere</td>
							<td>customCheck1 for문 돌려야함 customCheck1 for문 돌려야함
								customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문
								돌려야함</td>
							<td>글번호 inserthere</td>
							<td>글번호 inserthere</td>
						</tr>
					</tbody>
				</table>

				<!-- 심부름 내역보기(내가 수행한 심부름 테이블) -->
				<!-- <span class="total_rec coin2">
                전체 : (inserthere)
              </span>
              <table class="errand_tb" id="products">
                <form action="" id="setRows">
                  <input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
                </form>
                <thead >
                  <tr>
                    <th scope="cols" width="9%">선택</th>
                    <th scope="cols" width="22%">날짜</th>
                    <th scope="cols" width="42%">제목</th>
                    <th scope="cols" width="15%">가격</th>
                    <th scope="cols" width="12%">닉네임</th>
                  </tr>
                  </thead>
                <tbody>
                  <tr>
                    <td><div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck1">
                      <label class="custom-control-label" for="customCheck1"></label></div></td>
                    <td>2021-06-19 12:49</td>
                    <td>customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함</td>
                    <td>70000원</td>
                    <td>기설123</td>
                  </tr>
                  <tr>
                    <td><div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck1">
                      <label class="custom-control-label" for="customCheck1"></label></div></td>
                    <td>글번호 inserthere</td>
                    <td>customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함</td>
                    <td>글번호 inserthere</td>
                    <td>글번호 inserthere</td>
                  </tr>
                </tbody>
              </table>-->
				<div class="delete">
					<button type="button" class="btn btn-danger">삭제</button>
				</div>
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
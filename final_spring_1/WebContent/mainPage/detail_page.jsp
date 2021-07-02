<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>내동생 - Detail Page</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
    <!-- Font Awesome-->
    <script
      src="https://kit.fontawesome.com/a2c0486048.js"
      crossorigin="anonymous"
    ></script>
    <!-- Favicons -->
    <link href="assets/img/mybro_favicon1.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/venobox/venobox.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/main_page.css" rel="stylesheet" />
  <%@ include file="./source_h.jsp" %>
</head>

<body>
	<!-- ============================= Header Section ========================= -->
  <jsp:include page="../common/header.jsp" flush="false"></jsp:include>
  <!-- ============================= Header Section ========================= -->
	<!-- ============================= Detail Section ========================= -->
	<main class="pd__main" id="main">
		<section id="product" class="product__description col-12 col-lg-12">
			<div class="container mt-3" id="pd__top" data-aos="fade-up">
				<div class="row h-100 justify-content-around p-2" id="pd__box">
					<!-- 상품 img div -->
					<div
						class="
                col-4 col-lg-4
                d-flex
                justify-content-center
                align-items-center
                p-0
              "
						id="pd__img__box">
						<div class="owl-carousel owl-theme owl-slider text-center"
							id="pd__img__carousel">
							<div class="items">
								<img src="./assets/img/nike_shoe.png" alt="nike_shoe" />
							</div>
							<div class="items">
								<img src="./assets/img/portfolio/portfolio-3.jpg"
									alt="nike_shoe" />
							</div>
							<div class="items">
								<img src="./assets/img/portfolio/portfolio-5.jpg"
									alt="nike_shoe" />
							</div>
						</div>
					</div>
					<!-- End 상품 img div -->
					<!-- 상품 설명 div -->
					<div class="col-8 col-lg-8" id="pd__content">
						<div class="d-flex justify-content-between align-items-end">
							<div class="d-flex align-items-end">
								<span class="" id="pd__title">nike 데이브레이크</span>
								<div class="ml-3">
									<span>조회수</span><span>50</span><span>회</span>
								</div>
							</div>
							<div>
								<ul class="d-flex align-items-end mb-0">
									<li>
										<button>수정</button>
									</li>
									<li>
										<button>삭제</button>
									</li>
									<li>
										<button>
											게시물 신고 <i class="fas fa-exclamation warn"
												style="color: red; font-size: 20px; font-weight: bold"></i>
										</button>
									</li>
								</ul>
							</div>
						</div>
						<div class="pd__divider"></div>
						<div class="mt-3" id="pd__middle">
							<p>나이키 데이브레이크 5번밖에 안신었어요 더 예쁜거 사게되서 팝니당 사이즈 260</p>
						</div>
						<div class="position-relative">
							<div class="d-flex justify-content-between mt-3" id="pd__bottom">
								<div class="d-flex align-items-baseline">
									<h3>판매가격</h3>
								</div>
								<div class="d-flex align-items-baseline">
									<h2>45,000</h2>
									<span>원</span>
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-baseline"
								id="pd__bottom">
								<div class="d-flex justify-content-around align-items-baseline">
									<h3>판매자</h3>
									<div class="ml-3">
										<a class="" id="pd__seller">우아한 남매들</a>
									</div>
									<div class="ml-3">
										<a id="pd__seller__chat"> 대화하기 <i class="far fa-comments"></i>
										</a>
									</div>
								</div>
								<div class="d-flex align-items-baseline">
									<h2>찜하기</h2>
									<button type="button" id="likeBtn">
										<i class="far fa-heart"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End 상품 설명 div -->
				</div>
			</div>
			<!-- ============================= End Detail ========================= -->

        <!-- ============================= Comment Section ========================= -->
        <div class="container p-0">
          <div class="mt-3">
            <div class="row">
              <div class="col-lg-12 col-12">
                <span id="pd__comment__start">댓글</span>
                <div id="pd__comment__divider"></div>
              </div>
            </div>
            <div class="w-100" id="pd__comment__list">
              <div class="w-100 mt-3" id="comment__box">
                <div
                  class="d-flex justify-content-between align-items-end"
                  id=""
                >
                  <div>
                    <span id="comment__user__origin">우아한남매들</span>
                    <span id="comment__date">2021-06-26</span>
                    <span id="comment__time">17:25:55</span>
                  </div>
                  <div>
                    <ul class="d-flex align-items-end mb-0">
                      <li>
                        <button class="pd__comment__btn" id="">답글</button>
                      </li>
                      <li>
                        <button class="pd__comment__btn" id="">수정</button>
                      </li>
                      <li>
                        <button class="pd__comment__btn" id="">삭제</button>
                      </li>
                      <li>
                        <button class="pd__comment__btn" id="">
                          유저신고
                          <i
                            class="fas fa-exclamation warn"
                            style="
                              color: red;
                              font-size: 20px;
                              font-weight: bold;
                            "
                          ></i>
                        </button>
                      </li>
                    </ul>
                  </div>
                </div>
                <div id="comment_txt">
                  <p class="w-100" row="2" readonly>
                    "여기 댓글 내용 들어간당"
                  </p>
                </div>
              </div>
            </div>
            <div class="mt-3">
              <form action="">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">댓글 작성란</span>
                  </div>
                  <textarea
                    class="form-control"
                    aria-label="댓글 작성란"
                    style="resize: none"
                  ></textarea>
                  <div class="input-group-prepend">
                    <button type="button" class="btn btn-primary">
                      댓글등록
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- ============================= End Comment ========================= -->
      </section>
    </main>
    <!-- ============================= End main ========================= -->

    <div id="preloader"></div>
    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

    <!-- ============================= Script part [[ 스크립트 위치 변경하지 말것!!!! ]]========================= -->

    <!-- sweet Alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- ver 4.0 v -->
    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>

    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Vendor JS Files -->

    <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="assets/vendor/counterup/counterup.min.js"></script>
    <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/venobox/venobox.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>

<<<<<<< HEAD:final_spring_1/WebContent/mainPage_JSP/detail_page.jsp
    <!-- Template Main JS File -->
    <script src="assets/js/detail_page.js"></script>
  </body>
=======
	<!-- Template Main JS File -->
	<%@ include file="./source_f.jsp" %>
</body>
>>>>>>> KEY:final_spring_1/WebContent/mainPage/detail_page.jsp
</html>

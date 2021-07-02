<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
	Map<String,Object> itemContext =(Map<String,Object>)request.getAttribute("itemContext");
	int    BM_PRICE        = itemContext.get("BM_PRICE")!=null ? Integer.parseInt(itemContext.get("BM_PRICE").toString()):0;   //가격
	int    BM_NO           = itemContext.get("BM_NO")!=null ? Integer.parseInt(itemContext.get("BM_NO").toString()):0;    //번호
	String BM_TITLE        = itemContext.get("BM_TITLE")!=null ? itemContext.get("BM_TITLE").toString():"";       //제목
	String BM_CONTENT      = itemContext.get("BM_CONTENT")!=null ? itemContext.get("BM_CONTENT").toString():"";     //내용
	String SELLER_NICKNAME = itemContext.get("SELLER_NICKNAME")!=null ? itemContext.get("SELLER_NICKNAME").toString():"";//닉네임
	int    BM_LIKE         = itemContext.get("BM_LIKE")!= null ? Integer.parseInt(itemContext.get("BM_LIKE").toString()):0;   //찜수
	int    BM_HIT          = itemContext.get("BM_HIT")!= null ? Integer.parseInt(itemContext.get("BM_HIT").toString()):0;    //조회수
	String BM_DATE         = itemContext.get("BM_DATE")!= null ? itemContext.get("BM_DATE").toString():"";        //날짜
	String BM_STATUS       = itemContext.get("BM_STATUS")!= null ? itemContext.get("BM_STATUS").toString():"";     //팔린건지 상품의 상태
	int I_LIKE             = itemContext.get("I_LIKE")!= null ? Integer.parseInt(itemContext.get("I_LIKE").toString()):0;         //좋아요한상태인지 아닌지
	int seller_me 		   = itemContext.get("seller_me")!= null ? Integer.parseInt(itemContext.get("seller_me").toString()):0;         //1 이면 판매자와 내가 동일 인물임 0이면 아니고 
	//결과값[4.png] 사진
	List<String> imgs = (List<String>) request.getAttribute("itemImgs");
	//결과값 댓글 itemComments
	List<Map<String,Object>> itemComments = (List<Map<String,Object>>)request.getAttribute("itemComments");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title>내동생 - Detail Page</title>
<meta content="" name="description" />
<meta content="" name="keywords" />
<!-- Font Awesome-->
<script src="https://kit.fontawesome.com/a2c0486048.js"
	crossorigin="anonymous"></script>
<!-- Favicons -->
<link href="assets/img/mybro_favicon1.png" rel="icon" />
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
	rel="stylesheet" />

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet" />
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet" />
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet" />
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet" />
<link href="assets/vendor/aos/aos.css" rel="stylesheet" />

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/main_page.css" rel="stylesheet" />
</head>

<body>
	<!-- ============================= Header Section ========================= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">
			<img class="myBro__logo mr-2" src="assets/img/mybro_favicon1.png"
				alt="mybro_favicon" />
			<h1 class="logo mr-auto main__title">
				<a href="main_page.html">내 동생<span>.</span></a>
			</h1>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<!-- 비회원 로그인시 나타나는 nav bar -->
					<div>
						<li><a href="#" data-toggle="modal" data-target="#logIn">로그인</a>
						</li>
						<li><a href="#" data-toggle="modal" data-target="#signInForm">회원가입</a>
						</li>
						<li><a href="#" data-toggle="modal"
							data-target="#report_user">모달test</a></li>
						<button type="button" class="btn btn-outline-light btnTest">
							BtnTest</button>
					</div>

					<!-- 회원 로그인시 나타나는 nav bar -->
					<!-- <div>
            <li>
              <span>심부름하기</span>
              <input type="checkbox" id="switch1" name="switch1" class="input__on-off">
              <label for="switch1" class="label__on-off">
                <span class="marble"></span>
                <span class="on">on</span>
                <span class="off">off</span>
              </label>
            </li>
            <li>
              <a class="nav-link" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">
                <i class="icofont-envelope-open"></i>
                <span class="badge badge-danger badge-counter">0</span>
              </a>
            </li>
            <li><a href="">profile</a></li>
            <li><a href="">상품판매</a></li>
            <li><a href="">코인충전</a></li>
            <li><a href="">마이페이지</a></li>
            <li><a href="">로그아웃</a></li>
          </div> -->
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>
	</header>
	<!-- ============================= End Header Section ========================= -->
        
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
							<% if("C".equals(BM_STATUS)) { %>
								<% for(int i=0;i<imgs.size();i++){ %>
									<div class="items" style="position: relative;">
									   <img style="width: 100%; height: 100%; opacity: 0.1;" src="./assets/img/board_Img/<%= imgs.get(i) %>" alt="" />
									    <div style='font-size: 3.5rem; width: 100%; position: absolute; top: 50%; text-align: center;'> 판매완료 </div>
									</div>	
							<% }}else if("S".equals(BM_STATUS)) { %>
								<% for(int i=0;i<imgs.size();i++){ %>
									<div class="items" style="position: relative;">
									   <img style="width: 100%; height: 100%; opacity: 0.1;" src="./assets/img/board_Img/<%= imgs.get(i) %>" alt="" />
									   <div style='font-size: 3.5rem; width: 100%; position: absolute; top: 50%; text-align: center;'> 거래중 </div>
									</div>	
							<% }}else{ %>
								<% for(int i=0;i<imgs.size();i++){ %>
									<div class="items" style="position: relative;">
									   <img style="width: 100%; height: 100%" src="./assets/img/board_Img/<%= imgs.get(i) %>" alt="" />
									</div>	
								<% }} %>
						</div>
					</div>
					<!-- End 상품 img div -->
					<!-- 상품 설명 div -->
					<div
						class="col-8 col-lg-8 d-flex flex-column justify-content-between"
						id="pd__content">
						<div class="d-flex flex-column">
							<div class="d-flex justify-content-between align-items-end">
								<div class="d-flex align-items-end">
									<span class="" id="pd__title"><%= BM_TITLE %></span>
									<div class="ml-3">
										<span>조회수</span><span><%= BM_HIT %></span><span>회</span>
									</div>
								</div>
								<div>
									<ul class="d-flex align-items-end mb-0">
									<% if(seller_me==1){%>
										<% if("N".equals(BM_STATUS)){%>
											<li>
												<form action="/item/updateItemConfirm.nds" method="post"  id="main__shape">
													<input type="hidden" name="pr_bm_no" value=<%= BM_NO %> />
													<button>판매처리하기</button>
												</form>
											</li>
										<% } %>
										<li>
											<form action="/item/editItem.nds" method="post"  id="main__shape">
												<input type="hidden" name="pr_bm_no" value=<%= BM_NO %> />
												<button>수정</button>
											</form>
										</li>
										<li>
											<form action="/item/deleteItem.nds" method="post">
												<input type="hidden" name="br_sel_buy" value='sel' />
												<input type="hidden" name="pr_bm_no" value=<%= BM_NO %> />
												<button>삭제</button>
											</form>
										</li>
									<%}else{%>
										<li>
											<form action="join" method="post"  id="main__shape">
												<button>
													게시물 신고 <i class="fas fa-exclamation warn"
														style="color: red; font-size: 20px; font-weight: bold;"></i>
												</button>
											</form>
										</li>
									<% }%>
									</ul>
								</div>
							</div>
							<div class="pd__divider"></div>
						</div>
						<div class="mt-3" id="pd__middle">
							<p><%= BM_CONTENT %></p>
						</div>
						<div class="position-relative">
							<div class="d-flex justify-content-between mt-3" id="pd__bottom">
								<div class="d-flex align-items-baseline">
									<h3>판매가격</h3>
								</div>
								<div class="d-flex align-items-baseline">
									<h2><%= BM_PRICE %></h2>
									<span>원</span>
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-baseline"
								id="pd__bottom">
								<div class="d-flex justify-content-around align-items-baseline">
									<h3>판매자</h3>
									<div class="ml-3">
										<a class="" id="pd__seller"><%= SELLER_NICKNAME %></a>
									</div>
									<div class="ml-3">
									<% if(seller_me==0){%>
										<a id="pd__seller__chat"> 대화하기 <i class="far fa-comments"></i>
										</a>
									<% } %>
									</div>
								</div>
								<div class="d-flex align-items-baseline">
									<h2>찜하기</h2>
									<button type="button" id="<%= BM_NO %>" onclick='likeItem(this)' style="color: red" class='likeBtn'>
									<%
										if(I_LIKE==0){
									%>
										<i class="far fa-heart"></i>
									<%
										} else{
									%>
										<i class= 'fas fa-heart'></i>
									<%
										}
									%>
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
							<% for(int i=0;i<itemComments.size();i++){ %>
						<div class="w-100 mt-3 comments comment_num<%= itemComments.get(i).get("COMMENT_STEP") %>" id="comment__box">
							<div class="d-flex justify-content-between align-items-end" id="">
								<div>
									<span id="comment__user__origin"><%= itemComments.get(i).get("MEM_NICKNAME") %></span> <span
										id="comment__date"><%= itemComments.get(i).get("COMMENT_DATE") %></span>
								</div>
								<div>
									<ul class="d-flex align-items-end mb-0">
									<% if(Integer.parseInt(itemComments.get(i).get("COMMENT_POS").toString())==0){ %>
										<li>
											<button class="pd__comment__btn" id="">답글</button>
										</li>
									<% } %>
									<% if(Integer.parseInt(itemComments.get(i).get("COMMENT_ME").toString())==1){ %>
										<li>
											<button class="pd__comment__btn" id="">수정</button>
										</li>
										<li>
											<button class="pd__comment__btn" id="<%= itemComments.get(i).get("COMMENT_STEP") %>" onclick='deleteComment(this)' >삭제</button>
										</li>
									<% } else {%>
										<li>
											<button class="pd__comment__btn" id="">
												유저신고 <i class="fas fa-exclamation warn"
													style="color: red; font-size: 20px; font-weight: bold;"></i>
											</button>
										</li>
									<% } %>
									</ul>
								</div>
							</div>
							<div id="comment_txt">
							<% if(Integer.parseInt(itemComments.get(i).get("COMMENT_POS").toString())==1){ %>
								<p class="w-100" row="2" readonly>
									<i class="fas fa-angle-double-right"></i> <%= itemComments.get(i).get("COMMENT_MSG") %>
								</p>
							<% } else {%>
								<p class="w-100" row="2" readonly>
									<%= itemComments.get(i).get("COMMENT_MSG") %>
								</p>
							<% } %>
							</div>
						</div>
								<% } %>
						<div class="w-100 mt-3" id="comment__box">
							<div class="d-flex justify-content-between align-items-end" id="">
								<div>
									<span id="comment__user__origin">우아한남매들</span> <span
										id="comment__date">2021-06-26</span> <span id="comment__time">17:25:55</span>
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
												유저신고 <i class="fas fa-exclamation warn"
													style="color: red; font-size: 20px; font-weight: bold;"></i>
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
								<textarea class="form-control" aria-label="댓글 작성란"></textarea>
								<div class="input-group-prepend">
									<button type="button" class="btn btn-primary" id="0-<%= BM_NO %>" onclick='insertComment(this)'>댓글등록</button>
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
	<script  src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- ver 4.0 v -->
	<script  src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
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

	<script  src="assets/vendor/jquery/jquery.min.js"></script>
	<script  src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Vendor JS Files -->

	<script  src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script  src="assets/vendor/php-email-form/validate.js"></script>
	<script  src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script  src="assets/vendor/counterup/counterup.min.js"></script>
	<script  src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script  src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script  src="assets/vendor/venobox/venobox.min.js"></script>
	<script  src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script  src="assets/js/detail_page.js"></script>
	<script  src="../mainPage/assets/js/main_page_js.jsp"></script>
</body>
</html>

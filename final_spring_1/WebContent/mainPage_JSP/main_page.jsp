<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>내동생 - Main Page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Font Awesome-->
  <script src="https://kit.fontawesome.com/a2c0486048.js" crossorigin="anonymous"></script>
  <!-- Favicons -->
  <link href="assets/img/mybro_favicon1.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">

  <!-- Google Map-->
  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
  <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/main_page.css" rel="stylesheet">
</head>

<body>
  <!-- ============================= Header Section ========================= -->
  <header id="header" class="fixed-top d-flex justify-content-even align-items-end">
    <!-- drop down -->
    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="category_drop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-bars"></i>
      </button>
      <div class="dropdown-menu" aria-labelledby="category_drop">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
      </div>
    </div>
    <!-- //////////////////////////////////////// -->
    <div style="width: 85%; padding-left: 50px;">
    <!-- End drop down  -->
    <!-- <div class="container d-flex align-items-center"> -->
    <div class="d-flex align-items-center">
      <img class="myBro__logo mr-2" src="assets/img/mybro_favicon1.png" alt="mybro_favicon">
      <h1 class="logo mr-auto main__title">
        <a href="main_page.html">내 동생<span>.</span></a>
      </h1>
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <!-- 비회원 로그인시 나타나는 nav bar -->
          <div>
            <li><a href="#" data-toggle="modal" data-target="#logIn">로그인</a></li>
            <li><a href="#" data-toggle="modal" data-target="#signUpModal">회원가입</a></li>
            <li><a href="#" data-toggle="modal" data-target="#errand_check_modal">모달test</a></li>
            <button type="button" class="btn btn-outline-light btnTest">BtnTest</button>
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
    </div>
  </header>
  <!-- ============================= End Header Section ========================= -->

  <!-- ============================= Map Section ========================= -->
  <section id="Map" class="d-flex justify-content-center align-items-center">
    <div id="map" class="col-12 col-lg-12" style="width: 100%; height: 80vh;"></div>
  </section>
  <!-- ============================= End Map Section ========================= -->

  <main id="main">
    <!-- ============================= Used goods Section ========================= -->
    <section id="product" class="product">
      <!-- 검색순위 플로팅 -->
      <div id="search__rank" class="serach__rank position-absolute position-fixed">
        <h3 class="mt-1">현재 검색 순위</h3>
        <div class="d-flex justify-content-sm-center align-items-center">
          <span>1</span>
          <h4 class="mb-0">나이키 샌달</h4>
        </div>
      </div>
      <div class="container" data-aos="fade-up">
        <div class="product__title d-flex flex-column justify-content-center align-items-center mb-4">
          <h2>지금 거래중인</h2>
          <h3 class="mb-2">
            <span class="nds__title">내 동</span><span style="color: #444444;">네</span><span class="nds__title">생</span><span style="color: #444444;">활</span>
            <span style="color: #444444;">중고거래상품</span>
          </h3>
          <div class="product__search__box d-flex flex-column align-items-center">
            <div class="product__prefer d-flex justify-content-around align-items-center mb-4">
              <a href="#">인기상품순</a>
              <div class="divider"></div>
              <a href="#">최근상품순</a>
              <div class="divider"></div>
              <a href="#">연령별</a>
            </div>
            <div class="product__serach__bar">
              <form>
                <div class="form-row justify-content-center align-items-center">
                  <div class="col-2">
                    <span class="search__bar__span">찾는상품</span>
                  </div>
                  <div class="col-7">
                    <input type="text" class="form-control text-center" placeholder="어떤 상품들이 거래되고 있을까요? : )"
                      style="font-size: 20px;">
                  </div>
                  <div class="col-1">
                    <button type="button" class="btn btn-outline-light btn-lg ">Search</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>


        <!-- 중고거래 상품 갤러리-->
        <div class="row hidden">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
            <!-- 인기상품 아이콘 -->
            <a class="position-absolute text-decoration-none ml-1" href="#">
              <i id="top__rank" class="fas fa-crown"></i>
              <span class="position-absolute translate-middle badge rounded-pill bg-light text-dark">
                인기상품
              </span>
            </a>
            <div class="product__box">
              <div class="card rounded-0 mb-2">
                <div class="pImgBox img-fluid d-flex flex-column justify-content-end align-items-lg-stretch">
                  <img id="pimg" class="card-img rounded-0 img-fluid" src="assets/img/nike_shoe.png">
                </div>
                <!-- 좋아요버튼 -->
                <button type="button" id="likeBtn" class="btn-sm text-danger position-absolute" href="">
                  <i class="far fa-heart"></i>
                </button>
              </div>
              <div class="p-3 text-left">
                <h3>
                  <a id="pTitle" href="">nike 데이브레이크</a>
                </h3>
                <p id="pDescrip">[[ 상품내용 ]]Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                <div class="row d-flex justify-content-between align-items-center mt-3">
                  <div class="col-lg-auto d-flex align-items-baseline">
                    <h2 id="pPrice">45,000</h2><span>원</span>
                  </div>
                  <label id="pCategory" for="" class="col-lg-auto">* 카테고리 *</label>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in"
            data-aos-delay="200">
            <!-- 인기상품 아이콘 -->
            <a class="position-absolute text-decoration-none" href="#">
              <i id="top__rank" class="fas fa-crown"></i>
              <span class="position-absolute translate-middle badge rounded-pill bg-light text-dark">인기상품</span>
            </a>
            <div class="product__box">
              <div class="card rounded-0 mb-2">
                <div class="pImgBox d-flex flex-column justify-content-center">
                  <img id="pimg" class="card-img rounded-0 img-fluid" src="assets/img/portfolio/portfolio-4.jpg">
                </div>
                <!-- 좋아요버튼 -->
                <button type="button" id="likeBtn" class="btn-sm text-danger position-absolute" href="">
                  <i class="far fa-heart"></i>
                </button>
                </div>
              <div class="p-3 text-left">
                <h3>
                  <a id="pTitle" href="">like Rayban 선글라스</a>
                </h3>
                <p id="pDescrip">[[ 상품내용 ]]Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                <div class="row d-flex justify-content-between align-items-center mt-3">
                  <div class="col-lg-auto d-flex align-items-baseline">
                    <h2 id="pPrice">55,000</h2><span>원</span>
                  </div>
                  <label id="pCategory" for="" class="col-lg-auto">* 카테고리 *</label>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in"
            data-aos-delay="300">
            <!-- 인기상품 아이콘 -->
            <a class="position-absolute text-decoration-none" href="#">
              <i id="top__rank" class="fas fa-crown"></i>
              <span class="position-absolute translate-middle badge rounded-pill bg-light text-dark">인기상품</span>
            </a>
            <div class="product__box">
              <div class="card rounded-0 mb-2">
                <div class="pImgBox d-flex flex-column justify-content-center">
                  <img id="pimg" class="card-img rounded-0 img-fluid" src="assets/img/portfolio/portfolio-3.jpg">
                </div>
                <!-- 좋아요버튼 -->
                <button type="button" id="likeBtn" class="btn-sm text-danger position-absolute" href="">
                  <i class="far fa-heart"></i>
                </button>
              </div>
              <div class="p-3 text-left">
                <h3>
                  <a id="pTitle" href="">우리집 베란다 다육이</a>
                </h3>
                <p id="pDescrip">[[ 상품내용 ]]Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                <div class="row d-flex justify-content-between align-items-center mt-3">
                  <div class="col-lg-auto d-flex align-items-baseline">
                    <h2 id="pPrice">5,000</h2><span>원</span>
                  </div>
                  <label id="pCategory" for="" class="col-lg-auto">* 카테고리 *</label>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="product__box">
              <div class="product__img"><i class="bx bx-world"></i></div>
              <h4><a href="">우리동네 상품 4</a></h4>
              <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="product__box">
              <div class="product__img"><i class="bx bx-slideshow"></i></div>
              <h4><a href="">우리동네 상품 5</a></h4>
              <p>Quis consequatur saepe eligendi voluptatem consequatur dolor consequuntur</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="product__box">
              <div class="product__img"><i class="bx bx-arch"></i></div>
              <h4><a href="">우리동네 상품 6</a></h4>
              <p>Modi nostrum vel laborum. Porro fugit error sit minus sapiente sit aspernatur</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="product__box">
              <div class="product__img"><i class="bx bx-arch"></i></div>
              <h4><a href="">우리동네 상품 6</a></h4>
              <p>Modi nostrum vel laborum. Porro fugit error sit minus sapiente sit aspernatur</p>
            </div>
          </div>

        </div>
      </div>
    </section>
    <!-- ============================= End Used goods ========================= -->

  </main>
  <!-- ============================= End main ========================= -->

  <!-- ============================= Footer start ========================= -->
  <!-- <footer id="footer">
  </footer> -->
  <!-- ============================= Footer End ========================= -->


  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- ============================= Modal Part ========================= -->

  <!-- Login Modal -->
  <div class="modal fade" id="logIn" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="exampleModalLongTitle">로그인</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body text-center d-flex justify-content-center">
          <div class="col-12 log__box d-flex flex-column justify-content-center">
            <form class="" action="">
              <div class="form-row col-12 ">
                  <div class="col-9 d-flex flex-column">
                    <input class="form-control mb-2 w-100" type="text" placeholder="id를 입력해주세요.">
                    <input class="form-control mb-2 w-100" type="password" placeholder="password를 입력해주세요.">
                  </div>
                  <div class="col-3">
                    <button class="btn btn-primary ml-1 text-center h-100 w-100" type="button">로그인</button>
                  </div>
              </div>
              <div class="form-row justify-content-center col-12">
                <div class="custom-control custom-checkbox col-4">
                  <input type="checkbox" class="custom-control-input" id="saveId">
                  <label class="custom-control-label" for="saveId">ID 저장</label>
                </div>
                <div class="custom-control custom-checkbox col-4">
                  <input type="checkbox" class="custom-control-input" id="autoLogin">
                  <label class="custom-control-label" for="autoLogin">자동로그인</label>
                </div>
              </div>
              </form>
            <a href="" class="col-12 mb-2">비밀번호를 잊으셨나요??</a>
            <button class="btn btn-info p-2">네이버로그인</button>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Sign In email Modal -->
  <div class="modal modal-center fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="signIn"
    aria-hidden="true">
    <div class="modal-dialog modal-center" style="width: 400px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="exampleModalLongTitle">이메일로 회원가입 양식을 보내드립니다.</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="form-row justify-content-center align-items-center">
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control w-100" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder="이메일을 입력해주세요 : )">
            </div>
            <div>
              <button type="submit" class="btn btn-primary ml-2 h-75 p-3">확인</button>
            </div>
          </form>
          <div class="d-flex flex-column w-100">
            <label for="naverLogin">네이버 로그인</label>
            <button class="btn btn-info p-2">네이버로그인</button>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Sign Up Form Modal -->
  <div class="modal modal-center fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="signUp"
    aria-hidden="true">
    <div class="modal-dialog modal-center" style="width: 600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="exampleModalLongTitle">회원가입 정보입력</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="needs-validation" id="signUpForm" novalidate>
            <div class="form-group">
              <label for="inputEmail">E-mail</label>
              <input type="email" class="form-control" id="inputEmail" name="mem_email" placeholder="email 자동으로 가져올예정" readonly>
            </div>
            <div class="form-row align-items-center">
              <div class="form-group col-md-12">
                <label for="inputCellPhone">핸드폰 번호</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-8 mb-0">
                    <input type="text" class="form-control" id="inputCellPhone" name="mem_phone" placeholder="(-) 없이 번호를 입력해주세요." required
                    minlength="11">
                  </div>
                  <div class="form-group col-md-4 mb-0 text-right">
                    <button type="button" id="btn_getCode" class="btn btn-primary">인증번호 받기</button>
                  </div>
                </div>
                <div class="valid-feedback">
                  Good
                </div>
                <div class="invalid-feedback">
                  핸드폰번호 11자리를 입력해주세요.
                </div>
              </div>
            </div>
            <div class="form-row align-items-center justify-content-between">
              <div class="form-group col-md-12">
                <label for="inputSafetyCode">인증번호 입력</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-9 mb-0">
                    <input type="text" class="form-control" id="inputSafetyCode" placeholder="인증번호를 입력해주세요." required
                      minlength="6">
                  </div>
                    <div class="form-group col-md-3 mb-0 text-right">
                      <button type="button" id="btn__codeChck" class="btn btn-primary">확인</button>
                    </div>
                </div>
                <div id="safetyCodeChck__box" class="doEmpty">
                  <small id="safetyCodeChck" class="form-text"></small>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassWord">비밀번호</label>
              <input type="password" class="form-control" id="inputPassWord" placeholder="영문,숫자,특수문자 조합 8~20글자" required
                minlength="8">
              <div class="valid-feedback">
                Good
              </div>
            </div>
            <div class="form-group">
              <label for="checkPassWord">비밀번호 확인</label>
              <input type="password" class="form-control" id="checkPassWord" name="mem_pw" placeholder="비밀번호를 한번 더 입력해주세요." required
                minlength="8">
                <div id="pwChck__box" class="doEmpty">
                  <small id="pwChck" class="form-text"></small>
                </div>
            </div>
            <div class="form-row align-items-center justify-content-between">
              <div class="form-group col-md-12">
                <label for="inputNickName">닉네임</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-9 mb-0">
                    <input type="text" class="form-control" id="inputNickName" name="mem_nickname" placeholder="사용하실 닉네임을 입력해주세요." required
                    minlength="2">
                  </div>
                  <div class="form-group col-md-3 mb-0 text-right">
                    <button type="button" class="btn btn-primary" id="btn_nickChck">중복확인</button>
                  </div>
                </div>
                <div id="nickChck__box" class="doEmpty">
                  <small id="nickNameChck" class="form-text"></small>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="inputAge">연령대</label>
              <select class="form-control custom-select" id="inputAge" name="mem_age" required>
                <option value="0">고객님의 연령대를 선택해주세요.</option>
                <option value="10">10대</option>
                <option value="20">20대</option>
                <option value="30">30대</option>
                <option value="40">40대</option>
                <option value="50">50대</option>
                <option value="60">60대이상</option>
              </select>
              <div id="ageChck__box" class="doEmpty">
                <small id="ageChck" class="form-text"></small>
              </div>
            <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" id="mem_female" name="mem_gender" class="custom-control-input" value="F" required>
              <label class="custom-control-label" for="mem_female">여성</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" id="mem_male" name="mem_gender" class="custom-control-input" value="M" required>
              <label class="custom-control-label" for="mem_male">남성</label>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="btn_signUp">확인</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Coin Charge Modal -->
  <div class="modal modal-center fade" id="coinCharge" tabindex="-1" role="dialog" aria-labelledby="coinCharge"
    aria-hidden="true">
    <div class="modal-dialog modal-center" style="width: 600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">코인충전</h3>
            <label>코인을 사용해서 안전하게 거래하세요 <i class="far fa-smile"></i></label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="coinCost" class="">
            <div class="form-group">
              <label for="inputCost">코인 충전</label>
              <input type="text" class="form-control" id="inputCost" placeholder="최소 충전 금액은 1,000원 입니다 : )">
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">충전하기</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">돌아가기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Errand regist Modal -->
  <div class="modal modal-center fade" id="errand_modal" tabindex="-1" role="dialog" aria-labelledby="errand_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 700px;">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">심부름 등록</h3>
            <label>어떤 심부름을 등록하실 건가요?? 상세 정보를 입력해주세요 : )</label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <h5 for="errandItem" style="font-weight: bold;">심부름 아이템</h5>
              <input type="text" class="form-control" id="errandItem" placeholder="어떤 심부름을 원하시나요??">
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h4 class="col-auto text-center mb-0" style="font-weight: bold;">금액 제안:</h4>
              <input type="text" class="form-control col-8" id="errandItemPr" placeholder="예상 금액을 입력해주세요."><span
                class="col-auto">원</span>
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h4 class="col-auto text-center mb-0" style="font-weight: bold;">심부름금액:</h4>
              <input type="text" class="form-control col-8" id="errandCost"
                placeholder="심부름 금액은 최소 1,000원부터 입니다 : )"><span class="col-auto">원</span>
            </div>
            <hr>
            <div class="form-group">
              <label for="">심부름 상세 내용 입력</label>
              <textarea type="text" class="form-control" id="errandDetail" placeholder="상세 내용을 입력해주세요."></textarea>
            </div>
            <div class="form-inline justify-content-between align-items-center mb-2">
              <label class="col-auto text-center">
                <i class="fas fa-map-marker-alt mr-1" style="color: rgb(0, 89, 255); font-size: 20px;"></i>
                현재 나의 위치:
              </label>
              <input type="text" class="col-6 form-control" id="errandAddr" placeholder="주소를 입력해주세요.">
              <button type="button" id="searchAddr" class="col-3 btn btn-primary">주소검색</button>
            </div>
            <div class="form-row justify-content-center mb-1">
              <span class="mr-1"><i class="fas fa-exclamation warn"
                  style="color: red; font-size: 20px; font-weight: bold;"></i></span>
              <small class="text-center">
                <span>심부름 요청은 등록 후 <span class="warn" style="color: red; font-weight: bold;">30분간 유지되며</span>
                  30분동안 심부름이 매칭되지 않았을 때,<br>
                  <span class="warn" style="color: red; font-weight: bold;">자동으로 등록이 취소됩니다.</span>
                </span>
              </small>
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h2 class="col-auto text-center mb-0" style="font-weight: bold;">총금액:</h2>
              <div class="col-9 d-flex justify-content-end align-items-baseline">
                <h3 id="totalCost" class="col-auto">"총금액 위치예정"(6,500)</h3><span class="col-auto">원</span>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" id="errandBtn" class="btn btn-primary">심부름 등록하기</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

    <!-- Errand check Modal -->
  <div class="modal modal-center fade" id="errand_check_modal" tabindex="-1" role="dialog" aria-labelledby="errand_check_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 700px;">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">심부름 확인</h3>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body pb-0">
            <div class="row justify-content-between align-items-center">
              <div class="col-lg-3 w-100 h-100 d-flex flex-column align-items-center" id="profileBox">
                <div class="" id="profileImg">
                  <img src="./assets/img/muji.png" alt="">
                </div>
                <div>
                  <h5 class="mt-3" id="profileName">
                    무지라이언
                  </h5>
                </div>
              </div>
              <div class="col-lg-9 d-flex flex-column" id="errandInfoBox">
                <div class="w-100 text-center" id="errandInfo_item">
                  <h1>"심부름 아이템"</h1>
                </div>
                <div class="w-100 row">
                  <div class="d-flex align-items-end">
                    <span class="text-center">
                      <i class="fas fa-map-marker-alt" style="color: rgb(0, 89, 255); font-size: 20px;"></i>
                      요청자님의 위치:
                    </span>
                    <span class="ml-4" id="errandInfo_addr">서울시 금천구 가산동 </span>
                  </div>
                </div>
                <div class="mt-2 d-flex flex-column align-items-center">
                  <div class="d-inline-flex">
                    <h4 id="errandInfo_user" style="font-weight: bold;">무지라이언<h4><span class="ml-1">님의 요구사항입니다.</span>
                  </div>
                  <textarea class="" id="errandInfo_mainContent" readonly>
                    "심부름 상세사항 들어갈 공간"
                    스벅 아메리카노 1잔 아이스 적게여~
                    빨리오시면 심부름값 x 2 배로 드릴게여~
                  </textarea>
                </div>
                <div class="mt-3">
                  <div class="d-flex justify-content-between">
                    <h4 class="text-center mb-0" style="font-weight: bold;">제안된 금액:</h4>
                    <div class="d-flex align-items-baseline">
                      <h4 class="" id="errandInfo_itemPr">5,500</h4><span class="">원</span>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between" >
                    <h4 class="text-center mb-0" style="font-weight: bold;">심부름금액:</h4>
                    <div class="d-flex align-items-baseline">
                      <h4 class="" id="errandInfo_cost">1,000</h4><span class="">원</span>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between">
                    <h3 class="text-center mb-0" style="font-weight: bold; color: rgb(255, 59, 59);">총금액:</h3>
                    <div class="d-flex align-items-baseline">
                      <h3 class="" id="errandInfo_total">6,000</h3><span class="">원</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" id="" class="btn btn-primary">심부름하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
      </div>
    </div>
  </div>

  <!-- report_board Modal -->
  <div class="modal modal-center fade" id="report_board" tabindex="-1" role="dialog" aria-labelledby="report_board"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 650px;">
        <div class="modal-header">
          <div class="d-flex justify-content-center align-items-center">
            <i class="fas fa-exclamation-circle" style="font-size: 2rem; color: rgb(255, 39, 39);"></i>
            <h2 class="modal-title" id="exampleModalLongTitle">
              게시물신고
            </h2>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="report_content_board" class="">
            <div class="form-group">
              <h4 style="font-weight: bold;">신고분류</h4>
              <select class="form-control custom-select" id="report_category_board">
                <option selected>분류</option>
                <option value="1">욕설 또는 비방</option>
                <option value="2">홍보 및 영리</option>
                <option value="3">불법 및 도박</option>
                <option value="4">음란 및 유해</option>
                <option value="5">도배</option>
                <option value="6">기타</option>
              </select>
            </div>
            <div class="form-group">
              <h4 style="font-weight: bold;">신고내용 상세 입력</h4>
              <div class="form-row">
                <div class="col-7">
                  <label class="mr-2">신고대상 게시글 번호:</label>
                  <span class="mr-2">No.</span><span id="report_num_board">100000</span>
                </div>
                <div class="col-5">
                  <label class="mr-2">신고날짜:</label><span id="report_date_board">2021-06-24</span>  
                </div>
              </div>
              <textarea type="text" class="form-control" id="report_detail_board" placeholder="상세 내용을 입력해주세요." rows="5"></textarea>
            </div>
            <div class="input-group">
              <div class="input-group-prepend">
                <label class="input-group-text" for="report_file_board">Upload</label>
              </div>
              <div class="custom-file">
                <input type="file" class="report_file" id="report_file_board" aria-describedby="inputGroupFileAddon01">
                <label class="custom-file-label" id="report_file_name_board" for="report_file_board">
                  파일은 최대 10MB까지 가능합니다.
                </label>
              </div>
            </div>
          </form>
          <div class="modal-footer">
            <button type="button" id="report_btn" class="btn btn-primary">신고하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- report_user Modal -->
  <div class="modal modal-center fade" id="report_user_modal" tabindex="-1" role="dialog" aria-labelledby="report_user_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 650px;">
        <div class="modal-header">
          <div class="d-flex justify-content-center align-items-center">
            <i class="fas fa-exclamation-circle" style="font-size: 2rem; color: rgb(255, 39, 39);"></i>
            <h2 class="modal-title" id="exampleModalLongTitle">
              회원신고
            </h2>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="report_content_user" class="">
            <div class="form-group">
              <div class="form-row">
                <div class="col-5">
                  <label class="mr-2">신고자:</label><span id="report_user">라이언</span>
                </div>
                <div class="col-5">
                  <label class="mr-2">신고 대상:</label><span id="report_bad_user">무지</span>
                </div>
              </div>
            <div class="dropdown-divider"></div>
            <div class="form-group">
              <h4 style="font-weight: bold;">신고분류</h4>
              <select class="form-control custom-select" id="report_category_user">
                <option selected>분류</option>
                <option value="1">전문판매업자</option>
                <option value="2">비매너 사용자</option>
                <option value="3">욕설 및 성희롱</option>
                <option value="4">기타</option>
              </select>
            </div>
            <div class="form-group">
              <h4 style="font-weight: bold;">신고내용 상세 입력</h4>
              <div class="form-row">
                <div class="col-5">
                  <label class="mr-2">신고날짜:</label><span id="report_date_user">2021-06-25</span>
                </div>
              </div>
              <textarea type="text" class="form-control" id="report_detail_user" placeholder="상세 내용을 입력해주세요."
                rows="5"></textarea>
            </div>
            <div class="input-group">
              <div class="input-group-prepend">
                <label class="input-group-text" for="report_file_user">Upload</label>
              </div>
              <div class="custom-file">
                <input type="file" class="report_file_user" id="report_file_user" aria-describedby="inputGroupFileAddon01">
                <label class="custom-file-label" id="report_file_name_user" for="report_file_user">
                  파일은 최대 10MB까지 가능합니다.
                </label>
              </div>
            </div>
          </form>
          <div class="modal-footer">
            <button type="button" id="report_btn_user" class="btn btn-primary sweet">신고하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================= End Modal Part ========================= -->

  <!-- ============================= Script part [[ 스크립트 위치 변경하지 말것!!!! ]]========================= -->

  <!-- sweet Alert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <!-- ver 4.0 v -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

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

  <!-- Template Main JS File -->
  <script src="assets/js/main_page.js"></script>
  <script src="assets/js/join.js"></script>

  <!-- Google Map Script -->
  <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
  <!-- <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4pd9w90oFRuCZOILRd07MBwVAthwIbIA&callback=initMap&region=kr"
    async></script>
  <script src="./google_map/src/main.js"></script> -->
</body>

</html>
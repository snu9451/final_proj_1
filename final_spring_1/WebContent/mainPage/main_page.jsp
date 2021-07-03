<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>내동생 - 메인페이지</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
    <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
    <%@ include file="../mainPage/source_h.jsp" %>
    <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
    <!-- ＧＯＯＧＬＥ　ＭＡＰ -->
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
  </head>

  <body>
    <!-- ========================================= ▼ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▼ ========================================= -->
    <%@ include file="../common/header.jsp" %>
    <!-- ========================================= ▲ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▲ ========================================= -->

    <!-- =========================================== ▼ ＭＡＰ　ＳＥＣＴＩＯＮ ▼ ============================================= -->
    <section id="Map" class="d-flex justify-content-center align-items-center">
      <div
        id="map"
        class="col-12 col-lg-12"
        style="width: 100%; height: 80vh"
      ></div>
    </section>
    <!-- =========================================== ▲ ＭＡＰ　ＳＥＣＴＩＯＮ ▲ ============================================= -->

    <!-- =========================================== ▼ ＭＡＩＮ　ＳＥＣＴＩＯＮ ▼ ============================================= -->
    <main id="main">
      <!-- ============================================== ▼ 중고거래 상품 ▼ ================================================ -->
      <section id="product" class="product">
        <!-- ▼ 검색순위 플로팅 시작 ▼ -->
        <div
          id="search__rank"
          class="serach__rank position-absolute position-fixed"
        >
          <h3 class="mt-1">현재 검색 순위</h3>
          <div class="d-flex justify-content-sm-center align-items-center">
            <span>1</span>
            <h4 class="mb-0">나이키 샌달</h4>
          </div>
        </div>
        <!-- ▲ 검색순위 플로팅 끝 ▲ -->
        <div class="container" data-aos="fade-up">
          <!-- ▼ 메인 타이틀 시작 ▼ -->
          <div
            class="
              product__title
              d-flex
              flex-column
              justify-content-center
              align-items-center
              mb-4
            "
          >
            <h2>지금 거래중인</h2>
            <h3 class="mb-2">
              <span class="nds__title">내 동</span
              ><span style="color: #444444">네</span
              ><span class="nds__title">생</span
              ><span style="color: #444444">활</span>
              <span style="color: #444444">중고거래상품</span>
            </h3>
            <div
              class="product__search__box d-flex flex-column align-items-center"
            >
              <div
                class="
                  product__prefer
                  d-flex
                  justify-content-around
                  align-items-center
                  mb-4
                "
              >
                <a href="#">인기상품순</a>
                <div class="divider"></div>
                <a href="#">최근상품순</a>
                <div class="divider"></div>
                <a href="#">연령별</a>
              </div>
              <!-- ▼ 검색창 시작 ▼ -->
              <div class="product__serach__bar">
                <form id="f_autocompl">
                  <!-- ▼ 검색창 | form 태그 시작 ▼ -->
                  <div
                    class="form-row justify-content-center align-items-center"
                  >
                    <div class="col-2">
                      <span class="search__bar__span">찾는상품</span>
                    </div>
                    <div class="col-7">
                      <input
                        name="nds_search"
                        type="text"
                        class="form-control text-center"
                        placeholder="어떤 상품들이 거래되고 있을까요? : )"
                        style="font-size: 20px"
                      />
                    </div>
                    <div
                      id="autocomplete"
                      style="position: absolute; z-index: 10"
                    ></div>
                    <!-- (( 검색어 자동완성이 들어갈 영역 )) -->
                    <div class="col-1">
                      <button
                        type="button"
                        class="btn btn-outline-light btn-lg"
                      >
                        Search
                      </button>
                    </div>
                  </div>
                </form>
                <!-- ▲ 검색창 | form 태그 끝 ▲ -->
              </div>
              <!-- ▲ 검색창 끝 ▲ -->
            </div>
          </div>
          <!-- ▲ 메인 타이틀 끝 ▲ -->
          <!-- ============================================== ▼ 상품목록 시작 ▼ ================================================ -->
          <!-- ▼ 중고거래 상품 갤러리 ▼ -->
          <div class="row hidden">
            <!-- 상품 사진 -->
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0"
              data-aos="zoom-in"
              data-aos-delay="200"
            >
              <a class="position-absolute text-decoration-none ml-1" href="#">
                <i id="top__rank" class="fas fa-crown"></i>
                <span
                  class="
                    position-absolute
                    translate-middle
                    badge
                    rounded-pill
                    bg-light
                    text-dark
                  "
                  >인기상품</span
                >
              </a>
              <div class="product__box">
                <div class="card rounded-0 mb-2">
                  <div
                    class="
                      pImgBox
                      img-fluid
                      d-flex
                      flex-column
                      justify-content-end
                      align-items-lg-stretch
                    "
                  >
                    <img
                      id="pimg"
                      class="card-img rounded-0 img-fluid"
                      src="assets/img/nike_shoe.png"
                    />
                  </div>
                  <!-- 좋아요버튼 -->
                  <button
                    type="button"
                    id="likeBtn"
                    class="btn-sm text-danger position-absolute"
                    href=""
                  >
                    <i class="far fa-heart"></i>
                  </button>
                </div>
                <div class="p-3 text-left">
                  <h3>
                    <a id="pTitle" href="">nike 데이브레이크</a>
                  </h3>
                  <p id="pDescrip">
                    [[ 상품내용 ]]Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore
                  </p>
                  <div
                    class="
                      row
                      d-flex
                      justify-content-between
                      align-items-center
                      mt-3
                    "
                  >
                    <div class="col-lg-auto d-flex align-items-baseline">
                      <h2 id="pPrice">45,000</h2>
                      <span>원</span>
                    </div>
                    <label id="pCategory" for="" class="col-lg-auto"
                      >* 카테고리 *</label
                    >
                  </div>
                </div>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0"
              data-aos="zoom-in"
              data-aos-delay="200"
            >
              <!-- 인기상품 아이콘 -->
              <a class="position-absolute text-decoration-none" href="#">
                <i id="top__rank" class="fas fa-crown"></i>
                <span
                  class="
                    position-absolute
                    translate-middle
                    badge
                    rounded-pill
                    bg-light
                    text-dark
                  "
                  >인기상품</span
                >
              </a>
              <div class="product__box">
                <div class="card rounded-0 mb-2">
                  <div
                    class="pImgBox d-flex flex-column justify-content-center"
                  >
                    <img
                      id="pimg"
                      class="card-img rounded-0 img-fluid"
                      src="assets/img/portfolio/portfolio-4.jpg"
                    />
                  </div>
                  <!-- 좋아요버튼 -->
                  <button
                    type="button"
                    id="likeBtn"
                    class="btn-sm text-danger position-absolute"
                    href=""
                  >
                    <i class="far fa-heart"></i>
                  </button>
                </div>
                <div class="p-3 text-left">
                  <h3>
                    <a id="pTitle" href="">like Rayban 선글라스</a>
                  </h3>
                  <p id="pDescrip">
                    [[ 상품내용 ]]Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore
                  </p>
                  <div
                    class="
                      row
                      d-flex
                      justify-content-between
                      align-items-center
                      mt-3
                    "
                  >
                    <div class="col-lg-auto d-flex align-items-baseline">
                      <h2 id="pPrice">55,000</h2>
                      <span>원</span>
                    </div>
                    <label id="pCategory" for="" class="col-lg-auto"
                      >* 카테고리 *</label
                    >
                  </div>
                </div>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0"
              data-aos="zoom-in"
              data-aos-delay="300"
            >
              <!-- 인기상품 아이콘 -->
              <a class="position-absolute text-decoration-none" href="#">
                <i id="top__rank" class="fas fa-crown"></i>
                <span
                  class="
                    position-absolute
                    translate-middle
                    badge
                    rounded-pill
                    bg-light
                    text-dark
                  "
                  >인기상품</span
                >
              </a>
              <div class="product__box">
                <div class="card rounded-0 mb-2">
                  <div
                    class="pImgBox d-flex flex-column justify-content-center"
                  >
                    <img
                      id="pimg"
                      class="card-img rounded-0 img-fluid"
                      src="assets/img/portfolio/portfolio-3.jpg"
                    />
                  </div>
                  <!-- 좋아요버튼 -->
                  <button
                    type="button"
                    id="likeBtn"
                    class="btn-sm text-danger position-absolute"
                    href=""
                  >
                    <i class="far fa-heart"></i>
                  </button>
                </div>
                <div class="p-3 text-left">
                  <h3>
                    <a id="pTitle" href="">우리집 베란다 다육이</a>
                  </h3>
                  <p id="pDescrip">
                    [[ 상품내용 ]]Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore
                  </p>
                  <div
                    class="
                      row
                      d-flex
                      justify-content-between
                      align-items-center
                      mt-3
                    "
                  >
                    <div class="col-lg-auto d-flex align-items-baseline">
                      <h2 id="pPrice">5,000</h2>
                      <span>원</span>
                    </div>
                    <label id="pCategory" for="" class="col-lg-auto"
                      >* 카테고리 *</label
                    >
                  </div>
                </div>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4"
              data-aos="zoom-in"
              data-aos-delay="100"
            >
              <div class="product__box">
                <div class="product__img"><i class="bx bx-world"></i></div>
                <h4><a href="">우리동네 상품 4</a></h4>
                <p>
                  At vero eos et accusamus et iusto odio dignissimos ducimus qui
                  blanditiis
                </p>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4"
              data-aos="zoom-in"
              data-aos-delay="200"
            >
              <div class="product__box">
                <div class="product__img"><i class="bx bx-slideshow"></i></div>
                <h4><a href="">우리동네 상품 5</a></h4>
                <p>
                  Quis consequatur saepe eligendi voluptatem consequatur dolor
                  consequuntur
                </p>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4"
              data-aos="zoom-in"
              data-aos-delay="300"
            >
              <div class="product__box">
                <div class="product__img"><i class="bx bx-arch"></i></div>
                <h4><a href="">우리동네 상품 6</a></h4>
                <p>
                  Modi nostrum vel laborum. Porro fugit error sit minus sapiente
                  sit aspernatur
                </p>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4"
              data-aos="zoom-in"
              data-aos-delay="300"
            >
              <div class="product__box">
                <div class="product__img"><i class="bx bx-arch"></i></div>
                <h4><a href="">우리동네 상품 6</a></h4>
                <p>
                  Modi nostrum vel laborum. Porro fugit error sit minus sapiente
                  sit aspernatur
                </p>
              </div>
            </div>
          </div>
          <!-- ▲ 중고거래 상품 갤러리 ▲ -->
          <!-- ============================================== ▲ 상품목록  끝 ▲ ================================================ -->
        </div>
      </section>
      <!-- ============================================== ▲ 중고거래 상품 ▲ ================================================ -->
    </main>
    <!-- =========================================== ▲ ＭＡＩＮ　ＳＥＣＴＩＯＮ ▲ ============================================= -->

    <!-- =============================================== ▼ ＦＯＯＴＥＲ ▼ ================================================= -->
    <!-- <footer id="footer"></footer> -->
    <!-- =============================================== ▲ ＦＯＯＴＥＲ ▲ ================================================= -->

    <!-- =============================================== ▼ 맨 위로 가기  ▼ ================================================= -->
    <div id="preloader"></div>
    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
    <!-- =============================================== ▲ 맨 위로 가기 ▲ ================================================= -->

    <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
    <!-- 로그인 모달 있던 자리 -->
    <!-- 회원가입(이메일) 모달 있던 자리 --><%@ include
    file="../mainPage/join.jsp" %>
    <!-- 회원가입 양식 모달 있던 자리 --><%@ include
    file="../mainPage/joinForm.jsp" %>
    <!-- 코인충전 모달 있던 자리 --><%@ include
    file="../mainPage/coinCharge.jsp" %>
    <!-- 심부름 모달 있던 자리 --><%@ include file="../mainPage/errand.jsp" %>
    <!-- 게시글 신고 모달 --><%@ include file="../mainPage/reportBoard.jsp" %>
    <!-- 회원 신고 모달 --><%@ include file="../mainPage/reportMem.jsp" %>
    <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->

    <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
    　　<%@ include file="../mainPage/source_f.jsp" %>
    <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
  </body>
</html>

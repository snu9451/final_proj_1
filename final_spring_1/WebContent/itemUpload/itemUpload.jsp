<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
	Map<String,Object> itemContext = null;
	List<String> imgs = null;
	if(request.getAttribute("item")!=null&&request.getAttribute("itemImgs")!=null){
		itemContext =(Map<String,Object>)request.getAttribute("item");
		//결과값[4.png] 사진
		imgs = (List<String>) request.getAttribute("itemImgs");
	}
%>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/itemUpload.css" rel="stylesheet">

</head>

<body>
  <jsp:include page="/myPage/header.jsp"></jsp:include>

  <!-- ======= Hero Section ======= -->

  <section id="hero" class="d-flex align-items-center">
  </section>

  <!-- End Hero -->


  <!-- ======= 상품등록페이지 시작 ======= -->
  <section id="featured-services" class="featured-services">
    <div class="container" data-aos="fade-in">
      <div class="row">
        <div class="col-12 col-lg-12 d-flex align-items-stretch mb-5 mb-lg-0">
          <div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
            <div class="top">
              <span class="title_section">
                <h2 class="title" style="font-weight: bold;">물품 상세 페이지</h2>
              </span>
            </div>
            <div class="middle">
              <h3 class="img_title" style="font-weight: bold; margin-left: 15px;">사진 등록</h3>
              <hr>
              <div class="img_list">
                <div>
                  <button type="button" id="delPic1" class="btn btn-secondary btn-sm delPic1">X</button>
                  <input type='file' id="imgInput1" accept="image/*" style="display: none;"/>
                  <label class="img_add" for="imgInput1" ><img class="img_upload" id="image_section1" src="./assets/img/itemupload/default.png"/></label>
                </div>
                <div>
                  <button type="button" id="delPic2" class="btn btn-secondary btn-sm delPic2">X</button>
                  <input type='file' id="imgInput2" accept="image/*" style="display: none;"/>
                  <label class="img_add" for="imgInput2" ><img class="img_upload" id="image_section2" src="./assets/img/itemupload/default.png"/></label>
                </div>
                <div>
                  <button type="button" id="delPic3" class="btn btn-secondary btn-sm delPic3">X</button>
                  <input type='file' id="imgInput3" accept="image/*" style="display: none;"/>
                  <label class="img_add" for="imgInput3" ><img class="img_upload" id="image_section3" src="./assets/img/itemupload/default.png"/></label>
                </div>
                <div>
                  <button type="button" id="delPic4" class="btn btn-secondary btn-sm delPic4">X</button>
                  <input type='file' id="imgInput4" accept="image/*" style="display: none;"/>
                  <label class="img_add" for="imgInput4" ><img class="img_upload" id="image_section4" src="./assets/img/itemupload/default.png"/></label>
                </div>
                <div>
                  <button type="button" id="delPic5" class="btn btn-secondary btn-sm delPic5">X</button>
                  <input type='file' id="imgInput5" accept="image/*" style="display: none;"/>
                  <label class="img_add" for="imgInput5" ><img class="img_upload" id="image_section5" src="./assets/img/itemupload/default.png"/></label>
                </div>
              </div>
            <div class="bottom">
              <h3 class="img_title" style="font-weight: bold; margin-left: 15px;">상세 정보 입력</h3>
              <hr>
              <div>
                <div class="item_info_title_section">
                  <h4 class="item_info_title">분류</h4>
                  <select id="essential3" class="form-select">
                    <option selected>카테고리 선택</option>
                    <option value="1">디지털기기</option>
                    <option value="2">가구</option>
                    <option value="3">화장품</option>
                    <option value="4">유아동</option>
                    <option value="5">의류</option>
                    <option value="6">도서</option>
                    <option value="7">식물</option>
                    <option value="8">스포츠</option>
                    <option value="9">반려동물용품</option>
                    <option value="10">기타</option>
                  </select>
                  <h4 class="item_info_title" style="color: rgb(211, 69, 69); font-size: 16px;">필수 입력 사항입니다.</h4>
                </div>
              </div>
              <div class="item_info_title_price_section">
                <div class="item_info_title_section">
                  <h4 class="item_info_title">제목</h4>
                     <% if(itemContext!=null){ %> 
                  		<input class="textbox_com" id="essential1" type="text" placeholder="&nbsp필수 입력 사항입니다." 
                  		value = "<%=itemContext.get("BM_TITLE")%>" size="50" maxlength="50">
                  	<% } else{ %>
                  		<input class="textbox_com" id="essential1" type="text" placeholder="&nbsp필수 입력 사항입니다." size="50" maxlength="50"> 
                  	<% } %>
                </div>
                <div class="item_info_price_section">
                  <h4 class="item_info_title">&nbsp&nbsp&nbsp가격</h4>
                  	<% if(itemContext!=null){ %> 
                  		<input class="textbox_com" id="essential2" type="number" placeholder="&nbsp필수 입력 사항입니다." 
                  		value = "<%=Integer.parseInt(itemContext.get("BM_PRICE").toString())%>" max="10000000">
                  	<% } else{ %>
	                  <input class="textbox_com" id="essential2" type="number" placeholder="&nbsp필수 입력 사항입니다." max="10000000">
                  	<% } %>
                </div>
              </div>
                <div class="item_info_content_section">
                  <h4 class="item_info_title">내용</h4>
                  	<textarea class="textarea" cols="119" rows="10" size="200" maxlength="200">
                    <% if(itemContext!=null){ %> 
                  		<%= itemContext.get("BM_CONTENT") %></textarea>
                  	<% } else{ %>
                  		</textarea>
                  	<% } %>
                </div>
            <div class="footer">
              <div class="item_submit">
                <button disabled="true" type="submit" id="btn-submit" class="btn btn-primary">판매 등록</button>
                <button type="button" data-toggle="modal" data-target="#itemCancel" class="btn btn-danger">취소</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </section>
  <!-- 상품등록페이지 끝 -->


  <!-- ============================= Modal Part ========================= -->
  <!-- 상품 등록 취소 모달 -->
  <div>
    <div class="modal fade" id="itemCancel" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
              <i class="fas fa-exclamation-triangle" style="color : red;"></i> 등록 취소</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-center d-flex justify-content-center">
            <div class="col-12 log__box d-flex flex-column justify-content-center">
              <div>
                <div class="col-12 d-flex flex-column">
                  <h4 style="font-size : 20px; font-weight:bold">변경사항이 저장되지 않을 수 있습니다.</h4>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>

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
  <script defer src="assets/vendor/jquery/jquery.min.js"></script>
  <script defer src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script defer src="assets/vendor/php-email-form/validate.js"></script>
  <script defer src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script defer src="assets/vendor/counterup/counterup.min.js"></script>
  <script defer src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script defer src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script defer src="assets/vendor/venobox/venobox.min.js"></script>
  <script defer src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/itemUpload.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>내동생</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
  <%@ include file="../mainPage/source_h.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</head>

<body>

  <!-- ========================================= ▼ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▼ ========================================= -->
  <%@ include file="../common/header.jsp" %>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▲ ========================================= -->
  <main id="main">
  	<div style="background-color: #8AAEE2; height: 100px; width: 100%;"></div>
		<section id="product" class="product">
			<!-- ▼ 검색순위 플로팅 시작 ▼ -->
			<div id="search__rank"
				class="serach__rank position-absolute position-fixed">
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
					class="product__title d-flex flex-column justify-content-center align-items-center mb-4">
					<h2>지금 거래중인</h2>
					<h3 class="mb-2">
						<span class="nds__title">내 동</span><span style="color: #444444;">네</span><span class="nds__title">생</span><span style="color: #444444;">활</span> <span>중고거래상품</span>
					</h3>
					<div
						class="product__search__box d-flex flex-column align-items-center">
						<!-- ▼ 검색창 시작 ▼ -->
						<div class="product__serach__bar">
							<div class="form-row justify-content-center align-items-center">
								<div class="col-2">
									<span class="search__bar__span">찾는상품</span>
								</div>
								<div class="col-7">
									<input id="f_autocompl" name="nds_search" type="text" onKeyup="javascript:if(event.keyCode==13){itemSearch(); hide_autocmpl();}" class="form-control text-center"
										placeholder="어떤 상품들이 거래되고 있을까요? : )" style="font-size: 20px;">
								</div>
								<div id="autocomplete" class="" style="position: absolute; z-index: 100;"></div>
								<div class="col-1">
									<button type="button" class="btn btn-outline-light btn-lg"
										onclick="itemSearch()">Search</button>
								</div>
							</div>
							<!-- ▲ 검색창 끝 ▲ -->
						</div>
					</div>
				</div>
				<!-- ▲ 메인 타이틀 끝 ▲ -->
					<div class="row hidden" id = "itemAll">
<%@ include file="../itemPage/item_page.jsp"%>
</div>
						<!-- ============================================== ▲ 상품목록  끝 ▲ ================================================ -->
					</div>
				</section>
				<!-- ============================================== ▲ 중고거래 상품 ▲ ================================================ -->
	</main>
  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
  <!-- 로그인 모달 있던 자리 -->
  <!-- 회원가입(이메일) 모달 있던 자리 --><%@ include file="../common/joinForm.jsp" %>
  <!-- 회원가입 양식 모달 있던 자리 --><%@ include file="../common/joinForm.jsp" %>
  <!-- 코인충전 모달 있던 자리 --><%@ include file="../common/coinCharge.jsp" %>
  <!-- 심부름 모달 있던 자리 --><%@ include file="../mainPage/errand.jsp" %>
  <!-- 게시글 신고 모달 --><%@ include file="../mainPage/reportBoard.jsp" %>
  <!-- 회원 신고 모달 --><%@ include file="../mainPage/reportMem.jsp" %>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
　　<%@ include file="../mainPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->

 
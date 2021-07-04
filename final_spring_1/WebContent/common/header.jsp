<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- ========================================= ▼ ＨＥＡＤＥＲ ▼ ========================================= -->
  <header id="header" class="fixed-top d-flex align-items-end">
  	<!-- drop down 시작 -->
  	<div class="dropdown">
  		<button class="btn btn-secondary dropdown-toggle" type="button" id="category_drop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  			<i class="fas fa-bars"></i>
  		</button>
		<div class="dropdown-menu" aria-labelledby="category_drop">
        	<ul class="pl-0 mb-0" id="category_item">
         	</ul>
		</div>
	</div>
	<div style="width: 85%; padding-left: 50px;">
	<!-- drop down 끝 -->
<!-- 	<div class="container d-flex align-items-center"> -->
	<div class="d-flex align-items-center">
		<img class="myBro__logo mr-2" src="../common/assets/img/mybro_logo.png" alt="mybro_favicon">
		<h1 class="logo mr-auto main__title">
			<a href="http://localhost:8080/mainPage/main_page.nds">내 동생<span>.</span></a>
		</h1>
		<nav class="nav-menu d-none d-lg-block">
		<ul>
<%
	// 로그인 중이 아닐 때
	Map<String, Object> login = new HashMap<>();
	String mem_nickname = null;	// 전역에서 사용되는 정보
	String mem_email = null;	// 전역에서 사용되는 정보
	double mem_star = 0.0;		// 마이페이지에서 사용되는 정보
	int coin_remain = 0;		// 마이페이지에서 사용되는 정보
	if(session.getAttribute("login") == null){
%>
	<!-- 비회원 로그인시 나타나는 nav bar --><%@ include file="../mainPage/annNavbar.jsp" %>
<%
	// 로그인 중일 때
	} else if(session.getAttribute("login") != null){
		login = (Map<String, Object>)session.getAttribute("login");
		mem_nickname = login.get("MEM_NICKNAME").toString();
		mem_email = login.get("MEM_EMAIL").toString();
		mem_star = Double.parseDouble(String.valueOf(login.get("MEM_STAR")));
// 		coin_remain = Integer.parseInt(String.valueOf(login.get("COIN_REMAIN")));
		
%>
	<!-- 회원 로그인시 나타나는 nav bar --><%@ include file="../mainPage/memNavbar.jsp" %>
<%
	}

%>
		</ul>
		</nav>
	</div>
	</div>
  </header>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ ▲ ========================================= -->





  <!-- ====================================== ▼ HEADER에서 쓰이는 모달 ▼ ====================================== -->
  <!-- 로그인 모달 --><%@ include file="../mainPage/login_modal.jsp" %>
  
  <!-- 코인충전 모달 있던 자리 --><%@ include file="../common/coinCharge.jsp" %>
  <!-- 회원가입 모달 --><%@ include file="../mainPage/join.jsp" %>
  <!-- 회원가입 양식 모달 --><%@ include file="../mainPage/joinForm.jsp" %>
  <!-- 코인충전 모달 --><%@ include file="../mainPage/coinCharge.jsp" %>
  <!-- 심부름 모달 --><%@ include file="../mainPage/errand.jsp" %>
  <!-- ====================================== ▲ HEADER에서 쓰이는 모달 ▲ ====================================== -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 중고거래 내역</title>
<meta content="" name="description">
<meta content="" name="keywords">
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_h.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</head>
<body>


  <!-- =========================================== ▼ ＣＯＭＭＯＮ　ＳＥＣＴＩＯＮ  ▼ ============================================= -->
<%@ include file="../common/header.jsp" %>
<%@ include file="../myPage/left_bar.jsp" %>
  <!-- =========================================== ▲ ＣＯＭＭＯＮ　ＳＥＣＴＩＯＮ ▲ ============================================= -->



	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="trade_top">
				<span></span> <span></span> <span></span> <span></span> 
				<a class="total_trade buy active" href="javascript:buyAction()"> <span><h4 class="all_rec">구매내역</h4></span></a> 
				<span class="divider_rec"></span> 
				<a class="total_trade sell" href="javascript:sellAction()"> <span><h4 class="all_rec">판매내역</h4></span></a> 
				<span></span> <span></span> <span></span><span></span>
			</div>
			<div class="trade_bottom">
			</div>
		</div>
	</div>







  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
<!-- myInfo 모달 --><%@ include file="../myPage/myTrade_modal.jsp" %>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->








  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
<script>
$(document).ready(function () {
	buyAction();
});
</script>
</body>

</html>
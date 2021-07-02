<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 내지갑보기</title>
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
			<div class="myinfo_top">
				<span class="cur_coin">
					<h4 class="coin">보유 코인 :</h4>
					<h4 class="coin1"><%=coin_remain %></h4>
					<h4 class="coin won">원</h4>
					<button type="button" class="btn btn-outline-warning">충전</button>
					<button type="button" class="btn btn-outline-warning">출금</button>
				</span>
			</div>
			<div class="myinfo_bottom">
				<table class="wallet_tb" id="products">
					<form action="" id="setRows">
						<input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
					</form>
					<thead>
						<tr>
							<th scope="cols" width="20%">날짜</th>
							<th scope="cols" width="38%">거래내용</th>
							<th scope="cols" width="15%">거래금액</th>
							<th scope="cols" width="15%">거래 후 잔액</th>
							<th scope="cols" width="12%">입/출금</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2021-06-19 12:49</td>
							<td>ex) 배달을 비행기로 ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ</td>
							<td>4600원</td>
							<td>10600원</td>
							<td>입금</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
						<tr>
							<td>inserthere</td>
							<td>ex) 셀보다 길이가 크면 '...' 처리</td>
							<td>inserthere</td>
							<td>inserthere</td>
							<td>insert</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>




  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>
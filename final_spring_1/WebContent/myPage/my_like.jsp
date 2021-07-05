<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 찜목록</title>
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
			<span class="total_like coin"> 전체 : (inserthere) </span>
			<div class="like_bottom">
				<table class="like_tb" id="products">
					<form action="" id="setRows">
						<input type="hidden" name="rowPerPage" value="4" id="rowPerPage">
					</form>
					<thead>
						<tr>
							<th scope="cols" width="15%"></th>
							<th scope="cols" width="25%"></th>
							<th scope="cols" width="35%"></th>
							<th scope="cols" width="25%"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								inserthere</td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="../myPage/assets/img/ndschar.png"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black">inserthere</a></td>
							<td class="divider">등록일 inserthere<br>inserthere원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="../myPage/assets/img/ndschar.png"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="../myPage/assets/img/ndschar.png"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="../myPage/assets/img/ndschar.png"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="../myPage/assets/img/ndschar.png"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="../myPage/assets/img/ndschar.png"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
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
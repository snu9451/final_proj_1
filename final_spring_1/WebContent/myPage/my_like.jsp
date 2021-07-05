<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
		List<Map<String, Object>> likeList = null;
		likeList = (List<Map<String, Object>>) request.getAttribute("likeList");
		String bm_no 			= null;
		String bm_price 		= null;
		String bm_date 			= null;
		String bm_title			= null;
		String bi_file			= null;
		//out.print(likeList);

%>
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
			<span class="total_like coin"> 전체 : <%=likeList.size()%> </span>
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
<%
	if(likeList == null){
%>	
			<tr>
				<th colspan="5" style="text-align: center !important;">조회결과가 없습니다.</th>
			<tr>

<%
	}else{
		for(int i=0; i<likeList.size(); i++){
			bm_no 	 	 = likeList.get(i).get("BM_NO").toString();
			bm_price  	 = likeList.get(i).get("BM_PRICE").toString();
			bm_date 	 = likeList.get(i).get("BM_DATE").toString();
			bm_title	 = likeList.get(i).get("BM_TITLE").toString();
			bi_file	 	 = likeList.get(i).get("BI_FILE").toString();
%>			
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>No.
							<span style="font-weight : bold; font-size:25px;">
								<%=bm_no %></span></td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="../itemPage/assets/img/board_Img/<%=bi_file %>"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black"><%=bm_title %></a></td>
							<td class="divider">등록일<br><%=bm_date %><br><span style="font-weight : bold; font-size:25px;"><%=bm_price %>
							</span>원</td>
						</tr>
<%
		}
	}
%>					
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
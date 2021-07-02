<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/myInfo.css" rel="stylesheet">

</head>

<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script>
$(document).ready(function () {
	if($("#ratingScore").val()==0){
		$(".outer-star").hide();
		$(".noScore").show();
	}else{
		$(".noScore").hide();
	}
});

function ajaxPW(){
//	let ch_pw = $(".new_pw").val();
//	let pw = $("#mem_pw").val();
	let mydata =  $('#f_myinfo').serialize();
	$.ajax({
		url : "/member/updatePw.nds",
// 		url : "/nds/member/updatePw.nds?mem_email=banana@good.com&mem_pw="+pw+"&change_pw="+ch_pw,
		type : "post",
		data: mydata,
// 		data: { mem_email: banana@good.com, mem_pw: pw , change_pw: ch_pw}
		success : function(data) {//@data-json,xml,html,text
			//alert(data);
			$('#pwChangeLast').modal('show');
			$('#pw_result').html(data);
		},
		error : function(e) {//@param-XMLHttpRequest

		}
	});
}
function pwChange(){
	
	if($(".new_pw_confirm").val().length < 1 || $(".new_pw").val().length < 1){
	    $("#newPwChange").modal("show");
	}else if($(".new_pw_confirm").val().length < 8 || $(".new_pw_confirm").val().length > 20){
	    $("#newPwChange").modal("show");
	}else if($(".new_pw_confirm").val().length < 1 || $(".new_pw").val().length < 1){
	    $("#newPwChange").modal("show");
    }else if($(".new_pw").val() != $(".new_pw_confirm").val()){
	    $("#newPwChange").modal("show");
	}else if ($(".new_pw").val() == $(".new_pw_confirm").val()) {
	    $("#pwChange").modal("show");
    }
};
	<%
		Map<String, Object> memberMap = (Map<String, Object>)request.getAttribute("memberMap");
		double mem_star = Double.parseDouble(String.valueOf(memberMap.get("MEM_STAR")));
		String mem_email = String.valueOf(memberMap.get("MEM_EMAIL"));
		String mem_nickname = String.valueOf(memberMap.get("MEM_NICKNAME"));
		/* String mem_img = String.valueOf(memberMap.get("MEM_IMG")); */
	%>
function nickSelect(){
	let mynick = $('#f_checknickname').serialize();
	$.ajax({
		url: "/member/selectNickName.nds",
		type : "post",
		data: mynick,
		success : function(data) {//@data-json,xml,html,text
		      /* flag = $("#mem_pw").val().length > 0 ? true : false;
		      $("#btn_nicksubmit").attr("disabled", flag); */
		    if($("#newNick").val().length < 2 || $("#newNick").val().length > 15){
				$('#nick_result').html("<h4 style=\"font-size : 15px; color : red; font-weight:bold\">닉네임은 2~15글자이어야 합니다.</h4>");
				$("#btn_nicksubmit").attr("disabled", true);
		    }else{
				if(data.indexOf("가능한") > -1){
		    	console.log($("#newNick").val().length);
					$('#nick_result').html(data);
			    	$("#btn_nicksubmit").attr("disabled", false);
				}else{
					$('#nick_result').html(data);
					$("#btn_nicksubmit").attr("disabled", true);
				}
		    }
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
};
function nickChange(){
	let mynick = $('#f_checknickname').serialize();
	$.ajax({
		url: "/member/updateNickName.nds",
		type : "post",
		data: mynick,
		success : function(data) {//@data-json,xml,html,text
			if(data == 1){
				// 성공한 경우
				$("#nickChangeSuccs").modal('show');
			} else {
				$("#nickChangeFail").modal('show');
			}
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
};
function leave(){
	let myleave =  $('#f_leave').serialize();
	$.ajax({
		url : "/member/leave.nds",
		type : "post",
		data: myleave,
		success : function(data) {
			//alert(data);
			$('#leaveLast').modal('show');
			$('#leave_result').html(data);
		},
		error : function(e) {//@param-XMLHttpRequest

		}
	});
};
function addAction(){
	$('#f_profile_picture').submit();
}
</script>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="left_bar.jsp"></jsp:include>
	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="myinfo_top">
				<div class="profile">
					<form id="f_profile_picture" method="post" enctype="multipart/form-data" action="updateImg.nds">
						<!-- <input type="image" name="change_img" id="image_section" src="./assets/img/profile/1.png"> -->
						<input type='file' name="change_img" id="imgInput" accept="image/*" style="display: none;"/>
		                <label class="img_add">
		                	<img class="img_upload" id="image_section" src="./assets/img/profile/1.png"/>
		                	<!-- src="./assets/img/profile/1.png" -->
		                </label>
						<label type="button" for="imgInput" class="btn btn-danger">사진변경</label>
						<button onclick="addAction()" type="button" class="btn btn-danger">저장</button>
					</form>
				</div>
               
			</div>
			<form id="f_myinfo">
			<div class="myinfo_bottom">
				<div class="myinfo_left">
					<div class="trust">
					<input type="hidden" class="ratingScore" value="<%=mem_star%>" id="ratingScore">
						<h4 class="con_title">신뢰도</h4>
						<div class='RatingStar'>
							<div class='RatingScore'>
								<div class="noScore">
									별점 없음
								</div>
								<div class='outer-star'>
									<div class='inner-star'>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="email">
						<h4 class="con_title">이메일</h4>
 						<h4 class="con_email" name="mem_email"><%=mem_email%></h4>
						<!-- <h4 class="con_email">whrltjf12345@naver.com</h4> -->
					</div>
					<div class="nickname">
						<h4 class="con_title">닉네임</h4>
						<h4 class="con_nick"><%=mem_nickname%></h4>
					</div>
				</div>
				<div class="myinfo_right">
					<div class="pw_con">
						<div class="pw">
							<h4 class="con_title2">현재 비밀번호</h4>
							<input type="password" id="mem_pw" name="mem_pw" value=""/>
						</div>
						<div class="pw">
							<h4 class="con_title2">새 비밀번호</h4>
							<input type="password" class="new_pw" name="change_pw" value=""/>
						</div>
						<div class="pw">
							<h4 class="con_title2">비밀번호 확인</h4>
							<input type="password" class="new_pw_confirm" value=""/>
						</div>
						<div class="pwchange_leave">
							<a data-toggle="modal" data-target="#nickChange">
								<button type="button" class="btn btn-warning">닉네임 변경</button>
							</a>
							<a onclick="pwChange()" data-toggle="modal">
								<button type="button" class="btn btn-success">비밀번호 변경</button>
							</a>
							<a data-toggle="modal" data-target="#leave">
								<button type="button" class="btn btn-danger">탈퇴하기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	<!-- ============================= Modal Part ========================= -->
  	<!-- 닉네임 변경하기 -->
	<div>
	  <div class="modal fade" id="nickChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : orange"></i> 닉네임 중복 확인</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-10 d-flex flex-column">
		          		<h4 style="font-size : 20px; font-weight:bold">새 닉네임을 입력해주세요.</h4>
		            </div>
		            <div class="col-12 d-flex justify-content-around">
		            	<span class="col-1 d-flex flex-column"></span>
	                	<div class="col-8 d-flex flex-column">
	                		<form id="f_checknickname">
		                  		<input id="newNick" name="mem_nickname" class="form-control mb-2" type="text" style="padding:0px;">
		                  		<div id="nick_result" style="padding-top:10px"></div>
	                		</form>
	                	</div>
	                	<div class="col-3 d-flex flex-column">
			                <button onclick="nickSelect()" id="btn_checknickname" class="btn btn-dark btn-sm" style="margin-left : 0px;">중복확인</button>
	                	</div>
	              	</div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button id="btn_nicksubmit" disabled="true" onclick="nickChange()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 닉네임 변경 실패 -->
	<div>
	  <div class="modal fade" id="nickChangeFail" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : red"></i> 닉네임 변경 실패</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		          		<h4 style="font-size : 20px; color : red; font-weight:bold">닉네임 변경에 실패하였습니다.</h4>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 닉네임 변경 성공 -->
	<div>
	  <div class="modal fade" id="nickChangeSuccs" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 닉네임 변경 성공</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		          		<h4 style="font-size : 20px; font-weight:bold">닉네임 변경에 성공하였습니다.</h4>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button onClick="window.location.reload()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
  	<!-- 비밀번호 변경하기 -->
	<div>
	  <div class="modal fade" id="pwChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 비밀번호 변경</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold">정말 변경하시겠습니까?
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" onclick="ajaxPW()" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 비밀번호 최종확인 -->
	<div>
	  <div class="modal fade" id="pwChangeLast" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 비밀번호 변경</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	            	<div id="pw_result" style="padding-top:10px"></div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button onClick="window.location.reload()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 새 비밀번호 변경하기 -->
	<div>
	  <div class="modal fade" id="newPwChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 비밀번호 변경 실패</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold;">비밀번호를 확인해주세요.
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 현재 비밀번호 비교 확인 여부 -->
	<div>
	  <div class="modal fade" id="curPwChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 비밀번호 변경 실패</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold;">현재 비밀번호를 확인해주세요.
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
  	<!-- 탈퇴하기 -->
	<div>
	  <div class="modal fade" id="leave" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 탈퇴하기</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold;">비밀번호를 입력해주세요.<br>
	              </h4>
	              <div style="color : red; margin-bottom : 15px; font-weight:bold;">(모든정보가 삭제됩니다.)</div>
              	  <div class="col-12 d-flex flex-column">
	              	  <form id="f_leave">
	                  	<input class="form-control mb-2" type="password" name="mem_pw">
	              	  </form>
               	  </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button onclick="leave()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 탈퇴하기 -->
	<div>
	  <div class="modal fade" id="leaveLast" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 탈퇴하기</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <div id="leave_result" style="padding-top:10px"></div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	

	<!-- ver 4.0 v -->
<!-- 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!-- Vendor JS Files -->
	<!--
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  -->


	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/myInfo.js"></script>
	<script type="text/javascript">


	</script>
</body>

</html>
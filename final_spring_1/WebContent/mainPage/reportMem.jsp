<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 회원 신고 모달  ▼ ================================================= -->
	<div class="modal modal-center fade" id="report_user_modal" tabindex="-1" role="dialog" aria-labelledby="report_user_modal"aria-hidden="true">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content" style="width: 650px;">
				<div class="modal-header">
					<div class="d-flex justify-content-center align-items-center">
						<i class="fas fa-exclamation-circle" style="font-size: 2rem; color: rgb(255, 39, 39);"></i>
						<h2 class="modal-title" id="exampleModalLongTitle">회원신고</h2>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="report_content_user" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<div class="form-row">
								<div class="col-5">
									<label class="mr-2">신고자: </label>
									<span id="report_user" style="font-size: 20px;font-weight: bold;"><%=mem_nickname%></span>
								</div>
								<div class="col-5">
									<label class="mr-2">신고 대상:</label>
									<span id="report_bad_user" name="pr_mem_nickname_to" style="font-size: 20px;font-weight: bold;"></span>
									<input type="hidden" id="pr_mem_nickname_to" name="pr_mem_nickname_to" />
								</div>
							</div>
							<div class="dropdown-divider"></div>
							<div class="form-group">
								<h4 style="font-weight: bold;">신고분류</h4>
								<select class="form-control custom-select"
									id="report_category_user" name="pr_report_type">
									<option selected>분류</option>
									<option value="전문판매업자">전문판매업자</option>
									<option value="비매너 사용자">비매너 사용자</option>
									<option value="욕설 및 성희롱">욕설 및 성희롱</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<div class="form-group">
								<h4 style="font-weight: bold;">신고내용 상세 입력</h4>
								<div class="form-row">
									<div class="col-auto">
										<label class="mr-2">신고날짜:</label><span id="report_date_user"><%=report_date%></span>
									</div>
								</div>
								<textarea type="text" class="form-control" id="report_detail_user" name="pr_report_msg" placeholder="상세 내용을 입력해주세요." rows="5"></textarea>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<label class="input-group-text" for="report_file_user">Upload</label>
								</div>
								<div class="custom-file">
									<input type="file" class="report_file_user" id="report_file_user" name="pr_img_real_name" aria-describedby="inputGroupFileAddon01">
									<label class="custom-file-label" id="report_file_name_user" for="report_file_user">파일은 최대 10MB까지 가능합니다. </label>
								</div>
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" id="report_btn_user" class="btn btn-primary">신고하기</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- =============================================== ▲ 회원 신고 모달 ▲ ================================================= -->
	<!-- 회원 신고 성공 -->
	<div>
	  <div class="modal fade" id="reportSuccess_mem" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 회원 신고</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		          		<h4 style="font-size : 20px; font-weight:bold">해당 회원이 신고되었습니다.</h4>
		          		<h4 style="font-size : 15px; color: red; font-weight:bold">(관리자 확인 후 조치 될 예정입니다.)</h4>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" onclick="location.reload(true)" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
<body>
	<script>
	$(document).ready(function(){
		

	//각 댓글의 회원닉네임을 담을 변수
	let comment_userNickname;
		$(".pd__comment__userReport").on('click', function(event){
		//댓글의 회원닉네임
		comment_userNickname = event.target.parentNode.parentNode.parentNode.previousSibling.previousSibling.childNodes[1].innerText;
		//신고대상자 회원 닉네임
		$("#report_bad_user").text(comment_userNickname);
		$("#pr_mem_nickname_to").attr('value', comment_userNickname);
		
		//회원 신고 모달 show
		$("#report_user_modal").modal('show');
		
	});
		
		//[신고하기]버튼 클릭시 실행되는 함수
		$("#report_btn_user").on('click', function(){
			if(!$("#report_file_user").val()){
				return swal("신고관련 파일을 첨부해 주세요!!","","warning");
			} else {
			//<form>태그 초기화
		 	let form = $("#report_content_user")[0];
			//<form> 안에 name속성을 가진 input 태그들의 value를 담아놓음.
		 	let formData = new FormData(form);
  		 	$.ajax({ 
		 		url: '/admin/memReport.nds',
		 		type: 'POST', 
		 		data: formData, 
		 		success: function (data) {
		 			console.log(data);
		 			$("#report_user_modal").modal('hide');
		 			$("#reportSuccess_mem").modal('show');
		 		}, 
				error: function (data) {
					alert("내용을 기입해주세요."); 
				}, 
				cache: false, 
				contentType: false, 
				processData: false 
			});
			}
		})
	});
	</script>
</body>
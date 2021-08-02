<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 게시글 신고 모달  ▼ ================================================= -->
<form id="report_content_board" method="post" enctype="multipart/form-data"><!-- ▼ 신고창 | form 태그 시작 ▼ -->
<div class="modal modal-center fade" id="report_board" tabindex="-1" role="dialog" aria-labelledby="report_board"
  aria-hidden="true">
  <div class="modal-dialog modal-center" role="document">
    <div class="modal-content" style="width: 650px;">
      <div class="modal-header">
        <div class="d-flex justify-content-center align-items-center">
          <i class="fas fa-exclamation-circle" style="font-size: 2rem; color: rgb(255, 39, 39);"></i>
          <h2 class="modal-title" id="exampleModalLongTitle">게시물신고</h2>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <h4 style="font-weight: bold;">신고분류</h4>
            <select class="form-control custom-select" name="pr_report_type" id="report_category_board">
              <option selected="selected" name="pr_report_type" value="default">분류</option>
              <option value="욕설,비방">욕설 또는 비방</option>
              <option value="홍보,영리목적">홍보 및 영리</option>
              <option value="불법,도박">불법 및 도박</option>
              <option value="음란,유해">음란 및 유해</option>
              <option value="도배">도배</option>
              <option value="기타">기타</option>
            </select>
          </div>
          <div class="form-group">
            <h4 style="font-weight: bold;">신고내용 상세 입력</h4>
            <div class="form-row">
              <div class="col-6">
                <label class="mr-2">신고대상 게시글 번호:</label>
                <span class="mr-2">No.</span><span id="report_num_board"><%=BM_NO %></span>
                <input type="hidden" name="pr_bm_no" value="<%=BM_NO %>"/>
              </div>
              <div class="col-6">
                <label class="mr-2">신고날짜:</label><span id="report_date_board"><%=report_date %></span>  
              </div>
            </div>
            <textarea name="pr_report_msg" type="text" class="form-control" id="report_detail_board" placeholder="상세 내용을 입력해주세요." rows="5"></textarea>
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <label class="input-group-text" for="report_file_board">Upload</label>
            </div>
            <div class="custom-file">
              <input type="file" name="imgFile" class="report_file" id="report_file_board" src="" aria-describedby="inputGroupFileAddon01">
              <label class="custom-file-label" id="report_file_name_board" for="report_file_board">파일은 최대 10MB까지 가능합니다.</label>
            </div>
          </div>
        <div class="modal-footer">
           <button type="button" id="report_btn" class="btn btn-primary">신고하기</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
</form><!-- ▲ 신고창 | form 태그 끝 ▲ -->
  <!-- 게시물 신고 성공 -->
<div>
  <div class="modal fade" id="reportSuccess" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
          <i class="fas fa-question-circle" style="color : green"></i> 게시물 신고</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body text-center d-flex justify-content-center">
          <div class="col-12 log__box d-flex flex-column justify-content-center">
            <div>
	            <div class="col-12 d-flex flex-column">
	          		<h4 style="font-size : 20px; font-weight:bold">게시물이 신고되었습니다.</h4>
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
// $('#report_file_name_board').click(function(input){
// });
 
 $('#report_file_board').on('change',function(){
	 function readURL(input) {
		  console.log('1');
		 if (input.files && input.files[0]) {
		     var reader = new FileReader();
		     reader.onload = function (e) {
		       $('#report_file_name_board').attr('src', e.target.result);
		     }
	     reader.readAsDataURL(input.files[0]);
		 }
	  }
	  readURL(this);
     //get the file name
     var fileName = $(this).val();
     //replace the "Choose a file" label
     $(this).next('.custom-file-label').html(fileName);
 })
 
//  $('#report_btn').click(function(){
// 	$('#report_content_board').submit();
//  });
 $("#report_btn").on("click", function (event) { /// event.preventDefault(); 
 	let fileCheck = $("#report_file_board").val();
 	if(!fileCheck){
 		swal("신고관련 파일을 첨부해 주세요!!","","warning");
    	return false;
 	} else {
	 	let form = $('#report_content_board')[0]; 
	 	let formData = new FormData(form); 
	 	$.ajax({ 
	 		url: '/admin/boardReport.nds',
	 		type: 'POST', 
	 		data: formData, 
	 		success: function (data) {
	 			$("#report_board").modal('hide');
	 			$("#reportSuccess").modal('show');
	 		}, 
			error: function (data) {
		     	alert("내용 기입 및 파일을 첨부해 주세요");
			}, 
			cache: false, 
			contentType: false, 
			processData: false 
		});
 	}
 });


  </script> 
  </body>
  <!-- =============================================== ▲ 게시글 신고 모달 ▲ ================================================= -->
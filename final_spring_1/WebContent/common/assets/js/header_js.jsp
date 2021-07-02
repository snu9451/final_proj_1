<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#h_myPage').on('click', function(){
		location.href = "http://localhost:8080/myPage/my_info.nds";
	});
	
	//버튼 클릭시 모달창 show
	$(".btnTest").click(function () {
	  console.log("modal test");
	  $("#report_board").modal("show");
	});
	
	//모달창 버튼 클릭시 이벤트
	$("#report_btn_user").click(function () {
	  console.log("btn clicked");
	  swal("Well Done!!", "심부름이 등록되었습니다 : )", "success").then(() => {
	    $("#report_content_user").submit();
	  });
	});
	
	//drop down toggle
	$('.dropdown-toggle').dropdown('toggle');
	$(".dropdown-toggle").dropdown("toggle");
	
	
	
	
})
</script>
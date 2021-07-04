<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- toastr css 라이브러리 -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- toastr js 라이브러리 -->
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
// 알람 메시지
$(document).ready(function(){
	toastr.info("알람 메시지", "안녕하세요~", {
		progressBar: 'true',
		timeOut: 3000,
		showMethod: 'slideDown',
		closeButton: 'true',
		positionClass: 'toast-bottom-right',
	// 	iconClass: 'cus'
	});
});
</script>

<style>
.toast {
	background-color: #FFC37B;
	color: black !important;
	box-shadow: none;
}

.toast:hover {
	box-shadow: none !important;
}
</style>
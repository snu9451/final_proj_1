<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#getCpCode").click(function() {
			const inputCellPhone = $("#inputCellPhone").val();
			let dt = "mem_phone=" + inputCellPhone;
			console.log(inputCellPhone);
			$.ajax({
				type: "post",
				data: dt,
				url: "http://192.168.0.163:9696http://192.168.0.163:9696/member/sendSMSCode.nds",
				success: function(data) {
					alert(data);
				}
			})
		})
	})
</script>
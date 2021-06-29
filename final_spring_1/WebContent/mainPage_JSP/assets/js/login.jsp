<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	/* 로그인 모달에서 로그인 버튼이 클릭되었을 때 */
	$('#nds_login_button').on('click',function(){
		let mem_email = $('input[name=mem_email]').val().trim();
		let mem_pw = $('input[name=mem_pw]').val().trim();
		let isSavedIdChecked = $('input[name=isSavedIdChecked]').is(':checked'); // 반환값: true/false
		let isAutoLoginChecked = $('input[name=isAutoLoginChecked]').is(':checked'); // 반환값: true/false
// 		alert(mem_email+', '+mem_pw+', '+isSavedIdChecked+', '+isAutoLoginChecked);
		let dt = "mem_email="+mem_email+"&mem_pw="+mem_pw+"&isSavedIdChecked="+isSavedIdChecked+"&isAutoLoginChecked="+isAutoLoginChecked;
		$.ajax({
			url: 'http://192.168.0.163:9696/member/doLogin.nds',
			data: dt,
			type: 'post',
			dataType: 'html',
			success: function(data){
				/* 로그인에 실패한 경우 */
				if("fail" == data){
					swal("아이디 또는 비밀번호가 잘못되었습니다.");
					/* ============== [[ 공통코드: 폼 비워주기 ]] ============== */
					$('#f_login input').each(function(index){
						$('#f_login input').eq(index).val('');
					});
					/* 체크박스 체크 해제하기 */
					$('input[name=isSavedIdChecked]').prop('checked', false);
					$('input[name=isAutoLoginChecked]').prop('checked', false);
					
				}
				else {
					swal("환영합니다. "+data+"님!")
						.then((value) => {
							/* 확인버튼 클릭 시 메인 페이지로 새로이 이동 */
							location.reload();
						});
// 					/* ============== [[ 공통코드: 폼 비워주기 ]] ============== */
// 					$('#f_login input').each(function(index){
// 						$('#f_login input').eq(index).val('');
// 					});
// 					/* 체크박스 체크 해제하기 */
// 					$('input[name=isSavedIdChecked]').prop('checked', false);
// 					$('input[name=isAutoLoginChecked]').prop('checked', false);
					
				}
			},
			error: function(xhrObject){
				alert(xhrObject.resposeText);
			}
			
		});
	});
	
	/* 비밀번호 잊으셨나요 글씨 클릭 시 */
	$('#issueTempPw').on('click',function(){
		$('#login_close').trigger('click');
// 		$('#logIn').modal('hide');
		swal("가입하신 이메일을 입력해주세요.", {
			  content: "input",
			  closeOnClickOutside: false
			})
			.then((value) => {
				/* 입력한 이메일의 존재여부를 확인하고 임시비번 발급 */
				let dt = "mem_email="+value.trim();
				$.ajax({
					url: 'http://192.168.0.163:9696/member/issueTempPw.nds',
					data: dt,
					type: 'post',
					dataType: 'html',
					success: function(data){
						if("fail" == data){
							swal("가입되어 있지 않은 이메일입니다.");
						} else if("success" == data){
							swal("임시 비밀번호가 발급되었습니다.", "보안을 위해 로그인 후 비밀번호를 변경해주세요.", "success", {
							  	button: "확인",
							});
						}
						$('#logIn').modal('show');
					}
				});
			});
	});
});

</script>
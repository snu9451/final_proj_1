<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

//출금 모달창이 나타났을때 실행되는 함수
$("#coinWithdraw").on('shown.bs.modal', function(){
	let inputCoin = false;
	let inputAccount = false;
	let inputSecurityCode = false;
	
	//현재 소지 코인 String -> Num 형변환
	let currentCoin = Number($("#currentCoin").text());
	//[출금하기] 버튼 
	let btn_coinWithdraw = $("#btn_coinWithdraw");
	
	//btn_coinWithdraw.attr("disabled", true);
	
		//현재 소지 코인이 0보다 클때
		if (currentCoin > 0){
			console.log('!0');
			//출금 금액 input 부분 활성화
			$("#input_withdrawCost").attr("disabled", false);
			
 			//[출금하기] 버튼 활성화
			btn_coinWithdraw.attr("disabled", false);
			
			$("#input_withdrawCost").on('keyup change', function(){
				//출금 금액 입력값
		 		let input_withdrawCost = $("#input_withdrawCost").val();
				//출금 가능 금액 나타내주는 <label>
				let getCost = $("#showCost");
				
				//수수료 7%를 제외한 출금 가능 금액 나타내주기
				let result = Math.floor(input_withdrawCost * 0.93);
				getCost.text("");
				getCost.text(result);
				
				//현재 소지 코인보다 높은 출금금액 입력시 alert창 띄우기
				if(input_withdrawCost > currentCoin){
					swal("현재 소지하신 코인 이상으로 입력하실 수 없습니다.", "다시 입력해주세요", "warning")
					.then(()=> {
						//출금 금액 입력 <input> 초기화
						$("#input_withdrawCost").val("");
						getCost.text("");
					})
				}
				else {
					//출금하기 <input>에 값이 있을 때
					if(input_withdrawCost.length > 0){
						console.log('exist');
						inputCoin = true;
					} else {
						consoel.log('none');
						inputCoin = false;
					}
				}
			})/////////////////////// end of keyup function
						
		}
		//현재 소지 코인이 0보다 작을때
		else if(currentCoin < 0){
			console.log('=== 0');
			$("#input_withdrawCost").attr("disabled", true);
			btn_coinWithdraw.attr("disabled", true);
		}
		
		//계좌번호가 입력됐을 때
		$("#input_account").on('keyup change', function(){
			let input_account = $("#input_account").val();
			//계좌번호 입력칸
			console.log(input_account.length);
			if(input_account.length === 16){
				$("#account_digits_box").empty();
				$("#account_digits_box").html(
				"<small id='account_digits' class='p-3' style='color: red; font-weight: bold;'>16자리 확인되었습니다.</small>"		
				)
				inputAccount = true;
			} else {
				inputAccount = false;
			}
		})
		
		//인증번호 확인
		$("#btn_withdraw_codeChck").on('click', function(){
			console.log('code chck');
 			const withdraw_inputCellPhone = $("#withdraw_inputCellPhone").val();
 			let dt = "mem_phone=" + withdraw_inputCellPhone;
 			console.log(withdraw_inputCellPhone);
 			$.ajax({
 				type: "post",
 				data: dt,
 				url: "http://localhost:9696/member/sendSMSCode.nds",
 				success: function(data) {
 					alert(data);
 				}
 			});
		})
		
	//모든 <input> 태그에 값이 있을 때, [출금하기] 버튼 활성화
	if(!inputCoin && !inputAccount && !inputSecurityCode) {
		btn_coinWithdraw.attr("disabled", true);
	}
	else {
		btn_coinWithdraw.attr("disabled", false);
	}
})/////////////////////////////////// end of shown modal function
</script>	
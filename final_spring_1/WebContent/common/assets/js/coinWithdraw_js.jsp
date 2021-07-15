<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$("#coinWithdraw").on('shown.bs.modal', function(){
	let currentCoin = Number($("#currentCoin").text());
	let btn_coinWithdraw = $("#btn_coinWithdraw");
	console.log(currentCoin);
		if (currentCoin > 0){
			console.log('available');
			$("#input_withdrawCost").attr("disabled", false);
			btn_coinWithdraw.attr("disabled", false);
			$("#input_withdrawCost").on('keyup change', function(){
			})
						
		} else {
			console.log('inavailable');
			$("#input_withdrawCost").attr("disabled", true);
			btn_coinWithdraw.attr("disabled", true);
		}
/* 		let input_withdrawCost = $("#input_withdrawCost").val();
		let getCost = $("#getCost");
		let result = Math.floor(input_withdrawCost * 0.93);
		getCost.text("");
		getCost.text(result); */
})
</script>	
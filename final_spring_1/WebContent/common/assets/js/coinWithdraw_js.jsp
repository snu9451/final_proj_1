<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$("#coinWithdraw").on('shown.bs.modal', function(){
	console.log('show');
	let input_withdrawCost = $("#input_withdrawCost");
	let getCost = $("#getCost");
	$("#input_withdrawCost").on('keyup change', function(){
		console.log('key');
	})
})
</script>	
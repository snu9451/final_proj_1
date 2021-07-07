<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
var $setRows = $('#setRows');

$setRows.submit(function(e) {
	e.preventDefault();
	var rowPerPage = $('#rowPerPage').val() * 1;
	// 1 을  곱하여 문자열을 숫자형로 변환

	$('#nav').remove();
	var $products = $('#products');

	$products.after('<div id="nav">');

	var $tr = $($products).find('tbody tr');
	var rowTotals = $tr.length;

	var pageTotal = Math.ceil(rowTotals / rowPerPage);
	var i = 0;

	for (; i < pageTotal; i++) {
		$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
				'#nav');
	}
	$tr.addClass('off-screen').slice(0, rowPerPage).removeClass(
			'off-screen');

	var $pagingLink = $('#nav a');
	$pagingLink.on('click', function(evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');
		// 0 => 0(0*4), 4(0*4+4)
		// 1 => 4(1*4), 8(1*4+4)
		// 2 => 8(2*4), 12(2*4+4)
		// 시작 행 = 페이지 번호 * 페이지당 행수
		// 끝 행 = 시작 행 + 페이지당 행수

		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;
		$tr.css('opacity', '0.0').addClass('off-screen').slice(
				startItem, endItem).removeClass('off-screen').animate({
			opacity : 1
		}, 300);
		console.log("5");
	});

	$pagingLink.filter(':first').addClass('active');

});

$setRows.submit();

$(document).ready(function () {
	console.log("mytrade js ready");
	buyAction();
});

$(document).ready(function () {
	/////////////////구매내역 판매내역 active///////////////
	$(".buy").click(function () {
	  $(".sell").removeClass('active');
	  $(this).addClass('active');
	});
	$(".sell").click(function () {
	  $(".buy").removeClass('active');
	  $(this).addClass('active');
	});
});

function sellAction() {
	console.log("판매내역");
	$.ajax({
		url :  "/member/selectMyTrade.nds?gubun=seller",
		success : function(data) {//@data-json,xml,html,text
			console.log("buy: "+data);
			let seller_list = '';
				seller_list +="<table class='like_tb' id='products'>"
				seller_list +="<form action='' id='setRows'>"
				seller_list +="	<input type='hidden' name='rowPerPage' value='4' id='rowPerPage'>"
				seller_list +="</form>"
				seller_list +="<thead>"
				seller_list +="	<tr>"
				seller_list +="		<th scope='cols' width='15%'></th>"
				seller_list +="		<th scope='cols' width='25%'></th>"
				seller_list +="		<th scope='cols' width='35%'></th>"
				seller_list +="		<th scope='cols' width='25%'></th>"
				seller_list +="	</tr>"
				seller_list +="</thead>"
				seller_list +="<tbody>"
			for(i=0; i<data.length; i++){
	 			seller_list +="<tr>"
				seller_list +="	<td class='divider'>글번호"+data[i].BM_NO+"</td>"
				seller_list +="	<td class='divider_img'><a href='http://naver.com'"
				seller_list +="		style='color: black'><img id='item_image'"
				seller_list +="			src=../itemPage/assets/img/board_Img/"+data[i].BI_FILE+"></a></td>"
				seller_list +="	<td class='divider_con'><a href='http://naver.com'"
				seller_list +="		style='color: black'>"+data[i].BM_TITLE+"</a></td>"
				seller_list +="	<td class='divider'>등록일"+data[i].BM_DATE+"<br>"+data[i].BM_PRICE+"원<br>"
				seller_list +="		<a href='#' data-toggle='modal' data-target='#delete'>"
				seller_list +="			<button type='button' class='btn btn-danger btn-sm'>삭제하기</button>"
				seller_list +="		</a>"
				seller_list +="	</td>"
				seller_list +="</tr>"
			}
				seller_list +="</tbody>"
				seller_list +="</table>"
				
			$(".trade_bottom").html(seller_list);
		},
		error : function(e) {//@param-XMLHttpRequest

		}
	});
}
function buyAction() {
	console.log("구매내역");
	$.ajax({
		url : "/member/selectMyTrade.nds?gubun=buyer",
		success : function(data) {//@data-json,xml,html,text
			let imsi = JSON.stringify(data);
			let parse = JSON.parse(imsi);
			console.log("imsi: "+imsi);
			console.log("parse: "+parse);
		let buyer_list = '';
			buyer_list +="<table class='like_tb' id='products'>"
			buyer_list +="<form action='' id='setRows'>"
			buyer_list +="	<input type='hidden' name='rowPerPage' value='4' id='rowPerPage'>"
			buyer_list +="</form>"
			buyer_list +="<thead>"
			buyer_list +="	<tr>"
			buyer_list +="		<th scope='cols' width='15%'></th>"
			buyer_list +="		<th scope='cols' width='25%'></th>"
			buyer_list +="		<th scope='cols' width='35%'></th>"
			buyer_list +="		<th scope='cols' width='25%'></th>"
			buyer_list +="	</tr>"
			buyer_list +="</thead>"
			buyer_list +="<tbody>"
		for(i=0; i<data.length; i++){
			console.log(data[i].BM_NO);
 			buyer_list +="<tr>"
			buyer_list +="	<td class='divider'>글번호"+data[i].BM_NO+"</td>"
			buyer_list +="	<td class='divider_img'><a href='http://naver.com'"
			buyer_list +="		style='color: black'><img id='item_image'"
			buyer_list +="			src=../itemPage/assets/img/board_Img/"+data[i].BI_FILE+"></a></td>"
			buyer_list +="	<td class='divider_con'><a href='http://naver.com'"
			buyer_list +="		style='color: black'>"+data[i].BM_TITLE+"</a></td>"
			buyer_list +="	<td class='divider'>등록일"+data[i].BM_DATE+"<br>"+data[i].BM_PRICE+"원<br>"
			buyer_list +="		<a href='#' data-toggle='modal' data-target='#delete'>"
			buyer_list +="			<button type='button' class='btn btn-danger btn-sm'>삭제하기</button>"
			buyer_list +="		</a>"
			buyer_list +="	</td>"
			buyer_list +="</tr>"
		}
			buyer_list +="</tbody>"
			buyer_list +="</table>"
			
		$(".trade_bottom").html(buyer_list);
		},
		error : function(e) {//@param-XMLHttpRequest

		}
	});
}


</script>
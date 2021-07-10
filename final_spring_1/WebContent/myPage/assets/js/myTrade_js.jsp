<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<script type="text/javascript">
  /* ============================ 페이징처리 함수 시작 ====================================*/
  var $setRows = $("#setRows");

  $setRows.submit(function (e) {
    e.preventDefault();
    var rowPerPage = $("#rowPerPage").val() * 1;
    // 1 을  곱하여 문자열을 숫자형로 변환

    $("#nav").remove();
    var $products = $("#products");

    $products.after('<div id="nav">');

    var $tr = $($products).find("tbody tr");
    var rowTotals = $tr.length;

    var pageTotal = Math.ceil(rowTotals / rowPerPage);
    var i = 0;

    for (; i < pageTotal; i++) {
      $('<a href="#"></a>')
        .attr("rel", i)
        .html(i + 1)
        .appendTo("#nav");
    }
    $tr.addClass("off-screen").slice(0, rowPerPage).removeClass("off-screen");

    var $pagingLink = $("#nav a");
    $pagingLink.on("click", function (evt) {
      evt.preventDefault();
      var $this = $(this);
      if ($this.hasClass("active")) {
        return;
      }
      $pagingLink.removeClass("active");
      $this.addClass("active");
      // 0 => 0(0*4), 4(0*4+4)
      // 1 => 4(1*4), 8(1*4+4)
      // 2 => 8(2*4), 12(2*4+4)
      // 시작 행 = 페이지 번호 * 페이지당 행수
      // 끝 행 = 시작 행 + 페이지당 행수

      var currPage = $this.attr("rel");
      var startItem = currPage * rowPerPage;
      var endItem = startItem + rowPerPage;
      $tr
        .css("opacity", "0.0")
        .addClass("off-screen")
        .slice(startItem, endItem)
        .removeClass("off-screen")
        .animate(
          {
            opacity: 1,
          },
          300
        );
      console.log("5");
    });

    $pagingLink.filter(":first").addClass("active");
  });

  $setRows.submit();
  /* ============================ 페이징처리 함수 끝 ====================================*/
  
  $(document).on('ready',function () {
    /////////////////구매내역 판매내역 active///////////////
    $(".buy").click(function () {
      $(".sell").removeClass("active");
      $(this).addClass("active");
    });
    $(".sell").click(function () {
      $(".buy").removeClass("active");
      $(this).addClass("active");
    });
  });
  
  /*삭제하기 버튼 이벤트*/
  let filter;//구매내역 or 판매내역을 구분하기 위한 변수
  function deleteAction(deleteBtn, filter){
		  $(deleteBtn).click(function(){
			  
			  //삭제하기 버튼
			  let delBtn = $(this);
			  
			  //삭제하기 버튼을 클릭한 <tr>태그
			  let tr = delBtn.parent().parent().parent();
			  
			  //게시글 번호
			  let bm_no = tr.find('#bm_no').text();
			  
			  deleteModal(filter, bm_no);
		  })
  }
  
  /* 판매내역 불러오기 */
  function sellAction() {
    $.ajax({
      url: "/member/selectMyTrade.nds?gubun=sel",
      success: function (data) {
        //@data-json,xml,html,text
        let count = JSON.stringify(data.length);
        let seller_list = "";
        seller_list +=
          "<span class='total_rec coin2'>" + "전체: " + count + "</span>";
        seller_list += "<table class='like_tb' id='products'>";
        seller_list += "<form action='' id='setRows'>";
        seller_list +=
          "	<input type='hidden' name='rowPerPage' value='4' id='rowPerPage'>";
        seller_list += "</form>";
        seller_list += "<thead>";
        seller_list += "	<tr>";
        seller_list += "		<th scope='cols' width='15%'></th>";
        seller_list += "		<th scope='cols' width='25%'></th>";
        seller_list += "		<th scope='cols' width='35%'></th>";
        seller_list += "		<th scope='cols' width='25%'></th>";
        seller_list += "	</tr>";
        seller_list += "</thead>";
        seller_list += "<tbody>";
        for (i = 0; i < data.length; i++) {
          seller_list += "<tr>";
          seller_list += "	<td class='divider'>글번호 <span id='bm_no'>" + data[i].BM_NO + "</span></td>";
          seller_list += "	<td class='divider_img'><a href='http://naver.com'";
          seller_list += "		style='color: black'><img id='item_image'";
          seller_list +=
            "			src=../itemPage/assets/img/board_Img/" +
            data[i].BI_FILE +
            "></a></td>";
          seller_list += "	<td class='divider_con'><a href='http://naver.com'";
          seller_list +=
            "		style='color: black'>" + data[i].BM_TITLE + "</a></td>";
          seller_list +=
            "	<td class='divider'>등록일" +
            data[i].BM_DATE +
            "<br>" +
            data[i].BM_PRICE +
            "원<br>";
          seller_list += "		<a href='#' data-toggle='modal' data-target=''>";
          seller_list +=
            "			<button type='button' id='deleteBtn' class='btn btn-danger btn-sm deleteBtn'>삭제하기</button>";
          seller_list += "		</a>";
          seller_list += "	</td>";
          seller_list += "</tr>";
        }////////////////////// end of for
        seller_list += "</tbody>";
        seller_list += "</table>";

        $(".trade_bottom").html(seller_list);
        filter = 'sel';
  	  	let deleteBtn = $(".deleteBtn");
  	  	deleteAction(deleteBtn, filter);
      },
      error: function (e) {
        //@param-XMLHttpRequest
      },
    });
  }
  
  /* 구매내역 불러오기 */
  function buyAction() {
    $.ajax({
      url: "/member/selectMyTrade.nds?gubun=buy",
      success: function (data) {
        //@data-json,xml,html,text
        let count = JSON.stringify(data.length);
        let buyer_list = "";
        buyer_list +=
          "<span class='total_rec coin2'>" + "전체: " + count + "</span>";
        buyer_list += "<table class='like_tb' id='products'>";
        buyer_list += "<form action='' id='setRows'>";
        buyer_list +=
          "	<input type='hidden' name='rowPerPage' value='4' id='rowPerPage'>";
        buyer_list += "</form>";
        buyer_list += "<thead>";
        buyer_list += "	<tr>";	
        buyer_list += "		<th scope='cols' width='15%'></th>";
        buyer_list += "		<th scope='cols' width='25%'></th>";
        buyer_list += "		<th scope='cols' width='35%'></th>";
        buyer_list += "		<th scope='cols' width='25%'></th>";
        buyer_list += "	</tr>";
        buyer_list += "</thead>";
        buyer_list += "<tbody>";
        for (i = 0; i < data.length; i++) {
          buyer_list += "<tr>";
          buyer_list += "	<td class='divider'>글번호 <span id='bm_no'>" + data[i].BM_NO + "</span></td>";
          buyer_list += "	<td class='divider_img'><a href='http://naver.com'";
          buyer_list += "		style='color: black'><img id='item_image'";
          buyer_list +=
            "			src=../itemPage/assets/img/board_Img/" +
            data[i].BI_FILE +
            "></a></td>";
          buyer_list += "	<td class='divider_con'><a href='http://naver.com'";
          buyer_list +=
            "		style='color: black'>" + data[i].BM_TITLE + "</a></td>";
          buyer_list +=
            "	<td class='divider'>등록일" +
            data[i].BM_DATE +
            "<br>" +
            data[i].BM_PRICE +
            "원<br>";
          buyer_list += "		<a href='#' data-toggle='modal' data-target=''>";
          buyer_list +=
            "			<button type='button' id='deleteBtn' class='btn btn-danger btn-sm deleteBtn'>삭제하기</button>";
          buyer_list += "		</a>";
          buyer_list += "	</td>";
          buyer_list += "</tr>";
        }////////////////////// end of for
        buyer_list += "</tbody>";
        buyer_list += "</table>";

        $(".trade_bottom").html(buyer_list);
        filter = 'buy';
  	  	let deleteBtn = $(".deleteBtn");
  	  	deleteAction(deleteBtn, filter);
      },
      error: function (e) {
        //@param-XMLHttpRequest
      },
    });
  }
  
  function deleteModal(filter, bm_no){
	  console.log('deleteModal');
	  //삭제모달 나타내기
	  $("#delete").modal('show');
	  
	  //모달이 브라우저에 나타났을 떄 실행되는 함수
	  $("#delete").on('shown.bs.modal', function(){
		  console.log('deleteModal shown');
		  $("#btn_delete").click(function(){
			 console.log('click delete confirm');
			 console.log(filter+", "+bm_no);
/*   			  $.ajax({
				  url: "/member/deleteTradeRec.nds?br_sel_buy="+filter+"&pr__bm_no="+bm_no
				  success: function(){
					  console.log("filter"+filter);
					  console.log("no"+bm_no);
				  }
			  }); */
		  });
	  });
  }

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
/*==========================================[[ Mine ]]==================================================*/
// Search__Rank Visible Controll
$(document).ready(function () {
  const product = document.querySelector("#product");
  
  //스크롤 이동시 이벤트
  $(window).scroll(function () {
    //중고상품 섹션 top 위치값
    let product_top = product.getBoundingClientRect().top;
    //현재 스크롤 위치값
    let scroll_top = $(window).scrollTop();
    //현재 스크롤 위치가 상품 섹션보다 내려갔을 때
    if (product_top < scroll_top) {
      $("#search__rank").addClass("search__visible");
      $("#search__rank").removeClass("search__invisible");
      
      // 검색창에 포커스
  	  $('input[name=nds_search]').focus();
      
    } else {
      $("#search__rank").removeClass("search__visible");
      $("#search__rank").addClass("search__invisible");
    }
  });
  //회원가입 - 입력창 유효값 확인 이벤트
  const form = document.querySelector(".needs-validation");
  form.addEventListener(
    "submit",
    function (event) {
      if (form.checkValidity() == false) {
        event.preventDefault();
        event.stopPropagation();
        form.classList.add("was-validated");
      }
      // 서버 연동 처리
    },
    false
  );
});
// //지도 말풍선 클릭시 이벤트
// $(window).on("load", function () {
//   console.log(3, "window.onload");
//   if ($(".errand_regist").length) {
//     $(document).on("click", ".errand_regist", function () {
//       console.log("errand!!!!!!!");
//       const modal = document.querySelector("#errand_modal");
//       console.log(modal);
//       $(modal).modal("show");
//     });
//   }
// });
//회원가입 - 입력창 유효값 확인 이벤트
const form = document.querySelector(".needs-validation");
form.addEventListener(
  "submit",
  function (event) {
    if (form.checkValidity() == false) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add("was-validated");
    }
    // 서버 연동 처리
  },
  false
);
//버튼 누르면 top으로 이동
$(".back-to-top").click(function () {
  $("html, body").animate(
    {
      scrollTop: 0,
    },
    1500,
    "easeInOutExpo"
  );
  return false;
});
//파일 이름 가져오기 & 파일용량 제한
$(document).ready(function () {
  console.log($(".report_file_user"));
  $(".report_file_user").on("change", function () {
    const file = $(this)[0].files[0];
    const fileName = $(this)[0].files[0].name;
    if (file) {
      console.log(file);
      const fileSize = file.size;
      if (fileSize > 1024 * 1024 * 10) {
        alert("10MB 이하 파일만 등록할 수 있습니다.");
        $(".report_file_user").next()[0].innerHTML = "Choose file";
        return;
      }
    }
    $(".report_file_user").next()[0].innerHTML = fileName;
  });
});
/*==========================================[[ Not Mine ]]==================================================*/
// Preloader
$(window).on("load", function () {
  if ($("#preloader").length) {
    $("#preloader")
      .delay(100)
      .fadeOut("slow", function () {
        $(this).remove();
      });
  }
});
// Toggle .header-scrolled class to #header when page is scrolled
// $(window).scroll(function () {
//   if ($(this).scrollTop() > 100) {
//     $("#header").addClass("header-scrolled");
//     $("#topbar").addClass("topbar-scrolled");
//   } else {
//     $("#header").removeClass("header-scrolled");
//     $("#topbar").removeClass("topbar-scrolled");
//   }
// });
// if ($(window).scrollTop() > 100) {
//   $("#header").addClass("header-scrolled");
//   $("#topbar").addClass("topbar-scrolled");
// }
// Back to top button
$(window).scroll(function () {
  if ($(this).scrollTop() > 100) {
    $(".back-to-top").fadeIn("slow");
  } else {
    $(".back-to-top").fadeOut("slow");
  }
});
// jQuery counterUp
$('[data-toggle="counter-up"]').counterUp({
  delay: 10,
  time: 1000,
});
// Testimonials carousel (uses the Owl Carousel library)
$(".testimonials-carousel").owlCarousel({
  autoplay: true,
  dots: true,
  loop: true,
  items: 1,
});
// Portfolio details carousel
$(".portfolio-details-carousel").owlCarousel({
  autoplay: true,
  dots: true,
  loop: true,
  items: 1,
});
// Init AOS
function aos_init() {
  AOS.init({
    duration: 1500,
    once: true,
  });
}
$(window).on("load", function () {
  aos_init();
});
/*==========================================[[ 여기는 지혜영역 ]]==================================================*/
//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
function allItemList(pr_choice){
	let item = {"pr_choice":pr_choice.id};
    $.ajax({
    	type: "GET",
    	url: "http://localhost:9696/item/selectItemList.nds",
		data: item,
    	success:function(data){
			viewItemList(data);
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
};
//검색어를 입력하여 찾기
function itemSearch(){
// 	let search = {"pr_search":$('input[name=nds_search]').val()};
    $.ajax({
    	type: "GET",
//     	data: search,
    	url: "http://localhost:9696/item/selectBySearch.nds?pr_search="+$('input[name=nds_search]').val(),
    	success:function(data){
//     		alert(data);
			viewItemList(data);
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
};
function viewItemList(items){
	let itemAll = document.querySelector("#itemAll");
	if(items.length>0){
		itemAll.innerHTML = items;
	}
	else{
		itemAll.innerHTML= "<div style='display: block; width: 100%; text-align: center;'>조회결과가 없습니다<div>";
	}
}
//상품 찜하기 클릭 시
function likeItem(itemno){	
	let itemID = document.getElementById(itemno.id);
	let item = {"pr_bm_no":itemno.id};
    $.ajax({
    	type: "POST",
    	url: "http://localhost:9696/item/likeItem.nds",
		data: item,
    	success:function(data){
    		if(data==1) {
				//찜 ok
				itemID.innerHTML="<i class= 'fas fa-heart'></i>";
			}else if(data==-1){
				//찜 no
				itemID.innerHTML="<i class= 'far fa-heart'></i>";
			}else{
				alert("로그인 후 이용가능합니다!");
			}
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
};
//댓글 삭제하기
function deleteComment(comment){	
	let p_comment_step = comment.id; //삭제할번호
    $.ajax({
    	type: "POST",
    	url: "http://localhost:9696/item/deleteComment.nds",
		data: {"p_comment_step":p_comment_step},
    	success:function(data){
    		if(data=='true') {
				document.querySelector('.comment_num'+p_comment_step).remove();
			}
    		else if(data=="false") {
				alert("삭제할 댓글이 없습니다.");				
			}
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
};
//댓글 작성하기
function insertComment(comment){
	console.log(comment);
	let commentType_No = comment.id.split('-');//commentType_No[0]은 댓글인지 대댓글인지 확인(0이면 댓글/1이면 대댓글), commentType_No[1]은 게시물번호
	let commentgroup = commentType_No[0]==0 ? 0 : 1;//댓글이면 0, 대댓글이면 댓글의 그룹번호를 가져옴
// 	let msg = document.querySelector(".form-control").value; //메세지 내용
	let msg = $('#nds_comment').val();
	let item = {"pr_comment_pos":commentType_No[0],"pr_comment_group":commentgroup,"pr_comment_msg":msg,"pr_bm_no":commentType_No[1]};
	if(msg == ""){
    	alert("내용을 입력해주세요.")
    	return false;
    }else{
	    $.ajax({
	      type: "POST",
	      url: "http://localhost:9696/item/insertComment.nds",
	      data: item,
	      success: function (data) {
	        $("#pd__comment__list").append(data);
	        $("#nds_comment").val("");
	        console.log(data);
	        // 	    		if(data['result']=='true') {
	        //댓글이라면
	        // 					if(data['COMMENT_POS']==0){
	        // 						document.querySelector("#pd__comment__list").innerHTML=comment_make(data)+document.querySelector("#pd__comment__list").innerHTML;
	        // 					}
	        // 				//대댓글이라면
	        // 				else{
	        // 					console.log("e대댓글");
	        // 				}
	        // 				document.querySelector(".form-control").value ="";
	        // 	 			}
	        //     		else if(data['result']=="itemFalse") {
	        // 				alert("해당 글이 존재하지 않습니다.");
	        // 			}
	        //     		else if(data['result']=="comentFalse") {
	        // 				alert("댓글이 존재하지 않습니다.");
	        // 			}
	        // 			else{
	        // 				alert("로그인 후 이용가능합니다!");
	        // 			}
	      },
	      error: function (e) {
	        alert("에러: " + e.responseText);
	      },
	    });
    }
};
//대댓글 창 열려있는지 확인
let commentWindow = 0;
//대댓글 달기
function pdCommentBtn(pdComment){
	if(commentWindow == 1){
// 		alert("답글 창이 이미 열려 있습니다.");
		return;
	}
	commentWindow = 1;
	let pdCommentform ="";
	pdCommentform +="					<form action=''>";
	pdCommentform +="						<div class='input-group'>                                                                                             ";
	pdCommentform +="							<div class='input-group-prepend'>                                                                                 ";
	pdCommentform +="								<span class='input-group-text'>댓글 작성란</span>                                                             ";
	pdCommentform +="							</div>                                                                                                            ";
	pdCommentform +="							<textarea class='form-control' id='nds_comment' aria-label='댓글 작성란'></textarea>                              ";
	pdCommentform +="							<div class='input-group-prepend'>                                                                                 ";
	pdCommentform +="								<button type='button' class='btn btn-primary' onclick='insertCommentTwo(this)' id="+pdComment.id+" style='color:black;'>댓글등록</button>";
	pdCommentform +="								<button type='button' class='btn btn-primary' onclick='insertCommentNo(this)' style='color:black;'>취소</button>";
	pdCommentform +="							</div>                                                                                                            ";
	pdCommentform +="						</div>                                                                                                                ";
	pdCommentform +="					</form>                                                                                                                   ";
	pdComment.parentNode.parentNode.parentNode.parentNode.parentNode.innerHTML+=pdCommentform;
}; 
//대댓글 버튼 취소
function insertCommentNo(pdComment){
	pdComment.parentNode.parentNode.remove();
	commentWindow = 0;
}
//대댓글 작성하기
function insertCommentTwo(pdComment){
	let words=pdComment.parentNode.parentNode.parentNode.childNodes[1].childNodes[3].value; //메세지 내용
	let commentType_No = pdComment.id.split('-');
	//pdComment.id는 댓글의 번호 - 대댓글은 댓글의 번호를 그룹번호로 사용
	let item = {"pr_comment_pos":1,"pr_comment_group":commentType_No[0],"pr_comment_msg":words,"pr_bm_no":commentType_No[1]};
    $.ajax({
    	type: "POST",
    	url: "http://localhost:9696/item/insertComment.nds",
		data: item,
    	success:function(data){
    		console.log("Df");
    		pdComment.parentNode.parentNode.parentNode.parentNode.insertAdjacentHTML('afterend',data);
    		$('#nds_comment').val("");
    		pdComment.parentNode.parentNode.remove();
    		commentWindow = 0;
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
};
//댓글 수정 취소를 누르면 다시 원래 값이 들어가야한다. 그래서 전역변수 처리
let history;
//댓글 수정창 열려있는지 확인
let commentUpdateWindow = 0;
//댓글 수정
function pdCommentupdateBtn(pdComment){
	let commentNo = pdComment.id.split('-');
	if(commentUpdateWindow == 1){
		alert("댓글 수정 중 입니다.");
		return;
	}
	commentUpdateWindow = 1;
	history = pdComment.parentNode.parentNode.parentNode.parentNode.nextElementSibling.innerText;
	let pdCommentform ="";
	pdCommentform +="					<form action=''>";
	if(commentNo[1]==1){
		pdCommentform +="							<textarea class='w-100' row='2' value=''>"+history.substring(7)+"</textarea> ";	
	}else{
		pdCommentform +="							<textarea class='w-100' row='2' value=''>"+history+"</textarea> ";
	}
		pdCommentform +="							<div class='input-group-prepend'>                                                                                 ";
		pdCommentform +="								<button type='button' class='btn btn-primary' onclick='updateComment(this)' id="+pdComment.id+" style='color:black;'>댓글수정</button>";			
	pdCommentform +="								<button type='button' class='btn btn-primary' onclick='updateCommentNo(this)' id="+pdComment.id+" style='color:black;'>취소</button>";
	pdCommentform +="							</div> ";
	pdCommentform +="					</form>  ";
	pdComment.parentNode.parentNode.parentNode.parentNode.nextElementSibling.innerHTML=pdCommentform;
};
//댓글 수정 버튼 취소
function updateCommentNo(pdComment){
	let commentNo = pdComment.id.split('-');
	let pdCommentform;
	if(commentNo[1]==1){
		pdCommentform ="<p class='w-100' row='2' readonly>&nbsp&nbsp&nbsp&nbsp&nbsp";
		pdCommentform +="<i class='fas fa-level-up-alt' style='transform:rotate(90deg);'></i>&nbsp&nbsp"+history.substring(7);
		pdCommentform +="</p> ";
	}
	else{		
		pdCommentform ="<p class='w-100' row='2' readonly>"+history+"</p> ";
	}
	pdComment.parentNode.parentNode.innerHTML=pdCommentform;
	commentUpdateWindow = 0;
	pdComment.parentNode.remove();
}
//댓글 수정 버튼 클릭
function updateComment(pdComment){
	let commentNo = pdComment.id.split('-');
	let updateNum = document.getElementById(pdComment.id);
	let words = updateNum.parentNode.parentNode.parentNode.parentNode.nextElementSibling.childNodes[1].childNodes[1].value;
	if(words.length==0){
		alert("글을 입력해주세요!");
		return;
	}
	let item = {"pr_comment_step":commentNo[0],"pr_comment_msg":words};
	console.log(item);
	$.ajax({
    	type: "POST",
    	url: "http://localhost:9696/item/updateComment.nds",
		data: item,
    	success:function(data){
			if(data=="true"){
				if(commentNo[1]==0){
					let pdCommentform ="<p class='w-100' row='2' readonly>"+words+"</p> ";
					pdComment.parentNode.parentNode.innerHTML=pdCommentform;
					commentUpdateWindow = 0;
				}else{
					let pdCommentform ="<p class='w-100' row='2' readonly>&nbsp&nbsp&nbsp&nbsp&nbsp";
					pdCommentform +="<i class='fas fa-level-up-alt' style='transform:rotate(90deg);'></i>&nbsp&nbsp"+words;
					pdCommentform +="</p> ";
					pdComment.parentNode.parentNode.innerHTML=pdCommentform;
					commentUpdateWindow = 0;					
				}
			}else{
				alert("댓글 수정에 실패했습니다.");
			}
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
}
/* ==================================== KEY ======================================== */
$(document).ready(function(){
	// 지도가 있다면 즉, 메인페이지라면 인기순위로 상품을 불러오자.	
	if($('#Map').length){
		let item = {"pr_choice":"like_rank"};
		$.ajax({
	    	type: "GET",
	    	url: "http://localhost:9696/item/selectItemList.nds",
			data: item,
	    	success:function(data){
				viewItemList(data);
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	}
});
</script>
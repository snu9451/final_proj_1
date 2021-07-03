<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
// /*==========================================[[ Mine ]]==================================================*/

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

//회원가입 모달창 이벤트들
$(document).ready(function () {
  
});

//지도 말풍선 클릭시 이벤트
$(window).on("load", function () {
  console.log(3, "window.onload");
  if ($(".errand_regist").length) {
    $(document).on("click", ".errand_regist", function () {
      console.log("errand!!!!!!!");
      const modal = document.querySelector("#errand_modal");
      console.log(modal);
      $(modal).modal("show");
    });
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
    	url: "http://192.168.0.163:9696/item/selectItemList.nds",
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
	let search = document.querySelector(".text-center").value;
    $.ajax({
    	type: "GET",
    	url: "http://192.168.0.163:9696/item/selectBySearch.nds",
		data: {"pr_search": search},
    	success:function(data){
    		alert(data);
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
		let itemOne = "";
		for(let i=0;i<items.length;i++){
				itemOne+="<div class='col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0' data-aos='zoom-in' data-aos-delay='200'>";
				itemOne+="	<a class='position-absolute text-decoration-none ml-1' href='#'>";
				itemOne+="	  <i id='top__rank' class='fas fa-crown'></i> <span class='position-absolute translate-middle badge rounded-pill bg-light text-dark'> 인기상품 </span>";
				itemOne+="  </a>";	
				itemOne+="	<div class='product__box'>";
				itemOne+="		<div class='card rounded-0 mb-2'>";			
				
				// org.apache.jasper.JasperException: javax.el.ELException: Failed to parse the expression..
				// 으로 일단 지웠음
				
				itemOne+="			</div>";
				itemOne+="		</div>";
				itemOne+="	</div>";
				itemOne+="</div>";
		}
		itemAll.innerHTML= itemOne;
	}else{
		itemAll.innerHTML= "<div style='display: block; width: 100%; text-align: center;'>조회결과가 없습니다<div>";
	}
}




//상품 찜하기 클릭 시
function likeItem(itemno){	
	let itemID = document.getElementById(itemno.id);
	let item = {"pr_bm_no":itemno.id};
    $.ajax({
    	type: "POST",
    	url: "http://192.168.0.163:9696/item/likeItem.nds",
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
    	url: "http://192.168.0.163:9696/item/deleteComment.nds",
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
	let commentType_No = comment.id.split('-');//commentType_No[0]은 댓글인지 대댓글인지 확인(0이면 댓글/1이면 대댓글), commentType_No[1]은 게시물번호
	let commentgroup = commentType_No[0]==0 ? 0 : 1;//댓글이면 0, 대댓글이면 댓글의 그룹번호를 가져옴
	let msg = document.querySelector(".form-control").value; //메세지 내용
	let item = {"pr_comment_pos":commentType_No[0],"pr_comment_group":commentgroup,"pr_comment_msg":msg,"pr_bm_no":commentType_No[1]};
    $.ajax({
    	type: "POST",
    	url: "http://192.168.0.163:9696/item/insertComment.nds",
		data: item,
    	success:function(data){
			console.log(data);
    		if(data['result']=='true') {
				//댓글이라면
				if(data['COMMENT_POS']==0){
					document.querySelector("#pd__comment__list").innerHTML=comment_make(data)+document.querySelector("#pd__comment__list").innerHTML;
				}
				//대댓글이라면
				else{
					console.log("e대댓글");
				}		
				document.querySelector(".form-control").value ="";
			}
    		else if(data['result']=="itemFalse") {
				alert("해당 글이 존재하지 않습니다.");				
			}
    		else if(data['result']=="comentFalse") {
				alert("댓글이 존재하지 않습니다.");					
			}
			else{
				alert("로그인 후 이용가능합니다!");
			}
    	},
    	error:function(e){
    		alert("에러: "+e.responseText);
    	}
    });
};

function comment_make(comment){
			let commenttext=""
			commenttext +=`	<div class='w-100 mt-3  comments comment_num${comment['COMMENT_STEP']}' id='comment__box'  >`;
			commenttext +="		<div class='d-flex justify-content-between align-items-end' id=''>";
			commenttext +="			<div>";
			commenttext +=`				<span id='comment__user__origin'>${comment['MEM_NICKNAME']}</span>`;
			commenttext +=`				<span id='comment__date'>${ comment['COMMENT_DATE'] }</span>`;
			commenttext +="			</div>";
			commenttext +="			<div>";
			commenttext +="				<ul class='d-flex align-items-end mb-0'>";
			if(comment['COMMENT_POS']==0){ 
			commenttext +="				<li>";
			commenttext +="					<button class='pd__comment__btn' id=''>답글</button>";
			commenttext +="				</li>";
			};
			if(comment['COMMENT_ME']==1){
			commenttext +="				<li>";
			commenttext +="					<button class='pd__comment__btn' id=''>수정</button>";
			commenttext +="				</li>";
			commenttext +="				<li>";
			commenttext +="					<button class='pd__comment__btn' id='comment['COMMENT_STEP']' onclick='deleteComment(this)' >삭제</button>";
			commenttext +="				</li>";
			} else {
			commenttext +="				<li>";
			commenttext +="					<button class='pd__comment__btn' id=''>";
			commenttext +="						유저신고 <i class='fas fa-exclamation warn' style='color: red; font-size: 20px; font-weight: bold;'></i>";
			commenttext +="					</button>";
			commenttext +="				</li>";
			}
			commenttext +="				</ul>";
			commenttext +="			</div>";
			commenttext +="		</div>";
			commenttext +="		<div id='comment_txt'>";
			if(comment['COMMENT_POS']==1){
			commenttext +="				<p class='w-100' row='2' readonly>";
			commenttext +=`					<i class='fas fa-angle-double-right'></i> ${comment['COMMENT_MSG'] }`;
			commenttext +="				</p>";
			} else {
			commenttext +="				<p class='w-100' row='2' readonly>";
			commenttext +=`						${ comment['COMMENT_MSG'] }`;
			commenttext +="					</p>";
			};
			commenttext +="		</div>";
			commenttext +="	</div>";
			return commenttext;
}


</script>
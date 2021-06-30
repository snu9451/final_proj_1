/**
 * 
 */
	/*==========================================[[ 여기는 지혜영역 ]]==================================================*/

//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
function allItemList(pr_choice){
	let item = {"pr_choice":pr_choice.id};
    $.ajax({
    	type: "GET",
    	url: "/item/selectItemList.nds",
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
    	url: "/item/selectBySearch.nds",
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
				itemOne+="			<div class='pImgBox img-fluid d-flex flex-column justify-content-end align-items-lg-stretch' style= 'position: relative;'>";
				itemOne+=`				<img id='pimg' class='card-img rounded-0 img-fluid' src='assets/img/board_Img/${items[i]['BI_FILE']}'`;
				itemOne+=`					style= 'width: 100%; height: 100%; opacity: ${items[i]['BM_STATUS']==='C' ||items[i]['BM_STATUS']==='S' ? 0.1 : 1};' >`;
				itemOne+="			</div>";
				if(items[i]['BM_STATUS']==='C' || items[i]['BM_STATUS']==='S'){
				itemOne+=`          <div style='font-size: 3.5rem; width: 100%; position: absolute; top: 50%; text-align: center;'> ${items[i]['BM_STATUS']==='C' ? '판매완료' : '거래중'}</div>`;					
				}
				itemOne+=`			<button type='button' id='${items[i]['BM_NO']}'`;
				itemOne+="				class='likeBtn btn-sm text-danger position-absolute' onclick='likeItem(this)'>";
				if(items[i]['I_LIKE']===0) itemOne+="<i class= 'far fa-heart'></i>";
				else itemOne+="<i class= 'fas fa-heart'></i>";
				itemOne+="			</button>";
				itemOne+="		</div>";
				itemOne+="		<div class='p-3 text-left'>";
				itemOne+="			<h3>";
				itemOne+=`				<a id='pTitle' name='pr_bm_no' href='/item/selectItemDetail.nds?pr_bm_no=${items[i]['BM_NO']}'>${items[i]['BM_TITLE']}</a>`;
				itemOne+="			</h3>";				
				itemOne+=`			<p id='pDescrip'>[[ 상품내용 ]]${items[i]['BM_CONTENT']!==undefined && items[i]['BM_CONTENT'].length>10 ? items[i]['BM_CONTENT'].substring(0,10)+'..' : items[i]['BM_CONTENT'] }</p>`;
				itemOne+="			<div class='row d-flex justify-content-between align-items-center mt-3'>";
				itemOne+="				<div class='col-lg-auto d-flex align-items-baseline'>";
				itemOne+=`					<h2 id='pPrice'>${items[i]['BM_PRICE']}</h2>`;
				itemOne+="					<span>원</span>";
				itemOne+="				</div>";
				itemOne+=`				<label id='pCategory' for='' class='col-lg-auto'>${items[i]['CATEGORY_NAME']}</label>`;
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
    	type: "GET",
    	url: "/item/likeItem.nds",
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
$(document).ready(function(){
	
	$('#h_myPage').on('click', function(){
		location.href = "http://localhost:9696/myPage/my_info.nds";
	});
	$('#h_itemInsert').on('click', function(){
		location.href = "http://localhost:9696/item/itemUploadPage.nds";
	});
	
	//drop down toggle
	$('.dropdown-toggle').dropdown('toggle');
	$(".dropdown-toggle").dropdown("toggle");
	
	$('#category_drop').on('click', function(){		
	    //카테고리 리스트 가져오기
	    if($("#category_item").children().length < 1){
		    $.ajax({
		      url: "http://localhost:9696/etc/selectCategory.nds",
		      success: function (data) {
//	 	    	alert(data+', '+data[0]+', '+data[0].length);
		        for(let i=0; i<data.length; i++){
		          $("#category_item").append("<li style=\"cursor:pointer;\" name=\"menu_item\" class=\"dropdown-item\">" + data[i] + "</li>");
		        }
		          $('.dropdown-item').each(function(index){
		        	$('.dropdown-item').eq(index).on('click', function(data){
// 		        		alert($('.dropdown-item').eq(index).text());
						let cate = $('.dropdown-item').eq(index).text();
		        		location.href = "http://localhost:9696/item/selectByCategory.nds?pr_categori="+cate;
		        	});
		          });
		      },
		    	error:function(e){
		    		alert("에러: "+e.responseText);
		    	}
		    });
	    }
	});


// 	alert("AFSDfsa");
	
})
</script>
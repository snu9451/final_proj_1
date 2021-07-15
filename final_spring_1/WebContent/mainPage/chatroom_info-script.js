let email_req = ""; 
let email_nds = "";
let errandArr=[];
let errandInfoArr=[];
let MAXINDEX;
let infoIndex;
$(document).ready(function(){
	$.ajax({
		type:'post',
		url:'/errand/jsonGetErrand.nds',
		data:{"mem_email":mem_email,"dest_email":dest_email},
		dataType:'json',
		success:function(data){
			console.log("ajax success for jsonGetErrand");
			console.log(data.length);
			MAXINDEX = data.length-1;
			infoIndex = MAXINDEX;
			for(let i=0; i<data.length; i++) {
				errandArr[i] = data[i];
				console.log(errandArr[i]);
				$.ajax({
					type:'post',
					url:'/errand/jsonGetErrandInfo.nds',
					data:{"errandKey":data[i].ERRANDKEY},
					dataType:'json',
					success:function(data2){
						errandInfoArr[i] = data2;
						if(i==data.length-1) {
							initNotice();
						}
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});
function initNotice(){
	let html = 
	   				"<div class=\"notice_wrapper\">"
	   				+"<div>"
		        		+"<div class=\"notice\">"
					      +"<div class=\"left\">"
					          +"<button class=\"btn btn-sm btnleft\"><i class=\"fas fa-arrow-circle-left prev\"></i></button>"
					      +"</div>"
					      +"<div class=\"center\">"
				          	+"<div class=\"center_text\">"
					            +"<div class=\"item\">심부름 물품 : "+errandArr[infoIndex].ERRAND_ITEM+"</div>"
					            +"<div class=\"price_list\">"
						            +"<div class=\"price_name\">물품가 : "
						            	+"<input class=\"price\" min=\"0\" type=\"number\"/ value=\""+errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS+"\" ";
	if(errandArr[infoIndex].MEM_EMAIL_REQ.split('.')[0] == mem_email)
		html +=							"readonly";
	html +=								">"
							            +"<button type=\"button\" disabled=\"true\" id=\"btn_confirm\" class=\"btn btn-success btn-sm\">확인</button>"
						            +"</div>"
					            +"</div>"
					            +"<div>"
					            +"</div>"
					            +"<div class=\"errand_price\">심부름 값 : "+errandArr[infoIndex].ERRAND_PRICE+"</div>"
					            +"<div class=\"errand_price\">&nbsp</div>"
				          	+"</div>"
					      +"</div>"
					      +"<span class=\"center1\">"
					            +"<i id=\"check1\" class=\"fas fa-check-circle iconCheck\"></i>"
					            +"<i id=\"check2\" class=\"fas fa-check-circle iconCheck\"></i>"
					      +"</span>"
				          +"<div class=\"right\">"
					          +"<button class=\"btn btn-sm btnright\"><i class=\"fas fa-arrow-circle-right next\"></i></button>"
				          +"</div>"
			        	+"</div>"
	   				+"</div>"
			          	 +"<div id=\"notice_button\">"
			          	  	+"<button class=\"btn btn-sm\" type=\"button\">"
					   	  		+"<i class=\"fas fa-bars\"></i>"
					   		+"</button>"
			         	  +"</div>"
		        	+"</div>"
	   				+"<div class=\"notice_wrapper1\">"
	   				+"<div>"
		        		+"<div class=\"notice1\"></div>"
	   				+"</div>"
			          	 +"<div id=\"notice_button1\">"
			          	  	+"<button class=\"btn btn-sm\" type=\"button\">"
					   	  		+"<i class=\"fas fa-bars\"></i>"
					   		+"</button>"
			         	  +"</div>"
		        	+"</div>";
	$(".col.s3").children("div").html(html);
	$('.notice_wrapper1').hide();
	$('#notice_button').click(function(){
		$('.notice_wrapper').hide();
		$('.notice_wrapper1').show();
	});
	$('#notice_button1').click(function(){
		$('.notice_wrapper1').hide();
		$('.notice_wrapper').show();
	});
	if(errandArr[infoIndex].MEM_EMAIL_REQ.split(".")[0] != mem_email) {
		$(".price").on('keyup', function(){
			let abled = false;
			abled = $(".price").val().length > 0 ? true : false;
			console.log(abled);
			$("#btn_confirm").attr("disabled", !abled);
		});
		$('#btn_confirm').click(function(){
			$.ajax({
				type:'post',
				url:'/errand/updateErrandItemPriceNds.nds',
				data:{"errand_item_price_nds":$(".price").val(),"errandKey":errandArr[infoIndex].ERRANDKEY},
				success:function(data){
					$.ajax({
						type:'post',
						url:'/errand/updateErrandInfo.nds',
						data:{"errandKey":errandArr[infoIndex].ERRANDKEY},
						success:function(data2){
							$('#check1').addClass('active');
							$("#btn_confirm").attr("disabled", true);
							$(".price").attr("readonly", true);
							$(".price").css({"bacground-color":"gray", "pointer-events": "none", "opacity":"0.5"});
						},
						error:function(e){
							console.log(e);
						}
					});
				},
				error:function(e){
					console.log(e);
				}
			});
		});
		$("#check1").click(function(){
			$("#check1").removeClass('active');
			abled = $(".price").val().length > 0 ? true : false;
			console.log(abled);
			$(".price").attr("readonly", false);
			$("#btn_confirm").attr("disabled", !abled);
			$(".price").css({"bacground-color":"gray", "pointer-events": "auto", "opacity":"1"});
		});
	}
	else {
		
	}
}
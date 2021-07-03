<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
let req_cnt = -1;
let nds_cnt = -1;
function reqAction() {
   $('.nds_errand_tb').hide();
   console.log("요청심부름1"+$('#nds_tbody_req').children().size());
   $.ajax({
      url : "myErrand_req_rec_FB.jsp",
      success : function(data) {//@data-json,xml,html,text
         $(".errand_FB").html(data);
      },
      error : function(e) {//@param-XMLHttpRequest
      }
   });
   console.log('req_cnt(1)='+req_cnt);
   if($('#nds_tbody_req').children().size() == 0){
      $.ajax({
         url : "http://localhost:8080/errand/selectErrandRecord.nds?gubun=req",
         success : function(data) {//@data-json,xml,html,text
            console.log(data);
            let str = "";
               $('#allcnt').html(data.length);
               
               if(data.length != req_cnt){
               
               for(let i=0; i<data.length; i++){
                  if(data[i].ERRAND_STATUS == 'P'){
                     console.log('p');
                     str += "<tr><td>"
                     str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
                     str += data[i].ERRANDKEY;
                     str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
                     str += data[i].ERRANDKEY;
                     str += "\"></label></div>";
                     str += "</td><td><span class=\"badge rounded-pill bg-warning text-dark\">";
                     str += "진행중";
                     str += "</span></td><td>";
                     str += data[i].ERRAND_REQUEST_DATE;
                     str += "</td><td>";
                     str += data[i].ERRAND_CONTENT;
                     str += "</td><td>";
                     str += data[i].ERRAND_TOTAL_PRICE;
                     str += "원</td><td>";
                     str += data[i].MEM_NICKNAME;
                     str += "</td></tr>";
         //               document.write("<table>"+str+"</table>");
                     $('#nds_tbody_req').append(str);
                     str = "";
                  }
                  else if(data[i].ERRAND_STATUS == 'S'){
                     console.log('s');
                     str += "<tr><td>"
                     str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
                     str += data[i].ERRANDKEY;
                     str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
                     str += data[i].ERRANDKEY;
                     str += "\"></label></div>";
                     str += "</td><td><span class=\"badge bg-secondary text-white\">";
                     str += "완료";
                     str += "</span></td><td>";
                     str += data[i].ERRAND_REQUEST_DATE;
                     str += "</td><td>";
                     str += data[i].ERRAND_CONTENT;
                     str += "</td><td>";
                     str += data[i].ERRAND_TOTAL_PRICE;
                     str += "원</td><td>";
                     str += data[i].MEM_NICKNAME;
                     str += "</td></tr>";
         //               document.write("<table>"+str+"</table>");
                     $('#nds_tbody_req').append(str);
                  }
                   str = "";
               }
               if(data.length < 1){
                     console.log('null');
                     str += "<tr><th colspan=\"6\">";
                     str += "조회결과가 없습니다.";
   //                   str += "</th></tr>";
   //                   str += "<tr>";
   //                   str += "<td>1111";
   //                   str += "</td>";
   //                   str += "<td>2222";
                     str += "</th>";
                     str += "</tr>";
                     $('#nds_tbody_req').append(str);
                      str = "";
               }
               
               
               }
               req_cnt = data.length;
               console.log('req_cnt(2)='+req_cnt);
               
         },
         error : function(e) {//@param-XMLHttpRequest
         }
      });
   }////////////////////end of if
      $('.req_errand_tb').show();
}
function resAction() {
   $('.req_errand_tb').hide();
   console.log("수행심부름");
   $(".errand_FB").html("");
   console.log('nds_cnt(1)='+nds_cnt);
   if($('#nds_tbody_nds').children().size() == 0){
      $.ajax({
         url : "http://localhost:8080/errand/selectErrandRecord.nds?gubun=nds",
         success : function(data) {//@data-json,xml,html,text
            console.log(data);
            let str = "";
            console.log(data.length);
            $('#allcnt1').html(data.length);
            if(data.length != nds_cnt){
            
               for(let i=0; i<data.length; i++){
                  if(data[i].ERRAND_STATUS == 'S'){
                     console.log('s');
                     str += "<tr><td>";
                     str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
                     str += data[i].ERRANDKEY;
                     str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
                     str += data[i].ERRANDKEY;
                     str += "\"></label></div>";
                     str += "</td><td>";
                     str += data[i].ERRAND_REQUEST_DATE;
                     str += "</td><td>";
                     str += data[i].ERRAND_CONTENT;
                     str += "</td><td>";
                     str += data[i].ERRAND_TOTAL_PRICE;
                     str += "원</td><td>";
                     str += data[i].MEM_NICKNAME;
                     str += "</td></tr>";
         //               document.write("<table>"+str+"</table>");
                     $('#nds_tbody_nds').append(str);
                  }
                   str = "";
               }
               if(data.length < 1){
   /*                   $('#nds_tbody_req').html(""); */
                     
                     console.log('null');
                     str += "<tr><th colspan=\"6\">";
                     str += "조회결과가 없습니다.";
   //                   str += "</th></tr>";
   //                   str += "<tr>";
   //                   str += "<td>1111";
   //                   str += "</td>";
   //                   str += "<td>2222";
                     str += "</th>";
                     str += "</tr>";
                     $('#nds_tbody_nds').append(str);
                      str = "";
               }
               
            }
            nds_cnt = data.length;
            console.log('nds_cnt(2)='+nds_cnt);
               
         },
         error : function(e) {//@param-XMLHttpRequest
         }
      });
   }////////////////////end of if
      $('.nds_errand_tb').show();
   
}
$(document).ready(function () {
	pageReq = "req";
	pageRes = "res";
	var url = location.href;
	var getPage1 = url.indexOf(pageReq);
	var getPage2 = url.indexOf(pageRes);
	console.log(getPage1);
	console.log(getPage2);
	if (getPage2 != -1) {
		$(".response").addClass("active");
		$(".request").removeClass("active");
		resAction();
	} else {
		reqAction();
	}
   $('#errReqDel').on('click', function(){
      $('.custom-control-input:checked').each(function(index){
    	 let errandKey = $('.custom-control-input:checked').eq(index).attr('id');
    	 errandKey = errandKey.substr(11,errandKey.length-1);
         console.log(errandKey);
         $.ajax({
             url : "/errand/errandRecordUpdate.nds?gubun=req&errandKey="+errandKey,
             success : function(data) {//@data-json,xml,html,text
                 location.href = "my_errand.nds?req";
             },
             error : function(e) {//@param-XMLHttpRequest
            	 console.log("error="+e.toString());
             }
          });
         //window.location.reload();
      })
   });
   $('#errNdsDel').on('click', function(){
      $('.custom-control-input:checked').each(function(index){
    	 let errandKey = $('.custom-control-input:checked').eq(index).attr('id');
    	 errandKey = errandKey.substr(11,errandKey.length-1);
         console.log(errandKey);
         $.ajax({
             url : "/errand/errandRecordUpdate.nds?gubun=nds&errandKey="+errandKey,
             success : function(data) {//@data-json,xml,html,text
                 location.href = "my_errand.nds?res";
             },
             error : function(e) {//@param-XMLHttpRequest
            	 console.log("error="+e.toString());
             }
          });
         //window.location.reload();
      })
   });
});
</script>
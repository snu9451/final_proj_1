<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

function reqAction() {
	console.log("요청심부름");
	$.ajax({
		url : "myErrand_req_rec_FB.jsp",
		success : function(data) {//@data-json,xml,html,text
			$(".errand_FB").html(data);
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
	$.ajax({
		url : "http://192.168.0.163:9696/errand/selectErrandRecord.nds",
		success : function(data) {//@data-json,xml,html,text
			console.log(data);
			let str = "";
			if(data[0].ERRAND_STATUS == 's'){
				str += "<tr><td></td><td><span class=\"badge rounded-pill bg-warning text-dark\">";
				str += "완료";
				str += "</span></td><td>";
				str += data[0].ERRAND_REQUEST_DATE;
				str += "</td><td>";
				str += data[0].ERRAND_CONTENT;
				str += "</td><td>";
				str += data[0].ERRAND_TOTAL_PRICE;
				str += "</td><td>";
				str += data[0].MEM_EMAIL_NDS;
				str += "</td></tr>";
//					document.write("<table>"+str+"</table>");
				$('#nds_tbody_req').append(str);
			}
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
}
function resAction() {
	console.log("수행심부름");
	$.ajax({
		url : "myErrand_res_rec.jsp",
		success : function(data) {//@data-json,xml,html,text
			$(".errand_bottom").html(data);
			$(".errand_FB").html("");
			console.log("수행심부름");
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
}

$(document).ready(function () {
	reqAction();
});
</script>
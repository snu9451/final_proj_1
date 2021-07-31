<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<!doctype html>
<html lang="en">
<%
	List<Map<String,Object>> adminPage2 = null;
	adminPage2 = (List<Map<String,Object>>)request.getAttribute("adminPage2");
	String bm_no = null;
	String bm_title = null;
	String seller_nickname = null;
	String bm_date = null;
	String bm_hit = null;
	String report_count    = null;

%>


<head>
	<title>내동생 - 관리자페이지</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<script src="https://kit.fontawesome.com/ce3585cab0.js" crossorigin="anonymous"></script>
	<!-- pagination -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
	<link
		rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
	<link rel="stylesheet" href="paging.css"/>
	<!-- <script src="paging.js"></script> -->
	<%@ include file="../admin/paging_js.jsp" %>
	<script src="https://kit.fontawesome.com/ce3585cab0.js" crossorigin="anonymous"></script>
</head>
<style>
.active{
	color: #337ab7;
	opacity: 1;
}
</style>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="#"><img
					src="assets/img/mybro_favicon.png"
					alt="nds Logo"
					style="width: 120px;"></a>
					<p style="color: rgb(88, 88, 88); font-size: 40px; padding-top: 15px;"><b>내 동생.</b></p>
			</div>
			<div class="container-fluid">
				<!-- <div class="navbar-btn"> <button type="button"
				class="btn-toggle-fullwidth"> <i class="lnr lnr-arrow-left-circle"></i>
				</button> </div> -->
				<!-- <div class="navbar-btn navbar-btn-right"> <a class="btn btn-success
				update-pro"
				href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro"
				title="Upgrade to Pro" target="_blank"> <i class="fa fa-rocket"></i>
				<span>UPGRADE TO PRO</span></a> </div> -->
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<!-- <li class="dropdown"> <a href="#" class="dropdown-toggle icon-menu"
						data-toggle="dropdown"> <i class="lnr lnr-alarm"></i> <span class="badge
						bg-danger">5</span> </a> <ul class="dropdown-menu notifications"> <li> <a
						href="#" class="notification-item"> <span class="dot bg-warning"></span>System
						space is almost full</a> </li> <li> <a href="#" class="notification-item"> <span
						class="dot bg-danger"></span>You have 9 unfinished tasks</a> </li> <li> <a
						href="#" class="notification-item"> <span class="dot bg-success"></span>Monthly
						report is available</a> </li> <li> <a href="#" class="notification-item"> <span
						class="dot bg-warning"></span>Weekly meeting in 1 hour</a> </li> <li> <a
						href="#" class="notification-item"> <span class="dot bg-success"></span>Your
						request has been approved</a> </li> <li> <a href="#" class="more">See all
						notifications</a> </li> </ul> </li> -->
                            <div>
                            <button class="admin-logout" onclick="window.close()" style="background-color: #e9e8d4; border: solid 2px rgb(131, 122, 111); border-radius: 7px;"> 
                            <li class="dropdown">
                                    <span style="font-size:20px;color:rgb(131, 122, 111);"><b>관리자&nbsp&nbsp</b></span>
                            </li>
                            <li class="dropdown">
								<span style="font-size:20px;color:rgb(131, 122, 111);"><b>로그아웃&nbsp</b></span><i style="font-size:20px;color:rgb(131, 122, 111);" class="fas fa-sign-out-alt"></i>
                            </li>
                            </button>
                           
                            </div>
						<!-- <li> <a class="update-pro"
						href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro"
						title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i>
						<span>UPGRADE TO PRO</span></a> </li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav style="margin-top: 10vh;">
					<ul class="nav">
							<h3 style="color: whitesmoke; margin-left: 1vw;">관리자페이지</h3> 
				
						<li><a href="admin_page1.jsp" class=""> <span>회원관리</span></a></li>
						<li><a href="admin_page2.jsp" class="active"> <span>게시글관리</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main" >
			  <!-- MAIN CONTENT -->
			  <div class="main-content">
				<div class="container-fluid">
					<h3>회원관리페이지 - 게시글목록</h3>
					<div class="row centerAlign">
						<div class="col-lg-12">
							<!-- 페이지 당 보여줄 로우의 수를 선택할 수 있는 콤보박스 생성 -->
							<div class="form-group">
								<!-- Show Numbers Of Rows -->
								<select class="form-control my-form-control" name="state" id="maxRows">
									<!-- <option value="5000">ROW</option> -->
									<!-- <option value="5">5</option> -->
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<!-- <option value="70">70</option> -->
									<!-- <option value="100">100</option> -->
								</select>
							</div>
							<!-- BASIC TABLE -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><label><i id="reportOnly2" class="far fa-check-circle"></i></label> &nbsp신고된 게시글만 보기</h3>
								</div>
								<div class="panel-body">
									<table class="table" id="products">
										<form action="" id="setRows">
											<input type="hidden" name="rowPerPage" value="10" id="rowPerPage">
										</form>
										<thead>
											<tr>
												<th style="text-align: center;" width="8%"><input type="checkbox" id="all_select"></th>
												<th style="text-align: center;" width="8%">글번호</th>
												<th style="text-align: center;" width="35%">제목</th>
												<th style="text-align: center;" width="15%">작성자</th>
												<th style="text-align: center;" width="13%">작성일</th>
												<th style="text-align: center;" width="10%">조회수</th>
												<th style="text-align: center;" width="10%">신고횟수</th>
											</tr>
										</thead>
										<tbody id="reportTable2"style="text-align: center;">
											
	
										</tbody>
									</table>
								</div>
							</div>
							<!-- END BASIC TABLE -->
						<!-- 페이지 선택 버튼 목록 -->
                                <!-- <div class="paging-search" id="paging-search"> -->
									<div class="paging-buttons">
										<div>
										</div>
										<div class='pagination-container'>
											<nav class="pagination-nav">
												<ul class="pagination">
													<li data-page="prev">
														<span>
															«
															<span class="sr-only">(current)</span></span>
													</li>
													<!-- Here the JS Function Will Add the Rows -->
													<li data-page="next" id="prev">
														<span>
															»
															<span class="sr-only">(current)</span></span>
													</li>
												</ul>
											</nav>
										</div>
										<div>
										  <button class="my-buttons" onclick="deleteItem()">선택항목 삭제</button>
										  <button class="my-buttons" onclick="initReportNum()">신고횟수 초기화</button>
										</div>
									  </div>
										<div class="select-input">
										  <select id="search_filter" class="form-control my-search-select" name="cond">
											<option>글번호</option>
											<option>제목</option>
											<option>작성자</option>
										</select>
                                      <form class="navbar-form navbar-left" action="javascript:search()">
                                          <div class="input-group">
                                              <input
                                              	  id="search_words"
                                                  type="text"
                                                  value=""
                                                  class="form-control"
                                                  placeholder="검색어를 입력하세요.">
                                              <span class="input-group-btn">
                                                  <button type="button" id="btn_search" class="btn btn-primary" onclick="search()">검색</button>
                                              </span>
                                          </div>
                                      </form>
										</div>
									<!-- </div> -->
								</div>
							</div>
						</div>
					</div>
					<!-- END MAIN CONTENT -->
				</div>
				<!-- END MAIN -->
		<div class="clearfix"></div>
		<!-- <footer>
		
		</footer> -->
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
// 		getPagination('#products');

		  $(document).ready(function(){
        	getReportBoard2();
        	$("#reportOnly2").off("click").on("click", checkFunc2);
        });
        function checkFunc2(){
        	if($("#reportOnly2").hasClass("active")) {
				getReportBoard2();
				$("#reportOnly2").removeClass("active");        		
        	}
        	else {
				getReportOnlyBoard();
				$("#reportOnly2").addClass("active");        		
        	}
        }
        
//     	$('#all_select').click(function (){
// 			if ($("input:checkbox[id='all_select']").prop("checked")){
// 				$("input[type=checkbox]").prop("checked",true)
// 			}else{
// 				$("input[type=checkbox]").prop("checked",false);
// 			}
// 			console.log("다눌러짐");
// 			console.log($('#ckBox0').prop('checked'));
// 			console.log($('#ckBox1').prop('checked'));
// 			console.log($('#ckBox2').prop('checked'));
// 			});
		
    	
//         	function outMember(){
//         		console.log("탈퇴버튼눌렸다~~");
// 				for(let i of $("#reportTable").children("tr"))    {
// 				    if($(i).css("display")=="none")
// 				        break;
// 				    if($(i).find("input").prop("checked")==true) {
// 		        		$.ajax({
// 		        			url: '/admin/outMember.nds',
// 		        			data : { mem_email : $($(i).children("td")[2]).text() },
// 		        			success:function(){
		        				
// 		        			},
// 		        			error:function(e){
// 								console.log(e);
// 							}
// 		        		});
// 				    }
// 				}
// 				location.reload(true);
//         	}
        	
        	
// 				arr=[];
// 				for(let i of $("#reportTable").children("tr"))    {
// 				    if($(i).css("display")=="none")
// 				        break;
// 				    if($(i).find("input").prop("checked")==true) {
// 				        arr.push($($(i).children("td")[2]).text());
// 						let	mem_email = arr.shift();
// 		        		$.ajax({
// 		        			url: '/admin/outMember.nds',
// 		        			data : { mem_email : mem_email },
// 		        			success:function(){
		        				
// 		        			},
// 		        			error:function(e){
// 								console.log(e);
// 							}
// 		        		});
// 				    }
// 				}
//         	}	

	   function search(){
    		let filter;
    		let search_words=$("#search_words").val();
    		if($("#search_filter").val()=="글번호")
    			filter={bm_no: search_words};
    		else if($("#search_filter").val()=="제목")
    			filter={bm_title: search_words};
    		else if($("#search_filter").val()=="작성자")
    			filter={seller_nickname: search_words};
    		$.ajax({
	        	url: '/admin/admin_page2.nds',
	        	data: filter,
	        	dataType:'json',
				success:function(data){
					document.querySelector("#reportTable2").innerHTML="";
					for(let i=0; i<data.length;i++) {
						data[i].BM_DATE = data[i].BM_DATE.substring(0, 10);
						data[i].BM_DATE = data[i].BM_DATE.replaceAll("-", ".");
						let html = 
							"<tr>"
								+"<td>"
								+"<label><input id=\"ckBox\" type=\"checkbox\" name=\"ckck\"></label>"
								+"</td>"
								+"<td>"+data[i].BM_NO+"</td>"
								+"<td>"
						         +"<a style=\"cursor: pointer;\" onClick=\"window.open('admin_modal2.nds?bm_no="+data[i].BM_NO+"', '', 'width=1350, height=690, scrollbars=no, resizable=no, toolbars=no, menubar=no')\">"+data[i].BM_TITLE+"</a>"
						         +"</td>"
								+"<td>"+data[i].SELLER_NICKNAME+"</td>"
								+"<td>"+data[i].BM_DATE+"</td>"
								+"<td>"+data[i].BM_HIT+"</td>"
								+"<td>"+data[i].REPORT_COUNT+"</td>"
							+"</tr>";
						document.querySelector("#reportTable2").innerHTML+=html;
					}
					getPagination('#products');
					
				},
				error:function(e){
					console.log(e);
				}
	        });
    	}
       
        function getReportBoard2(){
        	console.log("getReportBoard2");
	        $.ajax({
	        	url: '/admin/admin_page2.nds',
	        	dataType:'json',
				success:function(data){
					document.querySelector("#reportTable2").innerHTML="";
					for(let i=0; i<data.length;i++) {
						data[i].BM_DATE = data[i].BM_DATE.substring(0, 10);
						data[i].BM_DATE = data[i].BM_DATE.replaceAll("-", ".");
						let html = 
							"<tr>"
								+"<td>"
								+"<label><input id=\"ckBox\" type=\"checkbox\" name=\"ckck\"></label>"
								+"</td>"
								+"<td>"+data[i].BM_NO+"</td>"
								+"<td>"
						         +"<a style=\"cursor: pointer;\" onClick=\"window.open('admin_modal2.nds?bm_no="+data[i].BM_NO+"', '', 'width=1350, height=690, scrollbars=no, resizable=no, toolbars=no, menubar=no')\">"+data[i].BM_TITLE+"</a>"
						         +"</td>"
								+"<td>"+data[i].SELLER_NICKNAME+"</td>"
								+"<td>"+data[i].BM_DATE+"</td>"
								+"<td>"+data[i].BM_HIT+"</td>"
								+"<td>"+data[i].REPORT_COUNT+"</td>"
							+"</tr>";
						document.querySelector("#reportTable2").innerHTML+=html;
					}
					getPagination('#products');
					
				},
				error:function(e){
					console.log(e);
				}
	        });
        }
        
        function getReportOnlyBoard(){
        	console.log("getReportOnlyBoard");
			$.ajax({
	        	url: '/admin/admin_page2.nds',
	        	dataType:'json',
				success:function(data){
					document.querySelector("#reportTable2").innerHTML="";
					for(let i=0; i<data.length;i++) {
						if(data[i].REPORT_COUNT == 0)
							continue;
						data[i].BM_DATE = data[i].BM_DATE.substring(0, 10);
						data[i].BM_DATE = data[i].BM_DATE.replaceAll("-", ".");
						let html = 
							"<tr>"
								+"<td>"
								+"<label><input id=\"ckBox\" type=\"checkbox\" name=\"ckck\"></label>"
								+"</td>"
								+"<td>"+data[i].BM_NO+"</td>"
								+"<td>"
						         +"<a style=\"cursor: pointer;\" onClick=\"window.open('admin_modal2.nds?bm_no="+data[i].BM_NO+"', '', 'width=1350, height=690, scrollbars=no, resizable=no, toolbars=no, menubar=no')\">"+data[i].BM_TITLE+"</a>"
						         +"</td>"
								+"<td>"+data[i].SELLER_NICKNAME+"</td>"
								+"<td>"+data[i].BM_DATE+"</td>"
								+"<td>"+data[i].BM_HIT+"</td>"
								+"<td>"+data[i].REPORT_COUNT+"</td>"
							+"</tr>";
						document.querySelector("#reportTable2").innerHTML+=html;
					}
					getPagination('#products');
					
					
				},
				error:function(e){
					console.log(e);
				}
	        });
        }

    	function deleteItem(){
    		console.log("deleteItem");
			for(let i of $("#reportTable2").children("tr"))    {
			    if($(i).css("display")=="none")
			        continue;
			    if($(i).find("input").prop("checked")==true) {
	        		$.ajax({
	        			url: '/item/deleteItem.nds',
	        			data : { br_sel_buy : "sel", pr_bm_no : $($(i).children("td")[1]).text() },
	        			success:function(){
	        				location.reload(true);
	        			},
	        			error:function(e){
							console.log(e);
						}
	        		});
			    }
			}
    	}

    	function initReportNum(){
			for(let i of $("#reportTable2").children("tr"))    {
			    if($(i).css("display")=="none")
			        continue;
			    if($(i).find("input").prop("checked")==true) {
	        		$.ajax({
	        			url: '/admin/initReportNumber.nds',
	        			data : { bm_no : $($(i).children("td")[1]).text() },
	        			success:function(){
	        				location.reload(true);
	        			},
	        			error:function(e){
							console.log(e);
						}
	        		});
			    }
			}
    	}
		
		
		
		
		
	</script>
</body>

</html>

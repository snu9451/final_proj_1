<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<div>
	<li>
		<span>심부름하기</span>
		<input type="checkbox" id="switch1" name="switch1" class="input__on-off" >
		<label for="switch1" class="label__on-off" data-toggle="popover" data-placement="bottom" data-content="심부름을 해볼까요?">
			<span class="marble"></span><span class="on">on</span><span class="off">off</span>
		</label>
	</li>
	<li>
		<a class="nav-link" href="javascript:window.open('/mainPage/chatroomList.jsp','','width=550px, height=701px')" id="messagesDropdown"> 
			<i class="icofont-envelope-open"></i><span class="badge badge-danger badge-counter">0</span>
		</a>
	</li>
	<li style="padding: 10px 0 10px 48px !important;">
		<span><img id="navProfile" style="vertical-align: middle; width: 50px; height: 50px; border-radius: 50%; border: 2px solid #ffc37b;" 
			src="../myPage/assets/img/profile/<%=mem_img%>"/></span></li>
	<li style="padding: 10px 0 10px 5px !important;"><a href="/myPage/my_info.nds"><%=mem_nickname%></a></li>
	<li><a id="h_itemInsert" style="cursor:pointer;">상품판매</a></li>
	<li><a data-toggle="modal" data-target="#coinCharge" style="cursor:pointer;">코인충전</a></li>
	<li><a id="h_myPage" style="cursor:pointer;">마이페이지</a></li>
	<li><a id="h_logout" style="cursor:pointer;">로그아웃</a></li>
</div>
<script>
$(document).ready(function(){
    $( '[data-toggle="popover"]' ).popover('show');
    $('.label__on-off').click(function(){
    	$( '[data-toggle="popover"]' ).popover('hide');
    });
	if("<%=mem_email%>" == "admin@good.com"){
		let html = "<li><a href=\"/admin/admin_page1.jsp\" target=\"blank\" id=\"h_admin\" style=\"cursor:pointer;\">관리자페이지</a></li>";
		$("#header").find("nav").find("div").append(html);
	}
});
</script>
<style>
.active{
	border: 2px solid #627ea4;
}
</style>
			<!-- 언제나 채팅이 오는 것을 인지할 수 있게 navbar에 채팅방알림 코드 include함 -->
	<%@ include file="../common/chatAlert.jsp" %>
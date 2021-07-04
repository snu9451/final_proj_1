<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<div>
	<li>
		<span>심부름하기</span>
		<input type="checkbox" id="switch1" name="switch1" class="input__on-off">
		<label for="switch1" class="label__on-off">
			<span class="marble"></span><span class="on">on</span><span class="off">off</span>
		</label>
	</li>
	<li>
		<a class="nav-link" href="javascript:window.open('../mainPage/chatroomList.jsp','','width=550px, height=1000px')" id="messagesDropdown"> 
			<i class="icofont-envelope-open"></i><span class="badge badge-danger badge-counter">0</span>
		</a>
	</li>
	<li><a href=""><%=mem_nickname%></a></li>
	<li><a href="">상품판매</a></li>
	<li><a href="">코인충전</a></li>
	<li><a id="h_myPage" style="cursor:pointer;">마이페이지</a></li>
	<li><a id="h_logout" style="cursor:pointer;">로그아웃</a></li>
</div>
			<!-- 언제나 채팅이 오는 것을 인지할 수 있게 navbar에 채팅방알림 코드 include함 -->
	<%@ include file="../common/chatAlert.jsp" %>
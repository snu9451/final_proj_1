<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<li>
		<span>심부름하기</span>
		<input type="checkbox" id="switch1" name="switch1" class="input__on-off">
		<label for="switch1" class="label__on-off">
			<span class="marble"></span><span class="on">on</span><span class="off">off</span>
		</label>
	</li>
	<li>
		<a class="nav-link" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
			<i class="icofont-envelope-open"></i><span class="badge badge-danger badge-counter">0</span>
		</a>
	</li>
	<li><a href=""><%=mem_nickname%></a></li>
	<li><a href="">상품판매</a></li>
	<li><a class="h_coin" data-toggle="modal" data-target="#coinCharge" href="">코인충전</a></li>
	<li><a id="h_myPage" style="cursor:pointer;">마이페이지</a></li>
	<li><a id="h_logout" style="cursor:pointer;">로그아웃</a></li>
</div>





<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 중이 아닐 때
	Map<String, Object> login = new HashMap<>();
	String mem_nickname = null;	// 전역에서 사용되는 정보
	String mem_email = null;	// 전역에서 사용되는 정보
	int coin_remain = 0;		// 마이페이지에서 사용되는 정보
		login = (Map<String, Object>)session.getAttribute("login");
		mem_nickname = login.get("MEM_NICKNAME").toString();
		mem_email = login.get("MEM_EMAIL").toString();
		
%>
<%
	request.setCharacterEncoding("UTF-8");

//	String nickname = request.getParameter("nickname");
	
// /*	/\/\/\/\/\/\/\/\/\/\테스트용/\/\/\/\/\/\/\/\/\/\/\		*/
// 	String nickname = ;
// /*	\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/	*/
%>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
  <script defer src="../common/init-firebase.js"></script>
<script type="text/javascript">
	let nickname = "<%=mem_nickname%>";//현재 접속자의 닉네임
	let destNickname = "";//상대방의 닉네임
	let lastMsg = "";//마지막 메세지
	let timestamp = "";//메세지 보낸 시각
	let unreads = "";//안읽은 메세지 수
	$(document).ready(function(){
		let reading = firebase.database().ref("chatrooms").orderByChild("users/"+nickname).equalTo(true);
		reading.on('child_added', test_child_added);
		reading.on('child_changed', test_child_changed);
	});
	//채팅방 목록 불러와서 화면에 보여주기 & 새로운 채팅방이 추가되는지 감시
	function test_child_added(data) {
		console.log("ADD");
		let key = data.key;
		let userData = firebase.database().ref("chatrooms/"+key).child("users");
		let msgData = firebase.database().ref("chatrooms/"+key).child("comments").limitToLast(1);
		let readData = firebase.database().ref("chatrooms/"+key+"/unread/"+nickname);
		//collection에 대화방 추가
		msgData.once('value', function(data){
			console.log("datakey"+data.key);
			console.log("dataval"+data.val());
			if(!(data.val()==null || data.val()=="null")) {
				msgData.once('child_added', getMsgData);
				userData.once('child_added', getUserData);
		        let html =
		            "<li id='"+key+"' class=\"collection-item avatar\" onclick=\"enterChatroom(this.id,'"+destNickname+"');\" >" +
		            "<img class='profile' src=\"./profile.png\"/>" +
		            "<span class=\"dest\"><b>" + destNickname + "</b></span>" +
		            "<p class='msg'>" + lastMsg + "<br>" +
		            "</p>" +
		            "<p class='timestamp'>" + timestamp + "<br>" +
		            "</p>" +
		            "<a href=\"#!\" class=\"secondary-content\"><i id='unreads'>"+unreads+"</i></a>"+
		            "</li>";
		        $(".collection").html(html+$(".collection").html());
				//안읽은 메세지 수 표시
				readData.get().then(function(snapshot){
			        console.log("A"+snapshot.val());
					if(snapshot.val()!=0)
						$("#"+key).children("a").children("i").text(snapshot.val());
					else
						$("#"+key).children("a").children("i").text("");
				});
			}
		});
	}
	//채팅방의 내용이 바뀌는지 감시
	function test_child_changed(data) {
		let key = data.key;
		let userData = firebase.database().ref("chatrooms/"+key).child("users");
		let msgData = firebase.database().ref("chatrooms/"+key).child("comments").limitToLast(1);
		let readData = firebase.database().ref("chatrooms/"+key+"/unread/"+nickname);
		//안읽은 메세지 수 표시
		readData.get().then(function(snapshot){
			if(snapshot.val()!=0)
				$("#"+key).children("a").children("i").text(snapshot.val());
			else
				$("#"+key).children("a").children("i").text("");
		});
		msgData.once('child_added', getMsgData);
		userData.once('child_added', getUserData);
		if(document.querySelector("#"+key)==null) {
			console.log("run");
	        let html =
	            "<li id='"+key+"' class=\"collection-item avatar\" onclick=\"enterChatroom(this.id,'"+destNickname+"');\" >" +
	            "<img class='profile' src=\"./profile.png\"/>" +
	            "<span class=\"dest\"><b>" + destNickname + "</b></span>" +
	            "<p class='msg'>" + lastMsg + "<br>" +
	            "</p>" +
	            "<p class='timestamp'>" + timestamp + "<br>" +
	            "</p>" +
	            "<a href=\"#!\" class=\"secondary-content\"><i id='unreads'>"+unreads+"</i></a>"+
	            "</li>";
	        $(".collection").append(html);
		}
        $("#"+key+" > .timestamp").text(timestamp);
        $("#"+key+" > .msg").text(lastMsg);
	}
	//상대방의 닉네임을 destNickname변수에 저장
	function getUserData(data){
		if(data.key != nickname) {
			destNickname = data.key;
			console.log("destNickname = "+destNickname);
		}
	}
	//마지막 메세지의 내용과 시간을 가져옴
	function getMsgData(data){
		lastMsg = data.val().message;
		timestamp = data.val().timestamp;
		console.log("lastMsg="+lastMsg);
		console.log("timeStamp="+timestamp);
	}
	//채팅방에 입장할 때 채팅방 고유 번호, 자신의 닉네임, 상대의 닉네임을 전달
	function enterChatroom(roomKey,dest){
		$("#roomKey").val(roomKey);
		$("#nickname").val(nickname);
		$("#dest").val(dest);
		$("#destForm").submit();
	}
</script>
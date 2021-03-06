<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String roomKey = request.getParameter("roomKey");
	String nickname = request.getParameter("nickname");
	String dest = request.getParameter("dest");

/*	/\/\/\/\/\/\/\/\/\/\테스트용/\/\/\/\/\/\/\/\/\/\/\		
	String roomKey = "-McVUvqMWXIK71vIa5OW";
	String nickname = "바나나";
	String dest = "파인애플";
	\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/	*/
%>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-storage.js"></script>
  <script defer src="../common/init-firebase.js"></script>
<script type="text/javascript">
	//채팅방 고유 키
	let roomKey = "<%=roomKey%>";
	//자신의 닉네임
	let nickname = "<%=nickname%>";
	//상대방 닉네임
	let dest = "<%=dest%>";
	let prevDay = "0000-00-00";//날짜 비교를 위한 변수
	let prevTime = "00:00";//시간 비교를 위한 변수
	let prevMsgKey = "";//시간 삭제를 위한 메세지키 저장 변수
	let prevSender = "";//시간 삭제를 위한 전송자 저장 변수

	$(document).ready(function(){	

		$(".roomName").text(" < "+dest);
		$(".roomName").off("click").on("click", function(){
			window.history.back();
		});
		$("title").text(dest+"님과의 채팅방");
		
		//이미지 버튼에 클릭 함수 설정
		$("#img_insert").click(function(){
			document.querySelector("#input_file").value = "";
			document.querySelector("#input_file").click();
		});
		
		//엔터키를 누르면 메세지 전송
		$("#btn_msg").click(sendMsg);
		
		//이미지 전송
		document.querySelector('#input_file').addEventListener('change', e => {
			let reading = firebase.database().ref("chatrooms/" + roomKey + "/comments");
			let readingKey = reading.push().key;
		    selectedFile = e.target.files[0];
		    console.log("fiels"+e.target.files[0]);
		    console.log("res"+e.target.result);
			let storageRef = firebase.storage().ref("chatrooms/"+roomKey+"/comments/"+readingKey+"/"+selectedFile.name).put(selectedFile);
		    storageRef.on('state_changed', function(snapshot){
		    	  let progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
		    	  console.log('Upload is ' + progress + '% done');
		    	  switch (snapshot.state) {
		    	    case firebase.storage.TaskState.PAUSED: // or 'paused'
		    	      console.log('Upload is paused');
		    	      break;
		    	    case firebase.storage.TaskState.RUNNING: // or 'running'
		    	      console.log('Upload is running');
		    	      break;
		    	  }
		    	}, function(error) {
		    		console.log("error="+error);
		    	}, function() {
		    	  storageRef.snapshot.ref.getDownloadURL().then(function(downloadURL) {
		    	    console.log('File available at', downloadURL);

				    //이미지를 담을 메세지 전송
					reading.child(readingKey).set({
						message : selectedFile.name,
						type : "i",
						timestamp : getTime(),
						uid : nickname,
						read : 1
					});
					
					//unread를 1씩 올려주는 트랜잭션
					let updates = {};
					updates["chatrooms/"+roomKey+"/unread/"+dest] = firebase.database.ServerValue.increment(1);
					firebase.database().ref().update(updates);
		    	  });
		    	});
			
		});
		
		if(roomKey=="null") { //채팅방 고유 키를 받아오지 못하는 2가지 경우
			let checkRoom = firebase.database().ref("chatrooms").orderByChild("users/"+nickname).equalTo(true);
			checkRoom.once('value', function(snapshot){
				//1.처음 대화하는 상대라 채팅방을 새로 개설할 경우
				if(snapshot.val()==null) {
					//createRoom(); 메세지를 보낼 때 대화방을 생성하는걸로 변경
				}
				//2.이미 대화한 적 있는 상대지만 채팅리스트가 아닌 제품상세페이지에서 대화하기 버튼을 눌러 채팅방을 열 경우
				else {
					let reading = firebase.database().ref("chatrooms").orderByChild("users/"+nickname).equalTo(true);
					reading.once('child_added',function(snapshot){
						roomKey = snapshot.key;
						init();
					});
				}
			});
		}
		else
			init();
	});
	//채팅방에 입장했을 때 UI생성
	function init(){
		getChatMsg();
	}
	//채팅방 새로 개설
	function createRoom() {
		let newKey = firebase.database().ref("chatrooms").push().key;
		roomKey = newKey; //새로운 채팅방 고유 키 생성
		//생성한 고유 키로 테이블을 만들고 그 안에 유저 정보 저장
		let reading = firebase.database().ref("chatrooms/"+newKey);
		reading.set({
			users : {
				<%=nickname%> : true,
				<%=dest%> : true
			},
			unread : {
				<%=nickname%> : 0,
				<%=dest%> : 0
			}
		});
		init();
	}
	//파이어베이스에 저장되어있는 채팅기록들을 불러와 보여줌
	function getChatMsg(){
		let reading = firebase.database().ref("chatrooms/"+roomKey+"/comments");
		reading.on('child_added', function(comments){
			let msgKey = comments.key;//메세지 고유 키
			let msg = comments.val().message;//메세지 내용
			let timestamp = comments.val().timestamp;//메세지 보낸 시각
			let dayStamp = timestamp.substr(0,10);//YYYY-MM-DD
			let hourStamp = timestamp.substr(11,5);//HH:mm
			let sender = comments.val().uid;//메세지 보낸 유저의 닉네임
			let read = comments.val().read;//메세지 읽음 표시
	        let html = ""
			//날짜(하루단위)가 같지않으면 날짜변경선 생성
			if(prevDay!=dayStamp) {
				html += "<div class='timeline'>"+dayStamp+"</div>";
				prevDay = dayStamp;
			}
			//같은시간(분단위)에 보낸 메세지는 타임스탬프 하나만 출력
			if(prevTime==hourStamp && prevSender==sender) {
				$("#"+prevMsgKey).children(".timestamp").remove();
			}
			else {
				html = "<div style='height:10px;'></div>"+html;
				//상대방 프사, 이름 출력
				if(sender==dest)
					html += "<img id='profile' src='./profile.png'/><div id='destNickname'>"+dest+"</div>";
			}
	        if(nickname==sender) //내가 보낸 메세지일 경우
	        	html += "<div align='right' id='"+msgKey+"'><div class='read'>"+read+"</div><div class='timestamp'>"+hourStamp+"</div><div class='me' align='left'>"+msg+"</div></div>";
	        else { //상대가 보낸 메세지일 경우
	        	html += "<div align='left' id='"+msgKey+"'><div class='dest' align='left'>"+msg+"</div><div class='timestamp'>"+hourStamp+"</div><div class='read'>"+read+"</div></div>";
	        }
	        //가져온 정보들로 구성된 메세지박스<div>를 화면에 출력
	       	$(".collection").append(html);
			//타입이 있으면(이미지라면) 이미지 삽입 함수 실행
			if(comments.val().type!=null) {
				insertImg(msgKey, msg, sender);
		        $("#"+msgKey).css("margin-bottom","400px")
			}
	        //스크롤을 맨 아래로 내려줌
			$('.col').scrollTop(document.querySelector(".col").scrollHeight);
			prevTime = hourStamp;
			prevMsgKey = msgKey;
			prevSender = sender;
	        //읽으면 파이어베이스의 읽음표시 초기화
			if(nickname!=sender && read==1) {
				reading.child(msgKey).update({read:""});
			}
		});
		updateRead();
	}
	//이미지 메세지 변환
	function insertImg(msgKey, msg, sender){
		let storageRef = firebase.storage().ref("chatrooms/"+roomKey+"/comments/"+msgKey+"/"+msg);
		storageRef.getDownloadURL().then(function(url) {
			let html = "<a href='"+url+"' target='blank'><img src='"+url+"' class='img_inserted'/></a>";
			if(nickname==sender)
				$("#"+msgKey).children(".me").html(html);
			else
				$("#"+msgKey).children(".dest").html(html);
			$('.col').scrollTop(document.querySelector(".col").scrollHeight);
	        $("#"+msgKey).css("margin-bottom","");
		});
	}
	//메세지 감시하다가 읽으면 읽음표시 없애기
	function updateRead(){
		let reading = firebase.database().ref("chatrooms/"+roomKey+"/comments");
		reading.on('child_changed', function(comments){
			$("#"+comments.key).children(".read").remove();
			firebase.database().ref("chatrooms/"+roomKey+"/unread/").update({<%=nickname%> : 0});
		});
	}
	//메세지 보내는 함수
	function sendMsg() {
		if(roomKey=="null")
			createRoom();
		let msg_input = $("#input_msg").val();
		//입력한 메세지가 공백일 경우(trim()은 문자열의 앞뒤 공백을 없애주는 함수)
		if(msg_input.trim()=="")
			return;
		//메세지를 입력하고 나면 입력창 내용 지우기
		$("#input_msg").val("");
		//메세지를 파이어베이스에 저장
		let reading = firebase.database().ref("chatrooms/" + roomKey + "/comments");
		reading.push().set({
			message : msg_input.substr(0,200),
			timestamp : getTime(),
			uid : nickname,
			read : 1
		});
		//unread를 1씩 올려주는 트랜잭션
		let updates = {};
		updates["chatrooms/"+roomKey+"/unread/"+dest] = firebase.database.ServerValue.increment(1);
		firebase.database().ref().update(updates);
	}
	//현재 시간 구하는 함수, YYYY-MM-DD HH:mm:SS 형식으로 반환된다.
	function getTime(){
		let today = new Date();

		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2);
		let day = ('0' + today.getDate()).slice(-2);

		let hours = ('0' + today.getHours()).slice(-2); 
		let minutes = ('0' + today.getMinutes()).slice(-2);
		let seconds = ('0' + today.getSeconds()).slice(-2); 

		let dateString = year + '-' + month  + '-' + day;
		let timeString = hours + ':' + minutes  + ':' + seconds;
		let rstTime = dateString+" "+timeString;
		return rstTime;
	}
</script>
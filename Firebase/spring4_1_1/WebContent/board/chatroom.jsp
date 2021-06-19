<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">


<!--Let browser know website is optimized for mobile-->
<meta charset="UTF-8"/>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0" />
<style>
::-webkit-scrollbar {
	display: none;
}

.collection {
	cursor: pointer;
}
</style>
<title>Insert title11211 here</title>
</head>
<body>
      <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
	<script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
	<script defer src="./init-firebase.js"></script>
	<script type="text/javascript">
	let roomKey = "<%=request.getParameter("roomKey")%>";
	let nickname = "<%=request.getParameter("nickname")%>";
	$(document).ready(function(){
		let reading = firebase.database().ref("chatrooms/"+roomKey+"/comments");
		reading.on('child_added', getChatMsg);
	});
	function getChatMsg(comments){
		let msgKey = comments.key;
		let msg = comments.val().message;
		let timestamp = comments.val().timestamp;
		let sender = comments.val().uid;
        let html =
            "<li id='"+msgKey+"' class=\"collection-item avatar\" onclick=\"fn_get_data_one(this.id);\" >" +
            "<i class=\"material-icons circle red\">" + sender.substr(0, 1) + "</i>" +
            "<span class=\"title\">" + sender + "</span>" +
            "<p class='txt'>" + msg + "<br>" +
            "</p>" +
            "<p class='time'>" + timestamp + "<br>" +
            "</p>" +
            "<a href=\"#!\" onclick=\"fn_delete_data('"+msgKey+"')\"class=\"secondary-content\"><i class=\"material-icons\">grade</i></a>"+
            "</li>";
        $(".collection").append(html);
	}
	function sendMsg() {
		let msg_input = $("#input_msg").val();
		$("#input_msg").val("");
		let reading = firebase.database().ref("chatrooms/" + roomKey + "/comments");
		reading.push().set({
			message : msg_input,
			timestamp : getTime(),
			uid : nickname
		});
	}
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
	function enterKey(){
		if (window.event.keyCode == 13) {
			sendMsg();
       }
	}
	</script>
<body>
      <div>
        <div class="col s3" style="padding:0; margin:0; overflow-y:auto; overflow-x:hidden; height:1080px; -ms-overflow-style: none;">
          <!-- Grey navigation panel -->
          <ul class="collection"  style="padding:0; margin:0;"></ul>
        </div>
    <input id="input_msg" onkeyup="enterkey();" style="width:1000px;"><button id="btn_msg" onClick="sendMsg()">전송</button>

    <div class="preloader-wrapper big active" style="position:absolute; z-index:1000; left:50%; top:50%; display:none;">
        <div class="spinner-layer spinner-blue-only">
          <div class="circle-clipper left">
            <div class="circle"></div>
          </div><div class="gap-patch">
            <div class="circle"></div>
          </div><div class="circle-clipper right">
            <div class="circle"></div>
          </div>
        </div>
      </div>
  </div>
<script>
      </script>
</body>
</html>
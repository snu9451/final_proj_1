
/* /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ */

			/*기존에 만들어져있던 안쓰는 main.js의 내용을 새로만든 코드로 덮어씌움 */
						/* 확인했으면 주석을 지우셔도 됩니다. */
/* \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ */

    let markerContainer = new Map();//마커들을 담을 Map타입의 변수(지도아님)
    let myMap;//지도
    let timer = setInterval(createMyMap,100);//0.1초마다 createMyMap 실행
    let riderTimer = setInterval(insertRider, 5000);//라이더 위치 갱신용 타이머(5초마다)
    let locKey = "";
    $(document).ready(function() {
      getLoc();
      $("#switch1").change(switchRider);
	  $("#errand_modal").find("#errandBtn").off("click").on("click", insertErrand);
    });
    

    //심부름 요청자/라이더 전환
    function switchRider() {
      if ($("#switch1").is(":checked")) {
        removeAllMarkers();
        markerContainer = new Map();
        refRider.off();
        clearInterval(riderTimer);
        console.log("라이더");
        insertRider();//자신의 위치를 rider테이블에 저장
        riderTimer = setInterval(insertRider, 5000);//5초마다 위치 갱신
        addErrand();//심부름 마커 추가 감시
        changeErrand();//심부름 마커 변경 감시
        removeErrand();//심부름 마커 삭제 감시
//		onSuccessGeolocation();
      } else {
        removeAllMarkers();
//		removeMyLoc();
        markerContainer = new Map();
        refErrand.off();
        clearInterval(riderTimer);
        console.log("요청자");
        insertErrandMarker();
        addRider();//라이더 마커 추가 감시
        changeRider();//라이더 마커 변경 감시
        removeRider();//라이더 마커 삭제 감시
//		onSuccessGeolocation();
      }
    }
  
  //////////////////////////////////////////구글맵
    //구글맵api가 로드됐는지, 사용자의 현재 위치가 갱신됐는지 확인 후
    //사용자의 현재 위치 기준으로 맵 생성
    function createMyMap() {
      if (google != null && my_lat != "" && my_lng != "") {
        myMap = new google.maps.Map(document.getElementById('map'), {
          center : {
            lat : my_lat,
            lng : my_lng
          },
          zoom : 16,
        });
        switchRider();
        clearInterval(timer);
      }
    }

	function onSuccessGeolocation() {
	    //메인 페이지 로드시, 내 위치 바로 맵에 띄워줌.
	    let myPosition = new google.maps.LatLng(
	      my_lat,
	      my_lng
	    );
//		alert(myPosition);
	    myMap.setCenter(myPosition);
		
	  }5

    //받아온 심부름 정보를 가진 마커 생성
    function newErrandMarker(arr) {
      let errand_registed = document.createElement("span");
      errand_registed.innerHTML = 
        arr.errand_item
        +"<br>제안금액:"+arr.errand_item_price_req
        +"<br>심부름값:"+arr.errand_price
        +"<span id='errandDetail' style='display:none;' errId="+arr.errandKey+"><br>"
        +arr.errand_content
        +"<br>요청자:"+arr.mem_email
        +"<br>요청시각:"+arr.errand_request_date
        +"</span>";
      errand_registed.classList.add("errand_regist");
      errand_registed.setAttribute("onclick", function(){
	  	showErrandCheckModal(arr);
	  });
      let marker = new google.maps.Marker(arr);
      marker.addListener("click", () => {
        arr.infoWindow.setContent(errand_registed);
        arr.infoWindow.open(myMap, marker);
	  	showErrandCheckModal(arr);
      });
      marker.addListener("mouseover", () => {
        $("span[errId="+arr.errandKey+"]").css("display","inherit");
      });
      marker.addListener("mouseout", () => {
        $("span[errId="+arr.errandKey+"]").css("display","none");
      });
      arr.infoWindow.setContent(errand_registed);
      arr.infoWindow.open(myMap, marker);
      markerContainer.set(arr.errandKey, marker);
      console.log(markerContainer);
    }
	function showErrandCheckModal(arr){
		let destModal = $('#errand_check_modal');
		destModal.find("#errandInfo_item").children("h1").text(arr.errand_item);
		destModal.find("#errandInfo_mainContent").text(arr.errand_content);
		destModal.find("#errandInfo_itemPr").text(arr.errand_item_price_req);
		destModal.find("#errandInfo_cost").text(arr.errand_price);
		destModal.find("#errandInfo_total").text(arr.errand_total_price);
		destModal.find(".btn-primary").off("click").on('click', function() {
			doErrand(arr.errandKey);
		});
		$('#errand_check_modal').modal('show');
	}
    //받아온 라이더 정보를 가진 마커 생성
    function newRiderMarker(arr) {
      marker = new google.maps.Marker(arr);
      markerContainer.set(arr.mem_email, marker);
      console.log(markerContainer);
    }
    //마커 전부 제거(심부름 등록용 마커 제외)
    function removeAllMarkers(){
      for(let i of markerContainer) {
        i[1].setMap(null);
      }
    }
  
  //////////////////////////////////////////심부름요청자
    function insertErrandMarker() {
      if (google != null && my_lat != "" && my_lng != "") {
        let myInfoWindow = null;
        let myMarker = new google.maps.Marker({ 
          position : {
            lat : my_lat,
            lng : my_lng
          },
          map : myMap,
          zIndex : 1000,
		  icon: "http://localhost:9696/mainPage/google_map/nds.png",
        });
        const errand_regist = document.createElement("span");
        errand_regist.textContent = "심부름 등록하기";
        errand_regist.classList.add("errand_regist");
		let errandItemPr = $("#errand_modal").find("#errandItemPr");
		let errandCost = $("#errand_modal").find("#errandCost");
		errandItemPr.on('keyup', function(){
			$("#errand_modal").find("#totalCost").text(errandItemPr.val()*1+errandCost.val()*1);
		});
		errandCost.on('keyup', function(){
			$("#errand_modal").find("#totalCost").text(errandItemPr.val()*1+errandCost.val()*1);
		});
        errand_regist.setAttribute("onclick", "$('#errand_modal').modal('show')");
        myInfoWindow = new google.maps.InfoWindow();
        myMarker.addListener("click", () => {
          myInfoWindow.setContent(errand_regist);
          myInfoWindow.open(myMap, myMarker);
          $("#errand_modal").modal("show");
        });
        myInfoWindow.setContent(errand_regist);
        myInfoWindow.open(myMap, myMarker);
        markerContainer.set("insertErrand", myMarker)
      }
    }
    //심부름을 파이어베이스에 등록
    function insertErrand() {
      let reading = firebase.database().ref("errand");
      let newErrandKey = reading.push().key;
      reading.child(newErrandKey).set(
          {
            errand_item : $('#errandItem').val(),
            errand_request_date : getTime(),
            errand_item_price_req : $('#errandItemPr').val(),
            errand_price : $('#errandCost').val(),
            errand_total_price : $('#errandItemPr').val() * 1
                + $('#errandCost').val() * 1,
            errand_content : $('#errandDetail').val(),
            mem_email : mem_email,
            errand_lat : my_lat,
            errand_lng : my_lng,
            rider : "",
            status : 0
          });
      let alertData = {
          content : "심부름이 등록되었습니다.",
          type : "insertErrand",
          timestamp : getTime(),
          active : 1,
          errandKey : newErrandKey
      };
      refAlert.push().update(alertData);
      // closeErrForm();
    }
    //심부름이 새로 추가되면 html에 심부름 정보를 적고 새로운 마커를 생성(심부름 정보를 html에 추가할 지? 마커의 속성에 다 넣을지?)
    //페이지가 로드되면서 파이어베이스의 데이터를 처음 읽어올 때 child_added로 적용된다.
    function addErrand() {
      refErrand
          .on(
              "child_added",
              function(childSnapshot) {
                errandData = childSnapshot.val();
                let arr = {
                  position : {
                    lat : errandData.errand_lat,
                    lng : errandData.errand_lng
                  },
                  map : myMap,
                  infoWindow : new google.maps.InfoWindow(),
                  errandKey : childSnapshot.key,
                  errand_content : errandData.errand_content,
                  errand_item : errandData.errand_item,
                  errand_item_price_req : errandData.errand_item_price_req,
                  errand_price : errandData.errand_price,
				  errand_total_price : errandData.errand_total_price,
                  errand_request_date : errandData.errand_request_date,
                  mem_email : errandData.mem_email
                };
                newErrandMarker(arr);
              });
    }
    //심부름의 상태가 변경되면(누군가 이미 이 심부름을 배달하겠다고 요청중이면) 마커를 변경해야함(미완)
    function changeErrand() {
      refErrand.on("child_changed", function(childSnapshot) {
        errandData = childSnapshot.val();
        markerContainer.get(childSnapshot.key).setPosition(
				errandData.errand_lat, errandData.errand_lng);
      });
    }
     //심부름이 삭제되면 지도에서 해당 마커도 삭제
    function removeErrand() {
      refErrand.on("child_removed", function(childSnapshot) {
        markerContainer.get(childSnapshot.key).setMap(null);
      });
    }

  //////////////////////////////////////////라이더
    //rider테이블에서 사용자의 이메일로 검색,
    //해당 사용자에 대한 테이블이 없으면(처음 사용한다면) 값을 넣어 테이블을 생성
    function insertRider() {
      getLoc();
      let riderData = {
        lat : my_lat,
        lng : my_lng,
        //mem_email : mem_email,
        timestamp : getTime()
      };
//      refRider.child(mem_email).update(riderData);/* 김은영작업 - 로그인하지 않은 회원인 경우 오류나서 지도안뜨는 듯 시연을 위해 주석*/
//      console.log(mem_email+" rider loc updated. lat="+my_lat+" lng="+my_lng);
    }
function removeMyLoc(){
	refRider.child(mem_email).remove();
}
    //파이어베이스에 저장된 라이더들의 위치를 마커로 표시 & 추가될 때 마다 마커 추가
    function addRider() {
      refRider.on("child_added", function(childSnapshot) {
        riderData = childSnapshot.val();
        let arr = {
          position : {
            lat : riderData.lat,
            lng : riderData.lng
          },
          map : myMap,
          mem_email : childSnapshot.key
        };
        let marker = null;
        newRiderMarker(arr);
      });
    }
    //라이더의 위치가 변경되면 마커의 위치도 변경
    function changeRider() {
      refRider.on("child_changed", function(childSnapshot) {
        riderData = childSnapshot.val();
        markerContainer.get(childSnapshot.key).setPosition(
            riderData.lat,
                riderData.lng);
      });
    }
    //라이더가 삭제되면 지도에서 해당 마커도 삭제
    function removeRider() {
      refRider.on("child_removed", function(childSnapshot) {
        markerContainer.get(childSnapshot.key).setMap(null);
      });
    }
    //라이더가 심부름 하겠다는 버튼을 눌렀을 때 심부름 테이블 rider 속성 변경
    function doErrand(errandKey) {
      let riderEmail = { rider : mem_email };
      let observeRider = firebase.database().ref("errand/" + errandKey);
      observeRider.once('value', function(snapshot){
		if(snapshot.val().rider=="") {
		    observeRider.update(riderEmail);
	        //라이더의 알림 추가
	        let alertData = {
	            content : snapshot.val().errand_item+" 심부름 배달 요청을 보냈습니다.",
	            type : "doErrand",
	            timestamp : getTime(),
	            active : 1,
	            errandKey : errandKey
	        };
	        refAlert.push().update(alertData);
	        //심부름 요청자의 알림 추가
	        alertData = {
	            content : snapshot.val().errand_item+" 심부름을 희망하는 라이더가 있습니다.",
	            type : "getErrand",
	            timestamp : getTime(),
	            active : 1,
	            rider : mem_email,
	            errandKey : errandKey
	        };
	        firebase.database().ref("alert/"+snapshot.val().mem_email).push().update(alertData);
		}
		else {
	      makeModal(errandKey, "누군가 이미 배달요청중입니다.<br>잠시 후 다시 시도해주세요.");
	      $("#"+errandKey).modal("show");
		}
      });
    }
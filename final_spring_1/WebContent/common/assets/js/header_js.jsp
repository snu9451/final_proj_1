<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function () {
    $("#h_myPage").on("click", function () {
      location.href = "http://192.168.0.163:9696/myPage/my_info.nds";
    });

    //버튼 클릭시 모달창 show
    $(".btnTest").click(function () {
      console.log("modal test");
      $("#report_board").modal("show");
    });

    //모달창 버튼 클릭시 이벤트
    $("#report_btn_user").click(function () {
      console.log("btn clicked");
      swal("Well Done!!", "심부름이 등록되었습니다 : )", "success").then(() => {
        $("#report_content_user").submit();
      });
    });

    //drop down toggle
    $(".dropdown-toggle").dropdown("toggle");
    $(".dropdown-toggle").dropdown("toggle");

    //카테고리 리스트 가져오기
    $.ajax({
      url: "/etc/selectCategory.nds",
      success: function (data) {
        const category_item = $("#category_item");
        $(data).each(function (index) {
          let category = data[index];
          category_item.append(
            '<a class="dropdown-item" href="#">' + category + "</a>"
          );
        });
      },
    });
  });
</script>

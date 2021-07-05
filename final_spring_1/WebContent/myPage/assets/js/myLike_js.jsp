<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
////////////////좋아요 버튼////////////////////
$(".likebutton").click(function () {
  if ($(this).hasClass('active')) {
  	console.log("좋아요")
    $(this).removeClass('active');
  } else {
    $(this).addClass('active');
  }
});



</script>
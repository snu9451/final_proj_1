<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		/* =============================== [[ 검색어 자동 완성 기능 구현 ▼ ]] =============================== */
		const search_bottom = 246+'px';
		const search_left = 330+'px';
// 		const search_bottom = document.getElementsByName('nds_search').parentElement.offsetTop+'px';
// 		const search_left = document.getElementsByName('nds_search').parentElement.offsetLeft+'px';
// 		const search_bottom = $('input[name=nds_search]').parent().offset().top+'px';
// 		const search_left = $('input[name=nds_search]').parent().offset().left+'px';
		
		alert(search_bottom+', '+search_left);
		
		$('input[name=nds_search]').on('keyup change', function(){
			
			let keyword = $('input[name=nds_search]').val();
			
			/* 자동완성창 열기 */
			$('#autocomplete').css('width','560px');
			$('#autocomplete').css('height','fit-content');
			$('#autocomplete').css('padding','20px');
			$('#autocomplete').css('top', search_bottom);
			$('#autocomplete').css('left', search_left);
			$('#autocomplete').css('background-color', 'white');
			$('#autocomplete').css('opacity', '0.9');
			$('#autocomplete').css('box-shadow', '0px 8px 7px -3px rgba(150, 150, 150, 0.35)');
			/* ＡＪＡＸ　ＣＯＤＥ　ＨＥＲＥ */
			$('#autocomplete').html(keyword);
			/* 입력된 검색어가 없는 경우(지워진 경우) 자동완성창을 닫아주어야 함 */
			if($('#autocomplete').text().length <= 0){
				$('#autocomplete').css('height',0);
				$('#autocomplete').css('padding',0);
			}
			
			
		})
		/* =============================== [[ 검색어 자동 완성 기능 구현 ▲ ]] =============================== */
		
		
		
		
		
		
	});
</script>
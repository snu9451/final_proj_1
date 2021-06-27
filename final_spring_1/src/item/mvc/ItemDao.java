package item.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ItemDao {

	// MyBatis에서 제공하는 클래스. 스프링에 의해 객체주입을 받기 위해, 선언만 해둠.
	private SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		logger.info("SqlSessionTemplate 주입");
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public List<Map<String, Object>> selectItemList(String pr_choice) {
		logger.info("Dao :selectItemList메소드 호출");
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> p_temp = new ArrayList<>();
		//최근 상품 버튼인지, 인기 상품 버튼인지 값 담기
		map.put("pr_choice",pr_choice);
		//결과 값 ref커서를 반환 받을통
		map.put("p_temp",p_temp);
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_main",map);
		//결과 값만 전송
		return (List<Map<String, Object>>)map.get("p_temp");
	}
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public List<Map<String, Object>> selectByCategory(String pr_categori) {
		logger.info("Dao : selectByCategory메소드 호출");
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> p_temp = new ArrayList<>();
		//검색할 카테고리 담기
		map.put("pr_categori",pr_categori);
		//결과 값 ref커서를 반환 받을통
		map.put("p_temp",p_temp);
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_main_categori",map);
		//결과 값만 전송
		return (List<Map<String, Object>>)map.get("p_temp");
	}
	//검색어를 입력하여 찾기
	public List<Map<String, Object>> selectBySearch(String pr_search_order,String pr_search) {
		logger.info("Dao : selectBySearch메소드 호출");
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> p_temp = new ArrayList<>();
		//검색 타입이랑 검색어 받아오기
		map.put("pr_search_order",pr_search_order);
		map.put("pr_search",pr_search);
		//결과 값 ref커서를 반환 받을통
		map.put("p_temp",p_temp);
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_search",map);
		//결과 값만 전송
		return (List<Map<String, Object>>)map.get("p_temp");
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 정보만
	public Map<String, Object> editItem(int pr_bm_no) {
		logger.info("Dao : editItem메소드 호출");
		Map<String, Object> map = new HashMap<>();
		//select문 돌림
		map = sqlSessionTemplate.selectOne("editItemContext",pr_bm_no);
		//결과 값만 전송
		return map;
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 사진만
	//상품의 사진만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public List<String> editItemImg(int pr_bm_no) {
		logger.info("Dao : editItemImg메소드 호출");
		List<String> list = new ArrayList();
		//select문 돌림
		list = sqlSessionTemplate.selectList("editItemImg",pr_bm_no);
		//결과 값만 전송
		return list;
	}
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되어야함.+++++++++++++++++++++++++++++++++++++++++++++++++++++
	public void updateItem(Map<String, Object> pmap, List<String> itemImgs, int pr_bm_no) {
		logger.info("Dao : updateItem메소드 호출");
		//프로시져 사용 - 상품 정보 저장 
		sqlSessionTemplate.selectList("proc_board_update",pmap);
		//이미지들 교체 후 저장 -------------------------나중에 고려 프로시저 다씨 자기
		//sqlSessionTemplate.selectList("board_update_img",pr_bm_no);
		
	}
	//상품의 내용만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public Map<String, Object> selectItemDetailContext(Map<String, Object> pmap) {
		logger.info("Dao : selectItemDetailContext메소드 호출");
		Map<String, Object> map = new HashMap<>();
		//select문 돌림
		map = sqlSessionTemplate.selectOne("proc_board_select",pmap);
		//결과 값만 전송
		return map;
	}

	//상품 삭제 시
	public void deleteItem(Map<String, Object>  pmap) {
		logger.info("Dao : deleteItem메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_board_master_delete",pmap);
	}
	//상품 판매 완료 처리 
	public String updateItemToConfirm(Map<String, Object> pmap) {
		logger.info("Dao : updateItemToConfirm메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_board_bm_status",pmap);
		return pmap.get("result").toString();
	}
	//상품 찜하기
	public int likeItem(Map<String, Object> pmap) {
		logger.info("Dao : likeItem메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_my_like_change",pmap);
		return Integer.parseInt(pmap.get("i_like").toString());		
	}
	//댓글 달기. 대댓글 달기
	public Map<String, Object> insertComment(Map<String, Object> pmap) {
		logger.info("Dao : insertComment메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_comment_insert",pmap);
		return pmap;		
	}
	//댓글 or 대댓글 삭제
	public String deleteComment(Map<String, Object> pmap) {
		logger.info("Dao : deleteComment메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_comment_delete",pmap);
		return pmap.get("result").toString();		
	}
	//댓글 or 대댓글 수정
	public String updateComment(Map<String, Object> pmap) {
		logger.info("Dao : updateComment메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_comment_update",pmap);
		return pmap.get("result").toString();		
	}
	//사용자가 상품을 등록 시에
	public void insertItem(Map<String, Object> pmap, List<String> itemImgs) {
		logger.info("Dao : insertItem메소드 호출");
		//프로시져 - 상품 등록 정보
		sqlSessionTemplate.selectOne("proc_board_insert",pmap);
		//등록된 상품의 번호
		int result = Integer.parseInt(pmap.get("result").toString());
		//등록된 상품 번호를 이용해서 사진을 넣고 insert문 돌림**********************************
		//sqlSessionTemplate.selectOne("editItemContext",itemImgs);
	}
	
	
	
	
}

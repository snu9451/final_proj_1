package item.mvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ItemDao {

	// MyBatis에서 제공하는 클래스. 스프링에 의해 객체주입을 받기 위해, 선언만 해둠.
	private SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public List<Map<String, Object>> selectItemList(Map<String, Object> pmap) {
		List<Map<String, Object>> items = new ArrayList<>();
		return null;
	}
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public List<Map<String, Object>> selectByCategory(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//검색어를 입력하여 찾기
	public List<Map<String, Object>> selectBySearch(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 정보만
	public Map<String, Object> editItem(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 사진만
	public List<String> editItemImg(int pr_bm_no) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되어야함.
	public void updateItem(Map<String, Object> pmap, List<String> itemImgs) {
		// TODO Auto-generated method stub
		
	}
	//상품의 내용만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public Map<String, Object> selectItemDetailContext(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품의 사진만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public List<String> selectItemDetailImgs(int pr_bm_no) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품 삭제 시
	public Map<String, Object> deleteItem(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품 판매 완료 처리 
	public String updateItemToConfirm(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품 찜하기
	public int likeItem(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return 0;
	}
	//댓글 달기. 대댓글 달기
	public Map<String, Object> insertComment(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//댓글 or 대댓글 삭제
	public Map<String, Object> deleteComment(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//댓글 or 대댓글 수정
	public Map<String, Object> updateComment(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용자가 상품을 등록 시에
	public void insertItem(Map<String, Object> pmap, List<String> itemImgs) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}

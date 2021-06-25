package item.mvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ItemLogic {

	private ItemDao itemDao = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	public List<Map<String, Object>> selectItemList(String gubun){
		List<Map<String, Object>> a = new ArrayList<>();
		return a;
		
	}
	public static List<Map<String, Object>> selectByCategory(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	public static List<Map<String, Object>> selectBySearch(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품의 내용만 가져옴 - 사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음
	public static Map<String, Object> editItemContext(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품의 사진만 가져옴 - 사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음
	public static Map<String, Object> editItemImgs(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//상품의 내용만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public static Map<String, Object> selectItemDetailContext(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//상품의 사진만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public static Map<String, Object> selectItemDetailImgs(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//상품 삭제 시
	public static Map<String, Object> deleteItem(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//상품 판매 완료 처리 
	public static String updateItemToConfirm(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//상품 찜하기
	public static int likeItem(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//댓글 달기. 대댓글 달기
	public static Map<String, Object> insertComment(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	//댓글 or 대댓글 삭제
	public static void deleteComment(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		
	}
	
}

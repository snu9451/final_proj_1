package item.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ItemLogic {
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private ItemDao itemDao = null;
	
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	public void setItemDao(ItemDao itemDao) {
		logger.info("ItemDao 주입");
		this.itemDao = itemDao;
	}
	
	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public List<Map<String, Object>> selectItemList(Map<String, Object> pmap){
		logger.info("Logic : selectItemList메소드 호출");
		//인기상품 일시 "like_rank"로, 최근상품 일시 "new_rank" 인지만 반환 - String으로 변환
		return itemDao.selectItemList(pmap.get("pr_choice").toString());
	}
	
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public List<Map<String, Object>> selectByCategory(Map<String, Object> pmap) {
		logger.info("Logic : selectByCategory메소드 호출");
		//카테고리메뉴는 String으로 변환
		return itemDao.selectByCategory(pmap.get("pr_categori").toString());
	}
	//검색어를 입력하여 찾기
	public List<Map<String, Object>> selectBySearch(Map<String, Object> pmap) {
		logger.info("Logic : selectBySearch메소드 호출");
		String pr_search_order = pmap.get("pr_search_order").toString(); //검색 주제를 받아오기
		String pr_search = pmap.get("pr_search").toString(); //검색어 값 받아오기 
		return itemDao.selectBySearch(pr_search_order,pr_search);
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 내용
	public Map<String,Object> editItem(int pr_bm_no) {
		logger.info("Logic : editItem메소드 호출");
		return itemDao.editItem(pr_bm_no);
	}
	
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 사진들
	public List<String> editItemImg(int pr_bm_no) {
		logger.info("Logic : editItemImg메소드 호출");
		return itemDao.editItemImg(pr_bm_no);
	}
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되어야함.
	public void updateItem(Map<String, Object> pmap) {
		logger.info("Logic : updateItem메소드 호출");
		//상품 번호를 가져온다.
		int pr_bm_no = Integer.parseInt(pmap.get("pr_bm_no").toString());
		//사진을 1~5까지 넣고 없디먄 break로 중지시킨다.
		List<String> itemImgs = new ArrayList<>();
		for(int i=1;i<=5;i++) {
			String pname = "Img_"+i;
			if(pmap.containsKey(pname)) {
				itemImgs.add(pmap.get(pname).toString());
			}else {
				break;
			}
		}
		//상품의 정보(pmap) 와 사진(itemImgs)을 파라미터로 넣는다.
		itemDao.updateItem(pmap,itemImgs,pr_bm_no);
	}

	//상품의 내용만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public Map<String, Object> selectItemDetailContext(String pr_MEM_EMAIL,int pr_bm_no) {
		logger.info("Logic : selectItemDetailContext메소드 호출");
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_MEM_EMAIL", pr_MEM_EMAIL);
		pmap.put("pr_bm_no", pr_bm_no);
		return itemDao.selectItemDetailContext(pmap);
	}
	//상품의 사진만 가져옴 - 사용자가 상품하나를 자세히 볼 때(//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 사진들 얘랑 같은 거 사용)
	public List<String> selectItemDetailImgs(int pr_bm_no) {
		logger.info("Logic : selectItemDetailImgs메소드 호출");
		return itemDao.editItemImg(pr_bm_no);
	}
	
	//상품 삭제 시
	public void deleteItem(Map<String, Object>  pmap) {
		logger.info("Logic : deleteItem메소드 호출");
		itemDao.deleteItem(pmap);
	}
	
	//상품 판매 완료 처리 
	public String updateItemToConfirm(Map<String, Object> pmap) {
		logger.info("Logic : updateItemToConfirm메소드 호출");
		return itemDao.updateItemToConfirm(pmap);
	}
	
	//상품 찜하기
	public int likeItem(Map<String, Object> pmap) {
		logger.info("Logic : likeItem메소드 호출");
		return itemDao.likeItem(pmap);
	}
	
	//댓글 달기. 대댓글 달기
	public Map<String, Object> insertComment(Map<String, Object> pmap) {
		logger.info("Logic : insertComment메소드 호출");
		return itemDao.insertComment(pmap);
	}
	//댓글 or 대댓글 삭제
	public String deleteComment(Map<String, Object> pmap) {
		logger.info("Logic : deleteComment메소드 호출");
		return itemDao.deleteComment(pmap);
	}
	//댓글 or 대댓글 수정
	public String updateComment(Map<String, Object> pmap) {
		logger.info("Logic : updateComment메소드 호출");
		return itemDao.updateComment(pmap);
	}
	//사용자가 상품을 등록 시에
	public void insertItem(Map<String, Object> pmap) {
		logger.info("Logic : insertItem메소드 호출");
		//사진을 1~5까지 넣고 없디먄 break로 중지시킨다.
		List<String> itemImgs = new ArrayList<>();
		for(int i=1;i<=5;i++) {
			String pname = "Img_"+i;
			if(pmap.containsKey(pname)) {
				itemImgs.add(pmap.get(pname).toString());
			}
		}
		//상품의 정보와 사진을 파라미터로 넣는다.
		itemDao.insertItem(pmap,itemImgs);
	}



}

package item.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.util.HashMapBinder;

public class ItemController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	//private ItemLogic itemLogic = null;
	private ItemLogic itemLogic = new  ItemLogic();
	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(ItemController.class);
	
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setItemLogic(ItemLogic itemLogic) {
		this.itemLogic = itemLogic;
	}
	
	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public void selectItemList(HttpServletRequest req, HttpServletResponse res) {
		//String newORlike = req.getParameter("newORlike");
		String newORlike = "new";
		itemLogic.selectItemList(newORlike);
		
	}
	
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public ModelAndView selectByCategory(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		
		//List<Map<String,Object>> items = ItemLogic.selectItemList(pmap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("itemTest");
		return mav;
	}
	
	//검색어를 입력하여 찾기
	public ModelAndView selectBySearch(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

	
	//???????edit과 차이 사용자가 상품을 수정시
	public ModelAndView updateItem(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	//사용자가 하나의 제품을 클릭 시 가져 오게 되는 상품
	public ModelAndView selectItemDetail(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	//???????edit과 차이 사용자가 상품을 수정시
	public ModelAndView editItem(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	//상품 삭제
	public ModelAndView deleteItem(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	//상품 판매 완료 클릭 시
	public void updateItemToConfirm(HttpServletRequest req, HttpServletResponse res) {

	}
	
	//상품 찜하기 클릭 시
	public void likeItem(HttpServletRequest req, HttpServletResponse res) {
		
	}
	
	//댓글 등록 - 댓글인지 대댓글인지 구분
	public void insertComment(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
	}
	
	//댓글 삭제 - 댓글인지 대댓글인지 구분
	public void deleteComment(HttpServletRequest req, HttpServletResponse res) {

	}
	
	
	//댓글 수정 - 댓글인지 대댓글인지 구분
	public void updateComment(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
	}
	
	
	//사용자가 상품을 등록 시에
	public ModelAndView insertItem(HttpServletRequest req, HttpServletResponse res) {
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	
	
	
	
	
}

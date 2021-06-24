package item.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
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
		logger.info("controller : selectItemList메소드 호출");
		//front : key는 "newORlike" && value는 인기상품 일시 "like_rank"로, 최근상품 일시 "new_rank"
		//String newORlike = req.getParameter("newORlike");
		//아이템 전부를 가져오는 로직
		//List<Map<String, Object>> items = itemLogic.selectItemList(newORlike);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//res.setContentType("application/json;charset=utf-8");
		//try {
		//		PrintWriter out = res.getWriter();
		//} catch (IOException e) {
		//		e.printStackTrace();
		//}
		//out.print(itemsJson);
		
		String newORlike = "new_rank";
		List<Map<String, Object>> items = itemLogic.selectItemList(newORlike);
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		res.setContentType("application/json;charset=utf-8");
		try {
			PrintWriter out = res.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(itemsJson);
		
	}
	
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public ModelAndView selectByCategory(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectByCategory메소드 호출");
		//front : key는 "categoryName" && value는 카테고리이름을 가져오겠지!
		//한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//카테고리 메뉴가 여기에 들어가게 된다.
		//hmb.bind(pmap);
		//관련 카테고리 아이템들을 가져온다.
		//List<Map<String,Object>> items = ItemLogic.selectByCategory(pmap);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//ModelAndView mav = new ModelAndView();
		//mav.addObject("items", items);
		//mav.setViewName("itemTest");
		//return mav;
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		//카테고리 메뉴 이름이 여기에 들어가게 된다.
		hmb.bind(pmap);
		//관련 카테고리 아이템들을 가져온다.
		List<Map<String,Object>> items = ItemLogic.selectByCategory(pmap);
		//Json 형태로 가져오기
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		ModelAndView mav = new ModelAndView();
		mav.addObject("items", items);
		mav.setViewName("itemTest");
		return mav;
	}
	
	//검색어를 입력하여 찾기
	public ModelAndView selectBySearch(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectBySearch메소드 호출");
		//front : key는 "searchItem" && value는 입력한 검색어
		//front : key는 "searchType" && value는 "제목" or "내용" or "작성자"
		//한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//검색어를 가져오게 된다. + 검색 타입을(제목, 내용, 작성자) 가져온다.
		//hmb.bind(pmap);
		//검색어 아이템들을 가져온다.
		//List<Map<String,Object>> items = ItemLogic.selectBySearch(pmap);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//ModelAndView mav = new ModelAndView();
		//mav.addObject("items", items);
		//mav.setViewName("itemTest");
		//return mav;
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		//검색어를 가져오게 된다. + 검색 타입을(제목, 내용, 작성자) 가져온다.
		hmb.bind(pmap);
		//검색어 아이템들을 가져온다.
		List<Map<String,Object>> items = ItemLogic.selectBySearch(pmap);
		//Json 형태로 가져오기
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		ModelAndView mav = new ModelAndView();
		mav.addObject("items", items);
		mav.setViewName("itemTest");
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

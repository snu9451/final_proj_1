package item.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		//front : key는 "pr_choice" && value는 인기상품 일시 "like_rank"로, 최근상품 일시 "new_rank"
		//String newORlike = req.getParameter("newORlike");
		//아이템 전부를 가져오는 로직
		//List<Map<String, Object>> items = itemLogic.selectItemList(pr_choice);
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
		
		String pr_choice = "new_rank";
		List<Map<String, Object>> items = itemLogic.selectItemList(pr_choice);
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
		//front : key는 "pr_categori" && value는 카테고리이름을 가져오겠지!
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
		//front : key는 "pr_search" && value는 입력한 검색어
		//front : key는 "pr_search_order" && value는 "제목" or "내용" or "작성자"
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

	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음
	public ModelAndView editItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : editItem메소드 호출");
		//front : key는 "pr_bm_no" && value는 상품의 번호를 받아옴.
		//Map<String,Object> pmap = new HashMap<>();
		//pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		////상품의 내용을 가져온다.
		//Map<String,Object> itemContext = ItemLogic.editItemContext(pmap);
		////상품의 사진들을 가져온다
		//Map<String,Object> itemImgs = ItemLogic.editItemImgs(pmap);
		//
		//ModelAndView mav = new ModelAndView();
		////상품의 정보를 다 담는다.
		//mav.addObject("itemContext", itemContext);
		//mav.addObject("itemImgs", itemImgs);
		////페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		//상품의 내용을 가져온다.
		Map<String,Object> itemContext = ItemLogic.editItemContext(pmap);
		//상품의 사진들을 가져온다
		Map<String,Object> itemImgs = ItemLogic.editItemImgs(pmap);
		
		ModelAndView mav = new ModelAndView();
		//상품의 정보를 다 담는다.
		mav.addObject("itemContext", itemContext);
		mav.addObject("itemImgs", itemImgs);
		//페이지 전송
		mav.setViewName("itemTest");
		return mav;
	}
	
	
	
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되야하니까 -------어려우니깐 일단 패스-----------------
	public ModelAndView updateItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateItem메소드 호출");
		//front : key는 "pr_BM_TITLE" / "pr_BM_CONTENT" / "pr_BM_PRICE" / "pr_bm_no" / "pr_CATEGORY_NAME"
		//        value는  상품 제목         상품 내용            상품 가격         상품 번호        상품 카테고리
		//        key는 "picture_1
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		
		hmb.bind(pmap);
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	//사용자가 하나의 제품을 클릭 시 가져 오게 되는 상품
	public ModelAndView selectItemDetail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectItemDetail메소드 호출");
		//front : key는  "pr_bm_no" / value 값은 상품 번호
		//Map<String,Object> pmap = new HashMap<>();
		////세션으로 이메일을 가져옴.
		//HttpSession session= req.getSession(); 
		////값들을 넣어줌
		//pmap.put("pr_MEM_EMAIL", req.getAttribute("MEM_EMAIL")); 
		//pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		////상품의 내용을 가져온다.
		//Map<String,Object> itemContext = ItemLogic.selectItemDetailContext(pmap);
		////상품의 사진들을 가져온다
		//Map<String,Object> itemImgs = ItemLogic.selectItemDetailImgs(pmap);
		//ModelAndView mav = new ModelAndView();
		////상품의 정보를 다 담는다.
		//mav.addObject("itemContext", itemContext);
		//mav.addObject("itemImgs", itemImgs);
		////페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		
		Map<String,Object> pmap = new HashMap<>();
		//세션으로 이메일을 가져옴.
		HttpSession session= req.getSession(); 
		//값들을 넣어줌
		pmap.put("pr_MEM_EMAIL", req.getAttribute("MEM_EMAIL")); 
		pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		//상품의 내용을 가져온다.
		Map<String,Object> itemContext = ItemLogic.selectItemDetailContext(pmap);
		//상품의 사진들을 가져온다
		Map<String,Object> itemImgs = ItemLogic.selectItemDetailImgs(pmap);
		ModelAndView mav = new ModelAndView();
		//상품의 정보를 다 담는다.
		mav.addObject("itemContext", itemContext);
		mav.addObject("itemImgs", itemImgs);
		//페이지 전송
		mav.setViewName("itemTest");
		return mav;
	}

	
	//상품 삭제
	public ModelAndView deleteItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : deleteItem메소드 호출");
		//front : key는 "br_sel_buy" && value는 구매자일 경우 "buy" , 판매자일 경우 "sel"
		//        key는 "pr_bm_no"   && value값은 상품 번호
		//Map<String,Object> pmap = new HashMap<>();
		////값들을 넣어줌
		//pmap.put("br_sel_buy", req.getAttribute("br_sel_buy")); 
		//pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));	
		////상품을 삭제한다.
		//Map<String,Object> itemContext = ItemLogic.deleteItem(pmap);
		//ModelAndView mav = new ModelAndView();
		////페이지 전송
		//mav.setViewName("itemTest");		
		//return mav;
		
		Map<String,Object> pmap = new HashMap<>();
		//값들을 넣어줌
		pmap.put("br_sel_buy", req.getAttribute("br_sel_buy")); 
		pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));	
		//상품을 삭제한다.
		Map<String,Object> itemContext = ItemLogic.deleteItem(pmap);
		ModelAndView mav = new ModelAndView();
		//페이지 전송
		mav.setViewName("itemTest");		
		return mav;
	}
	
	//상품 판매 완료 클릭 시
	public void updateItemToConfirm(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateItemToConfirm 메소드 호출");
		////front : key는 "pr_bm_no"   && value값은 상품 번호
		//Map<String,Object> pmap = new HashMap<>();
		//pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		////상품을 판매 완료 처리한다.
		//String msg = ItemLogic.updateItemToConfirm(pmap);
		////만약에 누군가와 거래 중이라면 판매 완료 처리가 불가능 msg ="false"
		////그게 아니라면 msg = "true"
		//try {
		//	PrintWriter out = res.getWriter();
		//	out.print(msg);
		//} catch (IOException e) {
		//	e.printStackTrace();
		//}
		
		//front : key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		//상품을 판매 완료 처리한다.
		String msg = ItemLogic.updateItemToConfirm(pmap);
		//만약에 누군가와 거래 중이라면 판매 완료 처리가 불가능 msg ="false"
		//그게 아니라면 mss = "true"

	}
	
	//상품 찜하기 클릭 시
	public void likeItem(HttpServletRequest req, HttpServletResponse res){
		logger.info("controller : likeItem메소드 호출");
		////front : key는 "pr_bm_no"   && value값은 상품 번호
		//Map<String,Object> pmap = new HashMap<>();
		////세션으로 이메일을 가져옴.
		//HttpSession session= req.getSession(); 
		////값들을 넣어줌
		//pmap.put("pr_MEM_EMAIL", req.getAttribute("MEM_EMAIL")); 
		//pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		//// like = 1이면 찜하기 된거고, -1이면 찜하기 취소 된 거임
		//int like = ItemLogic.likeItem(pmap);
		//try {
		//	PrintWriter out = res.getWriter();
		//	out.print(like);
		//} catch (IOException e) {
		//	e.printStackTrace();
		//}
		
		//front : key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		//세션으로 이메일을 가져옴.
		HttpSession session= req.getSession(); 
		//값들을 넣어줌
		pmap.put("pr_MEM_EMAIL", req.getAttribute("MEM_EMAIL")); 
		pmap.put("pr_bm_no", req.getAttribute("pr_bm_no"));
		// like = 1이면 찜하기 된거고, -1이면 찜하기 취소 된 거임
		int like = ItemLogic.likeItem(pmap);
		try {
			PrintWriter out = res.getWriter();
			out.print(like);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//댓글 등록 - 댓글인지 대댓글인지 구분
	public void insertComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : insertComment메소드 호출");
		////front : key는 "pr_comment_msg"  / "pr_comment_group"                              / "pr_commnet_pos"     / "pr_mem_nickname" / "pr_bm_no"
		////      value는  메세지 내용        / 댓글이면 0이고, 대댓글이면 댓글의 pr_comment_group로 가져온다.    댓글이면 0, 대댓글이면 1    닉네임               게시판 번호
		////한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//hmb.bind(pmap);
		//
		////댓글 또는 대댓글의 정보 가지고 오기, 특히 댓글의 경우 0이 아닌 pr_comment_group을 가져와야한다! / comment_step도 부여
		//Map<String,Object> comments = ItemLogic.insertComment(pmap);
		//try {
		//	PrintWriter out = res.getWriter();
		//	out.print(comments);
		//} catch (IOException e) {
		//	e.printStackTrace();
		//}
		
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		
		//댓글 또는 대댓글의 정보 가지고 오기, 특히 댓글의 경우 0이 아닌 pr_comment_group을 가져와야한다!+ comment_step
		Map<String,Object> comments = ItemLogic.insertComment(pmap);
		try {
			PrintWriter out = res.getWriter();
			out.print(comments);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//댓글 삭제 - 댓글인지 대댓글인지 구분
	public void deleteComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : deleteComment메소드 호출");
		//front : key는 "comment_step" && value는 숫자를 가져오면 된다. (comment_step는 댓글의 시퀀스 번호임)
		Map<String,Object> pmap = new HashMap<>();
		//값을 넣어줌
		pmap.put("comment_step", req.getAttribute("comment_step"));
		ItemLogic.deleteComment(pmap);

	}
	
	
	//댓글 수정 - 댓글인지 대댓글인지 구분
	public void updateComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateComment메소드 호출");
		//front : key는 "comment_step" && value는 숫자를 가져오면 된다.
		Map<String,Object> pmap = new HashMap<>();
		//값을 넣어줌
		pmap.put("comment_step", req.getAttribute("comment_step"));
		ItemLogic.deleteComment(pmap);
	}

	
	//사용자가 상품을 등록 시에
	public ModelAndView insertItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : insertItem메소드 호출");
		//front : key는 pr_BM_TITLE   /   pr_BM_CONTENT  /  pr_BM_PRICE  /   pr_SELLER_NICKNAME  /  pr_CATEGORY_NAME  
		//      value는   제목                 내용              가격                닉네임                  카테고리         
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		
		//상품의 내용을 저장 하고 번호만 가져온다.
		//int insertItemNum = ItemLogic.selectItemDetailContext(pmap);
		//상품의 사진들을 가져온다
		//Map<String,Object> itemImgs = ItemLogic.selectItemDetailImgs(pmap);
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	
	
	
	
	
}

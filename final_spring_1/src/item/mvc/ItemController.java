package item.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import nds.util.AjaxDataPrinter;
import nds.util.HashMapBinder;

public class ItemController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private ItemLogic itemLogic = null;

	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(ItemController.class);
	
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setItemLogic(ItemLogic itemLogic) {
		logger.info("ItemLogic 주입");
		this.itemLogic = itemLogic;
	}
	
	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public void selectItemList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectItemList메소드 호출");
		//front : key는 "pr_choice" && value는 인기상품 일시 "like_rank"로, 최근상품 일시 "new_rank"
		//Map<String,Object> pmap = new HashMap<>();
		//pmap.put("pr_choice",req.getParameter("pr_choice"));
		//아이템 전부를 가져오는 로직
		//List<Map<String, Object>> items = itemLogic.selectItemList(pmap);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//가지고 나가는 key&value => "BM_PRICE": 80000,"BM_NO": 13,"BM_LIKE": 0,"BM_DATE": "2020-06-27 17:46:41","BM_STATUS": "N","BI_FILE": "16.png",BM_TITLE": "책팔요"
		//AjaxDataPrinter.out(res,"application/json",itemsJson);
		
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_choice","like_rank");
		//아이템 전부를 가져오는 로직
		List<Map<String, Object>> items = itemLogic.selectItemList(pmap);
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		AjaxDataPrinter.out(res,"application/json",itemsJson);
		
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
		//List<Map<String,Object>> items = itemLogic.selectByCategory(pmap);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//ModelAndView mav = new ModelAndView();
		//가지고 나가는 key&value => {BM_PRICE=200000, BM_NO=11, BM_LIKE=0, BM_DATE=2020-06-27 15:46:41, BM_STATUS=N, BI_FILE=14.png, BM_TITLE=의자팝니다}
		//mav.addObject("items", items);
		//mav.setViewName("itemTest");
		//return mav;
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		//카테고리 메뉴 이름이 여기에 들어가게 된다.
		hmb.bind(pmap);
		pmap.put("pr_categori","디지털기기");
		//관련 카테고리 아이템들을 가져온다.
		List<Map<String,Object>> items = itemLogic.selectByCategory(pmap);
		//Json 형태로 가져오기
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		ModelAndView mav = new ModelAndView();
		mav.addObject("items", items);
		mav.setViewName("itemTest");
		System.out.println(items);
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
		//List<Map<String,Object>> items = itemLogic.selectBySearch(pmap);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//ModelAndView mav = new ModelAndView();
		//가지고 나오는 key&value => {BM_PRICE=120000, BM_NO=12, BM_LIKE=0, BM_DATE=2020-06-27 16:46:41, BM_STATUS=N, BI_FILE=15.png, BM_TITLE=목걸이팔아요}
		//mav.addObject("items", items);
		//mav.setViewName("itemTest");
		//return mav;
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		//검색어를 가져오게 된다. + 검색 타입을(제목, 내용, 작성자) 가져온다.
		hmb.bind(pmap);
		pmap.put("pr_search","아fg요");
		pmap.put("pr_search_order","내용");
		//검색어 아이템들을 가져온다.
		List<Map<String,Object>> items = itemLogic.selectBySearch(pmap);
		//Json 형태로 가져오기
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		ModelAndView mav = new ModelAndView();
		mav.addObject("items", items);
		mav.setViewName("itemTest");
		System.out.println(items);
		return mav;
	}

	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음
	public ModelAndView editItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : editItem메소드 호출");
		//front : key는 "pr_bm_no" && value는 상품의 번호를 받아옴.
		//int pr_bm_no = Integer.parseInt(req.getParameter("pr_bm_no").toString());
		//상품의 내용, 상품의 사진들을 가져온다
		//Map<String,Object> item = itemLogic.editItem(pr_bm_no);
		//List<String> itemImg = itemLogic.editItemImg(pr_bm_no);
		//ModelAndView mav = new ModelAndView();
		//상품의 정보를 다 담는다.
		//가지고 나오는 key&value => {BM_PRICE=5000, BM_NO=4, BM_CONTENT=자취 방 빼서 옷 내놔요, CATEGORY_NAME=의류, BM_TITLE=카라티 팝니다}
		//mav.addObject("item", item);
		//가지고 나오는 list => [5.png, 6.png]
		//mav.addObject("itemImg", itemImg);
		//페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		
		//상품 번호를 가져온다.
		int pr_bm_no = 4;
		//상품의 내용, 상품의 사진들을 가져온다
		Map<String,Object> item = itemLogic.editItem(pr_bm_no);
		List<String> itemImg = itemLogic.editItemImg(pr_bm_no);
		ModelAndView mav = new ModelAndView();
		//상품의 정보를 다 담는다.
		mav.addObject("item", item);
		mav.addObject("itemImg", itemImg);
		System.out.println(item);
		System.out.println(itemImg);
		//페이지 전송
		mav.setViewName("itemTest");
		return mav;
	}
	
	
	
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되야하니까
	public ModelAndView updateItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateItem메소드 호출");
		//front : key는 "pr_BM_TITLE" / "pr_BM_CONTENT" / "pr_BM_PRICE" / "pr_bm_no" / "pr_CATEGORY_NAME"
		//        value는  상품 제목         상품 내용            상품 가격         상품 번호        상품 카테고리
		//        key는 "Img_1"  / "Img_2"  /  "Img_3"  /  "Img_4"  /  "Img_5"
		//한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//hmb.multiBind(pmap);
		//ModelAndView mav = new ModelAndView();
		////사이즈 초과시 에러를 전송시킴
		//if(pmap.containsKey("error")) {
		//	System.out.println(pmap.get("error"));
		//	//페이지 전송
		//	mav.setViewName("itemTest");
		//	return mav;
		//}
		////상품의 내용, 상품의 사진들을 저장한다.
		//itemLogic.updateItem(pmap);
		////페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_BM_TITLE","내용111" );
		pmap.put("pr_BM_CONTENT","내용111" );
		pmap.put("pr_BM_PRICE",2000);
		pmap.put("pr_SELLER_NICKNAME","바나나" );
		pmap.put("pr_CATEGORY_NAME","기타" );
		pmap.put("pr_bm_no",32);
		List<Map<String,Object>> itemImgs = new ArrayList<Map<String,Object>>();
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("bi_file", "23.png");
		map1.put("bi_size", 23);
		itemImgs.add(map1);
		map1 = new HashMap<String, Object>();
		map1.put("bi_file", "24.png");
		map1.put("bi_size", 555);
		itemImgs.add(map1);
		map1 = new HashMap<String, Object>();
		map1.put("bi_file", "25.png");
		map1.put("bi_size", 532);
		itemImgs.add(map1);
		pmap.put("itemImgs", itemImgs);
		//사이즈 초과시 에러를 전송시킴
		if(pmap.containsKey("error")) {
			System.out.println(pmap.get("error"));
			//페이지 전송
			mav.setViewName("itemTest");
			return mav;
		}
		//상품의 내용, 상품의 사진들을 저장한다.
		itemLogic.insertItem(pmap);
		//페이지 전송
		mav.setViewName("itemTest");
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
		//String pr_MEM_EMAIL = session.getAttribute(이멜 가지고 나와);
		//int pr_bm_no = Integer.parseInt(getParameter("pr_bm_no").toString());
		////상품의 내용을 가져온다.
		//Map<String,Object> itemContext = itemLogic.selectItemDetailContext(pr_MEM_EMAIL,pr_bm_no);
		////상품의 사진들을 가져온다
		//List<String> itemImgs = itemLogic.selectItemDetailImgs(pmap);
		//ModelAndView mav = new ModelAndView();
		////상품의 정보를 다 담는다.
		//결과값 {BM_PRICE=120000, BM_NO=3, BM_CONTENT=선물 받았는데 있어서 팔아요, SELLER_NICKNAME=딸기, BM_LIKE=2, BM_HIT=200, BM_DATE=2020-06-19 15:46:41, BM_STATUS=N, I_LIKE=true, BM_TITLE=샤넬 향수 새거 팔아요}
		//mav.addObject("itemContext", itemContext);
		//결과값[4.png]
		//mav.addObject("itemImgs", itemImgs);
		////페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		
		Map<String,Object> pmap = new HashMap<>();
		//세션으로 이메일을 가져옴.
		HttpSession session= req.getSession(); 
		//값들을 넣어줌
		String pr_MEM_EMAIL = "apple@good.com";
		int pr_bm_no = 3;
		//상품의 내용을 가져온다.
		Map<String,Object> itemContext = itemLogic.selectItemDetailContext(pr_MEM_EMAIL,pr_bm_no);
		//상품의 사진들을 가져온다
		List<String> itemImgs = itemLogic.selectItemDetailImgs(pr_bm_no);
		ModelAndView mav = new ModelAndView();
		//상품의 정보를 다 담는다.
		mav.addObject("itemContext", itemContext);
		mav.addObject("itemImgs", itemImgs);
		System.out.println(itemContext);
		System.out.println(itemImgs);
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
		//pmap.put("br_sel_buy", req.getParameter("br_sel_buy")); 
		//pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));	
		////상품을 삭제한다.
		//itemLogic.deleteItem(pmap);
		//ModelAndView mav = new ModelAndView();
		////페이지 전송
		//mav.setViewName("itemTest");		
		//return mav;
		
		Map<String,Object> pmap = new HashMap<>();
		//값들을 넣어줌
		pmap.put("br_sel_buy", "buy"); 
		pmap.put("pr_bm_no", 9);	
		//상품을 삭제한다.
		itemLogic.deleteItem(pmap);
		ModelAndView mav = new ModelAndView();
		//페이지 전송
		mav.setViewName("itemTest");		
		return mav;
	}
	
	//상품 판매 완료 클릭 시
	public void updateItemConfirm(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateItemToConfirm 메소드 호출");
		////front : key는 "pr_bm_no"   && value값은 상품 번호
		//Map<String,Object> pmap = new HashMap<>();
		//pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));
		////상품을 판매 완료 처리한다.
		//String msg = itemLogic.updateItemToConfirm(pmap);
		////만약에 누군가와 거래 중이라면 판매 완료 처리가 불가능 msg ="false"
		////그게 아니라면 msg = "true"
		//AjaxDataPrinter.out(res, msg);
		
		//front : key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_bm_no", 9);
		//상품을 판매 완료 처리한다.
		String msg = itemLogic.updateItemToConfirm(pmap);
		//만약에 누군가와 거래 중이라면 판매 완료 처리가 불가능 msg ="false"
		//그게 아니라면 msg = "true"
		AjaxDataPrinter.out(res, msg);
	}
	
	//상품 찜하기 클릭 시
	public void likeItem(HttpServletRequest req, HttpServletResponse res){
		logger.info("controller : likeItem메소드 호출");
		////front : key는 "pr_bm_no"   && value값은 상품 번호
		//Map<String,Object> pmap = new HashMap<>();
		////세션으로 이메일을 가져옴.
		//HttpSession session= req.getSession(); 
		////값들을 넣어줌
		//pmap.put("pr_MEM_EMAIL", 세션으로 이메일)); 
		//pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));
		//// like = 1이면 찜하기 된거고, -1이면 찜하기 취소 된 거임
		//int like = i temLogic.likeItem(pmap);
		//AjaxDataPrinter.out(res, like);
		
		//front : key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		//세션으로 이메일을 가져옴.
		HttpSession session= req.getSession(); 
		//값들을 넣어줌
		pmap.put("pr_MEM_EMAIL", "apple@good.com"); 
		pmap.put("pr_bm_no", 3);
		// like = 1이면 찜하기 된거고, -1이면 찜하기 취소 된 거임
		int like = itemLogic.likeItem(pmap);
		AjaxDataPrinter.out(res, like);
		
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
		////댓글 또는 대댓글의 정보 가지고 오기, 특히 댓글의 경우 0이 아닌 pr_comment_group을 가져와야한다!+ p_comment_step , result
		//Map<String,Object> comments = itemLogic.insertComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 등록 되었고, "itemFalse"이면 상품이 삭제 되었다는 것으로 댓글이 못 달린다.
		////									            "comentFalse"면 댓글이 삭제 되었다는 것이다.(물론 이 경우는 대댓글 등록일 경우)
		//AjaxDataPrinter.out(res,"application/json",comments);
		
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		pmap.put("pr_comment_msg", "네 뭔데?웃노");
		pmap.put("pr_comment_group" , 15);
		pmap.put("pr_comment_pos", 1);
		pmap.put("pr_mem_nickname", "토마토");
		pmap.put("pr_bm_no", 1);
		//댓글 또는 대댓글의 정보 가지고 오기, 특히 댓글의 경우 0이 아닌 pr_comment_group을 가져와야한다!+ p_comment_step , result
		Map<String,Object> comments = itemLogic.insertComment(pmap);
		AjaxDataPrinter.out(res,"application/json",comments);
		
	}
	
	//댓글 삭제 - 댓글인지 대댓글인지 구분
	public void deleteComment(HttpServletRequest req, HttpServletResponse res){
		logger.info("controller : deleteComment메소드 호출");
		////front : key는 "p_comment_step" && value는 숫자를 가져오면 된다. (comment_step는 댓글의 시퀀스 번호임)
		//Map<String,Object> pmap = new HashMap<>();
		////값을 넣어줌
		//pmap.put("comment_step", req.getParameter("p_comment_step"));
		//String result = itemLogic.deleteComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		////- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		//AjaxDataPrinter.out(res,result);
		
		Map<String,Object> pmap = new HashMap<>();
		////값을 넣어줌
		pmap.put("pr_comment_step", 24);
		String result = itemLogic.deleteComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		////- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		AjaxDataPrinter.out(res,result);

	}
	
	
	//댓글 수정 - 댓글인지 대댓글인지 구분
	public void updateComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateComment메소드 호출");
		//front : key는 "pr_comment_step" && value는 숫자를 가져오면 된다. (comment_step는 댓글의 시퀀스 번호임)
		//        key는 "pr_comment_msg" && value는 수정한 대화 내용
		////한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//hmb.bind(pmap);
		//String result = itemLogic.updateComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		////- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		//AjaxDataPrinter.out(res,result);
		
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		pmap.put("pr_comment_step",223);
		pmap.put("pr_comment_msg","호호로로로로로로로롤");
		String result = itemLogic.updateComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		////- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		AjaxDataPrinter.out(res,result);

	}

	
	//사용자가 상품을 등록 시에
	public ModelAndView insertItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : insertItem메소드 호출");
		//front : key는 pr_BM_TITLE   /   pr_BM_CONTENT  /  pr_BM_PRICE  /   pr_SELLER_NICKNAME  /  pr_CATEGORY_NAME  
		//      value는   제목                 내용              가격                닉네임                  카테고리         
		//        key는 "Img1" "img2" ....
		//ModelAndView mav = new ModelAndView();
		////한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//hmb.multiBind(pmap);
		////사이즈 초과시 에러를 전송시킴
		//if(pmap.containsKey("error")) {
		//	System.out.println(pmap.get("error"));
		//	//페이지 전송
		//	mav.setViewName("itemTest");
		//	return mav;
		//}
		////상품의 내용, 상품의 사진들을 저장한다.
		//itemLogic.insertItem(pmap);
		////페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		
		ModelAndView mav = new ModelAndView();
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.multiBind(pmap);
		pmap.put("pr_BM_TITLE","내용" );
		pmap.put("pr_BM_CONTENT","내용" );
		pmap.put("pr_BM_PRICE",3000);
		pmap.put("pr_SELLER_NICKNAME","바나나" );
		pmap.put("pr_CATEGORY_NAME","기타" );
		//사이즈 초과시 에러를 전송시킴
		if(pmap.containsKey("error")) {
			System.out.println(pmap.get("error"));
			//페이지 전송
			mav.setViewName("itemTest");
			return mav;
		}
		//상품의 내용, 상품의 사진들을 저장한다.
		itemLogic.insertItem(pmap);
		//페이지 전송
		mav.setViewName("itemTest");
		return mav;
	}
	
	
	
	
	
	
	
}

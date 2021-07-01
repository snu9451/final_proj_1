package admin.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


import item.mvc.ItemLogic;
import member.mvc.MemberLogic;
import nds.util.HashMapBinder;

public class AdminController extends MultiActionController {
	Logger logger = Logger.getLogger(AdminController.class); // 로그 출력

 // 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠
	private AdminLogic adminLogic = null;

 // setter 객체 주입법으로 객체 주입 받음
	public void setAdminLogic(AdminLogic adminLogic) {
		this.adminLogic = adminLogic;
	}

 // 회원 탈퇴하기(mem_active를 T에서 F로)
	public void outMember(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("outMember 메소드 호출");

	 // 프론트에서 선택된 회원들의 이메일을 List 형식으로 전송
		HashMapBinder hmb = new HashMapBinder(req); 
		Map<String, Object> pmap = new HashMap<>(); 
		hmb.bind(pmap); // 탈퇴시킬 회원의 정보를 담음
		 		
		int result = adminLogic.outMember(pmap); // update는 1건이(n건) 업데이트 되었습니다여서 int로
		res.sendRedirect("/WEB-INF/admin/getAdminPageMember.nds");
		
	 // 테스트	
		/*
		 * Map<String, Object> pmap = new HashMap<String, Object>();
		 * pmap.put("mem_email", "melon@good.com"); 
		 * null 체크됨 int result = adminLogic.outMember(pmap); 
		 * logger.info("처리결과 =====> " + result);
		 */
	}

 // (회원, 게시글)신고횟수 초기화 시키기(처리여부 F를 T로 바꾸기)
	public void initReportNumber(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("initReportNumber 메소드 호출");
		
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); 
		
	// 프론트에서 선택된 회원들의 이메일을 List 형식으로 전송
		int result = adminLogic.initReportNumber(pmap); // update는 1건이(n건) 업데이트 되었습니다여서 int로
		
		res.sendRedirect("/WEB-INF/admin/getAdminPageMember.nds");
	 // 테스트
//		Map<String, Object> pmap = new HashMap<String, Object>();
//		pmap.put("mem_email", "water@good.com");
//		pmap.put("bm_no", null);	// null 대입해주지 않아도 mapper XML에서 if문에서 null 체크됨
//		int result = adminLogic.initReportNumber(pmap);
//		logger.info("처리결과 =====> "+result);
	}

 // 회원 검색
	public void selectMemberBySearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectMemberBySearch 메소드 호출");

    // (관리자가 선택한 카테고리) Front에서 request 객체에 담아주어야 함
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); // 검색어 + 검색타입(닉네임이나 이메일, 전체) 담음
		
		String nick_email_type = ""; // 이메일, 닉네임, 전체인지 => 카테고리
		String pr_search = ""; // 검색단어
		pmap.put("nick_email_type", nick_email_type);
		pmap.put("pr_search", pr_search);
		
//		pmap.put("nick_email_type", "이메일");
//		pmap.put("pr_search", "w");
		
		List<Map<String, Object>> searchMember = new ArrayList<Map<String,Object>>(); // 검색한 회원들을 가져옴
		searchMember = adminLogic.selectMemberBySearch(pmap); 
		req.setAttribute("selectMemberBySearch", searchMember);
	//	logger.info("result" + searchMember);
	}

 // 게시글 검색
	public void selectBoardBySearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectBoardBySearch 메소드 호출");
		
	 // (관리자가 선택한 카테고리) Front에서 request 객체에 담아주어야 함
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); // 검색 타입(작성자, 제목, 전체) 담음
		
		String nick_email_type = ""; // 작성자, 제목, 전체 => 카테고리
		String pr_search = ""; // 검색단어
		pmap.put("pr_search", nick_email_type);
		pmap.put("nick_title_type", pr_search);
		
		// 테스트
//		  pmap.put("pr_search", "드"); 
//		  pmap.put("nick_title_type", "제목");
		
		List<Map<String,Object>> searchBoard = new ArrayList<Map<String,Object>>(); // 검색한 게시글들을 가져옴
		searchBoard = adminLogic.selectBoardBySearch(pmap); 
		req.setAttribute("searchBoard", searchBoard);
//		logger.info("result" + searchBoard);
	}

 // 신고된 회원 상세보기
	public ModelAndView selectMemberReportDetail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectMemberReportDetail 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); 
		
	 /* 테스트
  	    Map<String, Object> pmap = new HashMap<String, Object>();
		 > 신고 내용을 클릭하면 신고내용에 해당하는 신고번호, 신고한 사용자의 이메일, 신고당한 사용자의 이메일, 신고 내용, 신고 날짜, 신고 유형, 처리여부가 나옴
	  	pmap.put("report_msg", "욕을 해서 기분이 나쁘네요"); 
		pmap = adminLogic.selectMemberReportDetail(pmap);
		logger.info("처리결과 =====> " + pmap);	*/
		
		pmap = adminLogic.selectMemberReportDetail(pmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/selectMemberReportDetail");
		mav.addObject("selectMemberReportDetail", pmap);

		return mav;
	}

 // 신고된 게시글 상세보기
	public ModelAndView selectBoardReportDetail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectBoardReportDetail 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req); 
		Map<String,Object> pmap = new HashMap<>(); 
		hmb.bind(pmap); // 신고된 게시글 번호 담음
		 		
	 /* 테스트
  	    Map<String, Object> pmap = new HashMap<String, Object>();
		 > 신고 내용을 클릭하면 신고내용에 해당하는 신고번호, 신고한 회원 이메일, 신고내용, 신고날짜, 신고유형, 신고당한 게시글 번호, 처리여부가 나옴
	  	pmap.put("report_msg", "도배요~"); 
		pmap = adminLogic.selectBoardReportDetail(pmap);
		logger.info("처리결과 =====> " + pmap);	*/
		
		pmap = adminLogic.selectBoardReportDetail(pmap);

		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("admin/selectBoardReportDetail");
		mav.addObject("selectBoardReportDetail", pmap);		

		return mav;
	}
}
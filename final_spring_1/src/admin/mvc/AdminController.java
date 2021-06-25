package admin.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.util.HashMapBinder;

import item.mvc.ItemLogic;
import member.mvc.MemberLogic;

public class AdminController extends MultiActionController {
	Logger logger = Logger.getLogger(AdminController.class);

	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private MemberLogic memberLogic = null;
	private ItemLogic itemLogic = null;
	private AdminLogic adminLogic = null;

	// setter 객체 주입법으로 객체 주입 받음
	public void setAdminLogic(AdminLogic adminLogic) {
		this.adminLogic = adminLogic;
	}

 // 회원 탈퇴시키기
	public ModelAndView outMember(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("outMember 메소드 호출");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminTest");
//		mav.addObject("outMemeber", outMemeber);

		return mav;
	}

 // (회원, 게시글)신고횟수 초기화 시키기
	public ModelAndView initReportNumber(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("initReportNumber 메소드 호출");

		ModelAndView mav = new ModelAndView();
		return mav;
	}

 // 회원 검색
	public ModelAndView selectMemberBySearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectMemberBySearch 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);

		List<Map<String, Object>> selectMember = null;
		selectMember = memberLogic.selectMemberInfo(pmap); // ItemLogic에 있는 selectMemberInfo(회원 목록들) 가져옴

		ModelAndView mav = new ModelAndView();
		return mav;
	}

 // 게시글 검색
	public ModelAndView selectBoardBySearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectBoardBySearch 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);

		List<Map<String, Object>> selectBoard = null;
		selectBoard = itemLogic.selectItemList(pmap); // ItemLogic에 있는 selectItemList(게시판 목록들) 가져옴

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminTest");
		mav.addObject("selectBoard", selectBoard);
		return mav;
	}

 // 신고된 회원 신고 메시지 상세보기
	public ModelAndView selectMemberReportDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectMemberReportDetail 메소드 호출");
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);

		List<Map<String, Object>> memberReportDetail = null;
		memberReportDetail = adminLogic.selectMemberReportDetail(pmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminTest");
		mav.addObject("memberReportDetail", memberReportDetail);

		return mav;
	}

 // 신고된 게시글 신고 메시지 상세보기
	public ModelAndView selectBoardReportDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectBoardReportDetail 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);

		List<Map<String, Object>> boardReportDetail = null;
		boardReportDetail = adminLogic.selectBoardReportDetail(pmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminTest");
		mav.addObject("boardReportDetail", boardReportDetail);

		return mav;
	}
}
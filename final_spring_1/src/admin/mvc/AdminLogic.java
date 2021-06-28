package admin.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import item.mvc.ItemDao;
import member.mvc.MemberDao;

public class AdminLogic {
	Logger logger = Logger.getLogger(AdminLogic.class);
	
	private AdminDao adminDao = null;
	private MemberDao memberDao = null;
	private ItemDao itemDao = null;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
 // 회원 탈퇴시키기
	public int outMember(String memEmail) {
		logger.info("outMember 메소드 호출");
		
		return 0;
	}
	
 // (회원, 게시글)신고횟수 초기화 시키기(처리여부 F를 T로 시키기)
	public List<Map<String, Object>> initReportNumber(Map<String, Object> pmap) {
		logger.info("initReportNumber 메소드 호출");
		
		List<Map<String, Object>> initNumber = new ArrayList<Map<String,Object>>();
		initNumber = adminDao.initReportNumber(pmap);
		
		return null;
	}
	
 // 회원 검색
	public List<Map<String, Object>> selectMemberBySearch(Map<String, Object> pmap) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		List<Map<String, Object>> selectMember = new ArrayList<Map<String,Object>>();
		selectMember = adminDao.selectMemberBySearch(pmap);
		
		return selectMember;
	}
	
 // 게시글 검색
	public Map<String, Object> selectBoardBySearch(Map<String, Object> pmap) {
		logger.info("selectBoardBySearch 메소드 호출");
		
		List<Map<String, Object>> selectBoard = new ArrayList<Map<String,Object>>();
		selectBoard = adminDao.selectBoardBySearch(pmap);
		
		return null;
	}
	
 // 신고된 회원 상세보기
	public Map<String, Object> selectMemberReportDetail(Map<String, Object> pmap) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		String mem_eamil_to = pmap.get("bm_no").toString();
		pmap.put("mem_eamil_to", mem_eamil_to);
		
		return adminDao.selectMemberReportDetail(mem_eamil_to);
	}
	
 // 신고된 게시글 상세보기
	public Map<String, Object> selectBoardReportDetail(Map<String, Object> pmap) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		int bm_no = Integer.parseInt(pmap.get("bm_no").toString());
		pmap.put("bm_no", bm_no);
	
		return adminDao.selectBoardReportDetail(bm_no);
	}
}
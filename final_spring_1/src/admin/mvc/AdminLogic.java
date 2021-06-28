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
	
 // 회원 탈퇴하기(mem_active를 T에서 F로)
	public int outMember(Map<String, Object> pmap) {
		logger.info("outMember 메소드 호출");
		
		int result = adminDao.outMember(pmap);
		
		return result;
	}
	
 // (회원, 게시글)신고횟수 초기화 시키기(처리여부 F를 T로 바꾸기)
	public int initReportNumber(Map<String, Object> pmap) {
		logger.info("initReportNumber 메소드 호출");
		
		int result = adminDao.initReportNumber(pmap);
		
		return result;
	}
	
 // 회원 검색
	public List<Map<String, Object>> selectMemberBySearch(Map<String, Object> pmap) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		String nick_email_type = pmap.get("nick_email_type").toString();
		String pr_search = pmap.get("pr_search").toString();
		
		return adminDao.selectMemberBySearch(nick_email_type, pr_search);
	}
	
 // 게시글 검색
	public List<Map<String, Object>> selectBoardBySearch(Map<String, Object> pmap) {
		logger.info("selectBoardBySearch 메소드 호출");
		
		String nick_title_type = pmap.get("nick_title_type").toString(); // 작성자인지, 제목인지, 전체인지
		String pr_search = pmap.get("pr_search").toString(); // 검색한 단어 받음
		
		return adminDao.selectBoardBySearch(nick_title_type, pr_search);
	}
	
 // 신고된 회원 상세보기
	public Map<String, Object> selectMemberReportDetail(Map<String, Object> pmap) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		String report_msg = pmap.get("report_msg").toString();
		pmap.put("report_msg", report_msg);
		
		return adminDao.selectMemberReportDetail(report_msg);
	}
	
 // 신고된 게시글 상세보기
	public Map<String, Object> selectBoardReportDetail(Map<String, Object> pmap) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		String report_msg = pmap.get("report_msg").toString();
		pmap.put("report_msg", report_msg);
	
		return adminDao.selectBoardReportDetail(report_msg);
	}
}
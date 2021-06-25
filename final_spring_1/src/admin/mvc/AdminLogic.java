package admin.mvc;

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
	
	public int outMember(String memEmail) {
		logger.info("outMember 메소드 호출");
		
		return 0;
	}
	
	public List<Map<String, Object>> selectMemberBySearch(String gubun, String keyword) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		return 0;
	}
	
	public int initReportNumber(String gubun, List<Map<String, Object>> pmap) {
		logger.info("initReportNumber 메소드 호출");
		
		return 0;
	}
	
	public Map<String, Object> selectMemberReportDetail(String memEmail) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		Map<String, Object> memberReportDetail = null;
		memberReportDetail = adminDao.selectMemberReportDetail(memEmail);
		
		return memberReportDetail;
	}
	
	public List<Map<String, Object>> selectBoardBySearch(String gubun, String keyword) {
		logger.info("selectBoardBySearch 메소드 호출");
		
		List<Map<String, Object>> boardReportDetail = null;
		boardReportDetail = adminDao.selectBoardBySearch(gubun, keyword);
		
		return boardReportDetail;
	}
	
	public Map<String, Object> selectBoardReportDetail(int bmNo) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		Map<String, Object> boardReportDetail = null;
		boardReportDetail = adminDao.selectBoardReportDetail(bmNo);
		
		return (Map<String, Object>) boardReportDetail;
	}
}
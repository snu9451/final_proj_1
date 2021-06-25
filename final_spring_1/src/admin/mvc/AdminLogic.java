package admin.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class AdminLogic {
	Logger logger = Logger.getLogger(AdminLogic.class);
	
	private AdminDao adminDao = null;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public int outMember(String memEmail) {
		
		return 0;
	}
	
	public int initReportNumber(String gubun, List<Map<String, Object>> pmap) {
		return 0;
	}
	
	public List<Map<String, Object>> selectMemberBySearch(String gubun, String keyword) {
		return null;
	}
	
	public List<Map<String, Object>> selectBoardBySearch(String gubun, String keyword) {
		return null;
	}
	
	public Map<String, Object> selectMemberReportDetail(String memEmail) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		List<Map<String, Object>> memberReportDetail = null;
		memberReportDetail = adminDao.selectMemberReportDetail(memEmail);
		
		return (Map<String, Object>) memberReportDetail;
	}
	
	public Map<String, Object> selectBoardReportDetail(int bmNo) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		List<Map<String, Object>> boardReportDetail = null;
		boardReportDetail = adminDao.selectBoardReportDetail(bmNo);
		
		return (Map<String, Object>) boardReportDetail;
	}
}
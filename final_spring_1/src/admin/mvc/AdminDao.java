package admin.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class AdminDao {
	Logger logger = Logger.getLogger(AdminDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	


	public List<Map<String, Object>> selectBoardBySearch(String gubun, String keyword) {
		logger.info("selectBoardBySearch 메소드 호출");

		return null;
	}
	
	public Map<String, Object> selectMemberReportDetail(String memEmail) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		Map<String, Object> memberReportDetail = null;
		memberReportDetail = (Map<String, Object>) sqlSessionTemplate.selectList("memberReportDetail", memEmail);
		
		return memberReportDetail;
	}	

	public Map<String, Object> selectBoardReportDetail(int bmNo) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		Map<String, Object> boardReportDetail = null;
		boardReportDetail = (Map<String, Object>) sqlSessionTemplate.selectList("boardReportDetail", bmNo);
		
		return boardReportDetail;
	}
}
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
	
	public List<Map<String, Object>> selectMemberReportDetail(String memEmail) {
		List<Map<String, Object>> memberReportDetail = null;
		memberReportDetail = sqlSessionTemplate.selectList("selectMemberReportDetail", memEmail);
		
		return memberReportDetail;
	}

	public List<Map<String, Object>> selectBoardReportDetail(int bmNo) {
		List<Map<String, Object>> boardReportDetail = null;
		boardReportDetail = sqlSessionTemplate.selectList("selectBoardReportDetail", bmNo);
		
		return boardReportDetail;
	}
	
}
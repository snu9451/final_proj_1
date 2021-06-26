package admin.mvc;

import java.util.ArrayList;
import java.util.HashMap;
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

 // (회원, 게시글)신고횟수 초기화 시키기
	public List<Map<String, Object>> initReportNumber(Map<String, Object> pmap) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		List<Map<String, Object>> initNumber = new ArrayList<Map<String,Object>>();
		initNumber = sqlSessionTemplate.update("initNumber", pmap);
		
		return initNumber;
	}
	
 // 회원 검색
	public List<Map<String, Object>> selectMemberBySearch(Map<String, Object> pmap) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		List<Map<String, Object>> selectMember = new ArrayList<Map<String,Object>>();
		selectMember = sqlSessionTemplate.selectList("selectMember", pmap);
		
		return selectMember;
	}	
	

 // 게시글 검색
	public List<Map<String, Object>> selectBoardBySearch(Map<String, Object> pmap) {
		logger.info("selectBoardBySearch 메소드 호출");
		
		List<Map<String, Object>> selectBoard = new ArrayList<Map<String,Object>>();
		selectBoard = sqlSessionTemplate.selectList("selectBoard", pmap);

		return selectBoard;
	}
	
 // 신고된 회원 상세보기
	public Map<String, Object> selectMemberReportDetail(String mem_eamil_to) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		Map<String, Object> pmap = sqlSessionTemplate.selectOne("memberReportDetail", mem_eamil_to);
		 
		return pmap;
	}

 // 신고된 게시글 상세보기
	public Map<String, Object> selectBoardReportDetail(int bm_no) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		Map<String, Object> pmap = sqlSessionTemplate.selectOne("boardReportDetail", bm_no);
		
		return pmap;
	}
}
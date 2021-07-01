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
	
 // 회원 탈퇴하기(mem_active를 T에서 F로)
	public int outMember(Map<String, Object> pmap) {
		logger.info("outMember 메소드 호출");
		
		int result = sqlSessionTemplate.delete("outMem", pmap);
		
		return result;
	}

 // (회원, 게시글)신고횟수 초기화 시키기
	public int initReportNumber(Map<String, Object> pmap) {
		logger.info("initReportNumber 메소드 호출");
		
		int result = sqlSessionTemplate.update("initNumber", pmap);
		
		return result;
	}
	
 // 회원 검색
	public List<Map<String, Object>> selectMemberBySearch(Map<String, Object> pmap) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		sqlSessionTemplate.selectList("proc_member_all_select", pmap); // 프로시저
		logger.info("pmap ====> " + pmap);
		
		return (List<Map<String, Object>>)pmap.get("p_temp"); // 결과 값만 보냄
	}	
	

 // 게시글 검색
	public List<Map<String, Object>> selectBoardBySearch(Map<String, Object> pmap) {
		logger.info("selectBoardBySearch 메소드 호출");
		
		sqlSessionTemplate.selectList("proc_board_all_select", pmap); // 프로시저
		logger.info("pmap ====> " + pmap);
		
		return (List<Map<String, Object>>)pmap.get("p_temp"); // 결과 값만 보냄
	}
	
 // 신고된 회원 상세보기
	public Map<String, Object> selectMemberReportDetail(String report_msg) {
		logger.info("selectMemberReportDetail 메소드 호출");
		
		Map<String, Object> pmap = sqlSessionTemplate.selectOne("memberReportDetail", report_msg);
		 
		return pmap;
	}

 // 신고된 게시글 상세보기
	public Map<String, Object> selectBoardReportDetail(String report_msg) {
		logger.info("selectBoardReportDetail 메소드 호출");
		
		Map<String, Object> pmap = sqlSessionTemplate.selectOne("boardReportDetail", report_msg);
		
		return pmap;
	}
}
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
	public List<Map<String, Object>> selectMemberBySearch(String nick_email_type, String pr_search) {
		logger.info("selectMemberBySearch 메소드 호출");
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		List<Map<String, Object>> p_temp = new ArrayList<Map<String,Object>>();
		rmap.put("nick_email_type", nick_email_type); // 이메일, 닉네임, 전체인지 받아옴
		rmap.put("pr_search", pr_search); // 검색 단어 받아옴
		rmap.put("p_temp", p_temp); // ref 커서 담음
		sqlSessionTemplate.selectList("proc_member_all_select", rmap);
		
		return (List<Map<String, Object>>) rmap.get("p_temp");
	}	
	

 // 게시글 검색
	public List<Map<String, Object>> selectBoardBySearch(Map<String, Object> pmap) {
		logger.info("selectBoardBySearch 메소드 호출");
		
//		Map<String, Object> rmap = new HashMap<String, Object>();
//		List<Map<String, Object>> p_temp = new ArrayList<Map<String,Object>>();
//		Map<String, Object> p_temp = new HashMap<>();
//		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
//		rmap.put("nick_title_type", nick_title_type);
//		rmap.put("pr_search", pr_search);
//		rmap.put("p_temp", p_temp); // ref커서 담음
		sqlSessionTemplate.selectList("proc_board_all_select", pmap); // 프로시저
//		logger.info("rmap =====> " + rmap);
		logger.info("pmap ====> "+pmap);
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
package member.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MemberDao {

	// MyBatis에서 제공하는 클래스. 스프링에 의해 객체주입을 받기 위해, 선언만 해둠.
	private SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public Map<String, Object> selectOneBySession(String sessionValue) {
		logger.info("selectOneBySession 메소드 호출 완료");
		Map<String, Object> rmap = null;
		rmap = sqlSessionTemplate.selectOne("selectOneBySession", sessionValue);
		return rmap;
	}
//	public int saveId(Map<String, Object> pmap) {
//		int result = 0;
//		// Update or Insert To Session (Table) ================================= [[ 프로시저1 ]]
//		result = sqlSessionTemplate.selectOne("uiToSession", pmap);
//		return result;
//	}
//	public int setAutoLogin(Map<String, Object> pmap) {
//		int result = 0;
//		// Update or Insert To Session (Table) ================================= [[ 프로시저1 ]]
//		result = sqlSessionTemplate.selectOne("uiToSession", pmap);
//		return result;
//	}

	public List<Map<String, Object>> selectMemberList() {
		List<Map<String, Object>> memberList = new ArrayList<Map<String,Object>>();
		memberList = sqlSessionTemplate.selectList("selectMemberList");
		return memberList;
	}

	public int updateMember(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.update("updateMember", pmap);
		return result;
	}
	
 // 프로필 사진 바꾸기
	public int updateImg(Map<String, Object> pmap) {
		logger.info("updateImg 메소드 호출");
			
		int result = sqlSessionTemplate.update("upImg", pmap);
			
		return result;
	}

	public int updatePw(Map<String, Object> pmap) {
		int result = 0;
		// updatePw라는 프로시저를 실행함.
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		// 프로시저 호출 시에는 seleceOne 쓰든 selectList 쓰든 심지어는 update, delete 쓰든 상관 없는 것 같다.. -ㅁ-;
		sqlSessionTemplate.selectOne("updatePw", pmap);
		logger.info(pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		logger.info(result);
		return result;
	}







	public int updateActive(Map<String, Object> pmap) {
		int result = 0;
		// updatePw라는 프로시저를 실행함.
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		sqlSessionTemplate.update("updateActive", pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		return result;
	}







	public int withdraw(Map<String, Object> pmap) {
		int result = 0;
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		sqlSessionTemplate.update("withdraw", pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		return result;
	}







	public Map<String, Object> selectMember(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = sqlSessionTemplate.selectOne("selectMember", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}
	public int uiToSession(Map<String, Object> pmap) {
		int result = 0;
		sqlSessionTemplate.selectOne("uiToSession", pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		logger.info("result ====> "+result);
		return result;
	}







	public Map<String, Object> selectEmail(Map<String, Object> pmap) {
		return sqlSessionTemplate.selectOne("selectEmail",pmap);
	}
	public Map<String, Object> selectNickName(Map<String, Object> pmap) {
		return sqlSessionTemplate.selectOne("selectNickName",pmap);
	}







	public int selectIsMemberPw(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.selectOne("selectIsMemberPw", pmap);
		return result;
	}
	public int selectIsMember(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.selectOne("selectIsMember", pmap);
		return result;
	}







	public int insertMember(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.insert("insertMember", pmap);
		return result;
	}







	public Map<String, Object> selectMemberAdmin(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = sqlSessionTemplate.selectOne("selectMemberAdmin", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}

}

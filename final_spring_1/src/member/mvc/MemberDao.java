package member.mvc;

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
		Map<String, Object> rmap = null;
		rmap = sqlSessionTemplate.selectOne("selectOneBySession", sessionValue);
		return rmap;
	}
	public int saveId(Map<String, Object> pmap) {
		int result = 0;
		// Update or Insert To Session (Table) ================================= [[ 프로시저1 ]]
		result = sqlSessionTemplate.selectOne("uiToSession", pmap);
		return result;
	}
	public int setAutoLogin(Map<String, Object> pmap) {
		int result = 0;
		// Update or Insert To Session (Table) ================================= [[ 프로시저1 ]]
		result = sqlSessionTemplate.selectOne("uiToSession", pmap);
		return result;
	}






 // 프로필 사진 바꾸기
	public int updateImg(Map<String, Object> pmap) {
		logger.info("updateImg 메소드 호출");
		
		int result = sqlSessionTemplate.update("upImg", pmap);
		
		return result;
	}

}

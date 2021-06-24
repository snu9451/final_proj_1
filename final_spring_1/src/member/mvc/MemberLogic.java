package member.mvc;

import java.util.Map;

import org.apache.log4j.Logger;

public class MemberLogic {

	private MemberDao memberDao = null;
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	
	
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}


	public String selectMemberInfo(Map<String, Object> pmap) {
		return null;
	}



	public Map<String, Object> selectOneBySessionKey(String sessionKey) {
		Map<String, Object> rmap = null;
		rmap = memberDao.selectOneBySessionKey(sessionKey);
		return rmap;
	}
/* ===========================================================================
	아 이 디   저 장   또 는   자 동 로 그 인   구 현 - NDS_SKEY 발급 또는 만료일 갱신
=========================================================================== */ 
	public int saveId(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.saveId(pmap);
		return result;
	}
	public int setAutoLogin(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.setAutoLogin(pmap);
		return result;
	}
	
}

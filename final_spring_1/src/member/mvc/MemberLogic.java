package member.mvc;

import java.util.Map;

import org.apache.log4j.Logger;

public class MemberLogic {

	private MemberDao memberDao = null;
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	
	
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}





	public Map<String, Object> selectOneBySessionKey(String sessionKey) {
		Map<String, Object> rmap = null;
		rmap = memberDao.selectOneBySessionKey(sessionKey);
		return rmap;
	}
	
}

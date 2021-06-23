package member.mvc;

import org.apache.log4j.Logger;

public class MemberLogic {

	private MemberDao memberDao = null;
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	
	
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
}

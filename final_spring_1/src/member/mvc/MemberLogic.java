package member.mvc;

import java.util.ArrayList;
import java.util.Map;
import java.util.Random;

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



	public Map<String, Object> selectOneBySession(String sessionValue) {
		Map<String, Object> rmap = null;
		rmap = memberDao.selectOneBySession(sessionValue);
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


	public int selectIsMember(String inputEmail) {
		// TODO Auto-generated method stub
		return 0;
	}


	public String getRandomCode(int length) {
		String randomCode = null;
		ArrayList<String> result = new ArrayList<String>();
		String[] eng =  {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		String[] eng2 = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		Random r = new Random();
		for(int j=0; j<length; j++) {
			int which = r.nextInt(3);
			// 숫자
			if(which == 0) {
				// 0부터 9까지 중 랜덤한 숫자를 가져와줘.
				int s = r.nextInt(10);
				result.add(String.valueOf(s));
			}
			// 영어 대문자
			else if(which == 1) {
				// 대문자 배열 중 몇번째 방의 문자를 가져올거니?
				int i = r.nextInt(26);
				result.add(eng[i]);
			}
			// 영어 소문자
			else if(which == 2) {
				// 소문자 배열 중 몇번째 방의 문자를 가져올거니?
				int k = r.nextInt(26);
				result.add(eng2[k]);
			}
		}
		StringBuilder sb = new StringBuilder();
		for(int index=0; index<length; index++) {
			sb.append(result.get(index));
		}
		randomCode = sb.toString();
		return randomCode;
	}




	
}

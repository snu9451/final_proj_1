package etc.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


public class EtcLogic {
	Logger logger = Logger.getLogger(EtcLogic.class);
	
	private EtcDao etcDao = null;

	public void setEtcDao(EtcDao etcDao) {
		this.etcDao = etcDao;
	}

 // 카테고리 불러오기
	public List<String> selectCategory() {
		logger.info("selectCategory 메소드 호출");
		
		List<String> plist = new ArrayList<String>();
		plist = etcDao.selectCategory();
		return plist;
	}
	
 // 검색어 자동완성(검색횟수(누적검색수 기준)가 10번이상인 것 중에서 상위 10개만)
	public List<Map<String, Object>> selectAutocompleteList(Map<String, Object> pmap) {
		logger.info("selectAutocompleteList 메소드 호출");
		
		List<Map<String, Object>> keyword = new ArrayList<Map<String,Object>>();
		keyword = etcDao.selectAutocompleteList(pmap);
		
		return keyword;
	}

}
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
	public List<String> selectCategory(Map<String, Object> pmap) {
		logger.info("selectCategory 메소드 호출");
		
		List<String> plist = new ArrayList<String>();
		plist = etcDao.selectCategory(pmap);
		return plist;
	}

}
package errand.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ErrandLogic {
   Logger logger = Logger.getLogger(ErrandLogic.class);
   private ErrandDao errandDao = null;
   public void setErrandDao(ErrandDao errandDao) {
      this.errandDao = errandDao;
   }
   public List<Map<String, Object>> selectErrandRecord(Map<String, Object> pmap) {
      logger.info("logic : selectErrandRecord 호출 성공");
      List<Map<String,Object>> errandRecord = null;
      errandRecord = errandDao.selectErrandRecord(pmap);
      return errandRecord;
   }
   /* /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ */
	public Map<String, Object> getErrand(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = errandDao.getErrand(pmap);
		logger.info(rmap);
		return rmap;
	}
	public int insertErrand(Map<String, Object> pmap) {
		int result = 0;
		result = errandDao.insertErrand(pmap);
		return 0;
	}
						/* 확인했으면 주석을 지우셔도 됩니다. */
	/* \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ */
}
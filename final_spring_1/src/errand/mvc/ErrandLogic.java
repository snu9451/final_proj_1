package errand.mvc;

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
   
   public void errandRecordUpdate(Map<String, Object> pmap) {
	   logger.info("logic : errandRecordUpdate 호출 성공");
	   errandDao.errandRecordUpdate(pmap);
   }
}
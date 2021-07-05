package errand.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ErrandDao {
   private SqlSessionTemplate sqlSessionTemplate = null;
   Logger logger = Logger.getLogger(ErrandDao.class);
   
   public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
      this.sqlSessionTemplate = sqlSessionTemplate;
   }
   
   public List<Map<String, Object>> selectErrandRecord(Map<String, Object> pmap){
      logger.info("dao : selectErrandRecord 호출 성공");
      List<Map<String, Object>> errandRecord = null;
      errandRecord = sqlSessionTemplate.selectList("selectErrand", pmap);
      return errandRecord;
   }
   
   public void errandRecordUpdate(Map<String, Object> pmap){
	   logger.info("dao : errandRecordUpdate 호출 성공");
	   sqlSessionTemplate.update("errandRecordUpdate", pmap);
   }
}
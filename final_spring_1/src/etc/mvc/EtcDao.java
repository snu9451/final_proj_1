package etc.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class EtcDao {
	Logger logger = Logger.getLogger(EtcDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

 // 카테고리 불러오기
	public List<String> selectCategory(Map<String, Object> pmap) {
		logger.info("selectCategory 메소드 호출");
		
		List<String> plist = new ArrayList<String>();
		plist = sqlSessionTemplate.selectList("selectcate");
		
		return plist;
	}
}
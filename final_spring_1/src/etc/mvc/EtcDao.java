package etc.mvc;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class EtcDao {
	Logger logger = Logger.getLogger(EtcDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
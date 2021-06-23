package item.mvc;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ItemDao {

	// MyBatis에서 제공하는 클래스. 스프링에 의해 객체주입을 받기 위해, 선언만 해둠.
	private SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	
	
	
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
}

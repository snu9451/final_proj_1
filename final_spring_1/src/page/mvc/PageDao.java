package page.mvc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class PageDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
		
	public List<String> selectCategory() {
		List<String> category = null;
		category = sqlSessionTemplate.selectList("selectCategory");
		return category;
		
	}
}

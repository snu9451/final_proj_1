package page.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class PageLogic {
	private PageDao pageDao = null;
	Logger logger = Logger.getLogger(PageLogic.class);
	
	public Map<String,List<Map<String, Object>>> getMyPage (String memEmail) {
		
		return;
	}
	
	
	public Map<String,List<Map<String, Object>>> getMemberPage (String memNickName) {
		
		return;
	}
	
	
	public Map<String,List<Map<String, Object>>> getAdminPage (String memEmail) {
		
		return;
	}
	
	public List<String> selectCategory(){
		List<String> category = null;
		
		return category;
	}
	
	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}
	
}

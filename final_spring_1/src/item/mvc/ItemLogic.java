package item.mvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ItemLogic {

	private ItemDao itemDao = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	public List<Map<String, Object>> selectItemList(String gubun){
		List<Map<String, Object>> a = new ArrayList<>();
		return a;
		
	}
	
}

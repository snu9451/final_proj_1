package item.mvc;

import org.apache.log4j.Logger;

public class ItemLogic {

	private ItemDao itemDao = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	
	
	
	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
}

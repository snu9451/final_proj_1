package item.mvc;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class ItemController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private ItemLogic itemLogic = null;
	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(ItemController.class);
	
	
	
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setItemLogic(ItemLogic itemLogic) {
		this.itemLogic = itemLogic;
	}
	
}

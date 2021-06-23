package page.mvc;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import test.mvc.TestController;
import test.mvc.TestLogic;

public class PageController extends MultiActionController {
	
	public ModelAndView page(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		Logger logger = Logger.getLogger(PageController.class);
		
//	TestLogic testLogic = null;

	
	
	logger.info("화면 뜨나?");
	req.setAttribute("showModal", "yes");
	ModelAndView mav = new ModelAndView();
	mav.setViewName("page/page_index");
	return mav;
}
}

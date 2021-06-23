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
	private PageLogic pageLogic = null;
	Logger logger = Logger.getLogger(PageController.class);

	//===============================[[]]===============================
	public ModelAndView getMyPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		return mav;
}
	//===============================[[]]===============================
	public ModelAndView getMainPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		return mav;
	}
	//===============================[[]]===============================
	public ModelAndView getItemInsertPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		return mav;
	}
	//===============================[[]]===============================
	public ModelAndView getMemberPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		return mav;
	}
	//===============================[[]]===============================
	public ModelAndView getAdminPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		return mav;
	}
	
	public void setPageLogic(PageLogic pageLogic) {
		this.pageLogic = pageLogic;
	}
	
	
}

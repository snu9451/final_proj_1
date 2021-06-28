package etc.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class EtcController extends MultiActionController {
	Logger logger = Logger.getLogger(EtcController.class); // 로그 출력
	
 // 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠
	private EtcLogic etcLogic = null;
	
 // setter 객체 주입법으로 객체 주입 받음
	public void setEtcLogic(EtcLogic etcLogic) {
		this.etcLogic = etcLogic;
	}

 // 카테고리 선택
	public void selectCategory(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectCategory 메소드 호출");
		
	}
	
 // 검색어 자동완성
	public void selectAutocompleteList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectAutocompleteList 메소드 호출");
		
	}
	
 // 검색 순위
	public void selectWordList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectWordList 메소드 호출");
		
	}
}
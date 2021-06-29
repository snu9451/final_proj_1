package etc.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import nds.util.HashMapBinder;

public class EtcController extends MultiActionController {
	Logger logger = Logger.getLogger(EtcController.class); // 로그 출력
	
 // 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠
	private EtcLogic etcLogic = null;
	
 // setter 객체 주입법으로 객체 주입 받음
	public void setEtcLogic(EtcLogic etcLogic) {
		this.etcLogic = etcLogic;
	}

 // 카테고리 불러오기
	public void selectCategory(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectCategory 메소드 호출");
		
		List<String> plist = new ArrayList<>();
		plist = etcLogic.selectCategory();
		
	//	logger.info(plist);// > 테스트
	}
	
 // 검색어 자동완성(검색횟수(누적검색수 기준)가 10번이상인 것 중에서 상위 10개만)
	public void selectAutocompleteList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectAutocompleteList 메소드 호출");
		
		HashMapBinder hmb = new HashMapBinder();
		Map<String, Object> pmap = new HashMap<String, Object>();
		hmb.bind(pmap); // 입력한 검색단어를 담음
		
// 테스트		
//		Map<String, Object> pmap = new HashMap<String, Object>();
//	  	pmap.put("keyword", "필"); 
		
		List<Map<String, Object>> keyword = new ArrayList<Map<String,Object>>();
	  	keyword = etcLogic.selectAutocompleteList(pmap);
	  	
//		logger.info("처리결과 =====> " + keyword); // [{KEYWORD=필름}, {KEYWORD=필기구}]
	}
	
 // 검색 순위
	public void selectWordList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectWordList 메소드 호출");
		
	}
}
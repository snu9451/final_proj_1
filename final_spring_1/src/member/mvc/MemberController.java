package member.mvc;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class MemberController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private MemberLogic memberLogic = null;
	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(MemberController.class);
	
	// ===================================== [[ SELECT ]] =====================================
	public void selectNickName(HttpServletRequest req, HttpServletResponse res)	{
		logger.info("selectNickName 메소드 호출 성공!");
	}
	public void selectEmail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectEmail 메소드 호출 성공!");
		
	}
	
	// ===================================== [[ INSERT ]] =====================================
	
	
	// ===================================== [[ UPDATE ]] =====================================
	public void updateNickName(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updateNickName 메소드 호출 성공!");
		
	}
	public void updateImg(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updateImg 메소드 호출 성공!");
		
	}
	public void updatePw(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updatePw 메소드 호출 성공!");
		
	}
	public void updateDeposit(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updateDeposit 메소드 호출 성공!");
		
	}
	
	
	// ===================================== [[ DELETE ]] =====================================
	
	
	// ======================================= [[ 그 외 ]] =======================================
	public void issueTempPw(HttpServletRequest req, HttpServletResponse res) {
		logger.info("issueTempPw 메소드 호출 성공!");
		
	}
	public ModelAndView reqLoginView(HttpServletRequest req, HttpServletResponse res) {
		logger.info("reqLoginView 메소드 호출 성공!");
		ModelAndView mav = new ModelAndView();
//		req.getSession().setAttribute("login", "로그인중");
		// 로그인 화면으로 보내기 전, 세션키가 있는 사용자라면 저장된 유효한 아이디가 있는지 체크한다.
		Cookie[] cookies = req.getCookies();
		// NDS_SKEY라는 키를 갖는 쿠키가 있니?
		for(int i=0; i<cookies.length; i++) {
			if("NDS_SKEY".equals(cookies[i].getName())){ // NDS_SKEY: 내동생에서 사용자 브라우저 쿠키에 저장하는 세션키(세션아이디)
				// 해당 세션키를 변수에 담고
				String sessionKey = cookies[i].getValue();
				// 그 세션키의 [아이디 저장] 기능이 유효(valid)한지를 확인하고
				// 또 유효하다면 로그인창에 아이디를 띄워주기 위해, DB에서 세션키로 해당하는 정보를 가져온다.
				Map<String, Object> rmap = new HashMap<>();
				rmap = memberLogic.selectOneBySessionKey(sessionKey);
				// sid_expired는 DB에서 미리 비교 후 valid/expired로 반환해서 가져오자. - 프로시저//////////////////////////////////////////////
				// 아이디 저장이 유효하다면(즉, 만료되지 않았다면)
				if("valid".equals((String)rmap.get("sid_expired"))) {
					// 아이디를 로그인창에 띄워줄 수 있도록 request 객체에 담아준다.
					String mem_email = (String)rmap.get("mem_email");
					req.setAttribute("mem_email", mem_email);
				}
			}
		}
//		logger.info(req.getSession().getAttribute("login"));
		mav.setViewName("mainpage/mainpage");
		return mav;
	}
	// 로그인 버튼이 클릭되었을 때 실행되는 메소드//////////////////////////////////////////////이 메소드부터 이어서 작성
	public void doLogin(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String isAutoLoginChecked = null;
		String isSavedIdChecked = null;
		//////////////////////////////////////////////공통코드 작성해야 함- req에 담긴 정보를 Map에 옮겨줄 공통코드
		// 입력된 사용자의 정보를 가지고 DB에서 조회한다.
		// insert here
		// 로그인 성공 시
		if(memberLogic.selectMemberInfo() == 1) {
			// 아이디 저장에 체크했다면 - isSavedIdChecked(프론트에서 담아줘야 함) == true
			if("true".equals(isSavedIdChecked)) {
				// insert here - 세션키 만료일 갱신 또는 session 테이블에 insert (auth_range = S)
			}
			// 자동로그인에 체크했다면 - isAutoLoginChecked(프론트에서 담아줘야 함) == true
			if("true".equals(isAutoLoginChecked)) {
				// insert here - 세션키 만료일 갱신 또는 session 테이블에 insert (auth_range = A)
			}
			// 로그인 성공시 공통적으로 처리해 줄 사항; 세션에 이메일 아이디 담아주기.
			// insert here - request 객체에서 입력된 mem_email 꺼내서 mem_eamil 변수에 담기
			session.setAttribute("login", mem_email);
		// 로그인 실패 시 "아이디 또는 비번 틀림" 또는 "없는 사용자" 메세지 띄워주어야 함. 
		} else if(memberLogic.selectMemberInfo() == 0) {
			// insert here - AJAX 데이터 전송
		}
	}
	public void withdraw(HttpServletRequest req, HttpServletResponse res) {
		logger.info("withdraw 메소드 호출 성공!");
	}
	
	
	
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}
	
}

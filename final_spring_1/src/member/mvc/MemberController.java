package member.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.util.AjaxDataPrinter;
import com.util.HashMapBinder;

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
	public void reqLoginView(HttpServletRequest req, HttpServletResponse res) {
//	public ModelAndView reqLoginView(HttpServletRequest req, HttpServletResponse res) {
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
				// NDS_SKEY가 있더라도 기간이 만료되었으면 rmap = null이 된다.
				if(rmap != null) {
					// 권한 허용 범위가 S(SaveID)인 경우
					if("S".equals((String)rmap.get("sid_expired"))) {
						// 아이디를 로그인창에 띄워줄 수 있도록 request 객체에 담아준다.
						String mem_email = (String)rmap.get("mem_email");
						req.setAttribute("mem_email", mem_email);
					}
				} else {
					logger.info("유효하지 않은 세션키입니다.");
				}
			}
		}
		Gson g = new Gson();
		String jo = g.toJson("[{\"name\":\"은영\"}]");
		AjaxDataPrinter.out(res, "application/json", jo);
//		logger.info(req.getSession().getAttribute("login"));
		// mainpage.jsp로 이동해서 Front에서 처리해주면 됨. (mem_email이 req에 있으면 이메일을 화면에 띄워주기) 
//		mav.setViewName("mainpage/mainpage");
//		return mav;
	}
	// 로그인 버튼이 클릭되었을 때 실행되는 메소드
	public void doLogin(HttpServletRequest req, HttpServletResponse res) {
		// 사용자가 자동로그인 체크박스와 아이디저장 체크박스에 체크 했는지 여부를 담을 변수 선언
		String isAutoLoginChecked = null;
		String isSavedIdChecked = null;
		// req에 담긴 정보(input_email, input_pw)를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = null;
		HashMapBinder hmb = new HashMapBinder(req);
		// pmap의 원본을 파라미터로 넘기고 있기 때문에 리턴으로 받아서 담지 않아도 map에 옮겨진다.
		hmb.bindPost(pmap);	// pmap에 담긴 정보: input_email, input_pw
		// 입력된 사용자의 정보를 가지고 DB에서 조회한다.
		// resultMsg ===> "존재하지 앟는 아이디입니다." | "잘못된 비밀번호입니다." | mem_nickname
		String resultMsg = memberLogic.selectMemberInfo(pmap);
		// 로그인 실패 시 "존재하지 앟는 아이디입니다." 또는 "잘못된 비밀번호입니다." 메세지 띄워주어야 함.
		if("존재하지 않는 아이디입니다.".equals(resultMsg) || "잘못된 비밀번호입니다.".equals(resultMsg)) {
			// resultMsg를 전송 (AJAX)
			req.setAttribute("loginResult", resultMsg);
		}
		else {	// 로그인 성공 시(해당 email과 pw로 조회한 결과가 row 하나인 경우) - resultMsg: 사용자 닉네임
			// 아이디 저장에 체크했다면 - isSavedIdChecked(프론트에서 담아줘야 함) == true
			isSavedIdChecked = (String)pmap.get("isSavedIdChecked");
			if("true".equals(isSavedIdChecked)) {
				// 세션키 만료일 갱신 또는 session 테이블에 insert (auth_range = S)
				// 해당 이메일로 session 테이블에서 조회한 결과가 1이면 update, 0이면 insert ================================= [[ 프로시저1 ]]
				int result = memberLogic.saveId(pmap);
				logger.info("[1:success/0:fail]아이디 저장 처리 결과 ===> "+result);
			}
			// 자동로그인에 체크했다면 - isAutoLoginChecked(프론트에서 담아줘야 함) == true
			isAutoLoginChecked = (String)pmap.get("isAutoLoginChecked");
			if("true".equals(isAutoLoginChecked)) {
				// 세션키 만료일 갱신 또는 session 테이블에 insert (auth_range = A)
				// 해당 이메일로 session 테이블에서 조회한 결과가 1이면 update, 0이면 insert ================================= [[ 프로시저1 ]]
				int result = memberLogic.setAutoLogin(pmap);
				logger.info("[1:success/0:fail]자동로그인 처리 결과 ===> "+result);
			}
			// 로그인 성공시 공통적으로 처리해 줄 사항; 세션에 이메일 아이디 담아주기.
			// Front에서는 session에 login이 있는지를 체크함으로써 로그인 성공여부를 판단할 수 있음.
			String mem_email = (String)pmap.get("mem_email");
			HttpSession session = req.getSession();
			session.setAttribute("login", mem_email);
		}
	}
	
	public void withdraw(HttpServletRequest req, HttpServletResponse res) {
		logger.info("withdraw 메소드 호출 성공!");
	}
	
	
	
	
	
	
	
	
	
	
	// =================================================== [[ 테스트용 url ]] ===================================================
	public ModelAndView membertest(HttpServletRequest req, HttpServletResponse res) {
		logger.info("membertest 메소드 호출 성공!");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/membertest");	// /WEB-INF/views/xxx.jsp
		return mav;
	}
	public void ajaxHtml(HttpServletRequest req, HttpServletResponse res) {
		logger.info("ajaxHtml 메소드 호출 성공!");
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/member/ajaxHtml.jsp");
		try {
			rd.forward(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// =======================================================================================================================
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}
	
}

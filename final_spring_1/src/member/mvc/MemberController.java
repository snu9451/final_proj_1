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

import nds.util.AjaxDataPrinter;
import nds.util.CookiesMap;
import nds.util.HashMapBinder;
import nds.util.Mail;

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
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);	// 회원의 이메일 정보가 담겨있다.
		String inputEmail = (String)pmap.get("mem_email");
		// 입력 받은 이메일이 존재하는 이메일이면 1, 존재하지 않으면 0 - SELECT COUNT ...
//		int result = memberLogic.selectIsMember(inputEmail);
		int result = 1; // 테스트
		// 존재한다면 입력 받은 이메일로 임시비번 전송
		if(result == 1) {
			memberLogic = new MemberLogic();
			String tempPw = memberLogic.getRandomCode(10);
			Mail mail = new Mail();
			mail.setReceiveEmail(inputEmail+"@naver.com","[내동생] 임시 비밀번호 발급","임시비밀번호는 <b>"+tempPw+"</b>입니다.");	// 테스트
//			mail.setReceiveEmail(inputEmail);
			mail.sendEmail();
			// 성공하였음을 Front에 알림(AJAX)
			AjaxDataPrinter.out(res, 1);
		}
		// 존재하지 않는 이메일이라면
		else if(result == 0) {
			logger.info("존재하지 않는 이메일이 입력되었음");
			// (존재하지 않는 이메일이라) 실패하였음을 Front에 알림(AJAX)
			AjaxDataPrinter.out(res, 0);
		}
		
		// 비밀번호 저장해야 함////////////////////////////////////////
		
		
	}
	public void reqLoginView(HttpServletRequest req, HttpServletResponse res) {
//	public ModelAndView reqLoginView(HttpServletRequest req, HttpServletResponse res) {
		logger.info("reqLoginView 메소드 호출 성공!");
//		ModelAndView mav = new ModelAndView();
//		req.getSession().setAttribute("login", "로그인중");
		// 로그인 화면으로 보내기 전, 세션키가 있는 사용자라면 저장된 유효한 아이디가 있는지 체크한다.
		// NDS_SKEY라는 키를 갖는 쿠키가 있니?
		String sessionKey = "NDS_SKEY";
		CookiesMap cookies = new CookiesMap(req);	// nds.util 패키지에 만들어 둔 공통코드입니다.
		if(cookies.hasName(sessionKey)) {	// NDS_SKEY: 내동생에서 사용자 브라우저 쿠키에 저장하는 세션키(세션아이디)
			// 해당 세션키를 변수에 담고
			String sessionValue = cookies.getValue(sessionKey);
			// 그 세션키의 [아이디 저장] 기능이 유효(valid)한지를 확인하고
			// 또 유효하다면 로그인창에 아이디를 띄워주기 위해, DB에서 세션키로 해당하는 정보를 가져온다.
			Map<String, Object> rmap = new HashMap<>();
			rmap = memberLogic.selectOneBySession(sessionValue);
			// NDS_SKEY가 있더라도 기간이 만료되었으면 rmap = null이 된다.
			if(rmap != null) {
				// 권한 허용 범위가 S(SaveID)인 경우
				if("S".equals((String)rmap.get("sid_expired"))) {
					// 아이디를 로그인창에 띄워줄 수 있도록 request 객체에 담아준다.
					String mem_email = (String)rmap.get("mem_email");
					req.setAttribute("mem_email", mem_email);
				}
			} else {
				logger.info("유효하지 않은 sessionValue입니다.");
			}
		}
		Gson g = new Gson();
		String jo = g.toJson("[{\"name\":\"은영\"}]");
		AjaxDataPrinter.out(res, "application/json", jo);	// nds.util 패키지에 만들어 둔 공통코드입니다.
//		logger.info(req.getSession().getAttribute("login"));
		// mainpage.jsp로 이동해서 Front에서 처리해주면 됨. (mem_email이 req에 있으면 이메일을 화면에 띄워주기) 
//		mav.setViewName("mainpage/mainpage");
//		return mav;
	}
	// 로그인 버튼이 클릭되었을 때 실행되는 메소드
	public void doLogin(HttpServletRequest req, HttpServletResponse res) {
		memberLogic = new MemberLogic();/////////////////////////////////////////////////////////////////////////////////////////////////////////

		// 사용자가 자동로그인 체크박스와 아이디저장 체크박스에 체크 했는지 여부를 담을 변수 선언
		String isAutoLoginChecked = null;
		String isSavedIdChecked = null;

		String sessionKey = "NDS_SKEY";
		CookiesMap cookies = new CookiesMap(req);
		
		// req에 담긴 정보(input_email, input_pw)를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		// pmap의 원본을 파라미터로 넘기고 있기 때문에 리턴으로 받아서 담지 않아도 map에 옮겨진다.
		hmb.bindPost(pmap);	// pmap에 담긴 정보: input_email, input_pw
		// 입력된 사용자의 정보를 가지고 DB에서 조회한다.
		// resultMsg ===> "존재하지 앟는 아이디입니다." | "잘못된 비밀번호입니다." | mem_nickname
		String resultMsg = memberLogic.selectMemberInfo(pmap);
		// 로그인 실패 시 "존재하지 앟는 아이디입니다." 또는 "잘못된 비밀번호입니다." 메세지 띄워주어야 함.
		if("존재하지 않는 아이디입니다.".equals(resultMsg) || "잘못된 비밀번호입니다.".equals(resultMsg)) {
			// resultMsg를 전송 (AJAX)
			AjaxDataPrinter.out(res, resultMsg);
		}
		// 로그인 성공 시(해당 email과 pw로 조회한 결과가 row 하나인 경우) - resultMsg: 사용자 닉네임
		else {
			// 아이디 저장에 체크했다면 - isSavedIdChecked(프론트에서 담아줘야 함) == true
			isSavedIdChecked = (String)pmap.get("isSavedIdChecked");
			if("true".equals(isSavedIdChecked)) {
				Cookie cookie = cookies.getCookie(sessionKey);
				String sessionValue = cookies.getValue(sessionKey);
				// 쿠키에 NDS_SKEY가 있는 경우라면
				if(sessionValue!=null) {
					// [DB]에서 이메일과 sessionValue에 해당하는 로우의 유효기간을 갱신하고, 권한을 S로 설정한다. (update)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					int result = memberLogic.saveId(pmap);
					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 있는 경우::아이디 저장 처리 결과 ===> "+result);
					if(result == 1) { // 처리 결과가 성공이라면
						// 쿠키의 유효기간을 갱신한다.
						cookie.setMaxAge(60*60*24*30);
						logger.info("NDS_SKEY값::"+sessionValue);
					}
				}

				// 쿠키에 NDS_SKEY가 없는 경우라면
				else {
					// NDS_SKEY를 발급하고, [DB]에 insert한 후, 쿠키에 저장해주어야 한다.
					sessionValue = memberLogic.getRandomCode(20);	// 20자리의 랜덤코드 생성
					// 이메일과 sessionValue에 해당하는 로우를 insert한다. 권한은 S로 설정한다. (insert)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					int result = memberLogic.saveId(pmap);
					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 없는 경우::아이디 저장 처리 결과 ===> "+result);
					if(result == 1) {
						Cookie cookie_ = new Cookie(sessionKey, sessionValue);
						cookie.setMaxAge(60*60*24*30); 	// 초 단위 (한달)
						res.addCookie(cookie_);
						logger.info("NDS_SKEY값::"+sessionValue);
					}
				}
			}
			// 자동로그인에 체크했다면 - isAutoLoginChecked(프론트에서 담아줘야 함) == true
			isAutoLoginChecked = (String)pmap.get("isAutoLoginChecked");
			if("true".equals(isAutoLoginChecked)) {
				Cookie cookie = cookies.getCookie(sessionKey);
				String sessionValue = cookies.getValue(sessionKey);
				// 쿠키에 NDS_SKEY가 있는 경우라면
				if(sessionValue!=null) {
					// [DB]에서 이메일과 sessionValue에 해당하는 로우의 유효기간을 갱신하고, 권한을 S로 설정한다. (update)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					int result = memberLogic.setAutoLogin(pmap);
					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 있는 경우::자동 로그인 처리 결과 ===> "+result);
					if(result == 1) { // 처리 결과가 성공이라면
						// 쿠키의 유효기간을 갱신한다.
						cookie.setMaxAge(60*60*24*30);
						logger.info("NDS_SKEY값::"+sessionValue);
					}
				}
				
				// 쿠키에 NDS_SKEY가 없는 경우라면
				else {
					// NDS_SKEY를 발급하고, [DB]에 insert한 후, 쿠키에 저장해주어야 한다.
					sessionValue = memberLogic.getRandomCode(20);	// 20자리의 랜덤코드 생성
					// 이메일과 sessionValue에 해당하는 로우를 insert한다. 권한은 S로 설정한다. (insert)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					int result = memberLogic.setAutoLogin(pmap);
					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 없는 경우::자동 로그인 처리 결과 ===> "+result);
					if(result == 1) {
						Cookie cookie_ = new Cookie(sessionKey, sessionValue);
						cookie.setMaxAge(60*60*24*30); 	// 초 단위 (한달)
						res.addCookie(cookie_);
						logger.info("NDS_SKEY값::"+sessionValue);
					}
				}
			}

			// 로그인 성공시 공통적으로 처리해 줄 사항; 세션에 사용자정보(MemberVO) 담아주기.
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
		// snedRedirect와 requestDispatcher.forward의 차이 테스트
//		try {
//			res.sendRedirect("/member/ajaxHtml.jsp");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	// =======================================================================================================================
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}
	
}

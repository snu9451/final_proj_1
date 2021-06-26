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
import nds.util.Converter;
import nds.util.CookiesMap;
import nds.util.HashMapBinder;
import nds.util.Mail;

public class MemberController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private MemberLogic memberLogic = null;
	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(MemberController.class);
	
	

	
	/*	=======================================================================================
								Ｍ　ｅ　ｔ　ｈ　ｏ　ｄ　　　Ａ　ｒ　ｅ　ａ
	======================================================================================== */
	// ===================================== [[ SELECT ]] =====================================
	// 닉네임 중복 검사
	public void selectNickName(HttpServletRequest req, HttpServletResponse res)	{
		logger.info("selectNickName 메소드 호출 성공!");
		// 해당 닉네임을 갖는 회원을 조회한다.
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		Map<String, Object> rmap = new HashMap<>();
		rmap = memberLogic.selectMember(pmap);
		logger.info("NickName으로 조회한 결과 ===> "+rmap);
		// 중복이 아닌 경우: 같은 닉네임을 갖는 회원이 없는 경우
		if(rmap == null) {
			AjaxDataPrinter.out(res, 0);
		}
		// 중복인 경우: 같은 닉네임을 갖는 회원이 있는 경우
		else {
			AjaxDataPrinter.out(res, 1);
		}
	}
	// 이메일 중복 검사
	public void selectEmail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectEmail 메소드 호출 성공!");
		// 해당 이메일을 갖는 회원을 조회한다.
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		Map<String, Object> rmap = new HashMap<>();
		rmap = memberLogic.selectMember(pmap);
		logger.info("Email로 조회한 결과 ===> "+rmap);
		// 중복이 아닌 경우: 같은 이메일을 갖는 회원이 없는 경우
		if(rmap == null) {
			AjaxDataPrinter.out(res, 0);
		}
		// 중복인 경우: 같은 이메일을 갖는 회원이 있는 경우
		else {
			AjaxDataPrinter.out(res, 1);
		}
	}
	// ===================================== [[ INSERT ]] =====================================
	
	
	// ===================================== [[ UPDATE ]] =====================================
	// 닉네임 변경 시
	public void updateNickName(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updateNickName 메소드 호출 성공!");
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> map = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(map);
		// 변경된 항목이 '닉네임'임을 알리는 구분자
		String gubun = "mem_nickname";
		int result = memberLogic.updateMember(gubun, map);
		logger.info("NickName 업데이트 결과 ===> "+result);
		// 닉네임 변경 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, 0);
		}
		// 닉네임 변경 성공 시
		else {
			AjaxDataPrinter.out(res, 1);
		}
	}
	// 프로필 사진 변경 시
	public void updateImg(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updateImg 메소드 호출 성공!");
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> map = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(map);
		// 변경된 항목이 '프로필 사진(img)'임을 알리는 구분자
		String gubun = "mem_img";
		int result = memberLogic.updateMember(gubun, map);
		logger.info("프로필 사진 업데이트 결과 ===> "+result);
		// 프로필 사진 변경 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, 0);
		}
		// 프로필 사진 변경 성공 시
		else {
			AjaxDataPrinter.out(res, 1);
		}
	}
	public void updatePw(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updatePw 메소드 호출 성공!");
		// 입력된 현재 비밀번호가 사용자의 이메일로 조회한 비밀번호와 일치하는지 확인하고 일치하는 경우에만 업데이트 처리 해주어야 함. ================================= [[ 프로시저2 ]]
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);	// 사용자의 이메일, 입력한 현재 비밀번호, 입력한 새 비밀번호가 담겨 있게 됨.
		// 프로시저 실행 결과를 받아줄 proc_result 항목 추가 - 반환받는 값의 타입이 NUMBER이므로 타입에 맞게  0을 넣어둔다.
		pmap.put("proc_result", 0);
		int result = memberLogic.updatePw(pmap);
		logger.info("비밀번호 업데이트 결과 ===> "+result);
		// 비밀번호 변경 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, 0);
		}
		// 비밀번호 변경 성공 시
		else if(result ==1) {
			AjaxDataPrinter.out(res, 1);
		}
	}
	// 회원 탈퇴 시
	public void leave(HttpServletRequest req, HttpServletResponse res) {
//		logger.info("leave 메소드 호출 성공!");
//		Map<String, Object> pmap = new HashMap<String, Object>();
//		// 프로시저에서 반환되는 결과가 -1인 경우: 요청 혹은 진행 중인 심부름이 있는 경우
//		// 프로시저에서 반환되는 결과가 0인 경우: 비밀번호가 달라서 회원탈퇴 요청이 실패한 경우
//		// 프로시저에서 반환되는 결과가 1인 경우: 성공적으로 회원탈퇴 요청이 처리된 경우
//		HashMapBinder hmb = new HashMapBinder(req);
//		hmb.bindPost(pmap); // 입력 받은 현재 비밀번호, 새 비밀번호가 담겨있다.
//		// 프로시저 실행 결과를 받아줄 proc_result 항목 추가 - 반환받는 값의 타입이 NUMBER이므로 타입에 맞게  0을 넣어둔다.
//		pmap.put("proc_result", 0);
//		int result = memberLogic.updateActive(pmap);
//		logger.info("회원상태(mem_active) 업데이트 결과(탈퇴 처리 결과) ===> "+result);
//		// 입력 받은 현재 비밀번호가 [DB]에서 조회한 사용자의 비밀번호와 달라 회원 탈퇴 처리에 실패 시
		int result =0;
		if(result == 0) {
			AjaxDataPrinter.out(res, "text/html", "<b>비밀번호</b>가 일치하지 않습니다. 다시 입력해주세요.");
		}
		// 요청중 혹은 진행중인 심부름이 존재해서 회원 탈퇴 처리에 실패 시
		else if(result == -1) {
			AjaxDataPrinter.out(res, "text/html", "<b>요청중</b>이거나 <b>진행중</b>인 심부름이 존재하여 <b>탈퇴할 수 없습니다.</b>");
		}
		// 회원 탈퇴 처리 성공 시
		else if(result == 1){
			AjaxDataPrinter.out(res, "text/html", "탈퇴처리가 <b>완료</b>되었습니다. [확인] 버튼 클릭 시 메인페이지로 이동합니다.");
		}
		
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
		hmb.bindPost(pmap);	// 입력받은 회원의 이메일 정보가 담겨있다.
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
			// 비밀번호 저장해야 함
			HttpSession session = req.getSession();
			session.setAttribute("tempPw", tempPw);
			// 성공하였음을 Front에 알림(AJAX)
			AjaxDataPrinter.out(res, "text/html", "입력하신 이메일로 임시 비밀번호가 발급되었습니다.");
		}
		// 존재하지 않는 이메일이라면
		else if(result == 0) {
			logger.info("존재하지 않는 이메일이 입력되었음");
			// (존재하지 않는 이메일이라) 실패하였음을 Front에 알림(AJAX)
			AjaxDataPrinter.out(res, "존재하지 않는 이메일입니다.");
		}
		
		
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
		// 테스트 코드
//		Gson g = new Gson();
//		String jo = g.toJson("[{\"name\":\"은영\"}]");
//		AjaxDataPrinter.out(res, "application/json", jo);	// nds.util 패키지에 만들어 둔 공통코드입니다.
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
		// rmap ===> mem_eamil: "존재하지 앟는 아이디입니다." | "잘못된 비밀번호입니다." | member 정보가 담긴 map
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = memberLogic.selectMember(pmap);
		// 로그인 실패 시 "존재하지 앟는 아이디입니다." 또는 "잘못된 비밀번호입니다." 메세지 띄워주어야 함.
		if("존재하지 않는 아이디입니다.".equals(rmap.get("mem_email")) || "잘못된 비밀번호입니다.".equals(rmap.get("mem_email"))) {
			// resultMsg를 전송 (AJAX)
			AjaxDataPrinter.out(res, rmap.get("mem_email"));
		}
		// 로그인 성공 시(해당 email과 pw로 조회한 결과가 row 하나인 경우) - resultMsg: 사용자 닉네임
		else {
			// ================================================= [[ 아이디저장 ]] =================================================
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
			// ================================================= [[ 자동로그인 ]] =================================================
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
			// 참고로, Front에서는 session에 login이 있는지를 체크함으로써 로그인 성공여부를 판단할 수 있음.
			// map(rmap)으로 가져온 정보를 VO로 옮겨담기 - 공통코드
			MemberVO mvo = new MemberVO();
			Converter.MAPtoVO(rmap, mvo, "mem_email");
			Converter.MAPtoVO(rmap, mvo, "mem_nickname");
			HttpSession session = req.getSession();
			session.setAttribute("login", mvo);
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
		logger.info("mylist ===> "+(String)req.getAttribute("mylist112"));
		logger.info(req.getParameter("mylist112"));
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

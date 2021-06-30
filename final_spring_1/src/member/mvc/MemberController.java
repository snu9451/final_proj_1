package member.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.mail.Session;
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
import nds.util.SMS;

public class MemberController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private MemberLogic memberLogic = null;
	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(MemberController.class);
	
	

	
	/*	=======================================================================================
								Ｍ　Ｅ　Ｔ　Ｈ　Ｏ　Ｄ　　　Ａ　Ｒ　Ｅ　Ａ
	======================================================================================== */
	// ===================================== [[ SELECT ]] =====================================
	// 닉네임 중복 검사
	public void selectNickName(HttpServletRequest req, HttpServletResponse res)	{	// ♣ 완료
		logger.info("selectNickName 메소드 호출 성공!");
		// 해당 닉네임을 갖는 회원을 조회한다.
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		Map<String, Object> rmap = null;
		logger.info(pmap);
		rmap = memberLogic.selectNickName(pmap);
		logger.info("NickName으로 조회한 결과 ===> "+rmap);
		// 중복이 아닌 경우: 같은 닉네임을 갖는 회원이 없는 경우
		if(rmap == null) {
			AjaxDataPrinter.out(res, "text/html", "<h4 style=\"font-size : 15px; color : green; font-weight:bold\">사용 가능한 닉네임입니다.</h4>");
		}
		// 중복인 경우: 같은 닉네임을 갖는 회원이 있는 경우
		else {
			AjaxDataPrinter.out(res, "text/html", "<h4 style=\"font-size : 15px; color : red; font-weight:bold\">이미 사용중인 닉네임입니다.</h4>");
		}
	}
	// 이메일 중복 검사 - 회원가입 링크 전송
	public void selectEmail(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		logger.info("selectEmail 메소드 호출 성공!");
		// 해당 이메일을 갖는 회원을 조회한다.
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		Map<String, Object> rmap = null;
		rmap = memberLogic.selectEmail(pmap);
		logger.info("Email로 조회한 결과 ===> "+rmap);
		// 중복이 아닌 경우: 같은 이메일을 갖는 회원이 없는 경우
		if(rmap == null) {
			Mail mail = new Mail();
			mail.setReceiveEmail((String)pmap.get("mem_email"));
			HttpSession session = req.getSession();
			session.setAttribute("join", memberLogic.getRandomCode("NUL", 10));
			logger.info(session.getAttribute("join"));
			AjaxDataPrinter.out(res, "text/html", "<h4 style=\"font-size : 15px; color : green; font-weight:bold\">입력하신 이메일로 회원가입 링크가 전송되었습니다.</h4>");
		}
		// 중복인 경우: 같은 이메일을 갖는 회원이 있는 경우
		else {
			AjaxDataPrinter.out(res, "text/html", "<h4 style=\"font-size : 15px; color : red; font-weight:bold\">이미 가입되어 있는 닉네임입니다.</h4>");
		}
	}
	// ===================================== [[ INSERT ]] =====================================
	// 회원가입 모달에서 확인 버튼 클릭 시
	// 테스트: http://localhost:9696/member/insertMember.nds?mem_email=fan@good.com&mem_nickname=%ED%98%B8%EB%9E%91%EC%9D%B4&mem_pw=1111&mem_gender=F&mem_age=20&issocial=F&mem_phone=01056636363
	public ModelAndView insertMember(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		// request 객체에 담긴 정보를 map으로 옮겨 담기
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);	// mem_email, mem_phone, mem_pw, mem_nickname, mem_age, mem_gender
		int result = memberLogic.insertMember(pmap);
		// 정상 처리 시
		if(result == 1) {
			// 로그인 처리 후
			doLogin(req, res);
			// 메인 페이지로 이동
			ModelAndView mav = new ModelAndView();
			mav.setViewName("mainPage");
			return mav;
		}
		// 처리 실패 시
		else {
			AjaxDataPrinter.out(res, "text/html", "NDS::ERROR!");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("errorPage");
			return mav;
		}
	}
	
	// ===================================== [[ UPDATE ]] =====================================
	// 닉네임 변경 시
	public void updateNickName(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		logger.info("updateNickName 메소드 호출 성공!");
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		// 사용자의 이메일을 담아주기
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		logger.info(mvo);
		String mem_email = mvo.getMem_email();
		pmap.put("mem_email", mem_email);
		int result = memberLogic.updateMember(pmap);
		logger.info("NickName 업데이트 결과 ===> "+result);
		// 닉네임 변경 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, "text/html", "[ERROR] 닉네임 변경에 <b>실패</b>하였습니다.");
		}
		// 닉네임 변경 성공 시
		else if(result == 1) {
			// 세션에 저장해 둔 닉네임 변경해주기
			String afterNickName = (String)pmap.get("change_nickname");
			mvo.setMem_nickname(afterNickName);
			session.setAttribute("login", mvo);
			AjaxDataPrinter.out(res, "text/html", "닉네임이 <b>"+afterNickName+"</b>(으)로 변경되었습니다.");
		}
	}
	// 프로필 사진 변경 시
	public void updateImg(HttpServletRequest req, HttpServletResponse res) {////////////////////////////////////////////
		logger.info("updateImg 메소드 호출 성공!");
		// request객체로 받아온 정보를 map으로 옮겨 담는 작업
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		// 사용자의 이메일을 담아주기
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		logger.info(mvo);
		String mem_email = mvo.getMem_email();
		pmap.put("mem_email", mem_email);
		int result = memberLogic.updateMember(pmap);
		logger.info("프로필 사진 업데이트 결과 ===> "+result);
		// 프로필 사진 변경 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, "text/html", "[ERROR] 프로필 사진 변경에 <b>실패</b>하였습니다.");
		}
		// 프로필 사진 변경 성공 시
		else {
			// insert_here - 물리적인 위치에 저장된 파일을 삭제한다.
			AjaxDataPrinter.out(res, "text/html", "변경되었습니다.");
		}
	}
	public void updatePw(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		logger.info("updatePw 메소드 호출 성공!");
		// 입력된 현재 비밀번호가 사용자의 이메일로 조회한 비밀번호와 일치하는지 확인하고 일치하는 경우에만 업데이트 처리 해주어야 함. ================================= [[ 프로시저2 ]]
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		logger.info(mvo);
		String mem_email = mvo.getMem_email();
		pmap.put("mem_email", mem_email);
		// 프로시저 실행 결과를 받아줄 RESULT 항목 추가 - 반환받는 값의 타입이 NUMBER이므로 타입에 맞게  0을 넣어둔다.
		pmap.put("RESULT", 0);
		int result = memberLogic.updatePw(pmap);
		logger.info("비밀번호 업데이트 결과 ===> "+result);
		// 비밀번호 변경 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, "text/html", "[ERROR] 비밀번호 변경에 <b>실패</b>하였습니다.");
		}
		// 비밀번호 변경 성공 시
		else if(result ==1) {
			AjaxDataPrinter.out(res, "text/html", "변경되었습니다.");
		}
	}
	// 회원 탈퇴 시
	public void leave(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		logger.info("leave 메소드 호출 성공!");
		Map<String, Object> pmap = new HashMap<String, Object>();
		// 프로시저에서 반환되는 결과가 -1인 경우: 요청 혹은 진행 중인 심부름이 있는 경우
		// 프로시저에서 반환되는 결과가 0인 경우: 비밀번호가 달라서 회원탈퇴 요청이 실패한 경우
		// 프로시저에서 반환되는 결과가 1인 경우: 성공적으로 회원탈퇴 요청이 처리된 경우
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap); //
		// 사용자의 이메일을 담아주기
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		String mem_email = mvo.getMem_email();
		pmap.put("mem_email", mem_email);
		// 프로시저 실행 결과를 받아줄 proc_result 항목 추가 - 반환받는 값의 타입이 NUMBER이므로 타입에 맞게  0을 넣어둔다.
		pmap.put("proc_result", 0);
		int result = memberLogic.updateActive(pmap);
		logger.info("회원상태(mem_active) 업데이트 결과(탈퇴 처리 결과) ===> "+result);
		// 입력 받은 현재 비밀번호가 [DB]에서 조회한 사용자의 비밀번호와 달라 회원 탈퇴 처리에 실패 시
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
			session.invalidate();
		}
		
	}
	// 보유코인(coin_remain)을 업데이트 하는 상황에는 두 가지가 있다: (1) 결제 API를 통한 코인 충전 (2) 계좌로 출금
	// [coin_trans 테이블] (1) trans_io = "I" (2) trans_io = "O"
	// (1)의 경우 보유코인(coin_remain)은 금액이 늘어나고 입출금내역테이블(money_io_mem)에는 출금내역이 추가된다.
	// (2)의 경우 보유코인(coin_remain)은 금액이 줄어들 입출금내역테이블(money_io_mem)에는 입금내역이 추가된다.
	// (1) 결제 API를 통한 코인 충전
	public void chargeCoin(HttpServletRequest req, HttpServletResponse res) {
		logger.info("updateDeposit 메소드 호출 성공!");
		Map<String, Object> pmap = new HashMap<String, Object>();
		// 결제 성공 시 
		// request 객체를 통해 완료된 결제 정보가 넘어온다. 금액 등
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		// 사용자의 이메일을 담아주기
		HttpSession session = req.getSession();
		String mem_email = ((MemberVO)session.getAttribute("login")).getMem_email();
		pmap.put("mem_email", mem_email);
		// 프로시저 실행 결과를 받아줄 proc_result 항목 추가 - 반환받는 값의 타입이 NUMBER이므로 타입에 맞게  0을 넣어둔다.
		pmap.put("proc_result", 0);
		int result = 0;///////////////////////////////////////////////////////////////////////////////////////여기수정
//		int result = memberLogic.updateMoney(pmap);///////////////////////////////////////////////////////////
		// 처리 결과가 성공이면 (coin_trans 테이블에 insert와 member 테이블에 update 모두 성공) 2를 반환한다.
		String io = (String)pmap.get("trans_io");
		if(result == 2) {
			// 충전인 경우
			if(io != null && "I".equals(io)) {
				AjaxDataPrinter.out(res, "text/html", "충전이 완료되었습니다.");				
			}
			// 출금인 경우
			else if(io != null && "O".equals(io)) {
				AjaxDataPrinter.out(res, "text/html", "입력하신 금액이 계좌로 출금되었습니다.");				
			}
		}
		// 오라클 서버 장애 등으로 처리가 실패한 경우
		else {
			
		}
		
	}
	// (2) 계좌로 출금
	// 입력받는 정보: 출금 금액, 계좌번호, 인증번호
	public void withdraw(HttpServletRequest req, HttpServletResponse res) {
		logger.info("withdraw 메소드 호출 성공!");
		// request 객체에 담긴 정보를 map으로 옮겨 담기
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		// 인증코드 일치여부 판단
		HttpSession session = req.getSession();
		int input_code = (Integer)pmap.get("input_code");
		int withdraw_code = (Integer)session.getAttribute("withdraw_code");
		// 입력받은 인증코드와 세션에 저장되어 있는 인증코드가 일치한다면
		if(input_code == withdraw_code) {
			// 출금(O)이므로 map에 담아준다.
			pmap.put("trans_io","O");
			// 세션에 저장되어 있는 사용자의 이메일을 담아준다.
			MemberVO mvo = (MemberVO)session.getAttribute("login");
			String mem_email = mvo.getMem_email();
			pmap.put("mem_email", mem_email);
			// [DB]에 update 및 insert 처리
			int result = memberLogic.withdraw(pmap);
		}
		// 입력받은 인증코드와 세션에 저장되어 있는 인증코드가 일치하지 않는다면
		else {
			AjaxDataPrinter.out(res, "인증코드가 일치하지 않습니다.");
		}
		// 출금하고자 하는 금액
//		int io_money = (Integer)pmap.get("io_money");
		// 계좌번호
//		String account_num = (String)pmap.get("account_num");
		// 인증번호
	}
	
	
	
	
	
	// ===================================== [[ DELETE ]] =====================================
	
	
	// ======================================= [[ 그 외 ]] =======================================
	public void issueTempPw(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		logger.info("issueTempPw 메소드 호출 성공!");
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);	// 입력받은 회원의 이메일 정보가 담겨있다.
		// 입력 받은 이메일이 존재하는 이메일이면 1, 존재하지 않으면 0 - SELECT COUNT ...
		int result = memberLogic.selectIsMemberPw(pmap);
		logger.info("임시비번 발금을 위한 회원 조회 결과 ==> "+result);
//		int result = 1; // 테스트
		// 존재한다면 입력 받은 이메일로 임시비번 전송
		if(result == 1) {
			String tempPw = memberLogic.getRandomCode("NUL", 10);
			Mail mail = new Mail();
			mail.setReceiveEmail(pmap.get("MEM_EMAIL")+"@naver.com","[내동생] 임시 비밀번호 발급","임시비밀번호는 <b>"+tempPw+"</b>입니다.");	// 테스트
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
			AjaxDataPrinter.out(res, "text/html", "존재하지 않는 이메일입니다.");
		}
	}
	public void reqLoginView(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
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
			logger.info(rmap);
			// NDS_SKEY가 있더라도 기간이 만료되었으면 rmap = null이 된다.
			if(rmap != null) {
				// 권한 허용 범위가 S(SaveID)인 경우
				if("S".equals((String)rmap.get("AUTH_RANGE"))) {
					// 아이디를 로그인창에 띄워줄 수 있도록 request 객체에 담아준다.
					String mem_email = (String)rmap.get("MEM_EMAIL");
					req.setAttribute("MEM_EMAIL", mem_email);
					logger.info("저장되어 있는 아이디="+mem_email);
				}
				logger.info("아이디 저장을 선택하지 않았거나 자동로그인임");
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
	
	// 테스트용 url
	// 잘못된 아이디 http://localhost:9696/member/doLogin.nds?mem_email=grsdfpe@good.com&mem_pw=123&isAutoLoginChecked=true
	// [아이디 저장] http://localhost:9696/member/doLogin.nds?mem_email=grape@good.com&mem_pw=123&isSavedIdChecked=true
	// [자동 로그인] http://localhost:9696/member/doLogin.nds?mem_email=grape@good.com&mem_pw=123&isAutoLoginChecked=true
	// 로그인 버튼이 클릭되었을 때 실행되는 메소드
	public void doLogin(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
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
		Map<String, Object> rmap = new HashMap<String, Object>();
//		int imsi = memberLogic.selectIsMember(pmap);
//		logger.info("imsi ===> "+imsi);
		rmap = memberLogic.selectMember(pmap);
		logger.info(rmap);
		// 조회 결과가 없으면 rmap은  null임
		if(rmap == null) {
			// resultMsg를 전송 (AJAX)
			AjaxDataPrinter.out(res, "text/html", "아이디 혹은 비밀번호가 잘못되었습니다.");
		}
		// 로그인 성공 시(해당 email과 pw로 조회한 결과가 row 하나인 경우)
		else {
			// ================================================= [[ 아이디저장 ]] =================================================
			// 아이디 저장에 체크했다면 - isSavedIdChecked(프론트에서 담아줘야 함) == true
			isSavedIdChecked = (String)pmap.get("isSavedIdChecked");
			if("true".equals(isSavedIdChecked)) {
				Cookie cookie = cookies.getCookie(sessionKey);
				String sessionValue = cookies.getValue(sessionKey);
				logger.info(sessionValue);
				// 쿠키에 NDS_SKEY가 있는 경우라면
				if(sessionValue!=null) {
					logger.info("쿠키에 NDS_SKEY가 있는 경우");
					// [DB]에서 이메일과 sessionValue에 해당하는 로우의 유효기간을 갱신하고, 권한을 S로 설정한다. (update)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					pmap.put("mem_sessionid",sessionValue);
					pmap.put("a_or_s","S");
					logger.info(pmap);
					memberLogic.uiToSession(pmap);
//					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 있는 경우::아이디 저장 처리 결과 ===> "+result);
//					if(result == 1) { // 처리 결과가 성공이라면
						// 쿠키의 유효기간을 갱신한다.
						cookie.setMaxAge(60*60*24*30);
						logger.info("NDS_SKEY값::"+sessionValue);
//					}
					AjaxDataPrinter.out(res, "text/html", "[아이디저장] 로그인 성공!");
				}

				// 쿠키에 NDS_SKEY가 없는 경우라면
				else {
					logger.info("쿠키에 NDS_SKEY가 없는 경우");
					// NDS_SKEY를 발급하고, [DB]에 insert한 후, 쿠키에 저장해주어야 한다.
					sessionValue = memberLogic.getRandomCode("NUL", 20);	// 대소문자숫자로 구성된 20자리의 랜덤코드 생성
					// 이메일과 sessionValue에 해당하는 로우를 insert한다. 권한은 S로 설정한다. (insert)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					pmap.put("mem_sessionid",sessionValue);
					pmap.put("a_or_s","S");
					logger.info(pmap);
					memberLogic.uiToSession(pmap);
//					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 없는 경우::아이디 저장 처리 결과 ===> "+result);
//					if(result == 1) {
						Cookie cookie_ = new Cookie(sessionKey, sessionValue);
						cookie_.setMaxAge(60*60*24*30); 	// 초 단위 (한달)
						res.addCookie(cookie_);
						logger.info("NDS_SKEY값::"+sessionValue);
//					}
					AjaxDataPrinter.out(res, "text/html", "[아이디저장] 로그인 성공!");
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
					logger.info("쿠키에 NDS_SKEY가 있는 경우");
					// [DB]에서 이메일과 sessionValue에 해당하는 로우의 유효기간을 갱신하고, 권한을 S로 설정한다. (update)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					pmap.put("mem_sessionid",sessionValue);
					pmap.put("a_or_s","A");
					logger.info(pmap);
					memberLogic.uiToSession(pmap);
//					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 있는 경우::자동 로그인 처리 결과 ===> "+result);
//					if(result == 1) { // 처리 결과가 성공이라면
//						 쿠키의 유효기간을 갱신한다.
						cookie.setMaxAge(60*60*24*30);
						logger.info("NDS_SKEY값::"+sessionValue);
//					}
					AjaxDataPrinter.out(res, "text/html", "[자동로그인] 로그인 성공!");
				}
				
				// 쿠키에 NDS_SKEY가 없는 경우라면
				else {
					logger.info("쿠키에 NDS_SKEY가 없는 경우");
					// NDS_SKEY를 발급하고, [DB]에 insert한 후, 쿠키에 저장해주어야 한다.
					sessionValue = memberLogic.getRandomCode("NUL", 20);	// 20자리의 랜덤코드 생성
					// 이메일과 sessionValue에 해당하는 로우를 insert한다. 권한은 S로 설정한다. (insert)
					// 해당 이메일로 session 테이블에서 조회한 결과가 1건이면 update, 0건이면 insert ================================= [[ 프로시저1 ]]
					logger.info(pmap);
					pmap.put("mem_sessionid",sessionValue);
					pmap.put("a_or_s","A");
					memberLogic.uiToSession(pmap);
//					logger.info("[1:success/0:fail]쿠키에 NDS_SKEY가 없는 경우::자동 로그인 처리 결과 ===> "+result);
//					if(result == 1) {
						Cookie cookie_ = new Cookie(sessionKey, sessionValue);
						cookie_.setMaxAge(60*60*24*30); 	// 초 단위 (한달)
						res.addCookie(cookie_);
						logger.info("NDS_SKEY값::"+sessionValue);
//					}
					AjaxDataPrinter.out(res, "text/html", "[자동로그인] 로그인 성공!");
				}
			}
			// 로그인 성공시 공통적으로 처리해 줄 사항; 세션에 사용자정보(MemberVO) 담아주기.
			// 참고로, Front에서는 session에 login이 있는지를 체크함으로써 로그인 성공여부를 판단할 수 있음.
			// map(rmap)으로 가져온 정보를 VO로 옮겨담기 - 공통코드
			MemberVO mvo = new MemberVO();
			logger.info("mvo 주소번지: "+mvo);
			logger.info(rmap);
			Converter.MAPtoVO(rmap, mvo, "mem_email");
			Converter.MAPtoVO(rmap, mvo, "mem_nickname");
			logger.info(mvo.getMem_email());
			HttpSession session = req.getSession();
			session.setAttribute("login", mvo);
		}

	}
	// 로그아웃
	public void doLogout(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		session.invalidate();
		logger.info("로그아웃 처리 완료");
		// 메인 페이지로 이동시키기
	}
	// 이메일로 인증번호 발송
	public void sendCode(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		// 숫자로만 구성된 랜덤코드 생성
		String numberCode = memberLogic.getRandomCode("ON", 6);
		// 인증번호 발송을 요청한 사용자의 이메일을 세션에서 꺼내오기
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		String mem_email = mvo.getMem_email();
		// 인증코드를 메일로 발송하기
		Mail mail = new Mail();
		mail.setReceiveEmail(mem_email, "[내동생] 인증코드 발송", "내동생 서비스를 이용해주셔서 감사합니다.<br>인증코드는 <b>"+numberCode+"</b>입니다.");
		// 인중코드가 30분(세션유지시간) 동안 유지될 수 있도록 세션에 담는다.
		session.setAttribute("withdraw_code", numberCode);
		// 처리결과를 화면에 내보내기
		AjaxDataPrinter.out(res, "text/html", "가입하신 이메일(<b>"+mem_email+"</b>)로 인증코드가 전송되었습니다.");
	}
	// 핸드폰 번호로 인증번호 발송
	public void sendSMSCode(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		// request 객체를 통해 입력 받은 핸드폰 번호 가져오기.
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		String receiver = (String)pmap.get("mem_phone");
		// 랜덤한 인증코드 생성
		String randomCode = memberLogic.getRandomCode("ON", 6);
		randomCode = "123456";
		// 메세지로 보낼 내용 설정
		String content= "【내동생】 인증번호 [ "+randomCode+" ]를 정확히 입력해주세요.";
		SMS sms = new SMS();
		//sms.send(receiver, content);
		// 인증코드는 사용자가 회원가입을 확정하는 시점에 Front에서 비교할 수 있도록 request 객체에 담아준다.
//		req.setAttribute("phCode", randomCode);
		AjaxDataPrinter.out(res, "text/html", randomCode);
	}
	// 회원가입 링크 클릭 시
	public ModelAndView join(HttpServletRequest req, HttpServletResponse res) {	// ♣ 완료
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		// selectEmail.nds 로 발급받은 회원가입 링크로 유효시간 내에 접속 시 세션에 join이라는 속성이 존재한다.
		String join = (String)session.getAttribute("join");
		if(join == null) {
			// 유효하지 않은 접근임을 안내하는 페이지로 이동.
			mav.setViewName("/WEB-INF/views/member/invalid.jsp");	////////////////////////////////prefix suffix 설정하면 이 부분 변경해주어야 함.
		}
		else {
			// 메인페이지로 이동함과 동시에 회원가입 모달을 띄워줄 수 있도록 joinForm이라는 신호를 보냄.
			mav.addObject("joinForm","on");
			// 정상적인 접근. 메인 페이지로 이동.
			mav.setViewName("mainpage/main_page");
		}
		return mav;
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
	public void getAuth(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		MemberVO mvo = new MemberVO();
		mvo.setMem_email("apple@good.com");
		mvo.setMem_nickname("사과");
		session.setAttribute("login", mvo);
		res.addCookie(new Cookie("NDS_SKEY", "010010010"));
		logger.info("관리자로 로그인하였음");
	}
	public void showEmail(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		logger.info(mvo);
		if(mvo.getMem_email()!=null) {
			AjaxDataPrinter.out(res, mvo.getMem_email());
		} else {
			AjaxDataPrinter.out(res, "로그인 중이 아님");
		}
	}
	// =======================================================================================================================
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}

	
}

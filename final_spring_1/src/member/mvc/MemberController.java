package member.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class MemberController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private MemberLogic memberLogic = null;
	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(MemberController.class);
	
	// ===================================== [[ SELECT ]] =====================================
	public void selectNickName(HttpServletRequest req, HttpServletResponse res) {
		
	}
	public void selectEmail(HttpServletRequest req, HttpServletResponse res) {
		
	}
	
	// ===================================== [[ INSERT ]] =====================================
	
	
	// ===================================== [[ UPDATE ]] =====================================
	public void updateNickName(HttpServletRequest req, HttpServletResponse res) {
		
	}
	public void updateImg(HttpServletRequest req, HttpServletResponse res) {
		
	}
	public void updatePw(HttpServletRequest req, HttpServletResponse res) {
		
	}
	public void updateDeposit(HttpServletRequest req, HttpServletResponse res) {
		
	}
	
	
	// ===================================== [[ DELETE ]] =====================================
	
	
	// ======================================= [[ 그 외 ]] =======================================
	public void issueTempPw(HttpServletRequest req, HttpServletResponse res) {
		
	}
	public void reqLoginView(HttpServletRequest req, HttpServletResponse res) {
		
	}
	public void withdraw(HttpServletRequest req, HttpServletResponse res) {
		
	}
	
	
	
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}
	
}

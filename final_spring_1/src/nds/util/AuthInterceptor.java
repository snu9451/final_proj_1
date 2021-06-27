package nds.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import member.mvc.MemberLogic;

public class AuthInterceptor implements HandlerInterceptor {
	
	Logger logger = Logger.getLogger(AuthInterceptor.class);
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠. 
	MemberLogic memberLogic = null;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		
		return false;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav)
			throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e)
			throws Exception {
	}
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}


}
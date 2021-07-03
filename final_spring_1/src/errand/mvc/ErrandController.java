package errand.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;

import member.mvc.MemberVO;
import nds.util.AjaxDataPrinter;
import nds.util.HashMapBinder;

public class ErrandController extends MultiActionController{
   Logger logger = Logger.getLogger(ErrandController.class);
   private ErrandLogic errandLogic = null;
   public void setErrandLogic(ErrandLogic errandLogic) {
      this.errandLogic  = errandLogic;
   }
   //String mem_email_res = "pine@good.com";
   public void selectErrandRecord(HttpServletRequest req, HttpServletResponse res) throws Exception {
      logger.info("ctrl : selectErrandRecord 호출 성공");
      List<Map<String,Object>> errandRecord = null;
      Map<String,Object> pmap = new HashMap<>();      
      HashMapBinder hmb = new HashMapBinder(req);
      hmb.bindPost(pmap);
      //pmap.put("mem_email_res", mem_email_res);
      errandRecord = errandLogic.selectErrandRecord(pmap);
      ModelAndView mav = new ModelAndView();
      logger.info("errandRecord : "+errandRecord);
      mav.addObject("errandRecord", errandRecord);
      //where if test 가기전에 요청자, 수행자 email 체크 
      Gson g = new Gson();
      String jsondata = null;
      jsondata = g.toJson(errandRecord);
//      if(pmap.get("mem_email_req") != null ) {
//         mav.setViewName("myPage/myErrand_req_rec");
         AjaxDataPrinter.out(res, "application/json", jsondata);
         logger.info(jsondata);
         logger.info("요청자 if문 : "+ pmap.get("mem_email_req"));
//      }else {
//         AjaxDataPrinter.out(res, "application/json", jsondata);
//         mav.setViewName("myPage/myErrand_res_rec");
//         logger.info("수행자 if문 : "+ pmap.get("mem_email_res"));
//      }
//      return mav;
   }
   /* /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ */
	public void getErrand(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		Map<String, Object> pmap = new HashMap<String, Object>();
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		String mem_email = mvo.getMem_email();
		pmap.put("mem_email", mem_email);
		Map<String, Object> rmap = errandLogic.getErrand(pmap);
		req.setAttribute("memberMap", rmap);
		RequestDispatcher rd = req.getRequestDispatcher("/myPage/chatroomNotice.jsp");
		try {
			rd.forward(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void insertErrand(HttpServletRequest req, HttpServletResponse res) {
		logger.info("insertErrand 메소드 호출 성공!");
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
		int result = errandLogic.insertErrand(pmap);
		logger.info("심부름 insert 결과 ===> "+result);
		// 심부름 insert 실패 시
		if(result == 0) {
			AjaxDataPrinter.out(res, "text/html", "[ERROR] 심부름 insert <b>실패</b>하였습니다.");
		}
		// 심부름 insert 성공 시
		else if(result ==1) {
			AjaxDataPrinter.out(res, "text/html", "성공.");
		}
	}
						/* 확인했으면 주석을 지우셔도 됩니다. */
	/* \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ */
}
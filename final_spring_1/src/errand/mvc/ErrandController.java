package errand.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;

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
}
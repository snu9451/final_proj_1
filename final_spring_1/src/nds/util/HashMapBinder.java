package nds.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.util.xml.DomUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	//첨부 파일 처리에 필요한 변수 선언
	//첨부파일은 반드시 post방식으로 전송해야 한다.
	MultipartRequest multi = null;//기존의 request로는 값을 가져오지 못하게 됨.
	String realFolder = "";
	//첨부파일 한글처리
	String encType = "utf-8";
	//첨부파일 크기 제한
	int maxSize = 5*1024*1024;//5MB
	HttpServletRequest request = null;
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
		realFolder = "C:\\Users\\chokiseol\\Desktop\\final\\final_proj_1\\final_spring_1\\WebContent\\itemUpload\\assets\\img\\itemupload";
		logger.info("itemupload용 hashmapbinder");
	}
	public HashMapBinder(HttpServletRequest request,int i) {
		this.request = request;
		realFolder = "C:\\Users\\chokiseol\\Desktop\\final\\final_proj_1\\final_spring_1\\WebContent\\myPage\\assets\\img\\profile";
		logger.info("profileimg용 hashmapbinder");
	}
	public void profileBind(Map<String,Object> target) {
		try {
			multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		} catch (Exception e) {
			logger.info("Exception : "+e.toString());
		}
		Enumeration en = multi.getParameterNames();//배열 구조체 묶음
		//<input type="text" name="mem_id"
		//첨부파일에 대한 정보를 받아오기
		Enumeration files = multi.getFileNames(); //파일명정보를 배열로 만들다(files에 name들이 담겨있다)
		while(files.hasMoreElements()){
			String name = (String)files.nextElement(); //각각의 파일 name을 String name에 담는다.
			logger.info(name);
			String filename = multi.getFilesystemName(name); //각각의 파일 name을 통해서 파일의 정보를 얻는다.
			logger.info(filename);
			Map<String,Object> map = new HashMap<>();
			double size = 0;
			File file = new File(realFolder+"\\"+filename);
			//첨부파일의 크기를 담을 변수
			size = file.length();
			target.put("change_img",filename);
			System.out.println(name+" "+size+"    "+filename);
			if(size>500000) {
				target.put("error","size초과");
				break;
			}
		}
	}////////end of bind
	
	public void multiBind(Map<String,Object> target) {
		try {
			multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		} catch (Exception e) {
			logger.info("Exception : "+e.toString());
		}
		Enumeration en = multi.getParameterNames();//배열 구조체 묶음
		System.out.println(en);
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+multi.getParameter(key));
			target.put(key, multi.getParameter(key));
			logger.info("value:"+target);
		}
		List<Map<String,Object>> imgs = new ArrayList();
		//첨부파일에 대한 정보를 받아오기
		Enumeration files = multi.getFileNames(); //파일명정보를 배열로 만들다(files에 name들이 담겨있다)
		System.out.println("dfsfsd    "+files);
		while(files.hasMoreElements()){
		    String name = (String)files.nextElement(); //각각의 파일 name을 String name에 담는다.
		    logger.info(name);
		    String filename = multi.getFilesystemName(name); //각각의 파일 name을 통해서 파일의 정보를 얻는다.
		    logger.info(filename);
		    if(filename!=null) {
		    	Map<String,Object> map = new HashMap<>();
				double size = 0;
				File file = new File(realFolder+"\\"+filename);
				//첨부파일의 크기를 담을 변수
				size = file.length();
				map.put("bi_file",filename);
				map.put("bi_size",size);
				imgs.add(map);
				System.out.println(name+" "+size+"    "+filename);
				if(size>500000) {
					target.put("error","size초과");
					break;
				}
		    }
		}
		target.put("itemImgs",imgs);
	}////////end of bind
			
	public void bindPost(Map<String,Object> target) {
		Enumeration en = request.getParameterNames();//배열 구조체 묶음
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+request.getParameter(key));
			target.put(key, HangulConversion.toUTF(request.getParameter(key)));
			logger.info("value:"+target);
		}
	}////////end of bind
	public void bind(Map<String,Object> target) {
		Enumeration en = request.getParameterNames();//배열 구조체 묶음
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+HangulConversionGet.toUTF(request.getParameter(key)));
			target.put(key, HangulConversionGet.toUTF(request.getParameter(key)));
		}
	}////////end of bind
}
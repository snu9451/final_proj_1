package metabuild_test_ysc;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActive {
	
	//스트림으로 입력 버퍼를 생성
	BufferedReader buffReader = null;

	private void getFile() {
try {
	        
	        //file 객체 생성
	        File log_txt = new File("demo.log");
			
	        //file 입력 스트림을 생성
	        FileReader fileReader = new FileReader(log_txt);
			
	        //buffReader 초기화
	        buffReader = new BufferedReader(fileReader);
			
	        //txtLinesList 생성
	        List<String> txtLines = new ArrayList<String>();
			
	        String txtLine = "";
	        //텍스트 내용을 한 줄씩 읽어와 txtLine에 담고, txtLines에 add한다.
	        while((txtLine = buffReader.readLine()) != null) {
	            txtLines.add(txtLine);
	        }
	        
	        //txtLines size만큼 for문 실행
	        for(int i = 0 ;  i < txtLines.size()  ; i++) {
	        	String demo_txt_line = txtLines.get(i);
	        	//공백으로 구분하여 배열 생성
	        	String [] split = demo_txt_line.split(" ");
	        	//"#"기호 가지고 있는지 필터링
	        	if(demo_txt_line.contains("#")) {
	        		//"#"기호가 포함된 로그 txt line
	        		dontNeed(split);
	        	} else {
	        		//"#"기호가 없는 로그 txt line
	        		doNeed(split, demo_txt_line);
	        	}
	        }
	        
	    } catch(FileNotFoundException e) {
	        e.printStackTrace();
	        
	    } catch(IOException e){
            System.out.println(e);
        } finally{
	    	
	        try {
	        	//버퍼를 닫아줌 ( 파일을 닫아줌 )
				buffReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
	}	
	
	//"#"기호가 없는 로그 txt line
	private void doNeed(String[] split, String demo_txt_line) {
		
		//ip = 45.114.2.130 
		String ip = split[3];
		//"."을 기준으로 나눠서 배열 생성 [45, 114, 2, 130]
		String [] ip_array = split[3].split("\\.");
		//130
		String ip_filter = ip_array[3];
		
		//List<Map<String, Object>> ip_nums = new ArrayList<Map<String,Object>>();
		
		//ip 주소와 log정보들을 담아놓은 Map
		Map<String, Object> ip_info = new HashMap<String, Object>();
		ip_info.put("ip_filter", ip_filter);
		ip_info.put("demo_txt_line", demo_txt_line);
		
		
		List<String> result = new ArrayList<String>();
		
		//ip_nums.add(ip_info);
		//ip_filter 값이 null이 아닐때
		if(ip_info.get("ip_filter") != null) {
			//key: "ip_filter" 와 demo.txt에서 추출한 ip_filter가 같을시 
			if(ip_info.get("ip_filter").equals(ip_filter)) {
				//동일한 ip 를 가진 demo_txt_line의 정보들
				String mainLine = (String) ip_info.get("demo_txt_line");
				//result List에 add한다.
				result.add(mainLine);
			}
		}
		//파일을 만들어주는 메소드에 파라미터로 ip번호와 결과값을 넘겨준다.
		makeFile(ip, result);
	}
	
	//"#"기호가 포함된 로그 txt line
	private void dontNeed(String[] split) {
		//System.out.println("nouse");
	}
	
	//ip에 따라서 파일을 만들어주는 메소드
	private void makeFile(String ip, List<String> result)	{
		System.out.println("ip: "+ip);
		String fileName = "C://"+ip;
		try
		{
			FileWriter fw=new FileWriter(fileName); 
			BufferedWriter bw=new BufferedWriter(fw); 

			String strContent;

			for(int i=0; i<result.size(); i++){
				strContent = result.get(i);
				System.out.println(strContent);
				bw.write(strContent);
				bw.newLine(); 
			}
			bw.flush(); 
			bw.close(); 
			fw.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public MainActive() {
		getFile();
	}
	
	public static void main(String[] args) {
		new MainActive();

	}

}

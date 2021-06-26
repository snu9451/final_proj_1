package nds.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import member.mvc.MemberVO;

public class Converter {
	
	public static void VOtoMAP(Object vo, Map<String, Object> map, String key) {
		String first_str = key.substring(0, 1);	// target의 맨 첫글자를 가져옴
		first_str = first_str.toUpperCase();	// target의 맨 첫글자를 대문자로 바꿈
		String else_str = key.substring(1, key.length());
		// 호출할 메소드 이름 생성하기
		StringBuilder sb = new StringBuilder();
		sb.append("get");
		sb.append(first_str);
		sb.append(else_str);	// sb: setTarget - setter 메소드의 이름 완성
		String getterName = sb.toString();
		// vo의 getter 메소드를 호출하여 값 받아오기
		try {
			Class<?> clazz = Class.forName(vo.getClass().getName());
			/**************************************************************
			 * @param1 메소드명
			 **************************************************************/
			Method mesod = clazz.getDeclaredMethod(getterName);
			Object returrn = mesod.invoke(vo);	// 메소드를 호출
			Class<?> cl = mesod.invoke(vo).getClass();
			cl.cast(returrn);
			System.out.println(returrn.getClass().toString());
			// 받아온 값을 map에 넣어주기		
			map.put(key, returrn);	// int, String ...
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException | SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void MAPtoVO(Map map, Object vo, String key) {
		String first_str = key.substring(0, 1);	// target의 맨 첫글자를 가져옴
		first_str = first_str.toUpperCase();	// target의 맨 첫글자를 대문자로 바꿈
		String else_str = key.substring(1, key.length());
		// 호출할 메소드 이름 생성하기
		StringBuilder sb = new StringBuilder();
		sb.append("set");
		sb.append(first_str);
		sb.append(else_str);	// sb: setTarget - setter 메소드의 이름 완성
		String setterName = sb.toString();
		// key에 해당하는 값을 map에서 가져옴		
		Object value = map.get(key);	// int, String ...
		// vo의 setter 메소드를 호출하여 값 넣어주기
		try {
			Class<?> clazz = Class.forName(vo.getClass().getName());
			/**************************************************************
			 * @param1 메소드명
			 * @param2 메소드가 필요로 하는 파라미터
			 **************************************************************/
			Method mesod = clazz.getDeclaredMethod(setterName, map.get(key).getClass());
			mesod.invoke(vo, value);	// 메소드를 호출
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException | SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	public static void main(String[] args) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		MemberVO vo = new MemberVO();
//		// setter 테스트
//		map.put("mem_email", "key@naver.com");
//		
		// map의 값을 VO로 옮기기 테스트
//		Converter.MAPtoVO(map, vo, "mem_email");
//		System.out.println(vo.getMem_email());
		// getter 테스트
//		vo.setMem_age(44);
//		Converter.VOtoMAP(vo, map, "mem_age");
//		System.out.println(map.get("mem_age"));
//	}
}

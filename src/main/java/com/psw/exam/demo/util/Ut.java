package com.psw.exam.demo.util;

public class Ut {

	public static boolean empty(Object obj) {
		if( obj == null) {
			return true;
		}
		
		if( obj instanceof String == false) {
			return true;
		}
		
		String str = (String)obj;
		
		// 좌우 공백 제거후 길이 제거 한 내용이 0일 경우
		return str.trim().length() == 0;
	}

}

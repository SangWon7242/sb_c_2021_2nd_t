package com.psw.exam.demo.vo;

import lombok.Getter;

public class ResultData {
	// S-(성공)
	// F-(실패)
	
	@Getter
	private String resultCode;
	@Getter
	private String msg;
	@Getter
	private Object data1;
	
	public static ResultData from(String resultCode, String msg) {
		return from(resultCode, msg, null);
	}
	
	public static ResultData from(String resultCode, String msg, Object data1) {
		ResultData rd = new ResultData();
		rd.msg = msg;
		rd.data1 = data1;
		
		return rd;
	}
	
	public boolean isSuccess() {
		return resultCode.startsWith("S-");
	}
	
	public boolean isFail() {
		return isSuccess() == false;
	}
	
	
}

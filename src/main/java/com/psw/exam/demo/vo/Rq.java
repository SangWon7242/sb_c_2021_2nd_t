package com.psw.exam.demo.vo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.Getter;

public class Rq {	
	@Getter
	public boolean isLogined;
	@Getter
	private int loginedMemberId;

	public Rq(HttpServletRequest req) {
		HttpSession httpSession = req.getSession();
		boolean isLogined = false;
		int loginedMemberId = 0; // 로그인 안한 상태를 0으로 둠

		// null이 아니라면 로그인한 상태
		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int)httpSession.getAttribute("loginedMemberId");
		}
		
		this.isLogined = isLogined;
		this.loginedMemberId = loginedMemberId;
		
	}
	
}

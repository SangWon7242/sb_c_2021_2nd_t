package com.psw.exam.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psw.exam.demo.service.MemberService;
import com.psw.exam.demo.util.Ut;
import com.psw.exam.demo.vo.Member;

@Controller
public class UsrMemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNo,
			String email) {
		
		// Ut.empty 함수는 입력 값이 비어있는지 체크하는 함수
		if(Ut.empty(loginId)) {
			return "loginId(을)를 입력해주세요.";
		}
		
		if(Ut.empty(loginPw)) {
			return "loginPw(을)를 입력해주세요.";
		}
		
		if(Ut.empty(name)) {
			return "name(을)를 입력해주세요.";
		}
		
		if(Ut.empty(nickname)) {
			return "nickname(을)를 입력해주세요.";
		}
		
		if(Ut.empty(cellphoneNo)) {
			return "cellphoneNo(을)를 입력해주세요.";
		}
		
		if(Ut.empty(email)) {
			return "email(을)를 입력해주세요.";
		}
		
		int id = memberService.join(loginId, loginPw, name, nickname, cellphoneNo, email);
		// 성공하면 1 이상의 숫자, 실패하면 -1이 리턴
		
		
		if( id == -1) {
			return Ut.f("해당 로그인아이디(%s)는 이미 사용중입니다.", loginId);
		}
		
		if( id == -2) {
			return Ut.f("해당 이름(%s)과 이메일(%s)는 이미 사용중입니다.", name, email);
		}
		
		Member member = memberService.getMemberById(id);

		return member;
	}

}
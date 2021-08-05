package com.psw.exam.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psw.exam.demo.repository.MemberRepository;
import com.psw.exam.demo.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	public int join(String loginId, String loginPw, String name, String nickname, String cellphoneNo,
			String email) {
		
		// 로그인아이디 중복체크
		Member oldMember = getMemberByLoginId(loginId);
		
		if(oldMember != null) {
			return -1;
		}
		
		// 이름, 이메일 중복체크
		oldMember = getMemberByNameAndEmail(name, email);
		
		if(oldMember != null) {
			return -2;
		}
		
		memberRepository.getMember(loginId, loginPw, name, nickname, cellphoneNo, email);
		return memberRepository.getLastInsertId();
	}
	
	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
	// lgoinId를 repository에 요청
	private Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}
	
	// name, email을 repository에 요청
	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

}

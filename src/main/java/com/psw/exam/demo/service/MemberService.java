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
		
		Member oldmember = getMemberByLoginId(loginId);
		
		if(oldmember != null) {
			return -1;
		}
		
		memberRepository.getMember(loginId, loginPw, name, nickname, cellphoneNo, email);
		return memberRepository.getLastInsertId();
	}
	
	private Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberById(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

}

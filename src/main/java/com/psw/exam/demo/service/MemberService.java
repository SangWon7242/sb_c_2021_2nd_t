package com.psw.exam.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psw.exam.demo.repository.MemberRepository;
import com.psw.exam.demo.util.Ut;
import com.psw.exam.demo.vo.Member;
import com.psw.exam.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNo,
			String email) {
		
		// 로그인아이디 중복체크
		Member oldMember = getMemberByLoginId(loginId);
		
		if(oldMember != null) {
			return ResultData.from("F-7", Ut.f("해당 로그인아이디(%s)는 이미 사용중입니다.", loginId));
		}
		
		// 이름, 이메일 중복체크
		oldMember = getMemberByNameAndEmail(name, email);
		
		if(oldMember != null) {
			return ResultData.from("F-8", Ut.f("해당 이름(%s)과 이메일(%s)는 이미 사용중입니다.", name, email));
		}
		
		memberRepository.getMember(loginId, loginPw, name, nickname, cellphoneNo, email);
		int id = memberRepository.getLastInsertId();
		
		return ResultData.from("S-1", "회원가입이 완료되었습니다.", "id", id);
	}
	
	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
	// lgoinId를 repository에 요청
	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}
	
	// name, email을 repository에 요청
	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	public ResultData modify(int id, String loginPw, String name, String nickname, String email,
			String cellphoneNo) {
		
		memberRepository.modify(id, loginPw, name, nickname, email, cellphoneNo);
		
		return ResultData.from("S-1", "회원정보가 수정되었습니다."); 
	}

}

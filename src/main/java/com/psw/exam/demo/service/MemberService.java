package com.psw.exam.demo.service;

import com.psw.exam.demo.repository.MemberRepository;
import com.psw.exam.demo.util.Ut;
import com.psw.exam.demo.vo.Member;
import com.psw.exam.demo.vo.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	private AttrService attrService;
	private MailService mailService;

	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;
	@Value("${custom.needToChangePasswordFreeDays}")
	private int needToChangePasswordFreeDays;

	public MemberService(MailService mailService, AttrService attrService, MemberRepository memberRepository) {
		this.mailService = mailService;
		this.attrService = attrService;
		this.memberRepository = memberRepository;
	}
	
	public int getNeedToChangePasswordFreeDays() {
		return needToChangePasswordFreeDays;
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNo,
			String email) {

		// 로그인아이디 중복체크
		Member oldMember = getMemberByLoginId(loginId);

		if (oldMember != null) {
			return ResultData.from("F-7", Ut.f("해당 로그인아이디(%s)는 이미 사용중입니다.", loginId));
		}

		// 이름, 이메일 중복체크
		oldMember = getMemberByNameAndEmail(name, email);

		if (oldMember != null) {
			return ResultData.from("F-8", Ut.f("해당 이름(%s)과 이메일(%s)는 이미 사용중입니다.", name, email));
		}

		memberRepository.getMember(loginId, loginPw, name, nickname, cellphoneNo, email);
		int id = memberRepository.getLastInsertId();
 
		return ResultData.from("S-1", "회원가입이 완료되었습니다.", "id", id);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	// loginId를 repository에 요청
	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	// name, email을 repository에 요청
	public Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	public ResultData modify(int id, String loginPw, String name, String nickname, String email, String cellphoneNo) {

		memberRepository.modify(id, loginPw, name, nickname, email, cellphoneNo);

		if (loginPw != null) {
			setNeedToChangePasswordLater(id);
			attrService.remove("member", id, "extra", "useTempPassword");
		}

		return ResultData.from("S-1", "회원정보가 수정되었습니다.");
	}

	public String genMemberModifyAuthKey(int actorId) {
		String memberModifyAuthKey = Ut.getTempPassword(10);

		attrService.setValue("member", actorId, "extra", "memberModifyAuthKey", memberModifyAuthKey,
				Ut.getDateStrLater(60 * 5));

		return memberModifyAuthKey;
	}

	public ResultData checkMemberModifyAuthKey(int actorId, String memberModifyAuthKey) {
		String saved = attrService.getValue("member", actorId, "extra", "memberModifyAuthKey");

		if (!saved.equals(memberModifyAuthKey)) {
			return ResultData.from("F-1", "일치하지 않거나 만료되었습니다.");
		}

		return ResultData.from("S-1", "정상적인 코드입니다.");
	}

	public ResultData join(int id, String loginId, String loginPw, String name, String nickname, String email,
			String cellphoneNo) {
		memberRepository.join(id, loginId, loginPw, name, nickname, email, cellphoneNo);
		
		setNeedToChangePasswordLater(id);

		return ResultData.from("S-1", "회원가입이 완료되었습니다.");
	}

	private void setNeedToChangePasswordLater(int id) {
		int days = getNeedToChangePasswordFreeDays();		
		attrService.setValue("member", id, "extra", "needToChangePassword", "0", Ut.getDateStrLater(60 * 60 * 24 * days));		
	}

	public ResultData notifyTempLoginPwByEmail(Member actor) {
		String title = "[" + siteName + "] 임시 패스워드 발송";
		String tempPassword = Ut.getTempPassword(6);
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a href=\"" + siteMainUri + "/usr/member/login\" target=\"_blank\">로그인 하러가기</a>";

		ResultData sendResultData = mailService.send(actor.getEmail(), title, body);

		if (sendResultData.isFail()) {
			return sendResultData;
		}

		// 고객한테는 패스워드 원문을 보내주고 DB 저장할 때는 암호화 해서 저장.
		tempPassword = Ut.sha256(tempPassword);

		setTempPassword(actor, tempPassword);

		return ResultData.from("S-1", "계정의 이메일주소로 임시 패스워드가 발송되었습니다.");
	}

	private void setTempPassword(Member actor, String tempPassword) {
		attrService.setValue("member", actor.getId(), "extra", "useTempPassword", "1", null);

		memberRepository.modify(actor.getId(), tempPassword, null, null, null, null);
	}

	public boolean usingTempPassword(int id) {
		return attrService.getValue("member", id, "extra", "useTempPassword").equals("1");
	}

	public boolean needToChangePassword(int id) {
		return attrService.getValue("member", id, "extra", "needToChangePassword").equals("0") == false;
	}

}

\<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="비밀번호 확인" />
<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	let MemberCheckPassword__submitFormDone = false;
	
	function MemberCheckPassword__submitForm(form) {
		if (MemberCheckPassword__submitFormDone) {
			return;
		}
		
		form.loginPwInput.value = form.loginPwInput.value.trim();
		
		if (form.loginPwInput.value.length == 0) {
			alert('로그인비밀번호을 입력해주세요.');
			form.loginPwInput.focus();
			return;
		}
		
		form.loginPw.value = sha256(form.loginPwInput.value);
		form.loginPwInput.value = '';
		
		MemberCheckPassword__submitFormDone = true;
		form.submit();
	}
</script>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST" action="../member/doCheckPassword"
      onsubmit="MemberCheckPassword__submitForm(this); return false;">
      <input type="hidden" name="replaceUri" value="${param.replaceUri}" />
      <input type="hidden" name="loginPw" />
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
          <tr>
            <th>로그인 아이디</th>
            <td>${rq.loginedMember.loginId}</td>
          </tr>

          <tr>
            <th>로그인 비밀번호</th>
            <td>
              <input name="loginPwInput" class="w-96 input input-bordered" type="password" name="loginPwInput"
                placeholder="로그인비밀번호" required="required" />
            </td>
          </tr>

          <tr>
            <th>비밀번호 확인</th>
            <td>
              <button type="submit" class="btn btn-primary">비밀번호 확인</button>
              <button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>
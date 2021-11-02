<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	let MemberLogin__submitFormDone = false;

	function MemberLogin__submitForm(form) {
		if (MemberLogin__submitFormDone) {
			return;
		}

		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			alert('로그인아이디를 입력해주세요.');
			form.loginId.focus();
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

		form.submit();
		MemberLogin__submitFormDone = true;
	}
</script>

<section class="mt-36 section section-login flex flex-grow items-center justify-center">
  <div class="flex-grow max-w-md px-2 pt-4">
    <form class="flex flex-col" method="POST" action="../member/doLogin"
      onsubmit="MemberLogin__submitForm(this); return false;">
      <input type="hidden" name="redirectUri" value="${param.afterLoginUri}"/>
      <input type="hidden" name="loginPw" />
      <table>
        <div class="form-control">
          <label class="label">
            <span class="label-text">로그인 아이디</span>
          </label>
          <input name="loginId" class="input input-bordered" maxlength="20" type="text" placeholder="로그인아이디" />
        </div>
        
        <div class="form-control">
          <label class="label">
            <span class="label-text">로그인 비밀번호</span>
          </label>
          <input name="loginPwInput" class="input input-bordered" maxlength="20" type="password" 
                placeholder="로그인비밀번호" />
        </div>
        
        <div class="btns mt-3 flex justify-center px-1">
          <input class="btn btn-primary w-1/2" type="submit" value="로그인"/>
          <div class="w-2 flex-shrink-0"></div>
          <button type="button" class="btn btn-outline btn-secondary w-1/2" onclick="history.back();">뒤로가기</button>
        </div>
        
        <div class="btns mt-3 flex justify-center">
          <a href="../member/findLoginId" class="btn btn-link">아이디 찾기</a>
          <a href="../member/findLoginPw" class="btn btn-link">비밀번호 찾기</a>
        </div>
        
      </table>
    </form>
  </div>
</section>


<%@ include file="../common/foot.jspf"%>
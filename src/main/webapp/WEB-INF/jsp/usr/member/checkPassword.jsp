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
  <div class="px-10">
    <form method="POST" action="../member/doCheckPassword"
      onsubmit="MemberCheckPassword__submitForm(this); return false;">
    <input type="hidden" name="replaceUri" value="${param.replaceUri}" />
      <input type="hidden" name="loginPw" />
      
    <div class="grid-cols-4 bg-white gap-2 p-4 rounded-xl">
      <div class="md:col-span-3 h-auto shadow-xl p-4 space-y-2 p-3">
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">LOGIN_ID:</span>
          <input
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="text" value="${rq.loginedMember.loginId}" readonly />
        </div>
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">LOGIN_PW:</span>
          <input name="loginPwInput"
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="password" placeholder="로그인비밀번호" required="required" />
        </div>
      </div>

      <div class="btns mt-5 flex justify-end gap-3">
        <button type="submit" class="btn btn-primary">비밀번호 확인</button>
        <button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
      </div>
    </div>
    </form>
  </div>

</section>

<%@ include file="../common/foot.jspf"%>
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
  <!-- component -->
  <!-- This is an example component -->
  <form id="whoobe-t7qyk"
    class="justify-center items-center w-full shadow rounded-lg bg-white px-6 flex flex-col md:w-1/2 lg:w-1/3 m-auto"
    method="POST" action="../member/doLogin" onsubmit="MemberLogin__submitForm(this); return false;">
    <input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />
    <input type="hidden" name="loginPw" />

    <h2 class="font-bold text-2xl my-4">Login</h2>
    <div id="whoobe-h90kl" class="w-full p-2 justify-start flex flex-col">
      <div id="whoobe-7izhv" class=" flex flex-row">
        <span id="whoobe-plfl9"
          class="z-highest rounded-l-lg w-10 h-10 flex justify-center items-center text-2xl text-gray-400 border border-r-0"
          mode="render" block="">
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
            role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 26 26"
            class="iconify iconify--wpf">
              <path
              d="M16.563 15.9c-.159-.052-1.164-.505-.536-2.414h-.009c1.637-1.686 2.888-4.399 2.888-7.07c0-4.107-2.731-6.26-5.905-6.26c-3.176 0-5.892 2.152-5.892 6.26c0 2.682 1.244 5.406 2.891 7.088c.642 1.684-.506 2.309-.746 2.397c-3.324 1.202-7.224 3.393-7.224 5.556v.811c0 2.947 5.714 3.617 11.002 3.617c5.296 0 10.938-.67 10.938-3.617v-.811c0-2.228-3.919-4.402-7.407-5.557z"
              fill="currentColor">  
              </path>
            </svg>
        </span>
        <input class="border border-gray-200 rounded-r-lg outline-none focus:ring-1 ring-blue-400 w-full pl-1"
          name="loginId" maxlength="20" type="text" placeholder="userId">
      </div>

      <div id="whoobe-l6k6r" class="my-4 flex flex-row">
        <span id="whoobe-4occ6"
          class="z-highest rounded-l-lg w-10 h-10 flex justify-center items-center text-2xl text-gray-400 border border-r-0"
          mode="render" block="">
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
            role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 32 32"
            class="iconify iconify--carbon">
              <path
              d="M21 2a8.998 8.998 0 0 0-8.612 11.612L2 24v6h6l10.388-10.388A9 9 0 1 0 21 2zm0 16a7.013 7.013 0 0 1-2.032-.302l-1.147-.348l-.847.847l-3.181 3.181L12.414 20L11 21.414l1.379 1.379l-1.586 1.586L9.414 23L8 24.414l1.379 1.379L7.172 28H4v-3.172l9.802-9.802l.848-.847l-.348-1.147A7 7 0 1 1 21 18z"
              fill="currentColor">
              </path>
              <circle cx="22" cy="10" r="2" fill="currentColor">
              </circle>
            </svg>
        </span>
        <input name="loginPwInput"
          class="h-10 border border-gray-200 rounded-r-lg outline-none focus:ring-1 ring-blue-300 w-full pl-1"
          type="password" maxlength="20" placeholder="password">
      </div>
      <button value="로그인" type="submit" class="px-4 py-2 rounded bg-blue-400 text-white hover:bg-blue-700 my-4 w-full"
        id="whoobe-ibemp">Login</button>
    </div>
  </form>

</section>

<div class="btns mt-3 font-bold flex items-cneter justify-center gap-3">
  <a href="../member/findLoginId" class="hover:underline">아이디 찾기</a>
  <a href="../member/findLoginPw" class="hover:underline">비밀번호 찾기</a>
</div>


<%@ include file="../common/foot.jspf"%>
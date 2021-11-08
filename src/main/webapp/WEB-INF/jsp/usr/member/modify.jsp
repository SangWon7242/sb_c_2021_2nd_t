<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원정보수정" />
<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	let MemberModify__submitDone = false;

	function MemberModify__submit(form) {
		if (MemberModify__submitDone) {
			return;
		}

		form.loginPwInput.value = form.loginPwInput.value.trim();

		if (form.loginPwInput.value.length > 0) {
			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

			if (form.loginPwConfirm.value.length == 0) {
				alert('비밀번호확인을 입력해주세요.')
				form.loginPwConfirm.focus();

				return;
			}

			if (form.loginPwInput.value != form.loginPwConfirm.value) {
				alert('비밀번호확인이 일치하지 않습니다.');
				form.loginPwConfirm.focus();

				return;
			}
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.')
			form.name.focus();

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			alert('별명을 입력해주세요.')
			form.nickname.focus();

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.')
			form.email.focus();

			return;
		}

		form.cellphoneNo.value = form.cellphoneNo.value.trim();

		if (form.cellphoneNo.value.length == 0) {
			alert('휴대전화번호를 입력해주세요.')
			form.cellphoneNo.focus();

			return;
		}
		
		if ( form.loginPwInput.value.length > 0 ) {
	        form.loginPw.value = sha256(form.loginPwInput.value);
	        form.loginPwInput.value = '';
	        form.loginPwConfirm.value = '';
	    }

		MemberModify__submitDone = true;
		form.submit();
	}
</script>

<section class="grid min-h-screen place-items-center">
      <div class="w-11/12 p-12 bg-white sm:w-8/12 md:w-1/2 lg:w-5/12">
        <h1 class="text-xl font-semibold">Edit member information </br> <span class="font-normal">please fill in your information to continue</span></h1>
        
        <form method="POST" action="../member/doModify"
      onsubmit="MemberModify__submit(this); return false;">
      <input type="hidden" name="memberModifyAuthKey" value="${param.memberModifyAuthKey}"/>
      <input type="hidden" name="loginPw" />
        
          <label for="loginId" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">Login_id</label>
          <input id="loginId" type="text" name="loginId" value="${rq.loginedMember.loginId}" autocomplete="loginId" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <label for="password" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">New Password</label>
          <input id="password" type="password" name="loginPwInput" placeholder="********" autocomplete="new-password" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <label for="password-confirm" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">Confirm New password</label>
          <input id="password-confirm" type="password" name="loginPwConfirm" placeholder="********" autocomplete="new-password" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <label for="name" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">name</label>
          <input id="name" type="text" name="name" value="${rq.loginedMember.name}" autocomplete="name" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <label for="nickname" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">Nickname</label>
          <input id="nickname" type="text" name="nickname" value="${rq.loginedMember.nickname}" autocomplete="nickname" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <label for="email" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">E-mail</label>
          <input id="email" type="email" name="email" value="${rq.loginedMember.email}" autocomplete="email" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <label for="tel" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">cellphone-no</label>
          <input id="tel" type="tel" name="cellphoneNo" value="${rq.loginedMember.cellphoneNo}"  autocomplete="cellphoneNo" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />

          <button type="submit" class="w-full py-3 mt-6 font-medium tracking-widest text-white uppercase bg-black shadow-lg focus:outline-none hover:bg-gray-900 hover:shadow-none">
            회원정보수정
          </button>

          <p class="flex justify-between inline-block mt-4 text-xs text-gray-500 cursor-pointer hover:text-black" onclick="history.back();">뒤로 가려면 클릭해주세요.</p>
        </form>
      </div>
  </section>

<%@ include file="../common/foot.jspf"%>
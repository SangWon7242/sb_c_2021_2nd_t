<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="아이디찾기" />
<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	let MemberFindLoginId__submitDone = false;

	function MemberFindLoginId__submit(form) {
		if (MemberFindLoginId__submitDone) {
			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.')
			form.name.focus();

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.')
			form.email.focus();

			return;
		}

		MemberFindLoginId__submitDone = true;
		form.submit();
	}
</script>

<section class="section section-login mt-36 flex flex-grow items-center justify-center">
  <div class="flex-grow max-w-md px-2 pt-4">
    <form class="flex flex-col" method="POST" action="../member/doFindLoginId"
      onsubmit="MemberFindLoginId__submit(this); return false;">
      <input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />

      <table>
        <tbody>
          <div class="form-control">
            <label class="label">
              <span class="label-text">이름</span>
            </label>
            <input class="input input-bordered" name="name" placeholder="이름을 입력해주세요." type="text" />
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">이메일</span>
            </label>
            <input class="input input-bordered" name="email" placeholder="이메일을 입력해주세요." type="email" />
          </div>

          <div class="btns mt-3 flex justify-end">
            <input class="btn btn-primary w-full" type="submit" value="아이디 찾기" />
          </div>

          <div class="btns mt-3 font-bold flex items-cneter justify-center gap-3">
            <a href="../member/login" class="hover:underline">로그인</a>
            <a href="../member/findLoginPw" class="hover:underline">비밀번호 찾기</a>
          </div>

        </tbody>
      </table>
    </form>
  </div>
</section>


<%@ include file="../common/foot.jspf"%>
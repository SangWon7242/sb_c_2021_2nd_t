<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="비밀번호찾기" />
<%@ include file="../common/head.jspf"%>

<script>
	let MemberFindLoginPw__submitDone = false;

	function MemberFindLoginPw__submit(form) {
		if (MemberFindLoginPw__submitDone) {
			return;
		}

		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			alert('로그인아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.')
			form.email.focus();

			return;
		}

		MemberFindLoginPw__submitDone = true;
		form.submit();
	}
</script>

<section class="section section-login flex-grow flex items-center justify-center">
  <div class="flex-grow max-w-md px-2 pt-4">
    <form class="flex flex-col" method="POST" action="../member/doFindLoginPw"
      onsubmit="MemberFindLoginPw__submit(this); return false;">     
      <table>
        <tbody>

          <div class="form-control">
            <label class="label">
              <span class="label-text">아이디</span>
            </label>
            <input class="input input-bordered" name="loginId" placeholder="아이디를 입력해주세요." type="text" />
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">이메일</span>
            </label>
            <input class="input input-bordered" name="email" placeholder="이메일을 입력해주세요." type="email" />
          </div>

          <div class="btns mt-3 flex justify-end">
            <input class="btn btn-primary w-full" type="submit" value="비밀번호 찾기" />
          </div>

          <div class="btns mt-3 flex justify-center">
            <a href="../member/login" class="btn btn-link">로그인</a>
            <a href="../member/join" class="btn btn-link">회원가입</a>
          </div>

        </tbody>
      </table>
    </form>
  </div>
</section>


<%@ include file="../common/foot.jspf"%>
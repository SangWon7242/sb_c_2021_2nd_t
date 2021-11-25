<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="상세" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../../common/toastUiEditorLib.jspf"%>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<script>
	function ArticleDetail__increaseHitCount() {
		const localStorageKey = 'article__' + params.id + '__viewDone';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}

		localStorage.setItem(localStorageKey, true);

		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}

	$(function() {
		// 실전코드
		// ArticleDetail__increaseHitCount();

		// 임시코드
		setTimeout(ArticleDetail__increaseHitCount, 500);
	})
</script>

<section class="mt-5">
  <div class="box_article_tit flex flex-col px-24">
    <!-- 글 제목 구현 -->
    <div class="txt_sub_title text-4xl font-bold">${article.title}</div>
    <div class="sub_tit_info mt-2">
      <span class="category">
      </span>
      <p class="info_meta gap-4">
        <span class="name">by${article.extra__writerName}</span>
        <span class="regDate">${article.forPrintType2RegDate}</span>
      </p>
    </div>
    <!-- 글 제목 구현 끝 -->
  </div>
  <!-- 본문 내용 구현 -->
  <div class="box_article px-24">
    <div class="article_util">
      <div class="hidden">${article.id}</div>
      <div class="hidden">${article.hitCount}</div>

      <div class="flex items-center py-3 border-b-2 border-gray-300">
        <span class="badge badge-primary">${article.goodReactionPoint}</span>
        <span>&nbsp;</span>

        <c:if test="${actorCanMakeReaction}">
          <a
            href="/usr/reactionPoint/doGoodReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
            class="btn btn-xs btn-primary btn-outline"> 좋아요 👍 </a>
          <span>&nbsp;</span>
          <a
            href="/usr/reactionPoint/doBadReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
            class="btn btn-xs btn-secondary btn-outline"> 싫어요 👎 </a>
        </c:if>

        <!-- 좋아요 리액션 -->
        <c:if test="${actorCanCancelGoodReaction}">
          <a
            href="/usr/reactionPoint/doCancelGoodReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
            class="btn btn-xs btn-primary"> 좋아요 👍 </a>
          <span>&nbsp;</span>
          <a onclick="alert(this.title); return false;" title="먼저 좋아요를 취소해주세요." href="#"
            class="btn btn-xs btn-secondary btn-outline"> 싫어요 👎 </a>
        </c:if>

        <!-- 싫어요 리액션 -->
        <c:if test="${actorCanCancelBadReaction}">
          <a onclick="alert(this.title); return false;" title="먼저 싫어요를 취소해주세요." href="#"
            class="btn btn-xs btn-primary btn-outline"> 좋아요 👍 </a>
          <span>&nbsp;</span>
          <a
            href="/usr/reactionPoint/doCancelBadReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
            class="btn btn-xs btn-secondary"> 싫어요 👎 </a>
        </c:if>
      </div>
    </div>
    <div class="content_body mt-3">
      <div class="toast-ui-viewer">
        <script type="text/x-template">${article.body}</script>
      </div>
    </div>
    <!-- 본문 내용 구현 끝 -->
    <div class="btns">
      <c:if test="${empty param.listUri}">
        <button class="btn btn-link" type="button" onclick="history.back();">뒤로가기</button>
      </c:if>
      <c:if test="${not empty param.listUri}">
        <a class="btn btn-link" href="${param.listUri}">뒤로가기</a>
      </c:if>
      <c:if test="${article.extra__actorCanModify}">
        <a class="btn btn-link" href="../article/modify?id=${article.id}">게시물 수정</a>
      </c:if>
      <c:if test="${article.extra__actorCanDelete}">
        <a class="btn btn-link" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
          href="../article/doDelete?id=${article.id}">게시물 삭제</a>
      </c:if>
    </div>
  </div>
</section>

<script>
	// 댓글작성 관련
	let ReplyWrite__submitFormDone = false;
	function ReplyWrite__submitForm(form) {
		if (ReplyWrite__submitFormDone) {
			return;
		}

		// 좌우공백 제거
		form.body.value = form.body.value.trim();

		if (form.body.value.length == 0) {
			alert('댓글을 입력해주세요.');
			form.body.focus();
			return;
		}

		if (form.body.value.length < 2) {
			alert('댓글내용을 2자이상 입력해주세요.');
			form.body.focus();
			return;
		}

		ReplyWrite__submitFormDone = true;
		form.submit();
	}
</script>

<!-- 댓글 작성 폼 구현 -->
<section class="mt-5">
  <div class="container mx-auto px-3">
    <div>${replies.size()}개의댓글</div>
    <c:if test="${rq.logined}">
      <form class="table-box-type-1" method="POST" action="../reply/doWrite"
        onsubmit="ReplyWrite__submitForm(this); return false;">
        <input type="hidden" name="replaceUri" value="${rq.currentUri}" />
        <input type="hidden" name="relTypeCode" value="article" />
        <input type="hidden" name="relId" value="${article.id}" />
        <div class="border-0">
          <div class="py-2 flex flex-col ">
            <div class="mt-1">
              <textarea class="w-full textarea textarea-bordered" name="body" rows="5" placeholder="댓글을 작성하세요."></textarea>
            </div>
            <div class="flex flex-row">
              <div class="flex-grow"></div>
              <button type="submit" class="btn btn-primary">댓글 작성</button>
            </div>
          </div>
        </div>
      </form>
    </c:if>
    <c:if test="${rq.notLogined}">
      <div class="reply_write_inner border-2 border-gray-200 mt-2 h-14">
        <div class="reply_inbox flex py-3 ml-4">
          <label for="reply_textarea">
            댓글을 작성하려면&nbsp;
            <a class="link link-primary" href="${rq.loginUri}">로그인</a>
            &nbsp; 해주세요.
          </label>
        </div>
      </div>
    </c:if>
  </div>
</section>
<!-- 댓글 작성 폼 구현 끝 -->

<!-- 댓글 리스트 구현 -->
<section class="mt-5">
  <div class="container mx-auto px-3">
    <div class="reply-form flex flex-col mx-auto px-6">
      <c:forEach var="reply" items="${replies}">
        <div class="reply-info mt-2">
          <div class="profill flex gap-3">
            <div class="text-6xl">
              <i class="fas fa-user-circle"></i>
            </div>
            <div class="comment-info mt-1">
              <div class="username font-bold text-lg">${reply.extra__writerName}</div>
              <div class="regDate text-lg">${reply.forPrintType1RegDate}</div>
              <div class="updateDate text-lg hidden">${reply.forPrintType1RegDate}</div>
            </div>
            <div class="btns font-bold mt-1 flex gap-3">
              <c:if test="${reply.extra__actorCanModify}">
                <a class="hover:underline" href="../reply/modify?id=${reply.id}&replaceUri=${rq.encodedCurrentUri}">수정</a>
              </c:if>
              <c:if test="${reply.extra__actorCanDelete}">
                <a class="hover:underline" onclick="if (confirm('정말 삭제하시겠습니까?') == flase) return false;"
                  href="../reply/doDelete?id=${reply.id}&replaceUri=${rq.encodedCurrentUri}">삭제</a>
              </c:if>
            </div>
          </div>
        </div>
        <div class="reply-body py-3 text-xl">${reply.forPrintBody}</div>
        <div class="py-1 border-b-2 border-gray-300"></div>
      </c:forEach>
    </div>
  </div>
</section>
<!-- 댓글 리스트 구현 끝 -->

<%@ include file="../common/foot.jspf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name} 게시물 리스트"/>
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <div>게시물 개수 : ${articlesCount}개</div>
    <div class="table-box-type-1">
      <table>
        <colgroup>
          <col width="50" />
          <col width="150" />
          <col width="150" />
          <col width="150" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>번호</th>
            <th>작성날짜</th>
            <th>수정날짜</th>
            <th>작성자</th>
            <th>제목</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="article" items="${articles}">
            <tr>
              <td>${article.id}</td>
              <td>${article.regDate.substring(2, 16)}</td>
              <td>${article.updateDate.substring(2, 16)}</td>
              <td>${article.extra__writerName}</td>
              <td>
                <a class="btn-text-link" href="../article/detail?id=${article.id}">${article.title}</a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="page-menu mt-3">
      <div class="btn-group justify-center">
        <c:set var="pageMenuArmLen" value="6" /> <!-- 좌우 6칸을 보여줌 -->
        <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
        <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
        
        <c:if test="${startPage > 1}">
          <a class="btn btn-sm" href="?page=1&boardId=${boardId}">1</a>
          <c:if test="${startPage > 2}">          
            <a class="btn btn-sm btn-disabled">...</a>
          </c:if>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
          <a class="btn btn-sm ${page == i ? 'btn-active' : ''}" href="?page=${i}&boardId=${boardId}">${i}</a>          
        </c:forEach>
        <c:if test="${endPage < pagesCount}">
          <c:if test="${endPage < pagesCount - 1}">
            <a class="btn btn-sm btn-disabled">...</a>
          </c:if> 
          <a class="btn btn-sm" href="?page=${pagesCount}&boardId=${boardId}">${pagesCount}</a>
        </c:if>
      </div>
    </div>
    
    <!-- search{s} -->

    <div class="form-group row justify-center">
      <div class="w100" style="padding-right:10px">
        <select class="form-control form-control-sm" name="searchType" id="searchType">
          <option value="title">제목</option>
          <option value="Content">본문</option>
          <option value="reg_id">작성자</option>
        </select>
      </div>

      <div class="w300" style="padding-right:10px">
        <input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
      </div>
      <div>
        <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
      </div>
    </div>
    <!-- search{e} -->

  </div>
</section>   

<%@ include file="../common/foot.jspf"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시물 작성" />
<%@ include file="../common/head.jspf"%>

<section class="mt-3">
  <!-- component -->
  <div class="py-8">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
        <div class="p-6 bg-white border-b border-gray-200">
          <form method="POST" action="../article/doWrite">
            <div class="mb-4">
              <label class="text-xl text-gray-600">
                게시판
                <span class="text-red-500">*</span>
              </label>
              </br>
              <select class="border-2 border-gray-300 p-2 w-full" name="boardId">
                <option disabled="disabled" selected="selected">게시판을 선택해주세요.</option>
                <option value="1">공지</option>
                <option value="2">자유</option>
              </select>
            </div>

            <div class="mb-4">
              <label class="text-xl text-gray-600">
                제목
                <span class="text-red-500">*</span>
              </label>
              </br>
              <input type="text" class="border-2 border-gray-300 p-2 w-full" name="title" id="title" value="" required>
            </div>

            <div class="mb-5">
              <label class="text-xl text-gray-600">
                내용
                <span class="text-red-500">*</span>
              </label>
              </br>
              <textarea name="body" class="border-2 border-gray-500">
                                
                            </textarea>
            </div>

            <div class="flex justify-end p-1">
              <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-base px-5 py-2.5 text-center required">작성</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

<script>
	CKEDITOR.replace('body');
</script>

<%@ include file="../common/foot.jspf"%>
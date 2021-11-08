<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.psw.exam.demo.util.Ut"%>

<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">

  <!-- component -->
  <!-- Profile Card -->
  <div class="px-10">
    <div class="grid-cols-4 bg-white gap-2 p-4 rounded-xl">
      <div class="md:col-span-3 h-auto shadow-xl p-4 space-y-2 p-3">
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">LOGINID:</span>
          <input
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="text" value="${rq.loginedMember.loginId}" readonly />
        </div>
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">Name:</span>
          <input
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="text" value="${rq.loginedMember.name}" readonly />
        </div>
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">Email:</span>
          <input
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="text" value="${rq.loginedMember.email}" readonly />
        </div>
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">NICKNAME:</span>
          <input
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="text" value="${rq.loginedMember.nickname}" readonly />
        </div>
        <div class="flex ">
          <span
            class="text-sm border bg-blue-50 font-bold uppercase border-2 rounded-l px-4 py-2 bg-gray-50 whitespace-no-wrap w-2/6">CELLPHONE-NO:</span>
          <input
            class="px-4 border-l-0 cursor-default border-gray-300 focus:outline-none  rounded-md rounded-l-none shadow-sm -ml-1 w-4/6"
            type="tel" value="${rq.loginedMember.cellphoneNo}" readonly />
        </div>
      </div>

      <div class="btns mt-5 flex justify-end gap-3">
        <a href="../member/checkPassword?replaceUri=${Ut.getUriEncoded('../member/modify')}" class="btn btn-primary">회원정보
          수정</a>
        <button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
      </div>
    </div>
  </div>

</section>

<%@ include file="../common/foot.jspf"%>
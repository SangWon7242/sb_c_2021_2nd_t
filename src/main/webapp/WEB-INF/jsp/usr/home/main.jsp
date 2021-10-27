<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="m-8 flex justify-center">
    <div class="flex">
      <a href="/">
        <img src="https://picsum.photos/id/1005/400/250" class="rounded-lg">
      </a>
      <div class="ml-5 flex-row">
        <div class="h-32">
          <div class="flex mt-5 font-bold text-3xl">
            <a href="/">초급개발자로 전직중</a>
          </div>
          <div class="mt-3 text-xl">백엔드 개발자입니다. 풀스텍을 목표로 공부중입니다.</div>
        </div>
        <div class="links mt-5 flex">
          <a href="https://github.com/SangWon7242" class="text-2xl hover:text-gray-300">
            <span class="text-xl">
              <i class="fab fa-github"></i>
            </span>
            <span class="font-bold text-xl">GITHUB</span>
          </a>
          <a href="https://www.youtube.com/user/gotkdqja/videos" class="ml-3 text-2xl hover:text-gray-300">
            <span class="text-xl">
              <i class="fab fa-youtube"></i>
            </span>
            <span class="font-bold text-xl">YOUTUBE</span>
          </a>
          <a href="https://www.instagram.com/sang_1won/" class="ml-3 text-2xl hover:text-gray-300">
            <span class="text-xl">
              <i class="fab fa-instagram"></i>
            </span>
            <span class="font-bold text-xl">INSTAGRAM</span>
          </a>
        </div>
      </div>
    </div>
  </div>


  <div class="container mx-auto px-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci inventore
    saepe molestias possimus tempora explicabo placeat. Animi maxime blanditiis quidem nam cum id fugit voluptatem
    perferendis unde accusamus iure ex!</div>


</section>


<%@ include file="../common/foot.jspf"%>

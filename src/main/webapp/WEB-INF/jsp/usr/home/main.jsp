<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />
<%@ include file="../common/head.jspf"%>

<section class="section section-1 mt-5 lg:mt-16 flex justify-center">
  <div class="flex flex-row">
    <div class="flex flex-glow w-full h-auto">
      <div class="info-box">
        <div class="flex flex-row justify-center">
          <div class="profile-img mt-3 ml-5 hidden lg:inline-block">
            <a href="/">
              <img src='https://ifh.cc/g/NbEFOj.jpg' class="rounded-full h-24 w-24">
            </a>
          </div>
          <div class="ml-5 mt-5 flex flex-col">
            <div class="text-lg font-bold lg:text-2xl">
              <a href="/">초급개발자로 전직중</a>
            </div>
            <div class="text-base mt-2 lg:text-xl">백엔드 개발자입니다. 풀스텍을 목표로 공부중입니다.</div>
            <div class="mt-2 border-b-2"></div>
            <div class="gap-10 Links mt-1 flex flex-row justify-center lg:gap-4">
              <a href="https://github.com/SangWon7242" class="text-2xl hover:text-gray-300 hover:text-gray-300">
                <span class="text-xl">
                  <i class="fab fa-github"></i>
                </span>
                <span class="text-base font-bold lg:text-xl lg:inline-block">GITHUB</span>
              </a>
              <a href="https://www.youtube.com/user/gotkdqja/videos" class="ml-3 text-2xl hover:text-gray-300">
                <span class="text-xl">
                  <i class="fab fa-youtube"></i>
                </span>
                <span class="text-base font-bold lg:text-xl lg:inline-block">YOUTUBE</span>
              </a>
              <a href="https://www.instagram.com/sang_1won/" class="ml-3 text-2xl hover:text-gray-300">
                <span class="text-xl">
                  <i class="fab fa-instagram"></i>
                </span>
                <span class="text-base font-bold lg:text-xl lg:inline-block">INSTAGRAM</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section section-2 mt-5 lg:mt-16 flex justify-center">
  <div class="flex flex-row">
    <div class="flex-glow w-screen h-auto">
      <div class="flex flex-col items-center mt-5 h-auto bg-gray-100">
        <div class="mt-4 lg:mt-7 border-b-4">
          <div class="font-bold py-2 text-xl lg:text-3xl">Skills</div>
        </div>
        <div class="Backend-Skills mx-3 mt-4 lg:mt-10">
          <div class="font-bold text-xl text-center border-b-2">Backend</div>
          <div
            class="Backend-Skills-Icon mt-1 lg:mt-2 flex flex-wrap justify-center items-center lg:flex lg:flex-row gap-3 lg:gap-1">
            <div class="java bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex justify-center"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-14 lg:w-24">
                <img src='https://ifh.cc/g/H5ppSw.png'>
              </span>
            </div>
            <div class="MySql bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex justify-center ml-2 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/aIgnYa.png'>
              </span>
            </div>
            <div class="Jsp bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex justify-center ml-2 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/a12FhJ.png'>
              </span>
            </div>
            <div class="C-lang bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex justify-center ml-2 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/Ki2VGt.png'>
              </span>
            </div>
            <div class="C-flus bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex justify-center ml-2 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/G3BF7n.png' />
              </span>
            </div>
            <div class="Python bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex justify-center ml-2 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/WrXRGp.png' />
              </span>
            </div>
          </div>
        </div>

        <div class="Front-Skills mx-3 mt-4 lg:mt-10">
          <div class="font-bold text-xl text-center border-b-2">Frontend</div>
          <div
            class="Front-Skills-Icon mt-1 lg:mt-2 flex flex-wrap justify-center items-center lg:flex lg:flex-row gap-3 lg:gap-1">
            <div class="HTML bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-20 lg:w-28">
                <img src='https://ifh.cc/g/gs7bvK.png' />
              </span>
              <span class="font-bold text-xl lg:text-2xl">HTML</span>
            </div>
            <div
              class="CSS bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-20 lg:w-28">
                <img src='https://ifh.cc/g/D5uzcC.png' />
              </span>
              <span class="font-bold text-xl lg:text-2xl">CSS</span>
            </div>
            <div
              class="JS bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-20 lg:w-28">
                <img src='https://ifh.cc/g/GmRXwF.png' />
              </span>
              <span class="mt-3 font-bold text-xl lg:text-2xl">JS</span>
            </div>
            <div
              class="React bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="React items-center justify-center w-20 lg:w-28">
                <img src='https://ifh.cc/g/S3CdTr.png' />
              </span>
            </div>
          </div>
        </div>

        <div class="Devops-Skills mx-3 mt-4 lg:mt-10 mb-5">
          <div class="font-bold text-xl text-center border-b-2">Devops</div>
          <div
            class="Devops-Skills-Icon mt-1 lg:mt-2 flex flex-wrap justify-center items-center lg:flex lg:flex-row gap-3 lg:gap-1">
            <div class="Github bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-20 lg:w-28">
                <img src='https://ifh.cc/g/Knqri2.png' />
              </span>
              <span class="font-bold text-base lg:text-2xl">Github</span>
            </div>
            <div
              class="Linux bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center  w-20 lg:w-28">
                <img src='https://ifh.cc/g/GzOyNY.png' />
              </span>
              <span class="font-bold text-base lg:text-2xl">Git</span>
            </div>
            <div
              class="Ubuntu bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-20 lg:w-24">
                <img src='https://ifh.cc/g/xniAIu.png' />
              </span>
              <span class="mt-3 font-bold text-base lg:text-2xl">VSC</span>
            </div>
            <div
              class="Maven bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="Maven items-center justify-center w-20 lg:w-28">
                <img src='https://ifh.cc/g/89ZcDI.png' />
              </span>
              <span class="mt-2 font-bold text-base lg:text-2xl">Maven</span>
            </div>
          </div>
        </div>

      </div>
      <div></div>
    </div>
  </div>
</section>

<section class="section section-3 flex justify-center">
  <div class="ProJects mx-1 mt-2 flex flex-col items-center gap-3">
    <div class="mt-2 lg:mt-4 flex justify-center border-b-4">
      <div class="font-bold py-2 text-xl lg:text-3xl">ProJects</div>
    </div>
    <div
      class="Projects-list mt-1 lg:mt-2 flex flex-wrap justify-center items-center lg:flex lg:flex-row gap-3 lg:gap-7">
      <div class="project-1 bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center"
        style="box-shadow: 3px 3px 3px;">
        <a href="#"></a>
      </div>
      <div
        class="project-2 bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
        style="box-shadow: 3px 3px 3px;">
        <a href="#"></a>
      </div>
      <div
        class="project-3 bg-white w-32 h-32 lg:h-44 lg:w-40 rounded-xl flex flex-col items-center justify-center ml-1 lg:ml-3"
        style="box-shadow: 3px 3px 3px;">
        <a href="#"></a>
      </div>
    </div>
  </div>
</section>

<footer class="Copyright flex items-center justify-center h-28 bg-black p-2 pin-b mt-10 bottom-0">
  <div class="font-bold text-sm text-gray-300">
    Copyright ⓒ 2021
    <span class="text-green-300">SWPARK</span>
    All Rights Reserved.
  </div>
</footer>

<%@ include file="../common/foot.jspf"%>

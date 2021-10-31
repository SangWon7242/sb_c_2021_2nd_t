<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />
<%@ include file="../common/head.jspf"%>

<section class="section section-1 mt-16 flex justify-center">
  <div class="flex flex-row">
    <div class="flex flex-glow w-full h-auto">
      <div class="info-box">
        <div class="flex flex-row justify-center">
          <div class="mt-3 ml-5">
            <a href="/">
              <img src='https://ifh.cc/g/NbEFOj.jpg' class="rounded-full h-24 w-24">
            </a>
          </div>
          <div class="ml-5 mt-5 flex flex-col">
            <div class="font-bold text-2xl">
              <a href="/">초급개발자로 전직중</a>
            </div>
            <div class="mt-2 text-xl">백엔드 개발자입니다. 풀스텍을 목표로 공부중입니다.</div>
            <div class="mt-2" style="border-bottom: 2px solid black;"></div>
            <div class="Links mt-1 flex flex-row justify-center">
              <a href="https://github.com/SangWon7242" class="text-2xl hover:text-gray-300 hover:text-gray-300">
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
    </div>
  </div>
</section>

<section class="section section-2 mt-16 flex justify-center">
  <div class="flex flex-row">
    <div class="flex-glow w-screen h-screen">
      <div class="flex flex-col items-center mt-5 h-auto bg-gray-100">
        <div class="mt-14">
          <div class="font-bold text-3xl">Skills</div>
          <div class="mt-2 h-1 w-16 bg-black"></div>
        </div>
        <div class="Backend-Skills mt-10">
          <div class="font-bold text-xl text-center" style="border-bottom: 2px solid black;">Backend</div>
          <div class="Backend-Skills-Icon mt-2 flex flex-row">
            <div class="java bg-white h-44 w-40 rounded-xl flex justify-center" style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-24">
                <img src='https://ifh.cc/g/H5ppSw.png'>
              </span>
            </div>
            <div class="MySql bg-white h-44 w-40 rounded-xl flex justify-center ml-3" style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/aIgnYa.png'>
              </span>
            </div>
            <div class="Jsp bg-white h-44 w-40 rounded-xl flex justify-center ml-3" style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/a12FhJ.png'>
              </span>
            </div>
            <div class="C-lang bg-white h-44 w-40 rounded-xl flex justify-center ml-3" style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/Ki2VGt.png'>
              </span>
            </div>
            <div class="C-flus bg-white h-44 w-40 rounded-xl flex justify-center ml-3" style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/G3BF7n.png' />
              </span>
            </div>
            <div class="Python bg-white h-44 w-40 rounded-xl flex justify-center ml-3" style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/WrXRGp.png' />
              </span>
            </div>
          </div>
        </div>

        <div class="Front-Skills mt-10">
          <div class="font-bold text-xl text-center" style="border-bottom: 2px solid black;">Frontend</div>
          <div class="Front-Skills-Icon mt-2 flex flex-row">
            <div class="HTML bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/gs7bvK.png' />
              </span>
              <span class="font-bold text-2xl">HTML</span>
            </div>
            <div class="CSS bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/D5uzcC.png' />
              </span>
              <span class="font-bold text-2xl">CSS</span>
            </div>
            <div class="JS bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/GmRXwF.png' />
              </span>
              <span class="mt-3 font-bold text-2xl">JS</span>
            </div>
            <div class="C-lang bg-white h-44 w-40 rounded-xl flex items-center justify-center ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="React items-center justify-center w-28">
                <img src='https://ifh.cc/g/S3CdTr.png' />
              </span>
            </div>
          </div>
        </div>

        <div class="Devops-Skills mt-10 mb-5">
          <div class="font-bold text-xl text-center" style="border-bottom: 2px solid black;">Devops</div>
          <div class="Devops-Skills-Icon mt-2 flex flex-row">
            <div class="Github bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center"
              style="box-shadow: 3px 3px 3px;">
              <span class="flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/Knqri2.png' />
              </span>
              <span class="font-bold text-2xl">Github</span>
            </div>
            <div class="Linux bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-28">
                <img src='https://ifh.cc/g/rAiRER.png' />
              </span>
              <span class="font-bold text-2xl">Linux</span>
            </div>
            <div class="Ubuntu bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="mt-2 flex items-center justify-center w-24">
                <img src='https://ifh.cc/g/FeQqRj.png' />
              </span>
              <span class="mt-3 font-bold text-2xl">Ubuntu</span>
            </div>
            <div class="C-lang bg-white h-44 w-40 rounded-xl flex flex-col items-center justify-center ml-3"
              style="box-shadow: 3px 3px 3px;">
              <span class="Maven items-center justify-center w-28">
                <img src='https://ifh.cc/g/89ZcDI.png' />
              </span>
              <span class="mt-2 font-bold text-2xl">Maven</span>
            </div>
          </div>
        </div>


      </div>
      <div></div>
    </div>
  </div>
</section>

<section class="section section-3 mt-16 flex justify-center">
  <div class="ProJects mt-10 mb-5">
    <div class="mt-14 flex flex-col items-center">
      <div class="font-bold text-3xl">ProJects</div>
      <div class="mt-2 h-1 w-16 bg-black"></div>
    </div>
    <div class="bg-white"></div>
  </div>
</section>

<section class="section section-4 mt-16 flex justify-center">
  <div class="Copyright w-full h-20 bg-black mt-10">
    <div class="mt-7 flex justify-center">
      <div class="font-bold text-sm text-gray-300">Copyright ⓒ 2021 <span class="text-green-300">SWPARK</span> All Rights Reserved.</div>
    </div>
    <div class="bg-black"></div>
  </div>
</section>



<%@ include file="../common/foot.jspf"%>

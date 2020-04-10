<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="./css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="./css/style.css" type="text/css"> <!-- 디자인 CSS -->
</head>
<style>
  *{
  box-sizing:border-box;
}

body{
  color:#444;
}

.inputGroup{
  width:340px;
  margin:50px auto;
  position:relative;
}

input{
  border:none;
  border-bottom:1px solid #888;
  font-size:16px;
  /* width:290px; */
  z-index:1;
  transition:all .2s;
}

input:focus{
  outline:none;
  border-bottom-width:3px;
  border-color:#D35400;
}

label{
  color:#aaa;
  position:absolute;
  left:0;
  top:0;
  opacity:0;
  z-index:0;
  visiblity:hidden;
  transition:all .5s;
}

.labelTop{
  visible:visible;
  opacity:1;
  top:-20px;
}

button {
  width:170px;
  height:35px;
  color: #212529;
  background-color: #f7f8ff;
  border-color: #f7f8ff;
}

</style>
<body>
<div id="wrap">
  <header>
    <div class="inner clfix">
      <strong class="logo"><a href="#none">PICK ME</a></strong>
      <nav class="gnb">
        <a href="#none">채용탐색</a>
        <a href="#none">이력서</a>
        <a href="#none">지원현황</a>
        <a href="#none">고객센터</a>
      </nav><!-- // gnb -->
      <ul class="header_infoBtn clfix">
        <li><button type="button" id="searchBtn"></button></li>
        <li><span><a href="#none">로그인</a> / <a href="#none">회원가입</a></span></li>
        <li><a href="#none">기업서비스</a></li>
      </ul>
    </div><!-- // inner -->
  </header><!-- // header -->

  <div id="sub-container">
    <div class="inner">
      <div class="subTit">
        <h2 class="pageTit">마이페이지</h2>
        <div class="location">
          <span>홈</span>
          <span>></span>
          <span>마이페이지</span>
          <span>></span>
          <span>회원탈퇴</span>
        </div>
        <ul class="depth02 clfix">
          <li><a href="#none">기업정보 수정 · 등록</a></li>
          <li><a href="#none">결제</a></li>
          <li class = "on"><a href = "#none#">회원탈퇴</a></li>
        <!--<li><a href="#none">depth02-C</a></li>-->
        </ul><!-- // depth02 -->
      </div><!-- // subTit -->



	<form action = "withdrawal.do">
      <div class="subCont" align = "center">
        <br><br>
        <p style = "font-size:22pt">기업회원 탈퇴하기</p>
        <br><br>
        <div align = "center" style = "font-size:13pt">계속하시려면 비밀번호를 입력해주세요.</div>
        <br>
        <input type="password" id="txtFirstName" style="width:200px;margin-top:10px;padding-left:5px;text-align:center;font-size:20pt"/>
        <br><br><br><br><br><br><br><br>
        <div align="center" style = "font-size:13pt"> 계정 삭제 시 저장된 정보는 다시 복구하실 수 없습니다. <br> 그래도 진행하시겠습니까? </div>
        <br><br>
        <button type = "submit" class="btn btn-light" style = "font-size: 12pt; margin-bottom: 100px;"> 네, 탈퇴하겠습니다. </button>
      </div><!-- // subCont -->
     </form>
     
     
     
    </div><!-- // inner -->
  </div><!-- // sub-container -->

  <footer>
    <p class="copyright">Copyright by Up All Rights Reserved.</p>
  </footer><!-- // footer -->

</div><!-- // wrap -->

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width= 1050px, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="../css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="../css/style.css" type="text/css"> <!-- 디자인 CSS -->
<!-- Ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
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
        <h2 class="pageTit">회원서비스</h2>
        <div class="location">
          <span>홈</span>
          <span>></span>
          <span>회원서비스</span>
          <span>></span>
          <span>로그인</span>
        </div>
        <ul class="depth02 clfix">
          <li class="on"><a href="#none">회원 로그인</a></li>
          <li><a href="#none">회원가입</a></li>
          <li><a href="#none">아이디/비밀번호찾기</a></li>
        </ul><!-- // depth02 -->
      </div><!-- // subTit -->

        <div class="subCont">

            <form action="logincheck.do" method="post">
                <div class="com-content-wrap">
                    <div class="com-content">
                        <span>회원 로그인</span>
                        <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" autocomplete="off">
                        <input type="password" id="password" name="password" placeholder="비밀번호 입력하세요" autocomplete="off">
                        <button type="submit" id="com-login-btn">로그인</button>
                        <div class="com-href"><a href="#">아이디/비밀번호를 잊으셨나요?</a></div>
                    </div>
                    <div class="com-logo">
                        <img src="../joinimg1.jpg">
                    </div>
                </div>
            </form>

        </div><!-- // subCont -->
    </div><!-- // inner -->
  </div><!-- // sub-container -->

  <footer>
    <p class="copyright">Copyright by Up All Rights Reserved.</p>
  </footer><!-- // footer -->

</div><!-- // wrap -->

<script>

/* $('#com-login-btn').click(function(){
    alert('로그인');
    var login = {
        email:$("input[name=email").val(),
        pwd: $('input[name=pwd').val()
    }
    $.ajax({
        url:'/login/logincheck.do',
        type:'post',
        data:login,
        success: function( data ){
            alert('success')
        }, error: function ( err ){
            alert('error');
        }

    });
}) */


</script>

</body>
</html>
<style>

    .com-content-wrap{ display: flex; justify-content: space-evenly; }
    .com-content-wrap > div { margin: 30px 0;}
    .com-content-wrap .com-logo{ float: left; border-radius: 500px; overflow: hidden;width: 400px; height: 400px;}
    .com-content-wrap .com-logo img{ width: 600px; position: relative; right: 90px; }
    
    .com-content-wrap .com-content{  width: 500px; float: left; margin-top: 60px; position: relative; left: 50px;}
    .com-content-wrap .com-content > span{ display: block; font-size: 25px; color: #999; margin: 20px 0; font-weight: 300; width: 300px; text-align: center;}
    .com-content-wrap .com-content > input{ width: 300px; height: 50px; padding-left: 20px; margin-bottom: 15px; outline: none;}
    .com-content-wrap .com-content > input:focus{ outline: none;}
    .com-content-wrap .com-content .com-href { margin-top: 20px; text-align: center; width: 300px;}   
    .com-content-wrap .com-content .com-href > a {  font-size: 13px; }   
    #com-login-btn{ border: 1px solid #4f6eff; color:#fff; background: #4f6eff; font-size: 16px; cursor:pointer; width: 300px; height: 50px; line-height: 50px; text-align: center;  margin-top: 20px;}
    #com-login-btn:hover{}
    
    
    </style>
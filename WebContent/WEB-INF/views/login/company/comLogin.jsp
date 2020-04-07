<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@include file ="../../../../include/header.jsp" %>


<div class="profile-wrap">

<div class="com-content-wrap">
    
    <div class="com-logo">
      <img src="/Pickme/images/sub/comLogin.png">
    </div>
    <div class="com-content">
	   	<form method="POST" action="logincheck.do">
	      <span>기업회원 로그인</span>
	      <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" autocomplete="off">
	      <input type="password" id="pwd" name="password" placeholder="비밀번호 입력하세요" autocomplete="off">
	      <button id="com-login-btn" type="submit">로그인</button>
	   	</form>
    	<div class="com-href"><a href="ffd.do">아이디/비밀번호를 잊으셨나요?</a></div>
    </div>
  </div>
</div>


<%@include file ="../../../../include/footer.jsp" %>
<style>

.com-content-wrap{ display: flex; justify-content: space-evenly; }
.com-content-wrap > div { margin: 30px 0;}
.com-content-wrap .com-logo{ }
.com-content-wrap .com-logo img{ width: 440px; }

.com-content-wrap .com-content{  width: 350px; float: right; margin-top: 60px; position: relative; left: 50px;}
.com-content-wrap .com-content > form > span{ display: block; font-size: 25px; color: #999; margin: 20px 0; font-weight: 300; width: 300px; text-align: center;}
.com-content-wrap .com-content > form > input{ width: 300px; height: 50px; padding-left: 20px; margin-bottom: 15px; outline: none;}
.com-content-wrap .com-content > form > input:focus{ outline: none;}
.com-content-wrap .com-content .com-href { margin-top: 20px; text-align: center; width: 300px;}   
.com-content-wrap .com-content .com-href > a {  font-size: 13px; }   
#com-login-btn{ border: 1px solid #4f6eff; color:#fff; background: #4f6eff; font-size: 16px; cursor:pointer; width: 300px; height: 50px; line-height: 50px; text-align: center;  margin-top: 20px;}
#com-login-btn:hover{}


</style>


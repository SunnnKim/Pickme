<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width= 1050px, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css"> <!-- 디자인 CSS -->
<link rel="stylesheet" href="/Pickme/css/adminmember.css" type="text/css"> <!-- 디자인 CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
    <script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> <!--Vue cdn-->
    <script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script><!-- font-awesome -->
</head>
<body style="background: rgb(234, 234, 234);">
  
    <div class="logo">PICK ME 관리자</div>
    <form action="loginCheck.do" method="post" id="frm">
        <div class="login-wrap">
            <div>
                <input type="text" placeholder="관리자 아이디 입력" name="id">
                <input type="password" placeholder="관리자 비밀번호 입력" name="password">
            </div>
            <button type="button">관리자 로그인</button>
        </div>
    </form>


<script>
    var id = document.querySelector('input[name=id]');
    var password = document.querySelector('input[name=password]');
    document.querySelector('button').onclick = () =>{
        if( id.value != '' && password.value ){
            document.querySelector('#frm').submit();
        }
    }
	<%
	// login 실패시
	if( request.getParameter("fail") != null ){
		%> alert('관리자 아이디/비번 확인') <%
	}
	%>
</script>

</body>
<style>
.logo{ font-size:25px; height:50px; line-height:52px; overflow:hidden; font-family: 'Black Han Sans', sans-serif;
color:#304edf; text-shadow:2px 2px 0 #ececec; text-align: center;margin-top: 150px;}
.login-wrap{text-align: center; font-size: 18px; }
.login-wrap > div {}
.login-wrap > div > input{display: block; width: 300px; height: 50px; margin: 10px auto; padding-left: 15px; outline: none;}
.login-wrap > button { width: 300px; height: 50px; background: #304edf; color: #fff;outline: none;}
</style>
</html>

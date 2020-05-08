<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%
if(request.getParameter("fail") != null ){
%>
	<script>
		Swal.fire({
			  position: 'center',
			  icon: 'error',
			  text:'아이디 또는 비밀번호가 틀렸습니다!',
			  showConfirmButton: false,
			  timer: 1500 
		});
	</script>
<%
}
%>

<div class="profile-wrap">
<form action="logincheck.do" method="post" id="frm">
                <div class="com-content-wrap">
                    <div class="com-content">
                        <span>회원 로그인</span>
                        <input type="text" id="email" name="email" onkeyup="enterkey()" placeholder="이메일을 입력하세요" autocomplete="off">
                        <input type="password" id="pwd" name="password" onkeyup="enterkey()" placeholder="비밀번호 입력하세요" autocomplete="off">
                        <button type="button" id="com-login-btn" onclick="login()">로그인</button>
                        <div class="com-href"><a href="/Pickme/login/findEmailPwdA.do">아이디/비밀번호를 잊으셨나요?</a></div>
                    </div>
                    <div class="com-logo">
                        <img src="/Pickme/images/sub/memlogin.jpg">
                    </div>
                </div>
            </form>



</div>
<script>
// 로그인 버튼 
login = () => {
	var email = document.querySelector('input[name=email]');
	var password = document.querySelector('input[name=password]');

	// 이메일 입력 안함 
	if( email.value.trim() === '' ){
		email.style.border = '1px solid red';

		email.focus();
		return false;
	}
	// 비번 입력 안함 
	if( password.value.trim() === '' ){
		password.style.border = '1px solid red';
		email.style.border = '1px solid #eaeaea';
		password.focus();
		return false;
	}
	document.querySelector('#frm').submit();
}
// enter 적용
function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             login();
        }
}
</script>

<%@include file ="../../../include/footer.jsp" %>
<style>

.com-content-wrap{ display: flex; justify-content: space-evenly; }
.com-content-wrap > div { margin: 30px 0;}
.com-content-wrap .com-logo{ float: left; border-radius: 500px; overflow: hidden;width: 400px; height: 400px;}
.com-content-wrap .com-logo img{ width: 880px;   }

.com-content-wrap .com-content{  width: 500px; float: left; margin-top: 60px; position: relative; left: 50px;}
.com-content-wrap .com-content > span{ display: block; font-size: 25px; color: #999; margin: 20px 0; font-weight: 300; width: 300px; text-align: center;}
.com-content-wrap .com-content > input{ width: 300px; height: 50px; padding-left: 20px; margin-bottom: 15px; outline: none;}
.com-content-wrap .com-content > input:focus{ outline: none;}
.com-content-wrap .com-content .com-href { margin-top: 20px; text-align: center; width: 300px;}   
.com-content-wrap .com-content .com-href > a {  font-size: 13px; }   
#com-login-btn{ border: 1px solid #4f6eff; color:#fff; background: #4f6eff; font-size: 16px; cursor:pointer; width: 300px; height: 50px; line-height: 50px; text-align: center;  margin-top: 20px;}
#com-login-btn:hover{}

    
    </style>
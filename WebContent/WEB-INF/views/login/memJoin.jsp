<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@include file ="../../../include/header.jsp" %>


<div class="profile-wrap">
	<div class="mem-logo">
        <span>인재 정보를 등록해주세요</span>
        <p>
            * Pick me 에서는 등록된 인재 정보를 기반으로 기업의 인재 탐색이 이루어집니다.<br>
            * 가입 후 마이페이지에서 나의 정보를 더욱 상세하게 작성하실 수 있습니다.
        </p>
        <div class="logo-wrap">
            <img src="/Pickme/images/sub/memJoin.jpg">
        </div>
    </div>
	<form id="frm" action="memberJoin.do" method="post">
	    <!-- 이메일 -->
	   <div class="join-content">
	       <div class="input-label">이메일<span>*</span></div>
	       <div class="join-input" id="email-icon">
	           <input type="text" id="email" name="email" placeholder="이메일을 입력하세요">
	           <span id="email-warning"></span>
	           <i class="far fa-check-square true"></i>
	       </div>
	   </div>
	   <!-- 패스워드 -->
	   <div class="join-content">
	       <div class="input-label">패스워드<span>*</span></div>
	       <div class="join-input" id="pwd-icon">
	           <input type="password" id="password" name="password" placeholder="패스워드를 입력하세요 (숫자, 기호 포함 6자이상)">
	           <i class="far fa-check-square true"></i>
	       </div>
	   </div>
	   <!-- 패스워드 확인 -->
	   <div class="join-content">
	       <div class="input-label">패스워드 확인 <span>*</span></div>
	       <div class="join-input" id="pwdcheck-icon">
	           <input type="password" id="pwdcheck" placeholder="패스워드를 확인하세요 (숫자, 기호 포함 6자이상)">
	           <i class="far fa-check-square true"></i>
	       </div>
	   </div>
	   <!-- 이름  -->
	    <div class="join-content">
	        <div class="input-label">이름 <span>*</span></div>
	        <div class="join-input" id="name-icon">
	            <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
	            <i class="far fa-check-square true"></i>
	        </div>
	    </div>
	</form>
	<!-- button -->
	<div class="join-btn" onclick="joinBtn()">
	    회원가입
	</div>
</div>

<!-- SCRIPT -->

<script>
// 회원가입 정규식 확인
// 회원가입
document.addEventListener("DOMContentLoaded", function(){

  var email = document.querySelector("#email");
  var pwd   = document.querySelector("#password");
  var pwdcheck = document.querySelector("#pwdcheck");
  var name = document.querySelector("#name");

  // check true / false
  var _emailcheck = false;
  var _pwdcheck = false;
  var _pwdcheck2 = false;
  var _namecheck = false;

  // 1. email 체크 
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

  if( email.onkeyup = () => {
    // 정규식 확인 
    if( regExp.test(email.value) == true){
        // 아이디 중복 확인 
		$.ajax({
			url:"/Pickme/login/emailCheckAll.do",
			data:{
				username:email.value
			},
			type:'post',
			success: function( data ){
				if( data == 'true' ){	// 아이디 있음
					document.querySelector("#email-icon").classList.add('false');
					document.querySelector("#email-icon").classList.remove('true');
					_emailcheck = false;
					document.querySelector('#email-warning').style.display = 'inline-block';
					document.querySelector('#email-warning').innerHTML = '이미 존재하는 이메일입니다!';
					
				}else{	// 아이디 없음 
		            document.querySelector('#email-warning').style.display = 'none';
					document.querySelector("#email-icon").classList.add('true');
		            document.querySelector("#email-icon").classList.remove('false');
		            _emailcheck = true;
				}
			},
			error: function(err) {
				alert('err');
				console.log(err)
			}
		});
        
    } else{
        document.querySelector("#email-icon").classList.add('false');
        document.querySelector("#email-icon").classList.remove('true');
        _emailcheck = false;
        document.querySelector('#email-warning').style.display = 'inline-block';
        document.querySelector('#email-warning').innerHTML = '올바른 이메일 형식이 아닙니다';
    }
  });

  // 2. pwd 체크
  // 영문 2자이상, 특수문자, 숫자 1개 이상, 6문자 이상
  var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=.,]{1,50})(?=.*[a-zA-Z]{2,50}).{6,50}$/;

  if( pwd.onkeyup = () => {
    if( regExpPw.test(pwd.value) ){
          document.querySelector("#pwd-icon").classList.add('true');
          document.querySelector("#pwd-icon").classList.remove('false');
          _pwdcheck = true;
    }else{
          document.querySelector("#pwd-icon").classList.add('false');
          document.querySelector("#pwd-icon").classList.remove('true');
          _pwdcheck = false;
    }
  });
	//비밀번호 체크후 입력시 false 처리 
  if( pwd.onchange = () => {
	  if( pwd.value != pwdcheck.value ){
			_pwdCheck2 = false;
			document.querySelector("#pwdcheck-icon").classList.add('false');
	        document.querySelector("#pwdcheck-icon").classList.remove('true');
	        pwdcheck.value = '';
	  }
	});

    // 3. 비밀번호 같은지 체크
    if( pwdcheck.onkeyup = () => {
      if( _pwdcheck === false ){
        document.querySelector("#pwdcheck-icon").classList.add('false');
        document.querySelector("#pwdcheck-icon").classList.remove('true');
        _pwdcheck2 = false;
        return false;
      }
      if( pwdcheck.value === pwd.value ){
        document.querySelector("#pwdcheck-icon").classList.add('true');
        document.querySelector("#pwdcheck-icon").classList.remove('false');
        _pwdcheck2 = true;
      }else{
        document.querySelector("#pwdcheck-icon").classList.add('false');
        document.querySelector("#pwdcheck-icon").classList.remove('true');
        _pwdcheck2 = false;
      }
    });

    // 이름 체크
    if( name.onkeyup = () => {
      if(name.value.length >= 2 ){
        document.querySelector("#name-icon").classList.add('true');
        document.querySelector("#name-icon").classList.remove('false');
        _namecheck = true;
      }else{
        document.querySelector("#name-icon").classList.add('false');
        document.querySelector("#name-icon").classList.remove('true');
        _namecheck = false;
      }
    });


    

    // 회원가입 버튼 클릭 
    joinBtn = () => {
        if( email.value == '' ){
          document.querySelector("#email-icon").classList.add('false');
          email.focus();
          return false;
        }
        if( pwd.value == '' ){
          document.querySelector("#pwd-icon").classList.add('false');
          pwd.focus();
          return false;
        }
        if( pwdcheck.value == '' ){
          document.querySelector("#pwdcheck-icon").classList.add('false');
          pwdcheck.focus();
          return false;
        }
        if( name.value == '' ){
          document.querySelector("#name-icon").classList.add('false');
          name.focus();
          return false;
        }

        // 정규표현식 확인
        if( _emailcheck == true && _pwdcheck == true && _pwdcheck2 == true && _namecheck == true ){
          	// 디비에 넣기 
	        Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '성공적으로 가입되었습니다!',
				  showConfirmButton: false,
				  timer: 1500
			}).then( (result) =>{
		 		document.querySelector('#frm').submit();
			})
        }
	}
});
    

</script>

<%@include file ="../../../include/footer.jsp" %>

<style>
/* logo-text */
.mem-logo{ width: 550px; color: #555; margin-bottom: 30px;  position: relative; }
.mem-logo >span{ font-size: 31px; display: inline-block; margin-top: 30px; }
.mem-logo p{ margin-top: 25px; font-size: 14px;}
/* logo-img */
.logo-wrap{ width: 480px; position: absolute; left: 560px; top: 100px;}
.logo-wrap img{ width: 480px;}
/* inputs */
.join-content{}
.join-content .input-label{}
.join-content .input-label{ padding-left: 2px; margin-bottom: 3px; font-size: 13px;}
.join-content .input-label > span{ color: red;}
.join-content .join-input { width: 500px; position: relative; margin-bottom: 10px;}
.join-content .join-input input {  width: 500px; height: 50px; outline: none; padding-left: 15px; padding-right: 50px; }
.join-content .join-input i { position:absolute; top:11px; right:10px; z-index:99; color:#bbb; font-size:25px }
/* 이메일 경고창  */
#email-warning { display: none; background: red; color: #fff; width: 200px; position: absolute; z-index: 100; right: 0px; top: -28px; text-align: center; }
/* 정규식 체크 */
.join-content > div.true i {color:green;}
.join-content > div.false i {color:red;}
        
/* button */
.join-btn{ background: #4f6eff; width: 500px; height: 50px; line-height: 50px; text-align: center; color: #fff; margin-top: 30px;}
</style>
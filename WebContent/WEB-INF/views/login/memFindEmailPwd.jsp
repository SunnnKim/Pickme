<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<div class="profile-wrap">
   <div class="left-box">
     <div class="left-title">아이디 / 비밀번호를 잊으셨나요?</div>
     <div class="img-wrapper">
       <img src="/Pickme/images/sub/questionmark.png">
     </div>
   </div>
   <div class="right-box">
     <div class="tabs">
       <div id="email-box" class="tab tab-on" onclick="changeView(this)">이메일 체크</div>
       <div id="password-box" class="tab tab-off" onclick="changeView(this)">비밀번호 변경</div>
     </div>
     <div class="content-wrapper">
       <div id="email-content" class="content-box">
         <input type="text" name="email" placeholder="이메일을 입력하세요" onkeyup="enterkey('email')">
         <input type="text" name="name" placeholder="이름을 입력하세요" onkeyup="enterkey('email')">
         <div class="check-btn" id="registerBtn" onclick="checkEmail()">가입여부 확인하기</div>
       </div>
       
       <div id="password-content" class="content-box" style="display: none;">
         <div class="validate-box">
           <input type="text" name="email2" placeholder="이메일을 입력하세요" onkeyup="enterkey('pwd')">
           <button type="button" id="sendEmail">메일전송</button>
         </div>
         <input type="password" name="temp" placeholder="인증번호를 입력하세요" onkeyup="enterkey('pwd')">
         <button class="check-btn" id="validateBtn" onclick="checkPwd()">인증하기</button>
       </div>
     </div>
   </div>
</div>
<form id="frm" method='post' action="/Pickme/login/memChangePwd.do">
	<input type="hidden" name="emailCode" id="emailCode">
	<input type="hidden" name="memberEmail" id="memberEmail">
</form>
<script>
  // 이메일 인증
  var emailCode = "";

  // 탭 변경 
function changeView( btn ){
  var emailBtn = btn.parentNode.childNodes[1]
  var pwdBtn = btn.parentNode.childNodes[3]
  if(emailBtn == btn ){
    emailBtn.classList.add( 'tab-on' );
    emailBtn.classList.remove( 'tab-off' );
    pwdBtn.classList.add( 'tab-off' );
    pwdBtn.classList.remove( 'tab-on' );
    document.querySelector('#email-content').style.display = 'block'
    document.querySelector('#password-content').style.display = 'none'
  }else{
    pwdBtn.classList.add( 'tab-on' );
    pwdBtn.classList.remove( 'tab-off' );
    emailBtn.classList.add( 'tab-off' );
    emailBtn.classList.remove( 'tab-on' );
    document.querySelector('#email-content').style.display = 'none'
    document.querySelector('#password-content').style.display = 'block'
  }
}


// 이메일 가입여부 확인하기 
function checkEmail(){
  var email = $('input[name=email]');
  var name = $('input[name=name]')
  
  if(email.val().trim() == ''){
    email.focus()
    sweetAlert( 'error', '이메일을 입력하세요', 1000, false)
    return false;
  }
  if(name.val().trim() == ''){
    name.focus()
    sweetAlert( 'error', '이름을 입력하세요', 1000, false)
    return false
  }
  // form data 만들기
  let emailData = new FormData();
  emailData.append('email', $('input[name=email]').val())
  emailData.append('name', $('input[name=name]').val())

   $.ajax({
     url:'/Pickme/login/getLostEmailA.do',
     data: {
    	 'email': $('input[name=email]').val(),
    	 'name': $('input[name=name]').val()
     },
     type:'post',
     success: function( data ){
       if(data == 'true'){
		  sweetAlert('success', '가입된 이메일 입니다!', 0, true)
       }else{
		  sweetAlert('error', '가입된 이메일이 없거나 이름이 없습니다', 0, true)
		  $('input[name=email]').focus();
       }
     }, error: function( err ){
       alert('error')
       console.log(err)
     }
  })
}
// 인증 메일 보내기
$('#sendEmail').click( function(){
  if($('input[name=email2]').val().trim() == ''){
    $('input[name=email2]').focus()
    sweetAlert('error', '이메일을 입력하세요', 800, false)
    return false
  }
  
   $.ajax({
     url:'/Pickme/login/sendPasswordEmail.do',
     data:{
        email : $('input[name=email2]').val()
      },
     type:'post',
     success: function( data ){
       if( data == 'falseEmail'){
    	   sweetAlert('error', '등록되지 않은 이메일입니다', 800, false)
       }else if( data == 'false'){
    	   sweetAlert('error', '인증메일 전송실패', 800, false)
       }else{
           $('#memberEmail').val($('input[name=email2]').val())	  
		   emailCode = data
		   $('input[name=temp]').focus()
    	   sweetAlert('success', '인증메일을 보냈습니다', 800, false)
       }
       
     }, error: function( err ){
       alert('error')
       console.log(err)
     }
  })

 
});

// 이메일 인증 후 비밀번호 변경하기  
function checkPwd(){
  var email = $('input[name=email2]');
  var validateCode = $('input[name=temp]')
  if(emailCode == ''){
    sweetAlert( 'error', '인증번호를 전송하세요', 1000, false)
    return false;
  }
  if(email.val().trim() == ''){
    email.focus()
    sweetAlert( 'error', '이메일을 입력하세요', 1000, false)
    return false;
  }
  if(validateCode.val().trim() == ''){
    validateCode.focus()
    sweetAlert( 'error', '인증번호를 입력하세요', 1000, false)
    return false
  }

  // 인증완료 후
	$('#emailCode').val(emailCode)	  
	$('#frm').submit();
}






// 메세지 알림창
//function
function sweetAlert( type, msg, time, confirmBtn ){
	Swal.fire({
		  position: 'center',
		  icon: type,
		  text: msg,
		  showConfirmButton: confirmBtn,
		  timer: time
	});
}
// enter 적용
function enterkey( type ) {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             if(type == 'email' ){
               checkEmail();
             }
             else if( type = 'pwd' ){
                checkPwd();
             }
        }
}

</script>
<style>
.left-box{ width: 300px; float: left;  margin: 65px 20px; margin-left: 80px; }
.left-box .left-title{ font-size: 20px; text-align: center; margin-bottom: 40px;}
.left-box .img-wrapper{ width: 300px; margin: 0 auto;}
.left-box .img-wrapper > img{ width: 300px; }
.left-box{}

/* right-box */
.right-box{ width: 500px; float: right; margin-right: 50px; margin-top: 50px; }
.right-box .tab{ border: 1px solid #eaeaea; transition: all .2s ease-in-out; border-bottom: none; cursor: pointer; 
	width: 50%; float: left; text-align: center; height: 50px; line-height: 50px; border-radius: 10px 10px 0 0;}
.tab-on{ color: #333; display: block;}
.tab-off { background-color: #4356b3; color:#fff;}
.tab-off:hover{ background-color: #313f84;}

.right-box .content-wrapper{ border: 1px solid #eaeaea; border-top: 1px solid #fff; height: 350px; position: relative; top: 50px;}
.right-box .content-wrapper .content-box{ height: 250px; margin-top: 50px; }
/* 이메일 체크하기 */
.right-box .content-wrapper #email-content{ margin-top: 80px;}
.right-box .content-wrapper #email-content > input{ display: block; width: 350px; height: 40px; margin: 20px auto; padding: 20px; outline: none;}
.check-btn { background: #4356b3; color: #fff; transition: all .3s ease-in-out; cursor: pointer;
  width: 350px; height: 50px; border-radius: 50px; text-align: center; line-height: 50px; margin: 20px auto; margin-top: 40px;}
.check-btn:hover{ background-color: #313f84; }

/* 비밀번호 변경 */
.right-box .content-wrapper #password-content{margin-top: 50px;}
.right-box .content-wrapper .content-box .validate-box{ }
.right-box .content-wrapper .content-box .validate-box > input{ display: inline-block; width: 250px; height: 40px; margin: 20px 0; margin-left: 75px; padding: 20px; outline: none; }
.right-box .content-wrapper .content-box .validate-box > button { background: #4356b3; width: 100px; height: 45px; line-height: 40px; color: #fff; text-align: center; }
.right-box .content-wrapper .content-box > input{ display: block; width: 350px; height: 40px; margin-bottom: 15px; margin: 10px auto;  margin-left: 75px; padding: 20px; outline: none;}
.right-box #validateBtn{ background: #4356b3; color: #fff; transition: all .3s ease-in-out; cursor: pointer;
  width: 350px; height: 50px; border-radius: 50px; text-align: center; line-height: 50px; margin: 10px auto; margin-top: 30px; margin-left: 75px; }
</style>

<%@include file ="../../../include/footer.jsp" %>
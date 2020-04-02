<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script><!-- font-awesome -->

       <!-- Trigger/Open The Modal -->
        <!-- 모달 -->
        <div id="myModal" class="modal">
          <!-- Modal content -->
          <div class="modal-content">
            <!-- 로그인폼 -->
              <div id="loginForm">
                <div class="modal-wrap">
                      <div onclick="loginTab()">로그인</div>
                      <div onclick="joinTab()" class="tab-off">회원가입</div>
                </div>
                <div class="modal-input">
                  <input type="text" id="email_login" placeholder="이메일을 입력하세요">
                  <input type="text" id="pwd_login" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="modal-btn">
                  <div class="login-btn" onclick="loginBtn()">로그인</div>
                  <a href="#">아이디/비밀번호 찾기</a>
                </div>
            </div>

            <!-- 회원가입폼 -->
            <div id="joinForm" style="display: none;">
              <div class="modal-wrap">
                  <div class="tab-join" onclick="loginTab()">로그인</div>
                  <div class="tab-off tab-color" onclick="joinTab()">회원가입</div>
              </div>
              <div class="modal-input">
                  <div class="cont" id="email-icon">
                    <input type="text" id="email" name="email" placeholder="이메일을 입력하세요">
                    <i class="far fa-check-circle"></i>
                  </div>
                  <div class="cont" id="pwd-icon">
                    <input type="text" id="pwd" name="pwd" placeholder="특수문자 및 숫자 포함 8자리 이상">
                    <i class="far fa-check-circle"></i>
                  </div>
                  <div class="cont" id="pwdcheck-icon">
                    <input type="text" id="pwdcheck" name="pwdcheck" placeholder="비밀번호를 다시 입력하세요">
                    <i class="far fa-check-circle"></i>
                  </div>
                  <div class="cont" id="name-icon">
                    <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
                    <i class="far fa-check-circle"></i>
                  </div>
              </div>
              <div class="modal-btn">
                <div class="login-btn" onclick="joinBtn()">회원가입</div>
              </div>


            </div>
         </div>
     
<script>
     //modal
     var joinForm = document.querySelector("#joinForm");
     var loginForm = document.getElementById("loginForm");
     // login form
     function loginTab(){
          loginForm.style.display ="block";
          joinForm.style.display ="none";
          var inputlist = document.querySelectorAll('input');
          var iconlist = document.querySelectorAll('i');
          for( arr of inputlist ){
            arr.value = '';
          }
          for( icon of iconlist ){
            icon.parentNode.classList = '';
          }
        }
        // join form
        function joinTab(){
          loginForm.style.display ="none";
          joinForm.style.display ="block";
          var inputlist = document.querySelectorAll('input');
          var iconlist = document.querySelectorAll('i');
          for( arr of inputlist ){
            arr.value = '';
          }
          for( icon of iconlist ){
            icon.parentNode.classList = '';
          }
        }



document.addEventListener("DOMContentLoaded", function(){

  // 로그인 함수
  // 로그인 버튼 눌렀을 때           
  loginBtn = () => {
    alert('login process');
  }



  // 회원가입
  // 정규식 확인
  // input
  var email = document.querySelector("#email");
  var pwd   = document.querySelector("#pwd");
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
    if( regExp.test(email.value) === true){
          var check = true;  // ajax로 나온 결과 
          if( check === false ){
              document.querySelector("#email-icon").classList.add('false');
              document.querySelector("#email-icon").classList.remove('true');
              _emailcheck = false;
          }else{
              document.querySelector("#email-icon").classList.add('true');
              document.querySelector("#email-icon").classList.remove('false');
              _emailcheck = true;
          }
    } else{
        document.querySelector("#email-icon").classList.add('false');
        document.querySelector("#email-icon").classList.remove('true');
        _emailcheck = false;
    }
  });

  // 2. pwd 체크
  // 영문 2자이상, 특수문자, 숫자 1개 이상, 8문자 이상
  var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=.,]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

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
          alert('success');
          // 디비에 넣기 
        }




    }
});
            
</script>


<script>
      // Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
// span.onclick = function() {
//     modal.style.display = "none";
// }

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
      // input 모두 지우기
      email.value = "";
      pwd.value = "";
      pwdcheck.value = "";
      document.querySelector("#name").value = "";
      email.parentNode.className = '';
      pwd.parentNode.className = '';
      pwdcheck.parentNode.className = '';
      document.querySelector("#name").parentNode.className = '';
      loginForm.style.display ="block";
      joinForm.style.display ="none";
      modal.style.display = "none";
    }
}

</script>
<style>
     /* The Modal (background) */
.modal {
    display: none; /*Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: -80px;
    width: 100%; /* Full width */
    height: 120%; /* Full height */
    overflow: hidden; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fff;
    margin: 15% auto; /* 15% from the top and centered */
    min-height: 200px;
    width: 400px; /* Could be more or less, depending on screen size */                          

 }
/* main area */
.modal-content {
  border: 1px solid white;
}
/* modal-on */
.modal-on{
  display: none;
}
/* tab */
.modal-content .modal-wrap {
  position: relative;
}
.modal-content .modal-wrap div{
  /* border: 1px solid;  */
  border-bottom: none;
  width: 50%; height: 50px; float: left;
  text-align: center; line-height: 50px; cursor: pointer;
  border-radius: 10px 10px 0 0; background: #fff;
  position: absolute; top: -101px; left: -1px;
}
.modal-content .modal-wrap .tab-off{
  border: 1px solid #3b467c; 
  background: #3b467c; color: white;
  border-radius: 10px 10px 0 0; 
  position: absolute; top: -101px; left: 200px;
}
.modal-content .modal-wrap .tab-join{
  background: #3b467c; color: white;
}
.modal-content .modal-wrap .tab-color{
  background: white; color: #000;
  border: none;
}
/* input */
.modal-content .modal-input{
  margin-top: 50px; text-align: center;
  padding:0 49px;
}

.modal-content .modal-input > div {
  width:100%; position:relative;
}

.modal-content .modal-input > div i {
  position:absolute; top:11px; right:10px; z-index:99;
  color:#bbb; font-size:25px
}
.modal-content .modal-input > div.true i {color:green;}
.modal-content .modal-input > div.false i {color:red;}

.modal-content .modal-input input{
  width: 300px; height: 50px; padding:0 40px 0 10px;
  outline: none; 
  margin-bottom: 10px; 
}
.modal-content .modal-input input:focus{
  outline: none;
}

/* btn */
.modal-content .modal-btn{
  margin-top: 20px; margin-bottom: 50px; text-align: center;
}
.modal-content .modal-btn .login-btn{
  border: 1px solid;cursor: pointer;
  background: #4f6eff; color: white;
  width: 300px; height: 50px;  line-height: 50px; margin: 10px auto; 
}
.modal-content .modal-btn a{
  display: inline-block;
  font-size: 13px; margin-top: 10px;
}
.modal-content .modal-btn a:hover{
  color:#4f6eff
}

/* 버튼 클릭시 */
#myBtn{
	cursor:pointer;
}


</style>
    

    
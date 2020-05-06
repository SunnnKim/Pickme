<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@include file ="../../../../include/header.jsp" %>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<div class="profile-wrap">
<!-- 여기부터 복붙 -->
  <div class="com-content-wrap">
    <div class="com-join-logo">
      <span>기업의 정보를 등록해주세요</span>
      <p>
        * Pick me는 구직자와 기업간의 적합한 인재채용을 위해 다음 정보를 참고하여 회사등록을 승인하고 있습니다.<br>
        * 가입 후 마이페이지에서 기업 정보를 더욱 상세하게 작성하실 수 있습니다.
      </p>
      <div class="img">
        <img src="/Pickme/images/sub/joinimg2.jpg" style="width: 215px;">
      </div>
    </div>
	<form action="/Pickme/login/company/companySignUp.do" method="post" id="frm" >
    <!-- input -->
    <!-- 회사명 -->
    <div class="com-content">
      <div class="com-input-box full-box">
        <div class="input-lable">회사명<span style="color: red;">*</span></div>
        <div class="input-content">
          <input class="full-size" type="text" id="name" name="name" placeholder="회사명">
          <i class="far fa-check-square i-full" id="name-icon"></i>
        </div>
      </div>
      <!-- 이메일 -->
      <div class="com-input-box full-box">
        <div class="input-lable">가입 이메일<span style="color: red;">*</span></div>
        <div class="input-content">
       	  <span id="email-warning"></span>
          <input class="full-size" type="text" id="email" name="email" placeholder="가입 이메일">
          <i class="far fa-check-square i-full" id="email-icon"></i>
        </div>
      </div>
      <!-- 패스워드 -->
      <div class="com-input-box">
        <div class="input-lable">패스워드<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="password" id="password" name="password" placeholder="패드워드 입력 (숫자, 기호 포함 6자이상)">
          <i class="far fa-check-square" id="pwd-icon" ></i>
        </div>
      </div>
      <!-- 패스워드 확인 -->
      <div class="com-input-box">
        <div class="input-lable" style="padding-left: 15px;">패스워드확인<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="password" id="pwdcheck" placeholder="패드워드 확인" style="margin-left: 5px;">
          <i class="far fa-check-square" id="pwdcheck-icon"></i>
        </div>
      </div>
      <!-- 대표자명 -->
      <div class="com-input-box">
        <div class="input-lable">대표자명<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="president" name="president" placeholder="대표자명 입력">
          <i class="far fa-check-square" id="president-icon"></i>
        </div>
      </div>
      <!-- 기업분야  -->
      <div class="com-input-box" style="width: 262px; height: 94px;">
        <div class="input-lable" style="padding-left: 15px;">기업분야<span style="color: red;">*</span></div>
        <div class="input-content">
          <select id="department" name="department">
            <option value="0">선택하기</option>
          </select>
        </div>
      </div>

      <!-- 기업종류 -->
      <div class="com-input-box" style="width: 262px; height: 94px; float: right;;">
        <div class="input-lable" style="padding-left: 15px;">기업종류<span style="color: red;">*</span></div>
        <div class="input-content">
          <select id="type" name="type">
            <option value = "0"> 선택하기 </option>
            <option value = "대기업"> 대기업 </option>
            <option value = "대기업 계열사, 자회사"> 대기업 계열사, 자회사 </option>
            <option value = "중견기업(300명 이상)"> 중견기업(300명 이상) </option>
            <option value = "중소기업(300명 이하)"> 중소기업(300명 이하) </option>
            <option value = "벤처기업"> 벤처기업 </option>
            <option value = "외국계(외국 투자기업)"> 외국계(외국 투자기업) </option>
            <option value = "외국계(외국 법인기업)"> 외국계(외국 법인기업) </option>
            <option value = "국내 공공기관, 공기업"> 국내 공공기관, 공기업 </option>
            <option value= "비영리단체, 협회, 교육재단"> 비영리단체, 협회, 교육재단 </option>
          </select>
        </div>
      </div>
      <!-- 사업자등록번호 -->
      <div class="com-input-box">
        <div class="input-lable">사업자등록번호<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="number" name="number" placeholder="사업자번호 입력(숫자만 입력)" maxlength="10">
          <i class="far fa-check-square" id="number-icon"></i>
        </div>
      </div>
      <!-- 대표연락처 -->
      <div class="com-input-box" >
        <div class="input-lable" style="padding-left: 15px;">대표 연락처<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="tel" name="tel" placeholder="대표 연락처 입력 (-까지 입력)" style="margin-left: 5px;" maxlength="15">
          <i class="far fa-check-square" id="tel-icon"></i>
        </div>
      </div>
    </div>
    </form> <!-- //form -->
    
    <div class="com-input-btn" onclick="joinBtn()">
      기업회원 가입하기
      </div>
  </div>
</div>
<script>
  // 기업분야 셀렉트 박스 초기화 
  var department = [
    "가사, 가정",'건설', '공공행정, 국방', '광업', '교육서비스', '국제, 외교기관', '금융', '기타 서비스업', '농림, 어업', '물류, 운송업',
    '보건, 사회복지', '부동산', '사업지원', '상수도, 환경', '숙박, 음식점', '예술, 스포츠, 여가','전기, 가스', '전문, 과학기술',
    'IT, 컨텐츠, 네트워크', '제조', '판매, 유통'
  ];
  for( arr of department){
    document.querySelector('#department').innerHTML += '<option value="'+ arr +'">'+arr+'</option>';
  }



  document.addEventListener("DOMContentLoaded", function(){
  // 회원가입 input validate
  var nameCheck = false;  // 회사명 체크
  var emailCheck = false;   // 이메일 체크
  var pwdCheck = false;     // 비번 체크
  var pwdcheckCheck = false;  // 비번확인 체크
  var presidentCheck = false; // 대표자 체크
  var departmentCheck = false;  // 기업분야 체크
  var typeCheck = false;    // 기업 종류 선택
  var numberCheck = false;    // 사업자번호 체크
  var telCheck = false;     // 대표 연락처 체크
  
  // input 값
  var name = document.querySelector('#name');
  var email = document.querySelector('#email');
  var pwd =  document.querySelector('#password');
  var pwdcheck = document.querySelector('#pwdcheck');
  var president = document.querySelector('#president');
  var department = document.querySelector('#department');
  var type = document.querySelector('#type');
  var number = document.querySelector('#number');
  var tel = document.querySelector('#tel');


	// 기업명 확인 
	var regExpComname = /^[0-9가-힣a-zA-Z()-*&]*$/;
	
	if( name.onkeyup = () => {
		if( name.value.length >= 2 && regExpComname.test( name.value ) ){
			document.querySelector("#name-icon").classList.add('true');
	        document.querySelector("#name-icon").classList.remove('false');
	        nameCheck = true;
		}else{
			document.querySelector("#name-icon").classList.add('false');
	        document.querySelector("#name-icon").classList.remove('true');
	        nameCheck = false;
		}
	});

	// 기업 이메일 확인 
	// 1. email 체크 
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  if( email.onkeyup = () => {
    // 정규식 확인 
    if( regExp.test(email.value) === true){
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
					emailCheck = false;
					document.querySelector('#email-warning').style.display = 'inline-block';
					document.querySelector('#email-warning').innerHTML = '이미 존재하는 이메일입니다!';
					
				}else{	// 아이디 없음 
		            document.querySelector('#email-warning').style.display = 'none';
					document.querySelector("#email-icon").classList.add('true');
		            document.querySelector("#email-icon").classList.remove('false');
		            emailCheck = true;
				}
			},
			error: function(err) {
				alert('검색할 수 없습니다!');
				console.log(err);
				emailCheck = false;
			}
		});
        
    } else{
        document.querySelector("#email-icon").classList.add('false');
        document.querySelector("#email-icon").classList.remove('true');
        document.querySelector('#email-warning').style.display = 'none';
        emailCheck = false;
    }
  });

  // 2. pwd 체크
  // 영문 2자이상, 특수문자, 숫자 1개 이상, 6문자 이상
  var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=.,]{1,50})(?=.*[a-zA-Z]{2,50}).{6,50}$/;
  if( pwd.onkeyup = () => {
    if( regExpPw.test(pwd.value) ){
          document.querySelector("#pwd-icon").classList.add('true');
          document.querySelector("#pwd-icon").classList.remove('false');
          pwdCheck = true;
    }else{
          document.querySelector("#pwd-icon").classList.add('false');
          document.querySelector("#pwd-icon").classList.remove('true');
          pwdCheck = false;
    }
  });
  // 비밀번호 체크후 입력시 false 처리 
  if( pwd.onchange = () => {
			pwdcheckCheck = false;
			document.querySelector("#pwdcheck-icon").classList.add('false');
	        document.querySelector("#pwdcheck-icon").classList.remove('true');
	        pwdcheck.value = "";
	});

  // 3. 비밀번호 같은지 체크
    if( pwdcheck.onkeyup = () => {
      if( pwdCheck === false ){	// 비밀번호 정규식이 틀렸을 경우 
        document.querySelector("#pwdcheck-icon").classList.add('false');
        document.querySelector("#pwdcheck-icon").classList.remove('true');
        pwdcheckCheck = false;
        return false;
      }
      if( pwdcheck.value === pwd.value ){
        document.querySelector("#pwdcheck-icon").classList.add('true');
        document.querySelector("#pwdcheck-icon").classList.remove('false');
        pwdcheckCheck = true;
      }else{
        document.querySelector("#pwdcheck-icon").classList.add('false');
        document.querySelector("#pwdcheck-icon").classList.remove('true');
        pwdcheckCheck = false;
      }
    });
    
	// 4. 대표자명
	var regExpName = /^[가-힣a-zA-Z]*$/;
	if( president.onkeyup = () => {
		if( president.value.length >= 2 && regExpName.test( president.value )) {
				document.querySelector("#president-icon").classList.add('true');
		        document.querySelector("#president-icon").classList.remove('false');
		        presidentCheck = true;
		}else{
			document.querySelector("#president-icon").classList.add('false');
	        document.querySelector("#president-icon").classList.remove('true');
	        presidentCheck = false;
		 }
	});

	// 5. select - department (직종)
	if(department.onchange = () => {
		if( department.value == '0' ){
			departmentCheck = false;
			department.style.border = '1px solid red';
		}else{
			departmentCheck = true;
			department.style.border = '1px solid #eaeaea';
		}
	});

	// 6. select - type (기업종류)
	if( type.onchange = () => {
		if( type.value == '0' ){
			typeCheck = false;
			type.style.border = '1px solid red';
		}else{
			typeCheck = true;
			type.style.border = '1px solid #eaeaea';
		}
	});

	// 7. 사업자등록번호 입력	
	var regExpNumber = /^[0-9]*$/;
	if( number.onkeyup = () => {
		if( number.value.length != 10 ){
			document.querySelector("#number-icon").classList.add('false');
	        document.querySelector("#number-icon").classList.remove('true');
	        numberCheck = false;
		}else{
			if( regExpNumber.test(number.value) ){	// 맞는 경우 
				document.querySelector("#number-icon").classList.add('true');
		        document.querySelector("#number-icon").classList.remove('false');
		        numberCheck = true;
			}else{
				document.querySelector("#number-icon").classList.add('false');
		        document.querySelector("#number-icon").classList.remove('true');
		        numberCheck = false;
			}
		}
	});

	// 8. 대표연락처입력 
	var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if( tel.onkeyup = () => {
		if( regExpTel.test( tel.value ) ){	// 맞는 경우 
			document.querySelector("#tel-icon").classList.add('true');
	        document.querySelector("#tel-icon").classList.remove('false');
	        telCheck = true;
			
		}else{
			document.querySelector("#tel-icon").classList.add('false');
	        document.querySelector("#tel-icon").classList.remove('true');
	        telCheck = false;
		}
	});
	
	  // 가입버튼 누름
	   joinBtn = () => {
		   // 기업명 잘못입력
			if( nameCheck == false) {
				document.querySelector("#name-icon").classList.add('false');
		        document.querySelector("#name-icon").classList.remove('true');
				name.focus();
				warning('기업명을 잘못입력했습니다', 1500)
				return false;
			}
			// 이메일 잘못입력
			if( emailCheck == false) {
				document.querySelector("#email-icon").classList.add('false');
		        document.querySelector("#email-icon").classList.remove('true');
		        warning('이메일을 잘못입력했습니다', 1500)
				email.focus();
				return false;
			}
			// 비밀번호 잘못입력	
			if( pwdCheck == false) {
				document.querySelector("#pwd-icon").classList.add('false');
		        document.querySelector("#pwd-icon").classList.remove('true');
				pwd.focus();
				warning('비밀번호를 잘못입력했습니다\n(숫자,기호 포함 6자 이상)', 2000)
				return false;
			}
			// 비밀번호확인 잘못입력 
			if( pwdcheckCheck == false) {
				document.querySelector("#pwdcheck-icon").classList.add('false');
		        document.querySelector("#pwdcheck-icon").classList.remove('true');
				pwdcheck.focus();
				warning('비밀번호를 다시한번 입력해주세요', 1500)
				return false;
			}
			// 대표자명 잘못입력 
			if( presidentCheck == false) {
				document.querySelector("#president-icon").classList.add('false');
		        document.querySelector("#president-icon").classList.remove('true');
		        president.focus();
		        warning('대표자명을 잘못입력했습니다', 1500)
				return false;
			}
			// 기업분야 잘못 선택 
			if( departmentCheck == false) {
				department.focus();
				department.style.border = '1px solid red'
				warning('기업분야를 선택해주세요', 1500)
				return false;
			}
			// 기업 종류 잘못선택 
			if( typeCheck == false) {
				type.focus();
				type.style.border = '1px solid red'
				warning('기업종류를 선택해주세요', 1500)
				return false;
			}
			// 사업자번호 잘못 입력 
			if( numberCheck == false) {
				document.querySelector("#number-icon").classList.add('false');
		        document.querySelector("#number-icon").classList.remove('true');
		        number.focus();
		        warning('사업자번호를 확인해주세요', 1500)
				return false;
			}
			// 전화번호 잘못 입력 
			if( telCheck == false) {
				document.querySelector("#tel-icon").classList.add('false');
		        document.querySelector("#tel-icon").classList.remove('true');
		        tel.focus();
		        warning('대표 연락처를 확인해주세요', 1500)
				return false;
			}


			//submit
			Swal.fire({
				  position: 'center',
				  icon: 'success',
				  text: '성공적으로 가입되었습니다!',
				  showConfirmButton: false,
				  timer: 1500
			}).then( (result) =>{
		 		document.querySelector('#frm').submit();
			})
			
	    
	    
	  }
  });

  
</script>
<script>
function warning ( msg, sec ) {
	  Swal.fire({
		  position: 'center',
		  icon: 'error',
		  text: msg,
		  showConfirmButton: false,
		  timer: sec
	})
}
</script>

<%@include file ="../../../../include/footer.jsp" %>

<style>

.com-content-wrap{ }
/* join-intro */
.com-content-wrap .com-join-logo { color: #555; margin-bottom: 80px; margin-top: 15px; position: relative;}
.com-content-wrap .com-join-logo span { font-size: 31px; display: inline-block; margin-top: 30px; }
.com-content-wrap .com-join-logo p { margin-top: 25px; font-size: 14px;}
.com-content-wrap .com-join-logo .img { position: absolute; top: -5px; right: 20px; width: 200px; height: 200px; border-radius: 100px; overflow: hidden;}
/* input box */
.com-content-wrap .com-content{ min-height: 580px; }
.com-content-wrap .com-content div.full-box { width: 1050px; float: none; } 
.com-content-wrap .com-content .com-input-box { width: 50%; float: left; margin-bottom: 15px; height: 90px;} 
.com-content-wrap .com-content .com-input-box .input-lable { padding-left: 2px; margin-bottom: 3px;}
.com-content-wrap .com-content .com-input-box .input-content { width:100%; position:relative;}
/* input 짧은 칸 */
.com-content-wrap .com-content .com-input-box .input-content input{ border: 1px solid #eaeaea; width: 520px; height: 50px; padding-left: 20px; margin-bottom: 15px; outline: none;}
.com-content-wrap .com-content .com-input-box .input-content input:focus{ border: 1px solid #bbb;}
.com-content-wrap .com-content .com-input-box .input-content i { position: absolute; top: 11px; right: 10px; z-index:98; color:#bbb; font-size:25px }
/* input 긴 칸 */
.com-content-wrap .com-content .com-input-box .input-content input.full-size{ width: 1050px; height: 50px; padding-left: 20px; margin-bottom: 15px; outline: none;}
.com-content-wrap .com-content .com-input-box .input-content i.i-full{ position:absolute; top:11px; right:10px; z-index:99; color:#bbb; font-size:25px}
.com-content-wrap .com-content .com-input-box .input-content > i.false{ color: red;}
.com-content-wrap .com-content .com-input-box .input-content > i.true{ color: green}
/* 이메일 경고창  */
#email-warning { display: none; background: red; color: #fff; width: 200px; position: absolute; z-index: 100; right: 0px; top: -28px; text-align: center; }

/* select-box */

select {float: right; margin-left: 0px; width: 250px; padding: .8em .5em; font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  
  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #eaeaea; border-radius: 0px; outline: none;}
select:focus{ border: 1px solid #bbb;}
select::-ms-expand { /* for IE 11 */ display: none;}

/* 가입 버튼 */
.com-content-wrap .com-input-btn{ color: #fff; background-color: #4f6eff; border-radius: 3px; font-size: 17px;
width: 500px; height: 60px; line-height: 60px; text-align: center; margin: 0 auto; margin-top: 40px; cursor: pointer;}
</style>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@include file ="../../../include/header.jsp" %>


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

    <!-- input -->
    <!-- 회사명 -->
    <div class="com-content">
      <div class="com-input-box full-box">
        <div class="input-lable">회사명<span style="color: red;">*</span></div>
        <div class="input-content">
          <input class="full-size" type="text" id="c_name" name="c_name" placeholder="회사명">
          <i class="far fa-check-square i-full"></i>
        </div>
      </div>
      <!-- 이메일 -->
      <div class="com-input-box full-box">
        <div class="input-lable">가입 이메일<span style="color: red;">*</span></div>
        <div class="input-content">
          <input class="full-size" type="text" id="email" name="email" placeholder="회사명">
          <i class="far fa-check-square i-full"></i>
        </div>
      </div>
      <!-- 패스워드 -->
      <div class="com-input-box">
        <div class="input-lable">패스워드<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="pwd" name="pwd" placeholder="패드워드 입력">
          <i class="far fa-check-square"></i>
        </div>
      </div>
      <!-- 패스워드 확인 -->
      <div class="com-input-box" >
        <div class="input-lable" style="padding-left: 15px;">패스워드확인<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="pwdcheck" placeholder="패드워드 확인" style="margin-left: 5px;">
          <i class="far fa-check-square"></i>
        </div>
      </div>
      <!-- 대표자명 -->
      <div class="com-input-box">
        <div class="input-lable">대표자명<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="president" name="president" placeholder="대표자명 입력">
          <i class="far fa-check-square"></i>
        </div>
      </div>
      <!-- 기업분야  -->
      <div class="com-input-box" style="width: 262px; height: 94px;">
        <div class="input-lable" style="padding-left: 15px;">기업분야<span style="color: red;">*</span></div>
        <div class="input-content">
          <select id="c_department" name="c_department">
            <option value="0">선택하기</option>
          </select>
        </div>
      </div>

      <!-- 기업종류 -->
      <div class="com-input-box" style="width: 262px; height: 94px; float: right;;">
        <div class="input-lable" style="padding-left: 15px;">기업종류<span style="color: red;">*</span></div>
        <div class="input-content">
          <select id="c_type" name="c_type">
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
          <input type="text" id="number" name="number" placeholder="사업자번호 입력">
          <i class="far fa-check-square"></i>
        </div>
      </div>
      <!-- 대표연락처 -->
      <div class="com-input-box" >
        <div class="input-lable" style="padding-left: 15px;">대표 연락처<span style="color: red;">*</span></div>
        <div class="input-content">
          <input type="text" id="tel" name="tel" placeholder="대표 연락처 입력" style="margin-left: 5px;">
          <i class="far fa-check-square true"></i>
        </div>
      </div>
    </div>
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
    document.querySelector('#c_department').innerHTML += '<option value="'+ arr +'">'+arr+'</option>';
  }

  // 회원가입 input validate
  var c_nameCheck = false;  // 회사명 체크
  var emailCheck = false;   // 이메일 체크
  var pwdCheck = false;     // 비번 체크
  var pwdcheckCheck = false;  // 비번확인 체크
  var presidentCheck = false; // 대표자 체크
  var c_departmentCheck = false;  // 기업분야 체크
  var c_typeCheck = false;    // 기업 종류 선택
  var numberCheck = false;    // 사업자번호 체크
  var telCheck = false;     // 대표 연락처 체크
  
  // input 값
  var c_name = document.querySelector('#c_name');
  var email = document.querySelector('#email');
  var pwd =  document.querySelector('#pwd');
  var pwdcheck = document.querySelector('#pwdcheck');
  var president = document.querySelector('#president');
  var c_department = document.querySelector('#c_department');
  var c_type = document.querySelector('#c_type');
  var number = document.querySelector('#number');
  var tel = document.querySelector('#tel');

  // 회사명 체크 
  

  // 가입버튼 누름
  const joinBtn = () => {

    
    
  }

</script>

<%@include file ="../../../include/footer.jsp" %>

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

/* select-box */

select {float: right; margin-left: 0px; width: 250px; padding: .8em .5em; font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  
  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #eaeaea; border-radius: 0px; outline: none;}
select:focus{ border: 1px solid #bbb;}
select::-ms-expand { /* for IE 11 */ display: none;}

/* 가입 버튼 */
.com-content-wrap .com-input-btn{ color: #fff; background-color: #4f6eff; border-radius: 3px; font-size: 17px;
width: 500px; height: 60px; line-height: 60px; text-align: center; margin: 0 auto; margin-top: 40px; cursor: pointer;}
</style>

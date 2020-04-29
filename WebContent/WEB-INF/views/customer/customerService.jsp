<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<div class="profile-wrap">
  <div class="service-title">
     <div>문의 등록하기</div>
     <span>
         궁금한 내용을 작성하여 문의해주시면 이메일 주소로 답변을 보내드립니다.<br>
         답변까지는 2-3일 정도 소요될 수 있습니다.<br>
         비회원은 수신 가능한 이메일 주소를 적어주시기 바랍니다.
     </span>
 </div>
 <div class="service-content">
     <form id="frm" method="post" action="/Pickme/admin/question/insertQuestion.do">
         <div class="category">
             <div>이메일주소<span class="redtext">*</span></div>
             <input type="text" name="email">
         </div>
         <div class="category">
             <div>타입<span class="redtext">*</span></div>
             <select name="type">
                 <option value="서비스이용">서비스이용</option>
                 <option value="환불/유료서비스">환불/유료서비스</option>
                 <option value="채용/이력서">채용/이력서</option>
                 <option value="이벤트/공지사항">이벤트/공지사항</option>
                 <option value="기타">기타</option>
             </select>
         </div>
         <div class="category">
             <div>제목<span class="redtext">*</span></div>
             <input type="text" name="title" id="title">
         </div>
         <div class="category">
             <div>문의내용<span class="redtext">*</span></div>
             <textarea name="content"></textarea>
         </div>
     </form>
     <div class="agreement">
         <div class="title">개인정보 수집 및 이용에 대한 동의 내용</div>
         <span>
             정보통신망 이용촉진 및 정보보호 등에 관한 법률을 준수하며 고객님의 개인정보를 수집하고 소중하게 다루고 있습니다. 
             ①개인정보 수집 항목: 이름, 이메일 주소 ②수집목적: 고객식별, 문의응대, 서비스 품질 향상 ③보유 및 이용기간:
             수집 목적이 달성되면 지체없이 모든 개인정보를 파기합니다. 
             단, 관계법령에서 일정 기간 정보의 보관을 규정한 경우에 한해 분리 보관 후 파기합니다.
         </span>
         <div class="check">
             <label for="agreement">
            	 동의하시겠습니까?<span class="redtext">*</span>
             </label>
             <input type="checkbox" id="agreement">
         </div>
     </div>
 </div>
 <div class="insertBtn">
    <button type="button" onclick="insertQuestion()">문의하기</button>
 </div>
</div>
<!-- SCRIPT -->
<script>
// 문의하기 버튼시 
function insertQuestion(){

    let email = document.querySelector('input[name=email')
    let title = document.querySelector('input[name=title')
    let content = document.querySelector('textarea[name=content');
    // 빈칸 체크
    if( email.value.trim() == "" || title.value.trim() == "" || content.value.trim() == ""){
        sweetAlert('error', '빈칸을 모두 채워주세요.', 800, false)
        return false
    }
    // 1. 정규식 체크
    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if( !regExp.test( email.value ) ){
        email.focus();
        sweetAlert('error', '이메일 형식이 아닙니다', 800, false)
        return false
    }

    // 2. 동의하기 체크
    let check = $('#agreement').prop('checked');
    if( check === false ){
        sweetAlert('error', '개인정보 수집 및 이용에 체크해주세요!', 1500, false)
        return false;
    }
    
    console.log(email.value)
    console.log(title.value)
    console.log(content.value)
    console.log(document.querySelector('select[name=type]').value)

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
</script>


<!-- CSS -->
<style>
.redtext { color: tomato; }
/* service-title */
.service-title { margin-bottom: 30px;}
.service-title > div{ font-size: 30px; margin: 15px 0;} 
.service-title > span { font-size: 15px; color: #333; font-weight: 300;} 
/* service-content */
.service-content{ border: 1px solid #eaeaea;}
.service-content .category{ margin: 20px 30px;}
.service-content .category > div{ font-size: 13px; margin-left: 5px;}
.service-content .category > input{ width: 1000px; height: 40px; margin: 10px 0; outline: none;  border: 1px solid #eaeaea; padding-left:10px; }
.service-content .category select{ outline: none; margin: 10px 0; width: 500px; /* 원하는 너비설정 */ padding: .8em .5em; /* 여백으로 높이 설정 */ font-family: inherit; /* 폰트 상속 */ background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ border: 1px solid #eaeaea; border-radius: 0px; /* iOS 둥근모서리 제거 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
/* textarea */
.service-content .category > textarea { padding-left:10px; width: 1000px; height: 200px; outline: none; border: 1px solid #eaeaea; margin: 10px 0;}
/* agreement */
.agreement{ margin: 20px 30px;}
.agreement .title{ font-size: 16px; font-weight: 600; margin: 10px 0; } 
.agreement > span { font-size: 14px; }
.agreement .check { margin: 15px 0;  margin-bottom: 25px;}
/* insertBtn */
.insertBtn{ width: 200px; margin: 0px auto; margin-top: 60px;}
.insertBtn button{ background-color: #304edf; width: 200px; height: 40px; border-radius: 20px; color: #fff;}
</style>
<%@include file ="../../../include/footer.jsp" %>
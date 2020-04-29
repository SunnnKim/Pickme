<%@page import="model.QuestionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>
<%
	QuestionDto detail = (QuestionDto) request.getAttribute("detail");
%>

<div class="profile-wrap">
<!-- 여기부터 복붙하기 -->
 <div class="question-title">문의내용</div>
 <div class="question-title">답변하기</div>

 <div class="question-wrapper">
   <div class="q-content">
     <div class="label">문의종류</div>
     <div class="text-content"><%=detail.getType()%></div>
   </div>
   <div class="q-content">
     <div class="label">제목</div>
     <div class="text-content"><%= detail.getTitle()%></div>
   </div>
   <div class="q-content">
     <div class="question-content" id="questionContent">
     	<%=detail.getContent().replaceAll("\n", "<br>") %>
     </div>
   </div>
 </div>
 
 <div class="answer-wrapper">
   <div class="question-wrapper">
     <div class="q-content">
       <div class="label">수신자</div>
       <div class="text-content"><%=detail.getEmail() %></div>
       <div class="q-content">
         <div class="label">발신자</div>
         <div class="text-content">pickme_job@naver.com</div>
       </div>
     </div>
     <div class="q-content">
         <textarea id="reply"></textarea>
     </div>
   </div>
   <div class="answerBtn">
     <button type="button" onclick="sendEmail()">답변하기</button>
   </div>
 </div>
</div>
<form id="frm" action="/Pickme/admin/question/sendQuestionEmail.do" method="post">
	<input type="hidden" name="seq" value="<%=detail.getSeq()%>">
	<input type="hidden" name="reply">
</form>
<script>
function sendEmail(){
	var reply = document.querySelector('#reply').value;
	if( reply == '' ){
		alert('답변내용을 입력하세요')
		return false
	}
	//reply.replace(/\n/gi, "<br>");	// 개행을 모두 <br>태그로 변환
	document.querySelector('input[name=reply]').value = reply;	
	document.querySelector('#frm').submit();
		
}
</script>
<style>
  /* 문의내역 */
.question-title{ font-size: 28px; font-weight: 300; margin: 0px 0; margin-bottom: 20px; text-align: center;
width: 500px; float: left;
}
.question-wrapper {
  border: 1px solid #fff; padding: 10px; margin: 10px 10px; margin-bottom: 50px; width: 500px; float: left; 
 }
.question-wrapper .q-content{ margin: 10px 0;}
.question-wrapper .q-content .label{
  font-size: 13px; font-weight: 300; padding-left: 2px;
}
.question-wrapper .q-content .text-content{ font-size: 18px; font-weight: 500;}
.question-wrapper .q-content .question-content{ font-size: 16px; font-weight: 300; 
   overflow-y: scroll; height: 300px; background-color: #fff; padding: 10px;
}
/* 답변하기부분 */
.question-wrapper .q-content input{
  width: 480px; height: 40px; margin: 10px 0; outline: none; padding: 10px;
}
.question-wrapper .q-content textarea{
  width: 480px; height: 300px; border: 1px solid #eaeaea; padding: 10px; outline: none;
}
/* 버튼 */
.answerBtn{ width: 200px; margin: 0 auto;}
.answerBtn button{ outline:none;
  background-color: #304edf; width: 200px; height: 40px; line-height: 40px; color: #fff; border-radius: 20px;
}
</style>

<%@include file="../include/footer.jsp" %>

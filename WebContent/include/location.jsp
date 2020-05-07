<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lourl = request.getServletPath();  //프로젝트의 경로값만 가져옴
// System.out.println(ifurl);
%>

<!-- 마이페이지 일반회원 - 프로필  -->
<% if (lourl.contains("/a_mypage/profile")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>프로필</span>
</div> 
<% } %>

<!-- 마이페이지 일반회원 - 비밀번호 수정  -->
<% if (lourl.contains("/a_mypage/changePassword")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>비밀번호 변경</span>
</div> 
<% } %>

<!-- 마이페이지 일반회원 - 문의내역  -->
<% if (lourl.contains("/a_mypage/inquiry")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>문의내역</span>
</div> 
<% } %>

<!-- 마이페이지 일반회원 - 탈퇴  -->
<% if (lourl.contains("/a_mypage/withdrawal")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>탈퇴</span>
</div> 
<% } %>

<!-- 이력서  -->
<% if (lourl.contains("/resume/resume.jsp")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>이력서</span>
</div> 
<% } %>

<!-- 이력서 작성  -->
<% if (lourl.contains("/resume/resumeWrite.jsp")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>이력서</span>
	<span>></span>
	<span>이력서 작성</span>
</div> 
<% } %>




<!-- 일반 로그인 페이지  -->
<% if (lourl.contains("/login/mem")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>회원서비스</span>
	<span>></span>
<% if(lourl.contains("memLogin.jsp")){
	%>
		<span>로그인</span>
	<%
	}else if(lourl.contains("memJoin.jsp")){
		%>
		<span>회원가입</span>
		<%
	}else if(lourl.contains("memFindEmailPwd.jsp") || lourl.contains("memChange")){
		%>
		<span>이메일/비밀번호 분실</span>
		<%
	}
%>
</div>
<% } %>


<!-- 기업로그인 페이지 -->
<% if (lourl.contains("/login/com")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>기업서비스</span>
	<span>></span>
<% if(lourl.contains("comLogin.jsp")){
	%>
		<span>기업로그인</span>
	<%
	}else if(lourl.contains("comJoin.jsp")){
		%>
		<span>기업회원가입</span>
		<%
	}else if(lourl.contains("comFindEmailPwd.jsp") || lourl.contains("comChange")){
		%>
		<span>이메일/비밀번호 분실</span>
		<%
	}
%>
</div>
<% } %>
<!-- 회원 이메일 인증 페이지  -->
<% if (lourl.contains("login/validate")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>회원서비스</span>
	<span>></span>
	<span>회원인증</span>
</div> 
<% } %>
<!-- apply - message -->
<% if (lourl.contains("e_apply") && lourl.contains("Msg")) {%>

<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원현황</span>
	<span>></span>
	<span>메세지함</span>
</div>

<% } %>

<!-- apply - cvReq -->
<% if (lourl.contains("CvReq")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원현황</span>
	<span>></span>
	<span>열람요청보기</span>
</div>

<% } %>


<!-- apply - applyList -->
<% if (lourl.contains("curApplyList") || lourl.contains("pastApplyList")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원현황</span>
	<span>></span>
	<span>나의지원내역</span>
</div>
<% } %>

<!-- apply - interest -->
<% if (lourl.contains("interest") || lourl.contains("likeRecruit")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원현황</span>
	<span>></span>
	<span>나의관심</span>
</div>
<% } %>





<!-- 기업_지원자 관리 -->

<% if ( lourl.contains("cApplyList") || lourl.contains("cApplyMain")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원 현황</span>
	<span>></span>
	<span>지원자 관리</span>
</div>
<% } %>

<!-- 기업_메세지함-->
<% if ( lourl.contains("c_apply") && lourl.contains("Msg") ) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원 현황</span>
	<span>></span>
	<span>메시지함</span>
</div> 
<% } %>


<!-- 기업_이력서 열람요청 -->

<% if ( lourl.contains("c_apply") && lourl.contains("request") ) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원 현황</span>
	<span>></span>
	<span>이력서 열람 요청</span>
</div>
<% } %>





<!-- 채용등록 -->
<% if (lourl.contains("recInsert")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용관리</span>
	<span>></span>
	<span>공고등록</span>
</div>
<% } %>
<!-- 현재공고 -->
<% if (lourl.contains("recNow")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용관리</span>
	<span>></span>
	<span>현재공고</span>
</div>
<% } %>
<!-- 지난채용 -->
<% if (lourl.contains("recPast")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용관리</span>
	<span>></span>
	<span>지난공고</span>
</div>
<% } %>
<% if (lourl.contains("recUpdate")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용관리</span>
	<span>></span>
	<span>공고수정</span>
</div>
<% } %>
<!-- 기업)채용상세 -->
<% if (lourl.contains("/myRecDetail")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용관리</span>
	<span>></span>
	<span>채용상제</span>
</div>
<% } %>

<!-- 채용탐색>채용상세 -->
<% if (lourl.contains("/recDetail")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용탐색</span>
	<span>></span>
	<span>채용상세</span>
</div>
<% } %>

<!-- 채용탐색 -->
<% if (lourl.contains("recSearch")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>채용탐색</span>
	<span>></span>
	<span></span>
</div>
<% } %>

<!-- 기업 정보 수정 -->
<% if (lourl.contains("update.jsp")) { %>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>기업정보 수정 · 등록</span>
</div>
<% } %>

<!-- 기업 결제 -->
<% if (lourl.contains("payment.jsp")) { %>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>결제</span>
</div>
<% } %>

<!-- 기업 정보 (기업 마이페이지) -->
<% if (lourl.contains("myPage.jsp")) { %>
<div class="location">
</div>
<% } %>


<!-- 기업 탈퇴 -->
<% if (lourl.contains("withdrawal.jsp")) { %>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>탈퇴</span>
</div>
<% } %>

<!-- 기업 비밀번호 수정 -->
<% if (lourl.contains("passwordUpdate.jsp")) { %>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>마이페이지</span>
	<span>></span>
	<span>비밀번호 변경</span>
</div>
<% } %>

<!-- 공지사항 -->
<% if (lourl.contains("noticeList")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>고객센터</span>
	<span>></span>
	<span>공지사항</span>
</div>
<% } %>

<!-- 자주묻는질문  -->
<% if (lourl.contains("customer/customerQuestion")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>고객센터</span>
	<span>></span>
	<span>자주묻는질문</span>
</div>
<% } %>

<!-- 문의하기   -->
<% if (lourl.contains("customer/customerService")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>고객센터</span>
	<span>></span>
	<span>문의하기</span>
</div>
<% } %>

<!-- 고객센터 - 기업유료서비스보기 -->
<% if (lourl.contains("customer/paidService")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>고객센터</span>
	<span>></span>
	<span>기업유료서비스</span>
</div>
<% } %>

<!-- 인재탐색  -->
<% if (lourl.contains("/searchPeople/")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>인재탐색</span>
</div> 
<% } %>

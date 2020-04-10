<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lourl = request.getServletPath();  //프로젝트의 경로값만 가져옴
// System.out.println(ifurl);
%>


<!-- recruit - 구인 현황  -->
<% if (lourl.contains("c_message.jsp")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>구인 현황</span>
	<span>></span>
	<span>메세지함</span>
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
<% if (lourl.contains("Msg")) {%>
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
<% if (lourl.contains("AList")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>지원현황</span>
	<span>></span>
	<span>나의지원내역</span>
</div>
<% } %>



<!-- c_apply -->

<% if (lourl.contains("requestList.jsp") || lourl.contains("requestLike.jsp")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>구인 현황</span>
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

<!-- 채용상세 -->
<% if (lourl.contains("recDetail")) {%>
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
	<span>전체보기</span>
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



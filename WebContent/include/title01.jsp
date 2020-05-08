<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ifurl = request.getServletPath();  //프로젝트의 경로값만 가져옴
 System.out.println(ifurl);

%>

<!-- c_apply - 구인 현황  -->
<% if (ifurl.contains("c_apply")){ %>

	<% if(ifurl.contains("openResumeDetail")){%>
	지원이력서보기
	<% }
	else {%>
	지원현황
	<% }%>
<% } %>	
<!-- c_apply 이력서 디테일 -->

<!-- 일반로그인 서비스 -->
<% if(ifurl.contains("/login/mem")){
%>
회원서비스 
<% } %>

<!-- 기업 서비스 -->
<% if(ifurl.contains("/login/com")){
%>
기업서비스 
<% } %>

<!-- 이메일 인증페이지 -->
<% if (ifurl.contains("login/validate")){ %>
회원인증
<% } %>	

<!-- 일반 마이페이지 프로필 -->
<% if(ifurl.contains("/a_mypage/profile")){%>
프로필
<% }%>

<!-- 일반 마이페이지 비밀번호 변경 -->
<% if(ifurl.contains("/a_mypage/changePassword")){%>
비밀번호 변경
<% }%>

<!-- 일반 마이페이지 문의내역 -->
<% if(ifurl.contains("/a_mypage/inquiry")){%>
문의내역
<% }%>

<!-- 일반 마이페이지 탈퇴 -->
<% if(ifurl.contains("/a_mypage/withdrawal")){%>
탈퇴
<% }%>

<!-- 이력서 관리-->
<% if(ifurl.contains("/resume/resume.jsp")){%>
이력서
<% }%>

<!-- 이력서 작성 -->
<% if(ifurl.contains("/resume/resumeWrite.jsp")){%>
이력서 작성
<% }%>


<!--  apply - 지원 현황 -->
<% if(ifurl.contains("e_apply")){%>
지원현황
<% }%>


<!--  recruit - 채용관리 -->
<% if(ifurl.contains("/recruit")){
	 if(ifurl.contains("recInsert.jsp")){ %>
	채용등록
<% } else if(ifurl.contains("recNow.jsp")){ %>
	현재공고
<% } else if(ifurl.contains("recPast.jsp")){ %>
	지난공고
<% } else if(ifurl.contains("recUpdate.jsp")){ %>
	공고수정
<% } 
}%>


<!--  searchJob - 채용탐색 -->
<% if(ifurl.contains("/searchJob/recSearch")){%>
		채용탐색 		
<% }%>


		
<!--  c_mypage 기업 마이페이지  -->
<%
if(session.getAttribute("logincompany") != null) {
	if(ifurl.contains("/c_mypage/passwordUpdate.jsp") || ifurl.contains("/c_mypage/myPage1.jsp")
			|| ifurl.contains("/c_mypage/payment.jsp") || ifurl.contains("/c_mypage/update.jsp")
			|| ifurl.contains("/c_mypage/withdrawal.jsp")) { %>
		마이페이지
<%	}
} else if(session.getAttribute("logincompany") == null ) {
	if(ifurl.contains("/c_mypage/myPage1.jsp")) { %>
		회사정보
<%	}
}
%>


<!-- 결제 직전 단계 디테일 -->
<% if(ifurl.contains("/c_mypage/paymentDetail.jsp")) { %>
		결제
<% } %>


<!-- 고객센터  -->
<% if(ifurl.contains("/customer/")){%>
고객센터
<% }%>

<!--  searchPeople - 인재탐색 -->
<% if(ifurl.contains("/searchPeople/")){%>
		인재탐색 		
<% }%>

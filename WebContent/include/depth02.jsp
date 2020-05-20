<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
String durl = request.getServletPath();  
System.out.println("durl:"+durl);
%>


<!-- 기업_지원현황 -->

<% if (durl.contains("c_apply")){ %>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("cApply") ? " on" :" "%>>
		<a href="cApplyMain.do">지원자 관리</a>
	</li>
	<li class=<%= durl.contains("c_apply") && durl.contains("Msg")? " on" :" "%>>
		<a href="cRcvMsg.do">메시지함</a>
	</li>
	<li class=<%= durl.contains("requestList") || durl.contains("requestLike") ? " on" :" "%>>
		<a href="getRequestList.do">이력서 열람 요청</a>
	</li>
</ul>
<%
}	
%>	

<!-- 일반 로그인 페이지  -->
<% 
if (durl.contains("/login/mem")){
%>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("memLogin.jsp") ? " on" :" "%>>
		<a href="/Pickme/login/memLogin.do">회원로그인</a>
	</li>
	<li class=<%= durl.contains("memJoin.jsp") ? " on" :" "%>>
		<a href="/Pickme/login/memJoin.do">회원가입</a>
	</li>
	<li class=<%= durl.contains("memFindEmailPwd.jsp") || durl.contains("memChange") ? " on" :" "%>>
		<a href="/Pickme/login/findEmailPwdA.do">이메일/비밀번호찾기</a>
	</li>
</ul>
<%
}	
%>	
<!-- 기업 로그인 페이지  -->
<% 
if (durl.contains("/login/com")){
%>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("comLogin.jsp") ? " on" :" "%>>
		<a href="/Pickme/login/company/comLogin.do">기업로그인</a>
	</li>
	<li class=<%= durl.contains("comJoin.jsp") ? " on" :" "%>>
		<a href="/Pickme/login/company/comJoin.do">기업회원가입</a>
	</li>
	<li class=<%= durl.contains("comFind") ? " on" :" "%>>
		<a href="/Pickme/login/company/findEmailPwdC.do">이메일/비밀번호찾기</a>
	</li>
</ul>
<%
}	
%>
<!-- 기업 마이페이지 -->	
<%

if (durl.contains("c_mypage")) {
	if ( !durl.contains("c_mypage/myPage.jsp") && !durl.contains("c_mypage/paymentDetail.jsp") ) {
		if( session.getAttribute("logincompany") != null ){
		%>
		<ul class = "depth02 clfix">
			<li class = <%= durl.contains("update.jsp") ? " on" :" " %>>
				<a href="goUpdate.do">기업정보 수정 · 등록</a>
			</li>
			<li class = <%= durl.contains("passwordUpdate.jsp") ? " on" :" " %>>
				<a href="goPasswordUpdate.do">비밀번호 변경</a>
			</li>
			<li class = <%= durl.contains("payment.jsp") || durl.contains("refundRequest") ? " on" :" " %>>
				<a href="goPayment.do">결제내역 </a>
			</li>
			<li class = <%= durl.contains("withdrawal.jsp") ? " on" :" " %>>
				<a href="goWithdrawal.do">탈퇴</a>
			</li>
		</ul>
	<% }
	}
} %>

<!-- 일반 마이페이지 -->
<% if (durl.contains("a_mypage")){ %>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("profile.jsp") ? " on" :" "%>>
		<a href="/Pickme/a_mypage/profile.do">프로필</a>
	</li>
	<li class=<%= durl.contains("changePassword.jsp") ? " on" :" "%>>
		<a href="/Pickme/a_mypage/changePassword.do">비밀번호 변경</a>
	</li>
	<%-- <li class=<%= durl.contains("inquiry.jsp") ? " on" :" "%>>
		<a href="/Pickme/a_mypage/inquiry.do">문의내역</a>
	</li> --%>
	<li class=<%= durl.contains("withdrawal.jsp") ? " on" :" "%>>
		<a href="/Pickme/a_mypage/withdrawal.do">탈퇴</a>
	</li>
</ul>
<%
}	
%>	

<!-- 일반 마이페이지 -->
<% if (durl.contains("resume")){ %>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("resume.jsp") ? " on" :" "%>>
		<a href="/Pickme/resume/resume.do">이력서</a>
	</li>
	<li class=<%= durl.contains("resumeWrite.jsp") ? " on" :" "%>>
		<a href="/Pickme/resume/resumeWrite.do">이력서 작성</a>
	</li>
</ul>
<%
}	
%>	


<!-- apply  -->
<%
if( durl.contains("e_apply")){
%>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("CvReq")? " on" : " " %>>
		<a href="curCvReq.do">이력서열람요청</a>
	</li>
	<li class=<%= durl.contains("Msg") ? " on" :" "%>>
		<a href="inMsg.do">메시지함</a>
	</li>
	<li class=<%= durl.contains("ApplyList")? " on" : " "%>>
	  <a href="curApplyList.do">나의지원내역</a>
	</li>
	<li class=<%= durl.contains("interest") || durl.contains("like") ? " on" : " "%>>
	  <a href="interestCom.do">나의관심</a>
	</li>
</ul>
<%} %>


<!-- recruit. 공고 detail -->
<% if(durl.contains("/searchJob/recDetail")){ %>
<div class="recDetailTop clfix">
          <div class="detailTop-left">
            <h1 class="recTit"></h1>
            <h3 class="recSubTit"></h3>
          </div><!-- .detailTop-left -->
          <div class="detailTop-right">
            <section class="section-controller">
              <button type="button" id="recruitDetailButton1"><i class="fas fa-edit"></i>지원하기</button>
              <button type="button" id="recruitDetailButton2"><i class="fas fa-envelope"></i>쪽지보내기</button>
            </section>
          </div><!-- .detailTop-right -->
        </div><!-- .recDetailTop -->
<% } %>

<!-- 채용관리에서. 공고 detail -->
<%	if (durl.contains("/recruit/myRecDetail")) { %>
<div class="recDetailTop clfix">
	<div class="detailTop-left">
		<h1 class="recTit"></h1>
		<h3 class="recSubTit"></h3>
	</div>
	<!-- .detailTop-left -->
	<div class="detailTop-right">
		<section class="section-controller">
			<%-- 
             <c:if test="${recDto.del eq 0 }">
	              <button type="button" id="recruitDetailButton1"><i class="fas fa-edit"></i>수정하기</button>
	              <button type="button" id="recruitDetailButton2"><i class="fas fa-stopwatch"></i>마감하기</button>
              </c:if>
              <c:if test="${recDto.del eq 1 }">
	              <button type="button" id="recruitDetailButton1" disabled="disabled" style="cursor: default;background-color: #ccc;"><i class="fas fa-edit"></i>수정하기</button>
	              <button type="button" id="recruitDetailButton2" disabled="disabled" style="cursor: default;background-color: #ccc;"><i class="fas fa-stopwatch"></i>마감하기</button>
              </c:if>
            --%>
			<c:choose>
				<c:when test="${location eq 'cApply' }"></c:when>
				<c:otherwise>	
					<c:if test="${recDto.del eq 0 }">
						<button type="button" id="recruitDetailButton1">
							<i class="fas fa-edit"></i>수정하기
						</button>
						<button type="button" id="recruitDetailButton2">
							<i class="fas fa-stopwatch"></i>마감하기
						</button>
					</c:if>
					<c:if test="${recDto.del eq 1 }">
						<button type="button" id="recruitDetailButton1"
							disabled="disabled"
							style="cursor: default; background-color: #ccc;">
							<i class="fas fa-edit"></i>수정하기
						</button>
						<button type="button" id="recruitDetailButton2"
							disabled="disabled"
							style="cursor: default; background-color: #ccc;">
							<i class="fas fa-stopwatch"></i>마감하기
						</button>
					</c:if>
				</c:otherwise>
			</c:choose>
		</section>
	</div>	<!-- .detailTop-right -->
</div><!-- .recDetailTop -->
<%	} %>

<!-- recruit. 채용관리 -->
<%
	if (durl.contains("/recruit") && !durl.contains("/recruit/myRecDetail")) {
%>
	  <ul class="depth02 clfix">
	  <li class=<%=durl.contains("recNow") ? " on" : " "%>>
			<a href="javascript:goPageRec('now');">현재공고보기</a>
		</li>
		<li class=<%= durl.contains("recPast") ? " on" :" "%>>
			<a href="javascript:goPageRec('past');">지난공고보기</a>
		</li>
		<li class=<%= durl.contains("recInsert") ? " on" :" "%>>
			<a href="javascript:goPageRec('insert');">공고등록하기</a>
		</li>
	 </ul><!-- // depth02 -->
	 
	 
<% } %>
<!-- 현재공고/지난공고 볼때  로그인한 기업 seq 넘기기 -->
<form name="seqFrm">
	 	<input type="hidden" name="comSeq" value="${sessionScope.logincompany.seq}"> 
</form>
<script>
function goPageRec(str) {
    var f = document.seqFrm;

    if(str==="now"){
	    f.action = "/Pickme/recruit/recNow.do";
    } else if(str==="past"){
    	f.action = "/Pickme/recruit/recPast.do";
    } else if(str==="insert"){
		f.action = "/Pickme/recruit/recInsert.do";
    }
    // 전송 방식 : post
    f.method = "post";
    f.submit();
  };
</script>

<!-- searchJob. 채용탐색 -->
<% if(durl.contains("/searchJob/recSearch")){ %>
 <ul class="jobs_list clfix" id="joblist">
 </ul>
<% } %>


<!-- 고객센터  -->
<% 
if (durl.contains("customer/")){
%>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("notice") ? " on" :" "%>>
		<a href="/Pickme/customer/noticeList.do">공지사항</a>
	</li>
	<li class=<%= durl.contains("customerService.jsp") ? " on" :" "%>>
		<a href="/Pickme/customer/customerService.do">문의하기</a>
	</li>
	<%	
		// 기업에만 보이는 유료서비스페이지
		if(session.getAttribute("logincompany") != null){
			%>
			<li class=<%= durl.contains("paidService") ? " on" :" "%>>
				<a href="/Pickme/customer/paidService.do">[기업] 유료서비스</a>
			</li>
			<%
		}
	%>
</ul>
<%
}	
%>	



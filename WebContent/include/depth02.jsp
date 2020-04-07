<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String durl = request.getServletPath();  
System.out.println("durl:"+durl);
%>


<!-- c_apply -->

<% if (durl.contains("c_apply")){ %>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("recruitList.jsp") ? " on" :" "%>>
		<a href="">지원자 관리</a>
	</li>
	<li class=<%= durl.contains("c_message.jsp") ? " on" :" "%>>
		<a href="c_message.do">메시지함</a>
	</li>
	<li class=<%= durl.contains("requestList.jsp") ? " on" :" "%>>
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
	<li class=<%= durl.contains("memIdpwd.jsp") ? " on" :" "%>>
		<a href="/Pickme/login/memIdPwd.do">이메일/비밀번호찾기</a>
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
	<li class=<%= durl.contains("comIdpwd.jsp") ? " on" :" "%>>
		<a href="/Pickme/login/company/comIdPwd.do">이메일/비밀번호찾기</a>
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
		<a href="curCvReq.do">열람요청보기</a>
	</li>
	<li class=<%= durl.contains("Msg") ? " on" :" "%>>
		<a href="inMsg.do">메시지함</a>
	</li>
	<li class=<%= durl.contains("AList")? " on" : " "%>>
	  <a href="curAList.do">나의지원내역</a>
	</li>
</ul>

<%} %>

<!-- recruit. 공고 detail -->
<% if(durl.contains("/recruit/recDetail")){ %>
<div class="recDetailTop clfix">
          <div class="detailTop-left">
            <h1 class="recTit"></h1>
            <h3 class="recSubTit"></h3>
          </div><!-- .detailTop-left -->
          <div class="detailTop-right">
            <section class="section-controller">
              <button type="button"><i class="fas fa-edit"></i>지원하기</button>
              <button type="button"><i class="fas fa-envelope"></i>쪽지보내기</button>
            </section>
          </div><!-- .detailTop-right -->
        </div><!-- .recDetailTop -->
<% } %>

<!-- searchJob. 채용탐색 -->
<% if(durl.contains("/searchJob/recSearch")){ %>
 <ul class="jobs_list clfix" id="joblist">
          </ul>
<% } %>
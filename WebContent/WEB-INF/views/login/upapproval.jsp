<%@page import="model.CMemberDto"%>
<%@page import="model.AMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session
	AMemberDto member = (AMemberDto) session.getAttribute("loginuser");
	CMemberDto company = (CMemberDto) session.getAttribute("logincompany");
	String userName = "";
	String userMail = "";
	String memType = "";
	// 인증 페이지
	
	if( member != null ){
		userName = member.getName();
		userMail = member.getEmail();
		memType = "aMember";
		
	}
	else if( company != null ){
		userName = company.getName();
		userMail = company.getEmail();
		memType = "cMember";
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= 1050px, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
.validate-box{ width: 500px; float: left; margin-top: 80px; }
.validate-box p{ font-size: 20px; margin: 30px 20px; }
.validate-box input{ width: 400px; height: 50px;outline: none; margin: 20px 0;margin-left: 20px; padding-left: 10px }
.validate-box #codeBtn{ background: #4f6eff; color:#fff; margin-left: 20px; outline: none; font-size: 15px; width: 400px; height: 50px; text-align: center; transition: all 0.3s ease-in-out; }
.validate-box #codeBtn:hover{ background: #3349ac; }
.validate-img{ margin-top: 30px; width: 500px; float: right; }
.validate-img img{ width: 500px; }
/* validate-input */
.validate-input{ margin: 30px 0; margin-left: 20px; width: 400px; text-align: center; }
.validate-input input{ width: 280px; height: 50px; outline: none; padding-left: 10px; }
.validate-input #pressBtn{ border: 1px solid #3349ac; color: #3349ac; border-radius: 5px; margin-left: 15px; width: 100px; height: 50px; outline: none; transition: all 0.3s ease-in-out; }
.validate-input #pressBtn:hover{ background: #3349ac; color: #fff; }

</style>
<title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css">
<!-- 디자인 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css">
<!-- font-awesome -->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="/Pickme/js/jquery/jquery-3.4.1.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

</head>
<body>
<div id="wrap">
	<header>
		<div class="inner clfix">
			<strong class="logo"><a href="/Pickme/login/main.do">PICK ME</a></strong>
			<%
		 // 일반 로그인일 떄 
	 	 if( member != null ){
	 		 %>
	 		 <nav class="gnb">
				<a href="/Pickme/searchJob/recSearch.do">채용탐색</a> <!-- 일반회원 채용탐색  -->
				<a href="#">이력서</a><!-- 일반회원 이력서쓰기  -->
				<a href="/Pickme/e_apply/curCvReq.do">지원현황</a><!-- 일반회원 지원현황  -->
				<a href="#none">고객센터</a>
			</nav>
			<!-- // gnb -->
			<ul class="header_infoBtn clfix">
				<li><button type="button" id="searchBtn"></button></li>
				<li>
					<a href="#mypage.do"><%=userName %> 님 </a><!-- 일반회원 마이페이지 -->
				</li>
				<li><a href="/Pickme/login/logout.do">로그아웃</a></li>
			</ul>
	 		 <%
	 		 // 기업회원 로그인일때
	 	 } else if( company != null ){
			 %>
			 <nav class="gnb">
				<a href="#none">인재탐색</a> <!-- 기업회원 인재탐색  -->
				<a href="#">지원현황</a><!-- 기업회원 지원현황  -->
				<a href="/Pickme/e_apply/curCvReq.do">채용관리</a><!-- 기업회원 채용현황  -->
				<a href="#none">고객센터</a>
			</nav>
			<!-- // gnb -->
			<ul class="header_infoBtn clfix">
				<li><button type="button" id="searchBtn"></button></li>
				<li>
					<a href="#mypage.do"> <%=userName %> </a><!-- 기업회원 마이페이지 -->
				</li>
				<!-- 기업회원 마이페이지 -->
				<li><a href="/Pickme/login/company/logout.do">로그아웃</a></li>
			</ul>
			 <%
		 } 
		%>
		</div>
		<!-- // inner -->
	</header>
	<!-- // header -->
	<div id="sub-container">
		<div class="inner">
			<div class="subTit">
				<h2 class="pageTit"><%@include file ="../../../../include/title01.jsp" %></h2>
				<!-- location -->
				<%@include file ="../../../include/location.jsp" %>
				<!-- depth02 -->
				<%@include file ="../../../../include/depth02.jsp" %>
			</div>
			<!-- // subTit -->
			<div class="subCont">
			
				<div class="profile-wrap">
					<div class="validate-box">
			            <p>사업자등록번호 오류로 서비스를 이용할 수 없습니다.<br>새로운 사업자등록번호를 입력하세요</p>
			            <input type="text" name="num" maxlength="10">
			            <button type="button" id="codeBtn">사업자등록번호 변경</button>
       				</div>
			        <div class="validate-img">
			            <img src="/Pickme/images/sub/validateImg.jpg">
			        </div>
			        <form method="post" action="accountValidate.do" id="frm">
							<input type="hidden" name="number" value="">
							<input type="hidden" name="email" value="<%=userMail%>">
					</form>
				</div>
				
<script type="text/javascript">

$(document).on('click','#codeBtn', function(){
	var inputCode = $('input[name=num]').val();
	if( inputCode == '' || inputCode.length != 10 ){
		Swal.fire({
			  position: 'center',
			  icon: 'error',
			  text: '사업자등록번호를 모두 입력하세요',
			  showConfirmButton: false,
			  timer: 800
		});
		return false;
	}

	var regexp = /^[0-9]*$/
	v = $('input[name=num]').val();
	if( !regexp.test(v) ) {
		Swal.fire({
			  position: 'center',
			  icon: 'error',
			  text: '숫자만 입력하세요',
			  showConfirmButton: false,
			  timer: 800
		});
		$('input[name=num]').val(v.replace(regexp,''));
		return false;
	}
	if( ${logincompany.number} == $('input[name=num]').val() ){
		Swal.fire({
			  position: 'center',
			  icon: 'error',
			  text: '이미 사업자번호를 변경하셨으며 확인중입니다.',
			  showConfirmButton: false,
			  timer: 1500
		});
		return false;
	}
	// form데이터 만들기 
	$('input[name=number]').val($('input[name=num]').val());
	var sendData = $('#frm').serialize();
	$.ajax({
		url:'/Pickme/login/company/changeCompanyNumber.do',
		data:sendData,
		type:'post',
		success: function(data){
			if( data == true ){
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  text: '사업자번호를 변경했습니다. 승인을 기다려주세요.',
					  showConfirmButton: false,
					  timer: 2000
				}).then( (result) => {
						location.href="/Pickme/login/company/logout.do"
				})
			}
		},
		error: function(err){
			alert('error')
			console.log(err)
		}

	})
		
	
})

</script>

<%@include file ="../../../include/footer.jsp" %>
						
	

</body>
</html>

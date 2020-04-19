<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<style>

/* 전체 div 틀 */
.pwdUpdateWrap {margin-top:100px;}

/* 비밀번호 변경 페이지 타이틀 */
.pwdUpdate-title {font-size:22pt;}

/* 기존 비밀번호 타이틀 */
.pre-pwd-wrap-title {margin-top:50px;text-align:center;font-size:13pt;}

/* 기존 비밀번호 input */
.pre-pwd {margin-top:50px;width: 330px;border:none;border-bottom:1px solid #888;font-size:20px;text-align:center;}

/* 기존 비밀번호 input 클릭했을 때 */
.pre-pwd:focus {outline:none;border-bottom-width:2px;border-color:#2d2d2d;}

/* 기존 비밀번호 틀렸을 때 경고문 */
.pre-pwd-incorrect {font-size:19px;color:#fff;}

/* 새 비밀번호 타이틀 */
.new-pwd-wrap-title1 {margin-top:50px;text-align:center;font-size:13pt;}

/* 새 비밀번호 input */
.new-pwd1 {margin-top:30px;width: 330px;border:none;border-bottom:1px solid #888;font-size:20px;text-align:center;}

/* 새 비밀번호 input 클릭했을 때 */
.new-pwd1:focus {outline:none;border-bottom-width:2px;border-color:#2d2d2d;}

/* 새 비밀번호가 형식에 적합하지 않을 때 경고문 */
.new-pwd-incorrect1{font-size:19px;color:#fff;}

/* 새 비밀번호 확인 타이틀 */
.new-pwd-wrap-title2 {margin-top:50px;text-align:center;font-size:13pt;}

/* 새 비밀번호 확인 input */
.new-pwd2 {margin-top:30px;width: 330px;border:none;border-bottom:1px solid #888;font-size:20px;text-align:center;}

/* 새 비밀번호 확인 input 클릭했을 때 */
.new-pwd2:focus {outline:none;border-bottom-width:2px;border-color:#2d2d2d;}

/* 새 비밀번호 확인이 일치하지 않을 때 경고문 */
.new-pwd-incorrect2{font-size:19px;color:#fff;}

/* 완료 버튼 영역 */
.btn-wrap {text-align:center;}

/* 완료 버튼 */
.completeBtn {width:100px;height:40px;color:#fff;margin-top:100px;margin-bottom:50px;background-color:#4f6eff;border-color:#4f6eff;}

</style>


<!------------------------------------ 본문 영역 ----------------------------------------->


<form action = "passwordUpdate.do" method = "post">
	<div class = "pwdUpdateWrap" align="center">
		<div class = "pwdUpdate-title">
		비밀번호 변경
		</div>
		<div class = "pre-pwd-wrap">
			<div class = "pre-pwd-wrap-title"> 기존 비밀번호를 입력하세요. </div>
			<input type = "password" class = "pre-pwd">
			<div class = "pre-pwd-incorrect"> 비밀번호가 맞지 않습니다. </div>
		</div>
		<div class = "new-pwd-wrap1">
			<div class = "new-pwd-wrap-title1"> 새 비밀번호 입력 </div>
			<input type="password" class = "new-pwd1">
			<div class = "new-pwd-incorrect1"> 비밀번호가 적합하지 않습니다. </div>
		</div>
		<div class = "new-pwd-wrap2">
			<div class = "new-pwd-wrap-title2"> 한번 더 입력</div>
			<input type = "password" class = "new-pwd2">
			<div class = "new-pwd-incorrect2"> 비밀번호가 일치하지 않습니다. </div>
		</div>
	</div>
	<div class = "btn-wrap">
	<button type="submit" class = "completeBtn"> 완료 </button>
	</div>
</form>

<!---------------------------------- 본문 영역 끝 ------------------------------------------>

<%@include file ="../../../include/footer.jsp" %>






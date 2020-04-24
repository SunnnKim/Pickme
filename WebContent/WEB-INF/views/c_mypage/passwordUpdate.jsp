<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<style>

/* 전체 div 틀 */
.pwdUpdateWrap {margin-top:100px;}

/* 비밀번호 변경 페이지 타이틀 */
.pwdUpdate-title {font-size:22pt; width:400px; text-align:center;}

/* 기존 비밀번호 타이틀 */
.pre-pwd-wrap-title {margin-top:50px;text-align:center;font-size:13pt;}

/* 기존 비밀번호 input */
.pre-pwd {margin-top:50px;width: 330px;height:40px;border:1px solid #888;font-size:20px;text-align:center;}

/* 기존 비밀번호 틀렸을 때 경고문 */
.pre-pwd-incorrect {font-size:19px;color:#fff;}

/* 새 비밀번호 타이틀 */
.new-pwd-wrap-title1 {margin-top:50px;text-align:center;font-size:13pt;}

/* 새 비밀번호 input */
.new-pwd1 {/* margin-top:30px; */width: 330px;height:40px;border:1px solid #888;font-size:20px;text-align:center;}

/* 새 비밀번호가 형식에 적합하지 않을 때 경고문 */
.new-pwd-incorrect1{font-size:19px;color:#fff;}

/* 새 비밀번호 확인 타이틀 */
.new-pwd-wrap-title2 {margin-top:50px;text-align:center;font-size:13pt;}

/* 새 비밀번호 확인 input */
.new-pwd2 {/* margin-top:30px; */width: 330px;height : 40px;border:1px solid #888;font-size:20px;text-align:center;}

/* 새 비밀번호 확인이 일치하지 않을 때 경고문 */
.new-pwd-incorrect2{font-size:19px;color:#fff;}

/* 완료 버튼 영역 */
.btn-wrap {text-align:center;}

/* 완료 버튼 */
.completeBtn {width:100px;height:40px;color:#fff;margin-top:100px;margin-bottom:50px;background-color:#4f6eff;border-color:#4f6eff;}

</style>


<!------------------------------------ 본문 영역 ----------------------------------------->


<form action = "/Pickme/login/changePasswordC.do" method = "post" id="frm">
	<input type="hidden" name="seq" value="<%=company.getSeq()%>">
	<div class = "pwdUpdateWrap" align="center">
		<div class = "pwdUpdate-title">
		비밀번호 변경
		</div>
		<div class = "pwdUpdate-text">
		보다 안전한 서비스 이용을 위해 비밀번호를 변경하세요.
		</div>
	
		<div class = "pre-pwd-wrap">
			<div class = "pre-pwd-wrap-title"> </div>
			<input type = "text" class = "pre-pwd" name="oldPassword" placeholder="기존 비밀번호">
		</div>
		<div class = "new-pwd-wrap1">
			<div class = "new-pwd-wrap-title1"> </div>
			<input type="password" class = "new-pwd1" name="password" placeholder="새 비밀번호">
		</div>
		<div class = "new-pwd-wrap2">
			<div class = "new-pwd-wrap-title2"> </div>
			<input type = "password" class = "new-pwd2" name="passwordCheck" placeholder="새 비밀번호 확인">
		</div>
	</div>
	<div class = "btn-wrap">
	<button type="button" class = "completeBtn"> 완료 </button>
	</div>
</form>
<script>
// function
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
<script>

$('.completeBtn').click(function() {

	var oldPassword = $('input[name=oldPassword]');
	var password = $('input[name=password]');
	var passwordCheck = $('input[name=passwordCheck]');

	// 빈칸 확인
	if( oldPassword.val().trim() == '' ){
		oldPassword.focus();
		sweetAlert('error', '기존 비밀번호를 입력하세요.', 1000, false)
		return false;
	}
	if( password.val().trim() == '' ){
		password.focus();
		sweetAlert('error', '새 비밀번호를 입력하세요.', 1000, false)
		return false;
	}
	if( passwordCheck.val().trim() == '' ){
		passwordCheck.focus();
		sweetAlert('error', '새 비밀번호를 확인하세요.', 1000, false)
		return false;
	}
	
	// 비밀번호 정규식 확인
	// pwd 체크
	// 영문 2자이상, 특수문자, 숫자 1개 이상, 6문자 이상
	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=.,]{1,50})(?=.*[a-zA-Z]{2,50}).{6,50}$/;
	if( !regExpPw.test(password.val()) ){
		password.focus();
		sweetAlert('error', '비밀번호는 영문, 특수문자, 숫자 포함 6자 이상 작성해주세요.', 0, true)
		return false;
	}	

	// 비밀번호 확인여부 체크
	if( password.val() != passwordCheck.val() ){
		passwordCheck.focus();
		sweetAlert('error', '새 비밀번호가 일치하지 않습니다', 0, true);
		return false
	}
	// 비밀번호 체크하기 
	$.ajax({
		url:"/Pickme/login/checkPasswordC.do",
		data:{
			seq:<%=company.getSeq()%>,
			password:$('input[name=oldPassword]').val()
		},
		type:'post',
		success: function(data){
			if( data == 'false'){
				// 비밀번호 틀림
				oldPassword.focus();
				sweetAlert('error', '현재 비밀번호가 틀렸습니다', 1500, false);
				return false;
			}
			else{
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  text: '비밀번호를 변경합니다.',
					  showConfirmButton: false,
					  timer: 1500
				}).then( (res) => {
					$('#frm').submit();
				})
			}
		},
		error: function( err ){
			alert('error')
			console.log(err)
		}
	})
})


</script>

<!---------------------------------- 본문 영역 끝 ------------------------------------------>

<%@include file ="../../../include/footer.jsp" %>






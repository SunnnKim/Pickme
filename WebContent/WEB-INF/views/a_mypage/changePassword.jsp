<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="amemChangePw">
	<form id="frm" action="/Pickme/login/changePasswordA.do" method="post">
	<input type="hidden" name="seq" value="<%=member.getSeq()%>">
	<strong>비밀번호를 수정하시겠습니까?</strong>
	<p>
		비밀번호는 대문자, 소문자, 숫자, 특수문자 중 2종류 이상을 조합하여 최소 10자리 이상 또는<br>
		3종류 이상을 조합하여 최소 8자리 이상만 사용할 수 있습니다.
	</p>
	
	<table class="aMypageTbl">
		<colgroup>
			<col width="200px">
			<col width="*">
		</colgroup>
		<tr>
			<th>기존 비밀번호</th>
			<td><input type="password" name="oldPassword"></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="passwordCheck"></td>
		</tr>
	</table>

	<div class="amemChangeBtnWrap">
		<button type="button" onclick="updatePwd()">확인</button>
		<button type="reset" value="Reset">취소</button>
	</div>
	</form>
</div><!-- //amemChangePw -->

<!-- script -->
<script>
// 변수
var oldPassword = $('input[name=oldPassword]');
var password = $('input[name=password]');
var passwordCheck = $('input[name=passwordCheck]');

// 확인버튼 누름
updatePwd = () => {
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
		url:"/Pickme/login/checkPasswordA.do",
		data:{
			seq:<%=member.getSeq()%>,
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
}
</script>
<script>
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

<%@include file="../../../include/footer.jsp"%>

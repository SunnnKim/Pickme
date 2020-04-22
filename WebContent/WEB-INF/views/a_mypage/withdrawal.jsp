<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="amemChangePw">
	<form action="/Pickme/login/memberWithdrawal.do" id="frm" method="post">
	<strong>회원 탈퇴하시겠습니까?</strong>
			
	<table class="aMypageTbl">
		<colgroup>
			<col width="200px">
			<col width="*">
		</colgroup>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="passwordCheck"></td>
		</tr>
	</table>

	<div class="amemChangeBtnWrap">
		<button type="button" onclick="updatePwd()">탈퇴하기</button>
		<button type="reset" value="Reset" id="reset">취소</button>
	</div>
	</form>
</div><!-- //amemChangePw -->
<script>
var password = $('input[name=password]');
var passwordCheck = $('input[name=passwordCheck]');

// 확인버튼 누름
updatePwd = () => {
	// 빈칸 확인
	if( password.val().trim() == '' ){
		password.focus();
		sweetAlert('error', '비밀번호를 입력하세요.', 1000, false)
		return false;
	}
	if( passwordCheck.val().trim() == '' ){
		passwordCheck.focus();
		sweetAlert('error', '비밀번호를 확인하세요.', 1000, false)
		return false;
	}	

	// 비밀번호 확인여부 체크
	if( password.val() != passwordCheck.val() ){
		passwordCheck.focus();
		sweetAlert('error', '비밀번호가 일치하지 않습니다', 0, true);
		return false
	}
	
	// 비밀번호 체크하기 
	$.ajax({
		url:"/Pickme/login/checkPasswordA.do",
		data:{
			seq:<%=member.getSeq()%>,
			password:$('input[name=password]').val()
		},
		type:'post',
		success: function(data){
			if( data == 'false'){
				// 비밀번호 틀림
				password.val('')
				passwordCheck.val('')
				password.focus();
				sweetAlert('error', '현재 비밀번호가 틀렸습니다', 1500, false);
				return false;
			}
			else{
				Swal.fire({
					  title: '회원탈퇴',
					  text: "정말로 탈퇴하시겠습니까?",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '네, 탈퇴합니다.',
					  cancelButtonText: '취소'
					}).then((result) => {
					  if (result.value) {
						  Swal.fire({
							  position: 'center',
							  icon: 'success',
							  text: '그동안 이용해주셔서 감사합니다.',
							  showConfirmButton: false,
							  timer: 1800
						  }).then((result) => {
							$('#frm').submit();
					  })
					}
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

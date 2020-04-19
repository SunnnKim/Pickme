<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    


<div class="profile-wrap">

<form id="frm" method="post" action="">
	<input type="text" name="password" >
	<input type="text" name="newPassword" >
	<input type="text" name="newPasswordCheck" >
	<button type="button">비밀번호 변경하기</button>
</form>
</div>

<script>
if($('input[name=newPassword]').val() != $('input[name=newPasswordCheck]').val()){
	alert('새로운 비밀번호가 일치하지 않습니다.')
	return false;
}
let data = new FormData();
data.append('password', $('input[name=password]'))
data.append('newPassword', $('input[name=newPassword]'))
$.ajax({
	url:'/Pickme/login/nowPasswordCheck.do',
	type:'post',
	data:data,
	success: function( data ){
		alert('data')
	},	error: function( err ){
		alert('error')
		console.log(err)
	}
})

</script>


<%@include file ="../../../include/footer.jsp" %>
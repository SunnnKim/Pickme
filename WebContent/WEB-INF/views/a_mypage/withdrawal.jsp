<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="amemChangePw">
	<form>
	<strong>회원 탈퇴하시겠습니까?</strong>
			
	<table class="aMypageTbl">
		<colgroup>
			<col width="200px">
			<col width="*">
		</colgroup>
		<tr>
			<th>비밀번호</th>
			<td><input type="password"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password"></td>
		</tr>
	</table>

	<div class="amemChangeBtnWrap">
		<button type="button">탈퇴하기</button>
		<button type="reset" value="Reset">취소</button>
	</div>
	</form>
</div><!-- //amemChangePw -->

<%@include file="../../../include/footer.jsp"%>

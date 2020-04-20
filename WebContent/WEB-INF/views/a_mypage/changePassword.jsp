<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="amemChangePw">
	<form>
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
			<td><input type="password"></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type="password"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password"></td>
		</tr>
	</table>

	<div class="amemChangeBtnWrap">
		<button type="button">확인</button>
		<button type="reset" value="Reset">취소</button>
	</div>
	</form>
</div><!-- //amemChangePw -->

<%@include file="../../../include/footer.jsp"%>

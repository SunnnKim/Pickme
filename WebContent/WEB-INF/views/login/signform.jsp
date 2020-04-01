<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<form action="signup.do" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td>
				<input type="text" name="id" id="id">
			</td>
		</tr>
		<tr>
			<td>password</td>
			<td>
				<input type="password" name="password" id="password">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원가입">
			</td>
		</tr>
	</table>

</form>
</div>

</body>
</html>
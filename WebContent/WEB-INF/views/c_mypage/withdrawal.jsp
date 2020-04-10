<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<style>
  *{
  box-sizing:border-box;
}

body{
  color:#444;
}

.inputGroup{
  width:340px;
  margin:50px auto;
  position:relative;
}

input{
  border:none;
  border-bottom:1px solid #888;
  font-size:16px;
  /* width:290px; */
  z-index:1;
  transition:all .2s;
}

input:focus{
  outline:none;
  border-bottom-width:3px;
  border-color:#D35400;
}

label{
  color:#aaa;
  position:absolute;
  left:0;
  top:0;
  opacity:0;
  z-index:0;
  visiblity:hidden;
  transition:all .5s;
}

.labelTop{
  visible:visible;
  opacity:1;
  top:-20px;
}

button {
  width:400px;
  height:60px;
  color: #fff;
  background-color: #4f6eff;
  border-color: #4f6eff;
}

</style>
	<form action = "withdrawal.do" method = "post">
	  <div class="subCont" align = "center">
        <br><br>
        <p style = "font-size:22pt">기업회원 탈퇴하기</p>
        <br><br>
        <div align = "center" style = "font-size:13pt">
        		계속하시려면 비밀번호를 입력해주세요.
        	</div>
        <br>
        <input type="password" id="input_password" name = "password" style="width:200px;margin-top:10px;padding-left:5px;text-align:center;font-size:20pt"/>
        <br><br><br><br><br><br><br><br>
        <input type = "hidden" name = "email" value = "<%=company.getEmail() %>">
        <div align="center" style = "font-size:13pt; color:#ff0000"> 계정 삭제 시 저장된 정보는 다시 복구하실 수 없습니다. <br> 그래도 진행하시겠습니까? </div>
        <br><br>
        <button type = "submit" class="btn btn-light" 
        		style = "font-size: 12pt; margin-top:100px;"> 모든 주의사항을 확인하였으며, 탈퇴하겠습니다. 
        	</button>
      </div><!-- // subCont -->
	</form>

<%@include file ="../../../include/footer.jsp" %>




<%-- <script>
// 마지막으로 사용자가 입력한 비밀번호가 세션의 비밀번호와 일치하는지 확인

function withdrawal() {

	var input_password = $("#input_password").val();
	var db_password = <%=company.getPassword() %>;
	alert(input_password);
	
	if ( db_password != $("#input_password").val() ) {
		// 비밀번호 틀림!
		alert("비밀번호가 일치하지 않습니다.");
		location.href = "goWithdrawal.do";
} else {
	// 비밀번호 일치했고, 동의했으니 탈퇴 처리
	alert("탈퇴 처리되었습니다. 이용해주셔서 감사합니다.");
	location.href = "withdrawal.do"; }
}


</script> --%>




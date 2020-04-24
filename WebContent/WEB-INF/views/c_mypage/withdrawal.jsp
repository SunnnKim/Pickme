<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<style>
  *{
  box-sizing:border-box;
}

body{
  color:#444;
}

.subCont_div {
	margin-top:100px;
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
  border-bottom-width:2px;
  border-color:#2d2d2d;
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

button:hover {background-color:#6681ff;}

</style>
	<form action = "/Pickme/login/companyWithdrawal.do" method = "post" id="frm">
	  <div class="subCont_div" align = "center">
        <p style = "font-size:22pt">기업회원 탈퇴하기</p>
        <div align = "center" style = "font-size:13pt;margin-top: 80px;">
        		계속하시려면 비밀번호를 입력해주세요.
        	</div>
        <input type="password" id="input_password" name = "password" style="width:300px;margin:30px;padding-left:5px;text-align:center;font-size:20pt"/>
        <div align="center" style = "font-size:13pt; color:#ff0000; margin-top: 100px;"> 계정 삭제 시 저장된 정보는 다시 복구하실 수 없습니다. <br> 그래도 진행하시겠습니까? </div>
        <br><br>
        <button type = "button" class="btn btn-light" id="withdrawBtn" style = "font-size: 12pt; margin-top:100px;"> 
        	모든 주의사항을 확인하였으며, 탈퇴하겠습니다. 
       	</button>
      </div><!-- // subCont -->
	</form>


<script>
$('#withdrawBtn').click(function(){
	if( $('input[name=password]').val().trim() == ''){
		$('input[name=password]').focus();
		Swal.fire({
			  position: 'center',
			  icon: 'error',
			  text: '현재 비밀번호를 입력하세요.',
			  showConfirmButton: false,
			  timer: 1500
		})
		return false;
	}
	
	$.ajax({
		url:'/Pickme/login/checkPasswordC.do',
		data:{
			seq:<%=company.getSeq()%>,
			password:$('input[name=password]').val()
		},
		type:'post',
		success: function(data){
			if( data == 'false' ){
				Swal.fire({
					  position: 'center',
					  icon: 'error',
					  text: '비밀번호를 잘못 입력했습니다.',
					  showConfirmButton: false,
					  timer: 1500
				})
				return false;
			}else{
				 Swal.fire({
					  position: 'center',
					  icon: 'warning',
					  title: '지금까지 Pick me를 이용해주셔서 감사합니다.',
					  showConfirmButton: false,
					  timer: 1800
				}).then( (result) =>{
			 		document.querySelector('#frm').submit();
				})
			}
		}, error: function(err){
			alert('error');
			console.log(err)
		}
	})
	
})
</script>


<%@include file ="../../../include/footer.jsp" %>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="modal-back" style="display: none;"></div>
  <div id="applyModal" style="display:none; top:100px; left: 30%;">
   <form id="frm" action="" enctype="multipart/form-data">
        <div id="close-btn">
          <i class="fas fa-times"></i>
        </div>
        <div class="modal-title">지원하기</div>
        <div class="modal-content">
          <div class="title" id="selectResume" onclick="selectResume()">이력서 선택</div>
          <div class="contents" id="selectContents" style="display: none;">
				<!-- 이력서 이름(동적할당부분) -->
          </div>
          <div class="title" id="uploadResume" onclick="uploadResume()">이력서 업로드</div>
          <div class="content">
            <div class="contents" id="uploadContents" style="display: none;">
              <label for="file">
                <input type="file" id="file" name="file" style="display: none;" accept=".hwp, .xls, .doc, .docx, .pdf"> 
                <div class="file-btn">
                  업로드
                </div>
                <span id="filename"></span>
              </label>
            </div>
          </div>
        </div>
        <div id="submitBtn">지원하기</div>
      </form>
    </div>
    
<!-- @@@@@ Script @@@@@@ -->
    <script>
        // 지원하기 버튼 
        document.querySelector('#recruitDetailButton1').onclick = () => {
            
            // 데이터 가져오기
            $.ajax({
				url:"getMyResume.do",
				type:'post',
				data:'jobseq=${recDto.seq }',
				success: function(data){
					if(data == 'fail'){	// 로그인 필요 
						Swal.fire({
							  position: 'center',
							  icon: 'error',
							  text:'로그인이 필요합니다.',
							  showConfirmButton: false,
							  timer: 1000 
						}).then(result = () => {
							location.href = "/Pickme/login/memLogin.do"
							return false;

						})
					}
					else if( data == "alreadyApply" ){	// 이미 지원했을때
						Swal.fire({
							  position: 'center',
							  icon: 'error',
							  text:'이미 지원한 공고입니다.',
							  showConfirmButton: false,
							  timer: 1000 
						}).then(result = () => {
							return false;
						})

					}
					else{
						//console.log(data.myResumes)
						var myResumes = data.myResumes;				
						// 이력서 이름 뽑기 
						$('#selectContents').html('');
						for( var i = 0; i < myResumes.length; i++ ){
							var str = '<label><input type="radio" name="resume" value="'+ myResumes[i].seq +'">['+ myResumes[i].name +']</label>'
							$('#selectContents').append(str);
						}
						if(myResumes.length == 0){	// 이력서가 없을 경우
							var str = '<label><input type="hidden" name="resume" value="noneResume"/> 작성된 이력서가 없습니다.' + 
									   '<a href="/Pickme/resume/resume.do" id="resume-link" > >> 이력서 작성하기</a>'	+ '</lablel>'	
							$('#selectContents').append(str);
						}else{
							// 첫번째 이력서 선택됨 
							console.log($('input[name=resume]').eq(0))
							$('input[name=resume]').eq(0).prop('checked', true);
						}
			            // show modal display
			            //document.querySelector('#modal-back').style.display = "block"
			            $('#modal-back').fadeIn(500);
			            $('#applyModal').fadeIn(500);
			            $('#selectContents').show(30)
					}
				}, error: function(error){
					alert('error');
					console.log(err)
				}
            });
        }
        // 이력서 선택하기 버튼 누름
        selectResume = () => {
            $('#selectContents').show(100)
            $('#uploadContents').hide(100)
            $('input[name=file]').val("");
            $('#filename').text("");
        }
        // 이력서 업로드하기 버튼 누름
        uploadResume = () => {
            $('#uploadContents').show(100)
            $('#selectContents').hide(100)
            $('input[name=resume]')[0].checked = true;
    
        }
        
    
        // x 버튼 눌렀을 때 모달 닫기 
        document.querySelector('#close-btn').onclick = () => {
            // close modal display
           	$('#modal-back').fadeOut(500);
           	$('#applyModal').fadeOut(500);
            // 애니메이션 초기화 
            $('#uploadContents').hide()
            $('#selectContents').hide()
            // 입력한 데이터 모두 삭제 ()
            $('input[name=resume]')[0].checked = true;
            $('input[name=file]').val("");
            $('#filename').text("");
        }
        
        // 파일입력시 이름
        var uploadFile = document.querySelector('input[name=file]');
        uploadFile.onchange = () => {
          var index = uploadFile.value.lastIndexOf('\\');
          document.querySelector('#filename').innerHTML = uploadFile.value.substring(index+1);
        };
    
        // 지원서 제출하기
        $('#submitBtn').click(function(){
            
          uploadFile = document.querySelector('input[name=file]');
          var cv_title="";
          
          // 업로드 폼이 열려있고 이력서 업로드 안했을 시 처리  
          if($('#selectContents').css('display') == 'none'){
			if( uploadFile.value.trim() == "" ){
				Swal.fire({
					  position: 'center',
					  icon: 'error',
					  text:'이력서 파일을 업로드해주세요!',
					  showConfirmButton: false,
					  timer: 1000 
				});
				return false;
			}
          }
          // 작성된 이력서가 없을 때
          if( $('input:hidden[name=resume]').val() == 'noneResume' ){
        	  Swal.fire({
				  position: 'center',
				  icon: 'error',
				  text:'대표이력서가 없습니다. 이력서를 업로드해주세요!',
				  showConfirmButton: false,
				  timer: 1000 
				}).then(res = () =>{
					uploadResume();
		        	return false;
				})
          }
          // 이력서 이름 확인 
          if( uploadFile.value.trim() == "" ) cv_title = $('input[name=resume]:checked').parent().text();
          else cv_title = document.querySelector('#filename').innerHTML;
          
          Swal.fire({
            title: '이력서를 제출하시겠습니까?',
            text: "제출 이력서 : " + cv_title,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '지원하기',
            cancelButtonText: '취소'
          }).then((result) => {
            if (result.value) {
                // 업로드 파일을 폼 데이터로 만들기 
                let data = new FormData();
                var resumeUpload = $('input:file[name=file]');
				if( resumeUpload.val() != ''){
	     		  	data.append("file", resumeUpload[0].files[0]); 
	     		  	data.append("memSeq", "${loginuser.seq}" ); 
	     		  	data.append("comSeq", "${recDto.comSeq }" ); 
	     		  	data.append("jobSeq", "${recDto.seq }" ); 
	     		  	data.append("userName", "${loginuser.name}" ); 
	     		  	data.append("comName", "${recDto.comName}" ); 
				}else{
	     		  	data.append("seq", $('input[name=resume]:checked').val() ); 
	     		  	data.append("comSeq", "${recDto.comSeq }" ); 
	     		  	data.append("comName", "${recDto.comName}" ); 
	     		  	data.append("jobSeq", "${recDto.seq }" ); 
				}
				
				
				// 지원하기 부분 
				$.ajax({
					url:'insertResume.do',
					data:data,
					type:'post',
					cache: false,
			     	contentType: false,
			      	processData: false,
			      	enctype: 'multipart/form-data',
					success: function(data){
						// alert(data)
					}, error : function(err){
						alert('지원에 실패했습니다!')
						console.log(err)
						return false;
					},
					complete : function(){
						  Swal.fire(
					                '성공적으로 지원하였습니다!',
					                '지원현황에서 이력서 열람여부를 확인할 수 있습니다.',
					                'success'
					              ).then((result) => {
					               		location.reload();
					              });
					}

				})
            }
          })
        })
    
</script>

<style>
/* modal */
#modal-back{ background: #333; opacity: 0.7; height: 100%; width: 100%; position: fixed; top:0; left: 0; z-index: 900}
#applyModal{ z-index:1000; width: 500px; height: 480px; background: #fff; border: 1px solid #eaeaea; position: fixed; top:50px; left: 30%; }
#close-btn { cursor: pointer; position: absolute; right: 10px; font-size: 25px; color: #ccc;}
#resume-link{  margin-left: 50px; color: #eaeaea;}
#resume-link:hover { color: #4356b3;}

/* modal contents : select resume */
.modal-title{ cursor: pointer; font-size: 25px; text-align: center; margin: 10px 0; padding-bottom: 10px; border-bottom: 1px solid #eaeaea; }
.modal-content{ margin: 30px; border-left: 1px solid #eaeaea; border-right: 1px solid #eaeaea; border-bottom: 1px solid #eaeaea; }
.modal-content > .title{ height: 50px;line-height: 40px; cursor: pointer; padding: 5px; font-size: 15px; border: 1px solid rgb(96, 123, 255); background: #304edf; color: #fff;}
.modal-content > .contents { font-size: 15px; }
.modal-content > #selectContents { margin: 10px 0;height: 120px; width: 100%; overflow-y: scroll; }
.modal-content > #selectContents > label { display:block; margin-left: 30px; margin-top: 10px;}
.modal-content > #selectContents > label > input { margin-right: 10px; }
/* modal contents : upload contents */
#uploadContents > label{  display: block; margin: 30px 0; }
#uploadContents > label .file-btn{ height: 30px; text-align: center; cursor: pointer; background-color: #333; color: #fff; width: 130px; margin-left: 20px; float: left; border: 1px solid #333;}
#filename{ overflow:hidden; text-overflow:ellipsis; white-space:nowrap; font-size: 13px; line-height: 30px; padding-left: 5px; border: 1px solid; width: 250px; display: inline-block; height: 30px; border: 1px solid #eaeaea;}
#submitBtn{ position: absolute; bottom:30px;left: 130px; cursor: pointer; border-radius: 30px; width: 250px; margin: 0 auto; background: #4356b3; color: #fff; text-align: center; height: 50px; line-height: 50px;}

</style>
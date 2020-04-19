<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>
<!-- summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="/Pickme/js/summernote/summernote.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="/Pickme/js/summernote/summernote.js"></script>
<!-- //summernote -->

<div class="profile-wrap">
	   <div class="content-wrap">
		<form method="POST" id="frm" enctype="multipart/form-data" action="insertNotice.do" >
         <ul>
           <li>글종류</li>
           <li>
             <select id="type" name="type">
               <option value="공지사항" selected>공지사항</option>
               <option value="이벤트">이벤트</option>
             </select>
           </li>
           <li>제목</li>
           <li>
             <input type="text" name="title">
           </li>
           <li>파일</li>
           <li class="fileContainer">
           		<input type="file" id="noticeFile" name="noticeFile" multiple="multiple">
           </li>
         </ul>
         <input type="hidden" name="content" >
	    </form>
       <textarea id="summernote"></textarea>
       <div class="submit-btn">
         <button type="button" id="submitBtn">공지등록</button>
       </div>
      </div>
</div>


<script type="text/javascript">
// summernote
	let fileArray = [];
	let keyCnt = 0;
	$('#summernote').summernote({
		height: 400,
		callbacks: {
            onImageUpload: function (files, editor, welEditable) {
                sendFile(files[0], editor, welEditable);
            }
        }
	});
	// 이미지 업로드 시 temp 폴더에 저장 후 불러옴 
	 function sendFile(file, editor, welEditable) {
		   let data = new FormData();
		   data.append("file", file); 

		    $.ajax({
		      data: data,
		      type: 'POST',
		      url: "noticeContentImg.do",
		      cache: false,
		      contentType: false,
		      processData: false,
		      enctype: 'multipart/form-data',
		      success: function (url) { 
		         var key = ('img_' + keyCnt);
		    	 fileArray.push({
		    		'key': key,
		    		'filename': url.filename,
		    		'filepath': url.filepath,
		    		'file': file
		    	});
		    	// 에디터창에 넣기
		    	var downloadUrl = '/Pickme/admin/notice/imgDownload.do?filename=' + url.filename + '&filepath=' + url.filepath;
	          	$("#summernote").summernote('editor.insertImage', downloadUrl, ('img_' + keyCnt));
		        keyCnt++;
		      }
		   });
		}
	
</script>
<!-- 공지사항 등록시 -->
<script>
$(document).ready(function() {

// 등록버튼 클릭
$('#submitBtn').click(function(){
	var title = $('input[name=title]').val();
	
	// 텍스트에디터에 있는 사진 비교하기 
	var contentHtml = $('#summernote').val();
	var splitArr = contentHtml.split('<img ');
	var uploadArr = [];	// 텍스트에디터 안에 있는 소스코드부분 배열에 담기 

	// 제목, 콘텐츠 빈칸인지 확인
	if( title.trim() == ''){
		alert('제목을 입력하세요')
		return false;
	}
	if(contentHtml.trim() == '' ){
		alert('내용을 입력하세요')
		return false;
	}

	// hidden에 content 값 넣기 
	$('input[name=content]').val(contentHtml);
	
	
	// 텍스트에디터 안에 있는 소스만 배열로 옮기기 
	for( i = 1; i < splitArr.length; i++ ) {
		var arr = splitArr[i];
		if( !arr.includes('src') ) continue;	// 소스코드가 없는 태그들 빼기 
		arr = arr.split('>')[0];
		// 소스부분 잘라서 비교할 배열에 넣기 
		var temp1 = arr.split('filename=')[1];
		var temp2 = arr.split('id="')[1];
	
		var obj = {};
		var nameAndPath = temp1.substring(0, temp1.indexOf('\"')).split('&amp;filepath=');
		obj.key = temp2.substring(0, temp2.indexOf('\"'));
		obj.filename = nameAndPath[0];
		obj.filepath = nameAndPath[1];
		
		uploadArr.push(obj);	// 비교할 데이터를 배열에 담기
	}

	// 폼에 넣기 
	
	// 파일데이터를 담을 formData
	let data = new FormData;
		
	
	// 탐색하기
	for( arr of uploadArr ){
		for( fileArr of fileArray ){
			if( arr.key == fileArr.key ){
				console.log('fileArr:')
				console.log(fileArr)
				data.append('file', fileArr.file)
				data.append('filename', fileArr.filename)
				$("#frm").append("<input type='hidden' name='contentfilename' value='"+fileArr.filename+"'>");
				break;
			}
		}
	}
	
	// ajax로 콘텐츠 사진부터 업로드하기 
	$.ajax({
	      data: data,
	      type: 'POST',
	      url: "/Pickme/admin/notice/editorImageUpload.do",
	      cache: false,
	      contentType: false,
	      processData: false,
	      enctype: 'multipart/form-data',
	      success: function (data) { 
			if(data == 'success'){
				// 텍스트에디터 경로 모두 바꾸기 
				var modifiedContent = contentHtml.replace(/\/upload\/temp/gi, '/upload/notice');
				console.log(modifiedContent);
				$('input[name=content]').val(modifiedContent);
				$("#frm").submit(); 
			}else{
				alert('fail to upload editor images!')
			}	    	
	      }
	   });
	});
});
</script>



<!-- CSS -->
<style>
.content-wrap{
  width: 900px; min-height: 650px; margin: 0 auto;
}
.content-wrap form{ min-height: 200px; }
.content-wrap ul{ min-height: 200px; }
.content-wrap ul li{ float: left;  margin: 10px 0px; font-size: 20px;  width: 800px; }
.content-wrap ul li:nth-child(2n-1){ width: 60px; margin-right: 30px;text-align: center; line-height: 30px;}
.content-wrap ul li input{width: 800px; height: 40px; outline: none; padding: 10px;}
.content-wrap ul li.fileContainer{ 
	min-height: 100px;
}
select{ outline: none; width: 200px; height: 30px; border-radius: 0; padding-left: 10px; border: 1px solid #ddd; background: #fff;}
.content-wrap .submit-btn{ text-align: center;}
.content-wrap .submit-btn > button{ background-color: #304edf; color: #fff; width: 100px; height: 50px; outline: none;}



</style>



<%@include file="../include/footer.jsp" %>

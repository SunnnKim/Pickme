<%@page import="model.FilesDto"%>
<%@page import="java.util.List"%>
<%@page import="model.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>
<%
// 공지사항 디테일
NoticeDto detail = (NoticeDto) request.getAttribute("detail");
List<FilesDto> files = (List<FilesDto>) request.getAttribute("files");
%>

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
		<form method="POST" id="frm" enctype="multipart/form-data" action="updateNotice.do" >
		<input type="hidden" value="<%=detail.getSeq()%>" name="seq">
         <ul>
           <li>글종류</li>
           <li>
             <select id="type" name="type">
               <option value="공지사항" <%=detail.getType().equals("공지사항") ? "selected":"" %>>공지사항</option>
               <option value="이벤트" <%=detail.getType().equals("이벤트") ? "selected":"" %>>이벤트</option>
             </select>
           </li>
           <li>제목</li>
           <li>
             <input type="text" name="title" value="<%=detail.getTitle()%>">
           </li>
           <li>첨부</li>
           <li class="fileContainer">
           	<div class="notice-files">
		        <!--파일 있으면 반복문 돌림 -->
		        <% for(int i = 0; i < files.size(); i++){
		        		FilesDto file = files.get(i);
	        	%> <span class="files">
			            <i class="far fa-file-alt"></i>
			          	<%= file.getOriginname()%>
			        </span>
        		<% } if(files.size() == 0 ){
	        	%>
	        		[ 첨부파일이 없습니다 ]	
	        	<%
	        }
	        %>
	    </div>
           </li>
           <li>새로등록</li>
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

// 데이터 초기화
$('input[name=content]').val(`<%=detail.getContent()%>`);	// 내용 불러오기 (데이터에 저장)
$('#summernote').html(`<%=detail.getContent()%>`);			// 내용 불러오기 (에디터에 반환)
var noticeFiles = [];	// 기존에 업로드한 파일들 
<% for(int i = 0; i < files.size(); i++){
		FilesDto file = files.get(i);
%>		noticeFiles.push('<%=file.getNewname()%>');
<% }%>
//console.log(noticeFiles)

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

	// 기존에 있던 이미지파일 비교 어레이  
	var beforeUpdateContents = $('#summernote').val();
	var splitArr = beforeUpdateContents.split('<img ');

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
		
		fileArray.push(obj);	// 비교할 데이터를 배열에 담기
	}


	
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
	var updateFiles = $('#noticeFile');	// 새로올린 파일들 
		
	// 제목, 콘텐츠 빈칸인지 확인
	if( title.trim() == ''){
		alert('제목을 입력하세요')
		return false;
	}
	if(contentHtml.trim() == '' ){
		alert('내용을 입력하세요')
		return false;
	}
	if( updateFiles[0].files.length > 0 ){
		if( confirm('새로운 파일을 업로드하면 기존 파일이 삭제됩니다.') ){
			// hidden에 content 값 넣기 
			$('input[name=content]').val(contentHtml);
			// 기존파일 삭제하기 
			// 기존파일이름
			var sendObject = {
				'filenames':noticeFiles,
				'seq':<%=detail.getSeq()%>
			}
			$.ajax({
				url:'noticeFileDelete.do',
				data:sendObject,
				type:'post',
				success: function(data){
					if( data == 'fail' ){
						alert('공지사항 수정 실패!')
					}
				}, error: function(err){
					alert('공지사항 수정 실패!')
				}
			});
		}
	}
	
	// 텍스트에디터 안에 있는 소스만 배열로 옮기기 
	for( i = 1; i < splitArr.length; i++ ) {
		var arr = splitArr[i];
		if( !arr.includes('src') || !arr.includes('temp') ) continue;	// 소스코드가 없는 태그들 빼기 
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
.content-wrap form{ min-height: 250px; display: block}
.content-wrap ul{  min-height: 200px;}
.content-wrap ul li{ float: left;  margin: 10px 0px; font-size: 20px;  width: 800px; }
.content-wrap ul li:nth-child(2n-1){ width: 60px; margin-right: 30px;text-align: center;}
.content-wrap ul li input{width: 800px; height: 40px; outline: none; padding: 10px;}
.content-wrap ul li.fileContainer{ 
	min-height: 20px;
}
select{ outline: none; width: 200px; height: 30px; border-radius: 0; padding-left: 10px; border: 1px solid #ddd; background: #fff;}
.content-wrap .submit-btn{ text-align: center;}
.content-wrap .submit-btn > button{ background-color: #304edf; color: #fff; width: 100px; height: 50px; outline: none;}
.files{ font-size: 15px}

</style>



<%@include file="../include/footer.jsp" %>

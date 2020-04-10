<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<div id="aMypage-wrap">
   <div class="aMypage_top clfix">
     <div class="profileWrap">
       <div class="profile">
         <i class="fas fa-user"></i>
         <div class="imgs-wrap" id="imgs-wrap"></div>
       </div>
       <div class="filebox preview-image">
         <label for="input_file"><i class="fas fa-camera"></i></label>
         <input type="file" id="input_file" class="upload-hidden">
       </div>
     </div><!-- //profileWrap -->
     <div class="aMyinfo">
       <h4>전지현</h4>
       <p>jihyun@gmail.com</p>
       <p><input type="text" placeholder="연락처를 입력해주세요"></p>
       <ul>
         <li>
             <strong>직무</strong>
             <input type="text">
         </li>
         <li>
           <strong>경력</strong>
           <select class="" name="">
             <option value="신입">신입</option>
             <option value="1년">1년</option>
             <option value="2년">2년</option>
             <option value="3년">3년</option>
             <option value="4년">4년</option>
             <option value="5년">5년</option>
             <option value="6년">6년</option>
             <option value="7년">7년</option>
             <option value="8년">8년</option>
             <option value="9년">9년</option>
             <option value="10년">10년</option>
           </select>
         </li>
       </ul>
       <!-- <div class="aMyBtn"><a href="#none">비밀번호수정 / 탈퇴</a></div> -->
     </div>
   </div><!-- // aMypage_top -->
   <div class="aMycont">
       <h5>간단 소개글</h5>
       <p>직무 내용, 경험, 목표 등을 추가해서 더욱 멋진 소개글을 작성해보세요.</p>
       <textarea></textarea>
       <h5 class="block">관심분야를 태그해주세요</h5>
       <div class="hashtagWrap">
         <input type="text" id="hashtag" required placeholder="태그는 최대 3개까지 입력가능합니다."><button type="button" id="hashadd" onclick="tagappend()" >추가</button>
       </div>
       <div class="inhash"></div>
     <button type="button draw meet">작성 완료</button>
   </div><!-- // aMycont -->
 </div><!-- // aMypage-wrap -->
 
 <script>
 $(document).ready(function(){
	// 연락처 숫자만 입력
     $(".aMyinfo input").keypress(function(event){
         var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));         
     });
     
   // 프로필 사진 등록
   var fileTarget = $('.filebox .upload-hidden');

   fileTarget.on('change', function () {
     if (window.FileReader) {
       // 파일명 추출
       var filename = $(this)[0].files[0].name;
     } else {
       // Old IE 파일명 추출
       var filename = $(this).val().split('/').pop().split('\\').pop();
     };

     $(this).siblings('.upload-name').val(filename);
   });

   //preview image
   var imgTarget = $('.preview-image .upload-hidden');

   imgTarget.on('change', function () {
     var parent = $(this).parent();
     parent.children('.upload-display').remove();

     if (window.FileReader) {
       //image 파일만
       if (!$(this)[0].files[0].type.match(/image\//)) {
         alert("이미지파일만 가능");
         return;
       }

       var reader = new FileReader();
       reader.onload = function (e) {
         var src = e.target.result;
         parent.prepend('<div class="upload-display"><img src="' + src + '" class="upload-thumb"></div>');
       };
       reader.readAsDataURL($(this)[0].files[0]);
     } else

     {
       $(this)[0].select();
       $(this)[0].blur();
       var imgSrc = document.selection.createRange().text;
       parent.prepend('<div class="upload-display"><img class="upload-thumb"></div>');

       var img = $(this).siblings('.upload-display').find('img');
       img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
     }
   });
 });

 /* hashtag */
  $("#hashtag").keyup(function(e){if(e.keyCode == 13)
    if($(this).val().trim() !=""){
      tagappend();
    } else {
      alert("태그를 입력해주세요.");
    }
  });

  //hashtag append
  var element_count = document.getElementsByTagName('hashtag').length;
  function tagappend(){
   var hashtext = document.getElementById('hashtag').value;
   const str = "<span><button type='button' class='hashbtn' name='hashtag' style='margin-right:8px;'>#"+hashtext+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' value="+hashtext+"></span>";
   if(hashtext.trim() != ""){
    $(".inhash").append(str);
    document.getElementById('hashtag').value="";
    element_count++;
    hashTagCount();

   } else {
     alert("태그를 입력해주세요.");
   }
  // alert(element_count);
  }

  function remove( element ){
    //element.parentNode.parentNode.removeChild(element.parentNode);
    element_count--;
    hashTagCount();
    //alert(element_count);

  };

  $('.inhash').on('click', 'i', function() {
    $(this).parent('button').parent('span').remove();
 });

  function hashTagCount(){
    if(element_count >= 3){
       $("#hashtag").attr("readonly","readonly");
       $("#hashadd").attr("disabled",true);
    }else {
      $("#hashtag").removeAttr("readonly");
      $("#hashadd").attr("disabled",false);
    }
  }

 </script>

<%@include file ="../../../include/footer.jsp" %>		
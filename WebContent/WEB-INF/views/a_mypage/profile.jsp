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
       <p><input type="text" name="_userPhone" placeholder="연락처를 입력해주세요" maxlength="13" value=""/></p>
       <ul>
         <li>
             <strong>직무</strong>
             <select class="select_cons" name="com_job1" id="com_job1" onchange="changeOcc(this)">
               <option value="0">1차분류</option>
             </select>
             <select class="select_cons ml10" name="com_job2" id="com_job2">
               <option value="0">2차분류</option>
             </select>
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
    $("input[name=_userPhone]").keyup(function(event){
      	var inputVal = $(this).val();        
    	$(this).val(inputVal.replace(/[^0-9]/gi,''));      	
 	});
	
	/*
    $("input[name=_userPhone]").on('keydown', function(e){
	    // 숫자만 입력받기
	    var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
	 				
	 	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	 	{
	   	    e.preventDefault();
	 	}
    }).on('blur', function(){ // 포커스를 잃었을때 실행
         if($(this).val() == '') return;

         // 기존 번호에서 - 를 삭제.
         var trans_num = $(this).val().replace(/-/gi,'');
       
         // 입력값이 있을때만 실행
         if(trans_num != null && trans_num != '')
         {
             // 총 핸드폰 자리수는 11글자이거나, 10자
             if(trans_num.length==11 || trans_num.length==10) 
             {   
                 // 유효성 체크
                 var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                 if(regExp_ctn.test(trans_num))
                 {
                     // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                     trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                     $(this).val(trans_num);
                 }
                 else
                 {
                     alert("유효하지 않은 전화번호 입니다.");
                     $(this).val("");
                     $(this).focus();
                 }
             }
             else 
             {
                 alert("유효하지 않은 전화번호 입니다.");
                 $(this).val("");
                 $(this).focus();
             }
       }
   });  
	*/
     
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

 // 직군 , 직무 선택
 // 직무 카테고리
    var json_url = './../util/rec-joblist.json';
    var keyArr = new Array();
    var valArr = new Array();
  
    var json;
    var jsonArr = [];
    $.getJSON(json_url, function(data){
        for( var i in data){
          json = JSON.stringify(data[i])
          json = JSON.parse(json);
          jsonArr.push(json)
          for( key in json ){
           // console.log(key);
            $("#com_job1").append("<option value='"+key+"'>"+key+"</option>");
            // console.log("key:"+key+", value:"+json[key]);
            keyArr.push(key);
            valArr.push(json[key]);

          }
        }

    });
    
      function changeOcc( onedepth ){
        var i=0;
        console.log(onedepth.value);
        $("#com_job2").html('');
        $("#com_job2").append("<option value='0'>2차분류</option>")
        for( arr of jsonArr ){
          // console.log(arr)
          for(key in arr){
              if( key.trim() == onedepth.value.trim() ){
                for( i = 0; i < arr[key].length; i++ ){
                  $("#com_job2").append("<option value='"+arr[key]+"'>"+arr[key][i]+"</option>");
                }
               
              }
          }
        }
      }

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
<%@page import="model.CMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<% /* CMemberDto cMem = (CMemberDto) session.getAttribute("logincompany "); */  %>
<% 
/*
[seq=1, email=aa@company.com, password=, president=대표자, name=테스트, tel=010-1111-1111, 
department=공공행정, 국방, type=중소기업(300명 이하), address=null, introduce=null, 
del=-1, hashTag=null, number=1111111111, logoPath=null, logoName=null] /**/
CMemberDto cMem= new CMemberDto(1,"aa@company.com","bitcamp.1", "대표자","회사명테스트","010-1111-1111", "공공행정,국방", "중소기업(300명이하)","서울특별시 강남구 테헤란로 151, 403-404호(역삼동, 역삼하이츠빌딩)",
		"intro",-1, "태그'태그1'태그2",1111111111, null, null);

%>
<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jquery ui -->

<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/4.14.0/basic/ckeditor.js"></script> 
<!-- 텍스트 에디터 -->
<!-- subCont 시작 -->
<!-- 메뉴 -->
        <div class="rec-wrapper">
          <div class="rec-caution">
            <h3 class="tit">채용등록</h3>
            <ul class="rec-ul">
              <li>채용등록주의사항1</li>
              <li>채용등록주의사항2</li>
              <li>채용등록주의사항3</li>
            </ul>
          </div><!-- rec-title -->
          <form action="" enctype="multipart/form-data">
          <!-- 회사정보 넘기기 -->
          <input type="hidden" name="comseq" value="<%= cMem.getSeq()%>">
          <div class="rec-conatainer">
            <div class="rec-info">
              <h3 class="tit">채용등록정보</h3>                
                  <h4>대표이미지등록<span class="ess">*</span></h4>
                  <div class="cont">
					<i class="file-image">
					 <input id="img1" type="file" onchange="readImage(this)" title="" />
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img1" class="image"></label>
					</i>
					<i class="file-image">
					 <input id="img2" type="file" onchange="readImage(this)" title="" />
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img2" class="image"></label>
					</i>
					<i class="file-image">
					 <input id="img3" type="file" onchange="readImage(this)" title="" />
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img3" class="image"></label>
					</i>
					<i class="file-image">
					 <input id="img4" type="file" onchange="readImage(this)" title="" />
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img4" class="image"></label>
					</i>
					
				</div>
                  <!-- <div class="imgs-wrap" id="imgs-wrap"></div>   -->                   
           	<h4>채용마감일<span class="ess">*</span></h4>
                  <div class="cont"> 
                  	<input type="text" id="datepicker" name="edate" required placeholder="채용마감일을 설정해주세요." maxlength="20" readonly="readonly" style="cursor: pointer;">
             
                  </div>
              
              <h4>직군/직무<span class="ess">*</span></h4>
              <div class="cont">
                <!-- <input type="text" name="com_job" required placeholder="직무를 입력해주세요" maxlength="100" autofocus>
                <i class="far fa-check-circle"></i> -->
                <select class="select_cons" name="com_job1" id="com_job1" onchange="changeOcc(this)">
                  <option value="0">1차분류</option>
                </select>
                <select class="select_cons" name="com_job2" id="com_job2">
                  <option value="0">2차분류</option>
                </select>
              </div>
            <div>
            <div class="lef">
             <h4>경력<span class="ess">*</span></h4>
               <div class="cont">
                <select class="select_cons" name="com_jobtype">
                <option value="0">경력을 선택해주세요</option>
                  <option value="신입">신입</option>
                  <option value="경력">경력</option>
                  <option value="경력무관">경력무관</option>
                </select>
                </div>
            </div>
            <div class="lef_r">
               <h4>근무형태<span class="ess">*</span></h4>
               <div class="cont" style="margin-left: 0;">
                <select class="select_cons" name="working_form">
                  <option value="0">근무형태를 선택해주세요</option>
                  <option value="정규직">정규직</option>
                  <option value="계약직">계약직</option>
                </select>
                </div>
             </div>
             </div>
              <h4>주요업무<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="main_task" required placeholder="주요업무를 간략하게 입력해주세요" maxlength="200">
                <i class="far fa-check-circle"></i>
              </div>
             
              <h4>자격요건<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="requirements"  required placeholder="학력, 스킬 등 원하는 조건을 입력해주세요." maxlength="200">
                <i class="far fa-check-circle"></i>
              </div>
              <h4>급여<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="salary" required placeholder="2,000~3,000만원" maxlength="25">
                <i class="far test fa-check-circle"></i>
              </div>
              <h4>내용<span class="ess">*</span></h4>
              <div class="cont">
                    <textarea id="content" name="content" cols="70" rows="50" placeholder="복지 등 업무소개를 더 자세하게 입력가능합니다."></textarea>
              </div>
              <h4>태그<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" id="hashtag" required placeholder="태그는 최대 3개까지 입력가능합니다." maxlength="10"><button type="button" id="hashadd" onclick="tagappend()" >추가</button>
                <div class="inhash"></div>
              </div>
              <div class="rec-buttons">
                <button type="button" id="rec-insert">등록</button>
                <button type="reset">취소</button>
              </div>
            </div><!-- rec-info-->
          </div><!-- rec-conatainer -->
          </form>
        </div> <!-- rec-wrapper -->

  <script type="text/javascript">

	//파일업로드
	function resetImage(input) {
  input.value = '';
  input.onchange();
}
function readImage(input) {
  var receiver = input.nextElementSibling.nextElementSibling;
  input.setAttribute('title', input.value.replace(/^.*[\\/]/, ''));
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      receiver.style.backgroundImage = 'url(' + e.target.result + ')';
    };
    reader.readAsDataURL(input.files[0]);
  }
  else receiver.style.backgroundImage = 'none';
}
  
	// datepicker
	$("#datepicker").datepicker({
			minDate : 0,
			maxDate : "+1M 7D",
			dateFormat : "yy-mm-dd"
	});
  
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
            // map.put(key, json[key]);
          }
        }
            // console.log(jsonArr)

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

    

    // v 체크 불 들어오게
   var com_jobtype = $("input[name='com_jobtype']");
   var main_task = $("input[name='main_task']");
   var working_form = $("input[name='working_form']");
   var requirements = $("input[name='requirements']");
   var salary = $("input[name='salary']");

    //boolean
  var b_com_jobtype;
  var b_main_task;
  var b_working_form;
  var b_requirements;
  var b_salary;



    //경력
    $(com_jobtype).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>1){
      $(this).next("i").css("color","green");
      b_com_jobtype=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //주요업무
    $(main_task).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>10){
      $(this).next("i").css("color","green");
      b_main_task=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //근무형태
    $(working_form).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>5){
      $(this).next("i").css("color","green");
      b_working_form=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //자격요건
    $(requirements).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>20){
      $(this).next("i").css("color","green");
      b_requirements=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //급여
    $(salary).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>3){
      $(this).next("i").css("color","green");
      b_salary=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });


	//태그 입력
   $("#hashtag").keyup(function(e){if(e.keyCode == 13) 
    if($(this).val().trim() !=""){
      tagappend(); 
    } else {
    	Swal.fire({
			  icon: 'error',
			  text: '태그를 입력해주세요.'
		})
    }
    });

    //hashtag append 
    var element_count = document.getElementsByTagName('hashtag').length;
    function tagappend(){
     var hashtext = document.getElementById('hashtag').value;
     const str = "<span><button type='button' class='hashbtn' name='hashbtn' style='margin-right:8px;'>#"+hashtext+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashtag' value='"+hashtext+"'></span>";
	 
	 
     if(hashtext.trim() != ""){
      $(".inhash").append(str);
    
      document.getElementById('hashtag').value="";
      element_count++;
      hashTagCount();

     } else {
       alert("태그를 입력해주세요.");
     }
    }

    function remove( element ){  
      //element.parentNode.parentNode.removeChild(element.parentNode);
      
      element_count--;
      hashTagCount();
    // alert(element_count);
    };

    $('.inhash').on('click', 'i', function() {
        $(this).parent('button').parent('span').remove();
     });

    function hashTagCount(){
      if(element_count >= 3){
         $("#hashtag").attr("readonly","readonly");
         $("#hashadd").attr("disabled",true);
      } else {
        $("#hashtag").removeAttr("readonly");
        $("#hashadd").attr("disabled",false);
      }
    }
    //텍스트에디터
    CKEDITOR.replace( 'content' );

    var comJob = $("#com_job1 option:selected").text()+$("#com_job2 option:selected").text();	//직군, 직무
    //console.log("에디터:"+CKEDITOR.instances.content.getData());

    //등록눌렀을때
    $("#rec-insert").on("click",function(){
    	var taglen = $("input[name='hashtag']").length;
    	var tags = new Array(taglen);

       	for(var i=0;i<=taglen;i++){
    		tags[i] = $("input[name='hashtag']").eq(i).val();
    	}

    	var str = tags.join('\'');
    	console.log("str: "+str);
		console.log("_hashlen: "+taglen);

		/*
		if ( $("input[name='edate']").val() == ""){
			Swal.fire({
				  icon: 'error',
				  text: '채용마감일을 등록해주세요'
				})
		} else if($("select[name='com_job1']").val()==0 || $("select[name='com_job2']").val()==0){
			Swal.fire({
				  icon: 'error',
				  text: '직군/직무를 선택해주세요.'
				})
		} else if($("select[name='com_jobtype']").val()==0){
			Swal.fire({
				  icon: 'error',
				  text: '경력을 선택해주세요.'
				})
		} else if($("select[name='working_form']").val()==0){
			Swal.fire({
				  icon: 'error',
				  text: '근무형태를 선택해주세요.'
				})
		} else if($("input[name='main_task']").val().trim()==""){
			Swal.fire({
				  icon: 'error',
				  text: '주요업무를 입력해주세요.'
				})
		} else if($("input[name='salary']").val().trim()==""){
			Swal.fire({
				  icon: 'error',
				  text: '급여를 입력해주세요.'
				})
		} else if(CKEDITOR.instances.content.getData().trim()==""){
			Swal.fire({
				  icon: 'error',
				  text: '내용을 입력해주세요.'
				})
		}  else if(CKEDITOR.instances.content.getData().trim()==""){
			Swal.fire({
				  icon: 'error',
				  text: '내용을 입력해주세요.'
				})
		} else if(taglen<1){
			Swal.fire({
				  icon: 'error',
				  text: '태그를 입력해주세요.'
				})
		} else {
			alert("등록가능");
			
		}/**/

    });

    
</script>
 

<!-- subCont 끝 -->

<%@include file="/include/footer.jsp"%>


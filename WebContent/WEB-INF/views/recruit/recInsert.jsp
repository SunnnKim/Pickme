<%@page import="model.CMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 헤더호출 -->

<c:import url="../../../include/header.jsp"/> 


<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="./../css/calstyle.css" rel="stylesheet">
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
          
          <!-- 회사정보 넘기기 -->
        
          <div class="rec-conatainer">
            <div class="rec-info">
              <h3 class="tit">채용등록정보</h3>
              	<form id="fileform" method="post" action="recfileup.do" enctype="multipart/form-data">
                  <h4>대표이미지등록<span class="ess">*</span></h4>
                  <div class="cont">
                  <i class="file-image">
					 <input id="img1" name="originfile" type="file" onchange="readImage(this)" title="" accept=".jpg, .png"/>
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img1" class="image"></label> 
					</i>
					<i class="file-image">
					 <input id="img2" name="originfile" type="file" onchange="readImage(this)" title="" accept=".jpg, .png"/>
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img2" class="image"></label>
					</i>
					  <i class="file-image">
					 <input id="img3" name="originfile" type="file" onchange="readImage(this)" title="" accept=".jpg, .png"/>
					<i class="reset" onclick="resetImage(this.previousElementSibling)"></i> 
					<label for="img3" class="image"></label>
					</i> 
				</div>
              	</form>     
              	<form id="frm"> 
              	 <input type="hidden" name="comSeq" value="${sessionScope.logincompany.seq}"> 
              	 <input type="hidden" name="comName" value="${sessionScope.logincompany.name}">
              	 <input type="hidden" name="ref" value="${ref}"> 
               <h4>제목<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="title" required placeholder="제목을 입력해주세요." maxlength="40">
                <i class="far fa-check-circle"></i>
              </div>         
               
                  <!-- <div class="imgs-wrap" id="imgs-wrap"></div>   -->                   
           	<h4>채용마감일<span class="ess">*</span></h4>
                  <div class="cont"> 
                  	<input type="text" id="datepicker" name="edate" required placeholder="채용마감일을 설정해주세요." readonly="readonly" style="cursor: pointer;">
             
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
                <select class="select_cons" name="comJobType">
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
                <select class="select_cons" name="workingForm">
                  <option value="0">근무형태를 선택해주세요</option>
                  <option value="정규직">정규직</option>
                  <option value="계약직">계약직</option>
                </select>
                </div>
             </div>
             </div>
              <h4>주요업무<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="mainTask" required placeholder="주요업무를 간략하게 입력해주세요" maxlength="200">
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
	//이미지 첨부 클릭 이벤트 막기
	$("label[for=img2]").on("click",function(e){
		if ( $("#img1").val() == "" ){
			Swal.fire({
				  icon: 'error',
				  text: '첫번째 이미지를 등록해주세요.'
			})
			return false;
		}
		return true;
	});

	$("label[for=img3]").on("click",function(e){
		if ( $("#img1").val() == "" ){
			Swal.fire({
				  icon: 'error',
				  text: '첫번째 이미지를 등록해주세요.'
			})
			return false;
		} else if ( $("#img2").val() == "" ){
			Swal.fire({
				  icon: 'error',
				  text: '두번째 이미지를 등록해주세요.'
			})
			return false;
		}
		return true;
	});
	
	
	

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

    

    // v 체크 불 들어오게
    var i_title = $("input[name='title']");
   var i_main_task = $("input[name='mainTask']");
   var i_requirements = $("input[name='requirements']");
   var i_salary = $("input[name='salary']");

    //boolean
  var b_title;
  var b_main_task;
  var b_requirements;
  var b_salary;



	//경력
	  $(i_title).keyup(function(){
	   var inputLength = $(this).val().length;
	  console.log(inputLength);
	  if(inputLength>1){
	    $(this).next("i").css("color","green");
	    b_title=true;
	    } else {
	    $(this).next("i").css("color","#bbb");
	    }
	 });

    //주요업무
    $(i_main_task).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>10){
      $(this).next("i").css("color","green");
      b_main_task=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });

    //자격요건
    $(i_requirements).keyup(function(){
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
    $(i_salary).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>3){
      $(this).next("i").css("color","green");
      b_salary=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });


    //hashtag append 
    var element_count = document.getElementsByTagName('hashtag').length;
    function tagappend(){
	     var hashtext = document.getElementById('hashtag').value;
	     var text_len =  document.getElementById('hashtag').value.length;
	     const str = "<span><button type='button' class='hashbtn' name='hashbtn' style='margin-right:8px;'>#"+hashtext+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashtext+"'></span>";
	     if(hashtext.trim() != "" && text_len>=4 ){
	      $(".inhash").append(str);
	    
	      document.getElementById('hashtag').value="";
	      element_count++;
	      hashTagCount();
	     } else if(text_len > 1 && text_len < 4){
	    	 Swal.fire({
				  icon: 'error',
				  text: '태그를 4자이상입력해주세요.'
			})

	     } else if(hashtext.trim() == ""){
	    	 Swal.fire({
				  icon: 'error',
				  text: '태그를 입력해주세요.'
			})
	     } 

     }


	//태그 입력
   $("#hashtag").keyup(function(e){
	   if(e.keyCode == 13) {
		   if( $(this).val().length >= 4 ) {
			 tagappend();
		   } else if ( $(this).val().length > 1 && $(this).val().length < 4){
			   Swal.fire({
					  icon: 'error',
					  text: '태그를 4자이상입력해주세요.'
				})
		   }
		}
	   
    });

   

    function remove( element ){  
      element_count--;
      hashTagCount();
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

    
    //등록눌렀을때
    $("#rec-insert").on("click",function(){
        //hash tag
    	var taglen = $("input[name='hashTag']").length;
    	var tags = new Array(taglen);

       	for(var i=0; i < taglen;i++){
           	tags[i] = $("input[name='hashTag']").eq(i).val();
    		console.log("tags:"+tags);
    	}
		//var jsondata = JSON.parse(tags);
		jsondata = JSON.stringify(tags)
    	console.log( jsondata)
	
	/*  
		String 데이터를 Json데이터로 바꾸는 방법
 		jsondata = JSON.parse(jsondata)
    	console.log( jsondata)
 */    	
    	
		 
		// null 체크 && true 체크
		if ( $("input[name='title']").val() == "" && b_title == true){
			Swal.fire({
				  icon: 'error',
				  text: '제목을 등록해주세요'
				})
		} else if ( $("input[name='originfile']").val() == ""){
			Swal.fire({
				  icon: 'error',
				  text: '대표이미지를 등록해주세요'
				})
		} else if ( $("input[name='edate']").val() == "" ){
			Swal.fire({
				  icon: 'error',
				  text: '채용마감일을 등록해주세요'
				})
		} else if($("select[name='com_job1']").val()==0 || $("select[name='com_job2']").val()==0){
			Swal.fire({
				  icon: 'error',
				  text: '직군/직무를 선택해주세요.'
				})
		} else if($("input[name='requirements']").val()=="" && b_requirements == true ){
			Swal.fire({
				  icon: 'error',
				  text: '자격요건을 입력해주세요.'
				})
		} else if($("select[name='comJobType']").val()==0){
			Swal.fire({
				  icon: 'error',
				  text: '경력을 선택해주세요.'
				})
		} else if($("select[name='workingForm']").val()==0){
			Swal.fire({
				  icon: 'error',
				  text: '근무형태를 선택해주세요.'
				})
		} else if($("input[name='mainTask']").val().trim()=="" &&  b_main_task == true ){
			Swal.fire({
				  icon: 'error',
				  text: '주요업무를 입력해주세요.'
				})
		} else if($("input[name='salary']").val().trim()=="" && b_salary == true ){
			Swal.fire({
				  icon: 'error',
				  text: '급여를 입력해주세요.'
				})
		} else if(CKEDITOR.instances.content.getData().trim()==""){
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
			/* var queryString = $("#frm").serialize(); */
			//name value
		 		var comSeq = $("input[name=comSeq]").val();
		 		var comName = $("input[name=comName]").val();
				var ref = $("input[name=ref]").val();
				var originfile = $("input[name=originfile]").val();
				var title = $("input[name=title]").val();
				var edate =  $("input[name=edate]").val();
				var comJob = $("#com_job1 option:selected").text()+","+$("#com_job2 option:selected").text();	//직군, 직무;
				var comJobType = $("select[name=comJobType]").val();
				var workingForm = $("select[name=workingForm]").val();
				var mainTask = $("input[name=mainTask]").val();
				var requirements = $("input[name=requirements]").val();
				var salary = $("input[name=salary]").val();
				var imageName = $("#img1").val();
				
				//CKEDITOR.instances.content.getData()
				var hashTag = jsondata;
		
				console.log( {'comSeq':comSeq,'comName':comName,'ref':ref,'edate':edate,'comJob':comJob,'comJobType':comJobType, 'title':title, 'requirements':requirements,
					'workingForm':workingForm,'mainTask':mainTask,'salary':salary,'content':CKEDITOR.instances.content.getData(), 'hashTag':hashTag, 'imagename':imageName });
			  
			  $.ajax({
				url:"recInsertAf.do",
				type:"post",
				datatype:'json',
				data:{'comSeq':comSeq,'comName':comName,'ref':ref,'edate':edate,'comJob':comJob,'comJobType':comJobType, 'title':title, 'requirements':requirements,
					'workingForm':workingForm,'mainTask':mainTask,'salary':salary,'content':CKEDITOR.instances.content.getData(), 'hashTag':hashTag, 'imagename':imageName },
				success: function(data){
					//alert("넘어온 seq: "+data);
					if(data > 0){
					$("#fileform").submit();
						Swal.fire({
							  icon: 'success',
							  title: '공고가 등록되었습니다.',
							  timer: 4000
						})
						
					} else {
						Swal.fire({
							  icon: 'error',
							  text: '등록 실패하였습니다 다시 시도해주세요.'
							})
						
					}
				}
			}); //ajax
				 
			
		}
	
    });//등록 눌렀을때


    
</script>
 

<!-- subCont 끝 -->

<%@include file="/include/footer.jsp"%>


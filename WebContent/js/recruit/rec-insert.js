   //페이지 벗어나면 확인창 띄우기
	  var checkUnload = true;
	  $(window).on("beforeunload", function(){
	      if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	  });
	
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
			minDate : 1,
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
           
            keyArr.push(key);
            valArr.push(json[key]);

          }
        }

    });
    
      function changeOcc( onedepth ){
         // alert(onedepth.value);
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
    var i_title = $("input[name='title']"),
   i_main_task = $("input[name='mainTask']"),
   i_requirements = $("input[name='requirements']"),
   i_salary = $("input[name='salary']");

    //boolean
  var b_title, b_main_task, b_requirements, b_salary;

	//경력
	  $(i_title).keyup(function(){
	   var inputLength = $(this).val().length
	  console.log(inputLength);
	  if(inputLength>1){
	    $(this).next("i").css("color","green")
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
    if(inputLength>10){
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
	     } else if(text_len > 1 && text_len < 2){
	    	 Swal.fire({
				  icon: 'error',
				  text: '태그를 2자이상입력해주세요.'
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
		   if( $(this).val().length >= 2 ) {
			 tagappend();
		   } else if ( $(this).val().length > 1 && $(this).val().length < 2){
			   Swal.fire({
					  icon: 'error',
					  text: '태그를 2자이상입력해주세요.'
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
    		//console.log("tags:"+tags);
    	}
		//var jsondata = JSON.parse(tags);
		jsondata = JSON.stringify(tags)
    	//console.log( jsondata)
	
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
		} else if( $("#img1").val()=="" &&  $("#img2").val()!= "" ){
			Swal.fire({
				  icon: 'error',
				  text: '첫번째 이미지를 등록해주세요'
				})
		} else if( $("#img1").val()=="" &&  $("#img3").val()!= "" ){
			Swal.fire({
				  icon: 'error',
				  text: '첫번째 이미지를 등록해주세요'
				})
		} else if( $("#img2").val()=="" &&  $("#img3").val()!= "" ){
			Swal.fire({
				  icon: 'error',
				  text: '두번째 이미지를 등록해주세요'
				})
		}  else if ( $("input[name='edate']").val() == "" ){
			Swal.fire({
				  icon: 'error',
				  text: '채용마감일을 등록해주세요'
				})
		} else if($("select[name='comJob1']").val()==0 || $("select[name='comJob2']").val()==0){
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
			 //페이지 이동 확인창 false
	 		checkUnload=false;
		 		var comSeq = $("input[name=comSeq]").val(),
		 		comName = $("input[name=comName]").val(),
				ref = $("input[name=ref]").val(),
				originfile = $("input[name=originfile]").val(),
				title = $("input[name=title]").val(),
				edate =  $("input[name=edate]").val(),
				comJob1 = $("#com_job1 option:selected").text(),	//직군
				comJob2 = $("#com_job2 option:selected").text(),	//직무
				comJobType = $("select[name=comJobType]").val(),
				workingForm = $("select[name=workingForm]").val(),
				mainTask = $("input[name=mainTask]").val(),
				requirements = $("input[name=requirements]").val(),
				salary = $("input[name=salary]").val(),
				imageName = $("#img1").val();
				
				//CKEDITOR.instances.content.getData()
				var hashTag = jsondata;

				//console.log("이미지:"+originfile);
				//console.log( {'comSeq':comSeq,'comName':comName,'ref':ref,'edate':edate,'comJob1':comJob1,'comJob2':comJob2,'comJobType':comJobType, 'title':title, 'requirements':requirements,
				//	'workingForm':workingForm,'mainTask':mainTask,'salary':salary,'content':CKEDITOR.instances.content.getData(), 'hashTag':hashTag, 'imagename':imageName });
			  
			   $.ajax({
				url:"recInsertAf.do",
				type:"post",
				datatype:'json',
				data:{'comSeq':comSeq,'comName':comName,'ref':ref,'edate':edate,'comJob1':comJob1,'comJob2':comJob2,'comJobType':comJobType, 'title':title, 'requirements':requirements,
					'workingForm':workingForm,'mainTask':mainTask,'salary':salary,'content':CKEDITOR.instances.content.getData(), 'hashTag':hashTag, 'imagename':imageName },
				success: function(data){
					//alert("넘어온 seq: "+data);
					if(data > 0){
						Swal.fire({
							  icon: 'success',
							  title: '공고가 등록되었습니다.',
							  timer: 1500
						}).then( (result) =>{
							$("#fileform").submit();
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 기업회원 정보 불러오기  --> 
<%
	// 컨트롤러에서 받아온 기업회원 정보 부분 
	CMemberDto memberInfo = (CMemberDto) request.getAttribute("cMember");

	// 컨트롤러에서 받아온 주소 조각
	String zipcode = (String)request.getAttribute("realAddress[0]");	// 우편번호
	String basicAdd = (String)request.getAttribute("realAddress[1]");	// 기본주소
	String detailAdd = (String)request.getAttribute("realAddress[2]");	// 상세주소
%>  
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>

<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>

<style>
#visual_wrap {position:relative; width:100%; height:450px; overflow:hidden;}
#visual li > p {height:480px; background-size:cover !important;}
.visual-box {opacity:0; transition:all 0.3s ease-in-out 1.5s; position:absolute; bottom:20px; left:50%; margin-left:-525px; width:6000px; background:#fff; z-index:99;}
.visual-box a {display:block;}
.visual-box .tit {padding:20px;}
.visual-box .tit strong {display:block; font-size:22px;}
.visual-box .tit p {margin-top:3px; font-size:14px; color:#999; font-weight:bold;}
.visual-box .more {font-size:16px; color:#4f6eff; border-top:1px solid #ddd; line-height:50px; padding:0 20px; font-weight:bold;}
.visual-box .more i {display:inline-block; margin-left:10px;}
#visual li.active-slide .visual-box {opacity:1;}


.c_introTop .c_introSlider {float: left;width: 600px;/* height: 480px; */background: #ccc;/* background: url("https://www.venturesquare.net/wp-content/uploads/2019/07/2019-0702-wanted-751x522.png") no-repeat center / cover; */}
.c_introTop .c_introInfo {float: right;width: 420px;}
.c_introInfo .tit h3 {line-height: 80px;font-size: 23px;}

/* 로고 */
.c_introInfo .tit h3 img {width: 80px;height: 80px;border : 1px solid #ddd;margin-right : 15px;}
.c_introInfo ul {margin-top: 20px;}
.c_introInfo ul li {font-size: 18px;position: relative;margin-top: 22px;padding-left: 120px;}
.c_introInfo ul li span {display: block;position: absolute;top:0;left:0;font-weight: bold;}


.followBtnWrap {margin-top: 21px;}
.followBtnWrap span {display: block;text-align: center;height: 50px;background-color: #4f6eff;color: #fff;line-height: 50px;font-size: 24px;cursor: pointer;}
.followBtnWrap span:hover {background-color:#6681ff;}
.followBtnWrap span i {margin-left: 10px;display: none;}
.followBtnWrap span input width: 0;height: 0;display:none;}

.c_introBtm {margin-top: 100px;}
.c_introBtm h4 {font-size: 22px; margin-top:30px; margin-left:40px;}
.c_introBtm h4 > span {display:inline-block; margin-left:30px;}
.c_introBtm h4 > span > span {display:inline-block;padding:5px 15px;font-size:15px;color:#fff;background:#999;border-radius:3px;margin-right:10px;}
.c_introBtm .cont {margin-top: 20px;font-size: 18px; /* margin-left:60px; */}
      	
/* 수정버튼 */
.updateBtn { font-size: 22px;padding-bottom: 8px;color: #fff;}

/* 수정 버튼 눌렀을 때 */
.updateBtn:focus { outline:none;}

.cont {background-color:#e0e0e0; /* margin-left:100px; */ padding-left:50px; padding-top: 50px; padding-right:50px; padding-bottom:50px;}
</style>

<body>
</body>
</html>
      

<div class="profile-wrap">
        <div class="c_introWrap">
          <div class="c_introTop clfix">
            <div class="c_introSlider">
            
            		<div id="visual_wrap">
		<link rel="stylesheet" href="/Pickme/css/bxslider.css" type="text/css" />
		<script type="text/javascript" src="/Pickme/js/bxslider.js"></script>
		<ul id="visual">
      <li>
          <p style="background-image:url('http://bitly.kr/Bhuwi1tzO');background-size:contain;"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
			<li>
		  <p style="background-image:url('http://bitly.kr/X6FdifSzE');background-size:contain;"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
      <li>
      	  <p style="background-image:url('http://bitly.kr/urJlCXH68');background-size:contain;"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
		</ul>
	</div>
            
            
            
            
            
            </div>  <!-- // c_introSlider -->
            <div class="c_introInfo">
                <div class="tit">
                  <h3><img src="https://image.rocketpunch.com/company/4084/wanted_logo_1519203285.jpg?s=400x400&t=inside" alt="logo"> <%=memberInfo.getName() %></h3>
                </div>
                <ul>
                
                
                  <!-- <li><button onclick = "location.href='slide.do'">슬라이드 테스트</button></li> -->
                
                
                  <li><span>기업분야</span><%=memberInfo.getDepartment() %></li>
                  <li><span>규모</span><%=memberInfo.getType() %></li>
                  <li><span>대표자 성명</span><%=memberInfo.getPresident() %></li>
                  <li><span>전화번호</span><%=memberInfo.getTel() %></li>
                  <li><span>이메일</span><%=memberInfo.getEmail() %></li>
                  <li><span>주소</span><%=memberInfo.getAddress() == ""? "등록된 주소가 없습니다.": memberInfo.getAddress()%> </li>
                </ul>
                <div class="followBtnWrap">
                  <label>
                    	<% if(member != null) { %>
                    	<span>팔로우<i class="fas fa-check"></i> <input type="checkbox"></span>
                    <% } else if(memberInfo != null) { %>
                   		<span><i class="fas fa-check"></i><button type = "button" class="updateBtn" onclick = "location.href='goUpdate.do?seq=<%=memberInfo.getSeq()%>'"> 수정 </button></span>
                    <% } %>					
                  </label>
                </div>
            </div>  <!-- // c_introInfo -->
          </div> <!-- // c_introTop -->      

          <div class="c_introBtm">
          
          <!--  ★★★★★★★★★★★★★★★★★★ DB 에서 해시태그 걸어야함 ★★★★★★★★★★★★★★★★ -->
          
            <h4>회사소개 
            	<span id="hashTags">
	            	
            	</span>
	        </h4>
            <div class="cont">
	            <%=memberInfo.getIntroduce() == null ? "등록된 소개가 없습니다.": memberInfo.getIntroduce()%>
            </div>
          </div> <!-- // c_introBtm -->


        </div> <!-- // c_introWrap -->
        
        
        
        
        
        <!--***************************** 스크립트 영역 **********************************************-->
        
        
        
        <!--------------------------- 슬라이드 ------------------------------->
        <script type="text/javascript">
		$(document).ready(function(){
		$('#visual').bxSlider({
			//mode:'fade',
	      pause:4500,
		  pager: false,
		  auto:true,
			onSliderLoad: function(currentIndex) {
			  $('#visual_wrap').find('.bx-viewport').find('ul').children().eq(currentIndex).addClass('active-slide');
	 			$('#visual_wrap').find('.bx-viewport').find('ul').children().eq(1).addClass('active-slide').css('transition', 'all 0.1 ease-in-out');
			},
			onSlideBefore: function($slideElement){
			  $('#visual_wrap').find('.bx-viewport').find('ul').children().removeClass('active-slide');
			  $slideElement.addClass('active-slide');
			}
			});
		});
		</script>

		<!------------------------- 팔로우 버튼 -------------------------->
    <script>
          $(".followBtnWrap label input[type='checkbox']").click(function(){
            if($(this).is(":checked")){
             $('.followBtnWrap span i').show();
            }else {
              $('.followBtnWrap span i').hide();
            }

          });
			<%-- var c_title = '<%= company.getName()%>';
          $('#company-logo').append('<span>'+c_title+'</span>') --%>


// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@ 해쉬태그 @@@@@@@@@@@@@

		// 해쉬태그 json 가져오기
		var hashTag = <%=memberInfo.getHashTag()%>;
	
		// 해쉬태그가 없는경우
		if(hashTag == 'null'){
			$('#hashTags').html('태그를 설정해주세요')
		}
		// 태그가 있는 경우
		else{
			$('#hashTags').html('')
			// 화면에 뿌리기  
			for( key in hashTag ){
				
				// 태그 배열 뽑아오기
				 console.log('배열 '+hashTag[key])
				var arr = hashTag[key];
				 console.log(arr);
				
				// for 문으로 배열 데이터(태그) 모두 뽑기 
				$('#hashTags').append('<span>#' + arr + '</span>')
			}
			//$('#hashTags').html('<span>' +  + '</span>')
		}
        </script>



</div><!-- // wrap -->


<%@include file="/include/footer.jsp"%>
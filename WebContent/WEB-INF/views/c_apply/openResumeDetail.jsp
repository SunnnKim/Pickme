<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../include/header.jsp"%>
<!-- //resumeWrite_Wrap -->
<div id="resumeWrite_Wrap">
   <div class="rsm_top">
       <form name="resumeFrm" id="resumeFrm">
       <input type="hidden" name="seq" value="이력서시퀀스"> <!-- 이력서 시퀀스 -->
       <input type="hidden" name="memSeq" value="유저시퀀스"> <!-- 유저 시퀀스 -->
       <input type="hidden" name="userName" value="유저이름"> <!-- 유저 이름 -->
       <input type="hidden" name="status" value="작성상태"><!-- 작성상태 : 0.작성중, 1.작성완료, 2.첨부완료 -->
       <h3><input type="text" name="name" value="이력서명1" readonly></h3>
       <input type="text" name="email" value="a@member.com" readonly>
       <input type="text" name="phone" value="010-3423-7750" readonly>
       <textarea name="introduce"readonly>자기소개입니다</textarea>
       </form>
   </div><!-- //rsm_top -->

   <div class="rsmCont">
       <h4>경력</h4>
       <div class="rsm_add">
           <div class="rsm_addCont clfix" id="career">
               <div class="rsm_left">
                   <div class="rsm_date">
                       <input type="text" value="2020-02" readonly>
                       <span class="dateHide">-</span>
                       <input type="text" class="dateHide" value="2020-02" readonly>
                   </div>
                   <p><label><input type="checkbox" disabled><span></span>현재 재직중</label></p>
               </div><!-- //rsm_left -->
               <div class="rsm_right">
                   <input type="text" class="tit" value="회사명" readonly>
                   <input type="text" class="desc" placeholder="부서명/직책" value="부서명/직책" readonly>
               </div><!-- //rsm_right -->
           </div><!-- //rsm_addCont -->
       </div><!-- //rsm_add -->
   </div><!-- //rsmCont -->

   <div class="rsmCont">
       <h4>학력</h4>
       <div class="rsm_add">
           <div class="rsm_addCont clfix">
               <div class="rsm_left">
                   <div class="rsm_date">
                       <input type="text" value="2020-02"readonly>
                       <!-- <span class="dateHide"</c:if></span>>-</span> -->
                       <!-- <input type="text" class="dateHide" value="2020-03"readonly> -->
                   </div>
                   <p><label><input type="checkbox" checked disabled><span></span>현재 재학중</label>
                   </p>
               </div><!-- //rsm_left -->
               <div class="rsm_right">
                   <input type="text" class="tit" value="비트대학교" readonly>
                   <input type="text" class="desc" value="컴퓨터학과"readonly>
                   <textarea readonly>이수과목 및 연구내용 </textarea>
               </div><!-- //rsm_right -->
               </div><!-- //rsm_addCont -->
       </div><!-- //rsm_add -->
   </div>
   <!-- //rsmCont -->

   <div class="rsmCont">
       <h4>수상 및 기타</h4>
       <div class="rsm_add">
           <div class="rsm_addCont clfix">
               <div class="rsm_left">
                   <div class="rsm_date">
                       <input type="text" value="2020-02" readonly>
                   </div>
               </div><!-- //rsm_left -->
               <div class="rsm_right">
                   <input type="text" class="tit" value="활동명">
                   <textarea readonly >세부사항</textarea>
               </div><!-- //rsm_right -->
               <div class="rsm_delete"><i class="fas fa-times"></i>
           </div><!-- //rsm_addCont -->
       </div><!-- //rsm_add -->		
   </div><!-- //rsmCont -->
   

   <div class="rsmCont">
       <h4>외국어</h4>
       <form name="langFrm">
       <div class="rsm_add">	
           <div class="rsm_addCont clfix">
               <div class="lang">
                   <h5>언어</h5>
                   <ul class="chkBox clfix">
                       <li class="on"><span></span><i>영어</i></li>
                   </ul>
               </div>
               <div class="level">
                   <h5>수준</h5>
                   <ul class="chkBox clfix">
                       <li class="on"><span></span><i>일상회화</i></li>
                   </ul>
               </div>
               <div class="lang_test">
                   <h5>관련 시험</h5>
                   <input type="text" class="desc" value="시험명" readonly>
                   <input type="text" class="desc" value="점수/급" readonly>
                   <div class="rsm_date">
                       <input type="text" style="width:80px" value="만료일" readonly>
                   </div>
               </div>
           </div><!-- //rsm_addCont -->
       </div><!-- //rsm_add -->		
       </form>
   </div><!-- //rsmCont -->
   <div class="rsmCont">
       <h4>링크</h4>
       <div class="rsm_add">	
           <div class="rsm_addCont clfix">
               <div class="rsm_right link">
                   <a href="dldkl.com"></a>
                   <input type="text" value="http://www.naver.com/myblog.com" readonly></div>
           </div><!-- //rsm_addCont -->
       </div><!-- //rsm_add -->		
   </div><!-- //rsmCont -->
    

    <div class="resumeBtnWrap">
        <button type="button" name="button" id="back">뒤로가기</button>
    </div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
<script type="text/javascript">

</script>

<%@include file="../../../include/footer.jsp"%>

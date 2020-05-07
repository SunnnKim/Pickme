<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../include/header.jsp"%>

<!-- //resumeWrite_Wrap -->
<div id="resumeWrite_Wrap">
   <div class="rsm_top">
       <h3><input type="text" name="name" value="${dto.name }" readonly></h3>
       <input type="text" name="email" value="${dto.email}" readonly>
       <input type="text" name="phone" value="${dto.phone}" readonly>
       <textarea name="introduce"readonly>${dto.introduce }</textarea>
   </div><!-- //rsm_top -->

   <div class="rsmCont">
       <h4>경력</h4>
       <c:forEach var="dto" items="${careerList}" varStatus="status">
	       <div class="rsm_add">
	           <div class="rsm_addCont clfix" id="career">
	               <div class="rsm_left">
	                   <div class="rsm_date">
	                       <input type="text" value="${dto.startdate}" readonly>
	                       <span class="dateHide" <c:if test="${dto.ing != 0}">style="display:none;"</c:if>>-</span>
	                       <input type="text" class="dateHide" value="${dto.enddate }" readonly>
	                   </div>
	                   <%-- <p><label><input type="checkbox" disabled <c:if test="${dto.ing != 0}">checked</c:if>><span></span>현재 재직중</label>
	                   </p> --%>
	               </div><!-- //rsm_left -->
	               <div class="rsm_right">
	                   <input type="text" class="tit" value="회사 : ${dto.company }" readonly>
	                   <input type="text" class="desc" value="부서 / 직책 : ${dto.position }" readonly>
	               </div><!-- //rsm_right -->
	           </div><!-- //rsm_addCont -->
	       </div><!-- //rsm_add -->
       </c:forEach>
   </div><!-- //rsmCont -->

   <div class="rsmCont">
       <h4>학력</h4>
       <c:forEach var="edu" items="${educationList}" varStatus="status">
	       <div class="rsm_add">
	           <div class="rsm_addCont clfix">
	               <div class="rsm_left">
	                   <div class="rsm_date">
	                       <input type="text" value="${edu.startdate}" readonly>
	                       <span class="dateHide" <c:if test="${edu.ing != 0}">style="display:none;"</c:if>>-</span>
	                       <input type="text" class="dateHide" value="${edu.enddate }" readonly>
	                   </div>
	                   <%-- <p>
	                   	<label><input type="checkbox" disabled <c:if test="${edu.ing != 0}">checked</c:if>><span></span>현재 재학중</label>
	                   </p> --%>
	               </div><!-- //rsm_left -->
	               <div class="rsm_right">
	                  <input type="text" class="tit" value="${edu.school }" readonly>
	                   <input type="text" class="desc" value="전공 : ${edu.major }" readonly>
	                   <textarea readonly>이수과목 / 내용 : ${edu.study }</textarea>
	               </div><!-- //rsm_right -->
	               </div><!-- //rsm_addCont -->
	       </div><!-- //rsm_add -->
       </c:forEach>
   </div>
   <!-- //rsmCont -->

   <div class="rsmCont">
       <h4>수상 및 기타</h4>
       <c:forEach var="awards" items="${awardsList}" varStatus="status">
	       <div class="rsm_add">
	           <div class="rsm_addCont clfix">
	               <div class="rsm_left">
	                   <div class="rsm_date">
	                       <input type="text" maxlength="6" value="${awards.date }" style="width: 120px">
	                   </div>
	               </div><!-- //rsm_left -->
	               <div class="rsm_right">
	                   <input type="text" class="tit" value="${awards.awards }">
	                   <textarea readonly >${awards.detail }</textarea>
	               </div><!-- //rsm_right -->
	           </div><!-- //rsm_addCont -->
	       </div><!-- //rsm_add -->		
       </c:forEach>
   </div><!-- //rsmCont -->
   

   <div class="rsmCont">
       <h4>외국어</h4>
        <c:forEach var="dto" items="${languageList}" varStatus="status">
       <div class="rsm_add">	
           <div class="rsm_addCont clfix">
               <div class="lang">
                   <h5>언어</h5>
                   <ul class="chkBox clfix">
                       <li><span></span><i>${dto.lang }</i></li>
                   </ul>
               </div>
               <div class="level">
                   <h5>수준</h5>
                   <ul class="chkBox clfix">
                       <li><span></span><i>${dto.level }</i></li>
                   </ul>
               </div>
               <div class="lang_test">
                   <h5>관련 시험</h5>
                   <input type="text" class="desc" value="시험 : ${dto.test }" readonly>
                   <input type="text" class="desc" value="점수 /급수 : ${dto.score }" readonly>
                   <div class="rsm_date">
                       <input type="text" style="width:200px" value="취득 연도 : ${dto.date }" readonly>
                   </div>
               </div>
           </div><!-- //rsm_addCont -->
       </div><!-- //rsm_add -->		
       </c:forEach>
   </div><!-- //rsmCont -->
   <div class="rsmCont">
       <h4>링크</h4>
         <c:forEach var="dto" items="${linkList}" varStatus="status">
	       <div class="rsm_add">	
	           <div class="rsm_addCont clfix">
	               <div class="rsm_right link">
	                   <a href="dldkl.com"></a>
	                   <input type="text" value="${dto.url }" readonly></div>
	           </div><!-- //rsm_addCont -->
	       </div><!-- //rsm_add -->		
       </c:forEach>
   </div><!-- //rsmCont -->
    

    <div class="resumeBtnWrap">
        <button type="button" name="button" onclick="back()">뒤로가기</button>
    </div>
</div>
<script type="text/javascript">
function back(){
	//alert('ss??')
	location.href="/Pickme/c_apply/cApplyList.do?jobSeq=${dto.jobSeq}"
}
</script>

<%@include file="../../../include/footer.jsp"%>

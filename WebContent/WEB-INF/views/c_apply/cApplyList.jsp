<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JQuery 추가 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<!-- 
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="cApplyList.do">현재공고</a></li>
	<li><a href="">지난공고</a></li>
</ul>
 -->

<!-- allList -->

<div class="cont">
<h1>cApplyList</h1>
	
</div>


<!-- // allList -->


<script>
/* 페이지 이동 */
 
//var seq = '${sessionScope.logincompany.seq}';
function goPage(pn){	

	 location.href="cApplyMain.do?&pageNumber=" + pn;
	
}

function cApply_list() {
	location.href="cApplyList.do"
}

</script>


<!-- subCont 끝 -->


<%@include file="/include/footer.jsp"%>

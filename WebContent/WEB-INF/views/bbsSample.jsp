<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/include/header.jsp"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li class=""><a href="#none" onclick="">메뉴1</a></li>
	<li class="active"><a href="#none" onclick="">메뉴2</a></li>
	<li class=""><a href="#none" onclick="">메뉴3</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="search" name="keyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			<button type="button" class="btn-search"
				onclick="javascript:search('allList')">
				<span>검색</span>
			</button>
			<!-- <button type="button" id="searchBtn" onclick=""></button> -->
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 45px">
				<col>
				<col>
				<col>
				<col>
				<col style="width: 100px">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>지원자</th>
					<th>요청일</th>
					<th>수락여부</th>
					<th>상태</th>
					<th>관심</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox"></td>
					<td>홍길동</td>
					<td>2020-04-05 12:40</td>
					<td>대기</td>
					<td>요청취소</td>
					<td><!-- 이미지 미정 --></td>
				</tr>
			</tbody>
		</table>
	</div>


	<!-- 페이징 -->
	<div class="paging">
		<button type="button" class="btn-first"
			onclick="getList('allList', 1)">
			<span>처음</span>
		</button>
		<button type="button" class="btn-prev" onclick="getList('allList', 1)">
			<span>이전</span>
		</button>
		<ul>
			<li><a href="" onclick="">1</a></li>
			<li class="active"><span>2</span></li>

			<li><a href="" onclick="">3</a></li>
		</ul>
		<button type="button" class="btn-next" onclick="getList('allList', 2)">
			<span>다음</span>
		</button>
		<button type="button" class="btn-last"
			onclick="getList('allList', 10)">
			<span>마지막</span>
		</button>
	</div>

</div>
<!-- // allList -->


<%@include file="/include/footer.jsp"%>

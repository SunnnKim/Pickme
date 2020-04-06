<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%-- 

<!-- cv_Favorite -->
<div id="cv_Favorite" data-tab-content="" class="">
	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value="">
			<button type="button" class="btn-search" onclick="search('cv_Favorite', 1)">
				<span>검색</span>
			</button>
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 50px">
				<col style="width: 50px">
				<col >
				<col >
				<col>
				<col style="width: 300px">
				<col style="width: 50px">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>관심</th>
					<th>이름</th>
					<th>요청일</th>
					<th>수락여부</th>
					<th>상태</th>
					<th><input type="checkbox" id="checkall"></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty requestList }">
				<tr>
					<td colspan="7">열람을 요청한 내역이 없습니다.</td>
				</tr>
				</c:if>
			
				<c:forEach items="${requestList }" var="request"  varStatus="vs">
				<tr>
					<td>${vs.count }</td>
					<td>
						<button type="button" class="likeButton " onclick="likech(this)">
							<i class="fas fa-heart liked"></i>
						</button>
						<i class="fas fa-star"> <input name="bool" type="hidden" value=""></i>
					</td>
					<td>
						<a href="" style="text-align: center;" >${request.name }</a>
					</td>
					<td>
						${request.rdate }
						${fn:substring(request.rdate ,0,10) }						
					</td>
					<td>
						<c:choose>
							<c:when test="${request.accept eq '1'}">
								1: 수락
							</c:when>
							<c:when test="${request.accept eq '2'}">
								2: 거절
							</c:when>
							<c:otherwise>
								0: 대기
							</c:otherwise>
						</c:choose>
					</td>
					
					<td>
						<c:choose>
							<c:when test="${request.accept eq '1'}">
								1: 수락 , ${request.state }
							</c:when>
							<c:when test="${request.accept eq '2'}">
								2: 거절
							</c:when>
							<c:otherwise>
								<button type="button" style="border: 1px solid #000;" >요청취소</button>
							</c:otherwise>
						</c:choose>
					</td>
					
					<td>
						<input type="checkbox" name="checkRow" value="${request.seq }">
					</td>
				</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>

	<div class="btn-message" style="text-align: right;">
		<button type="button" onclick="deleteAction()">선택삭제</button>
	</div>

	<!-- 페이징 -->
	<div class="paging">
		<button type="button" class="btn-first" onclick="getList('allList', 1)">
			<span>처음</span>
		</button>
		<button type="button" class="btn-prev" onclick="getList('allList', 1)">
			<span>이전</span>
		</button>
		<ul>
			<li class="active"><span>1</span></li>
			<li><a href="" onclick="">2</a></li>
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
</div> <!-- // favorite -->

 --%>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li><a href="curAList.do" >현재지원내역</a></li>
	<li class="active"><a href="pastAList.do">지난지원내역</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" name="keyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>


<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 45px">
				<col style="width: 400px">
				<col>
				<col>
				<col style="width: 100px">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkall"></th>
					<th>기업명</th>
					<th>지원일</th>
					<th>담당자확인여부</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" name="checkRow" value=""></td>
					<td><a href="채용공고페이지">기업명</a></td>
					<td>2020-04-01</td>
					<td>2020-04-05 12:40</td>
					<td><button class="applyDelBtn" onclick="cancelApply()">삭제</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btn-apply">
		<button type="button" style="float: left;" onclick="deleteAction()">선택삭제</button>
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

</div>
<!-- // allList -->

<script>
		function deleteAction() {
			var checkRow = "";
			$("input[name='checkRow']:checked").each(function() {
				checkRow = checkRow + $(this).val() + ",";
			});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			alert("checkRow : " + checkRow);
			if (checkRow == '') {
				alert("삭제 할 대상을 선택하세요.");
				return false;
			}
			console.log("### checkRow => {}" + checkRow);
		
			if (confirm("선택한 항목을 삭제 하시겠습니까?")) {
				//삭제처리 후 다시 불러올 리스트 url      
		
				
			}
		}

	
	function cancelApply(){
		Swal.fire({
		  title: "정말 삭제하시겠습니까?",
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'취소',
		  confirmButtonText: '삭제'
		}).then((result) =>{
		  if (result.value) {
			 // ajax로 삭제 구현
		    Swal.fire(
		      '',
		      '성공적으로 삭제가 되었습니다',
		      ''
		    )
		  }
		});
		
	}

	/*담당자 확인한 경우 삭제버튼 disabled*/
	
	
	/* 검색 */
	function searchAction() {
		alert("검색 버튼 클릭");
	}
	</script>


<%@include file="/include/footer.jsp"%>

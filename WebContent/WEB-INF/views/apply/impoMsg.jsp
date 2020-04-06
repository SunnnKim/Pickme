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
	<li><a href="inMsg.do" >받은 메시지</a></li>
	<li><a href="outMsg.do" >보낸 메시지</a></li>
	<li class="active"><a href="impoMsg.do" >중요 메시지</a></li>
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
				<col style="width: 10%">
				<col style="width: 50%">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width: 10%">
			</colgroup>
			<thead>
				<tr>
					<th>중요</th>
					<th>내용</th>
					<th>발신자</th>
					<th>발신일</th>
					<th><input type="checkbox" id="checkall"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 중요메세지 -->
					<td class="star-td"><i class="fas fa-star"> <input
							type="hidden" value="">
					</i></td>
					<td><a href="#none">안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요
							안녕하세요 안녕하세요 안녕하세요 안녕하세요 </a></td>
					<td>OOOOO</td>
					<td>2020-04-05</td>
					<td><input type="checkbox" name="checkRow" value=""></td>
				</tr>

				<tr>
					<!-- 중요메세지 -->
					<td class="star-td"><i class="fas fa-star"> <input
							type="hidden" vlaue="">
					</i></td><!-- 별표시 없애면 2초후  -->
					<td><a href="#none">안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요
							안녕하세요 안녕하세요 안녕하세요 안녕하세요 </a></td>
					<td>OOOOO</td>
					<td>2020-04-05</td>
					<td><input type="checkbox" name="checkRow" value=""></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btn-message">
		<button type="button" onclick="writeAction()">메시지 작성</button>
		<button type="button" style="float: right;" onclick="deleteAction()">선택삭제</button>
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

<!-- 메시지작성 팝업 -->
 <div class="messenger-wrap">
     <form id="frm" action="" method="post">
         <div class="msgBox">
                <div class="msg-bar">
                    <h4>메세지 보내기</h4>
                </div><!-- // message-bar-->
                <div class="msgCont">
                    <div class="msgTo"><!--검색기능 jquery-ui, ajax사용-->
                        <!--https://jqueryui.com/autocomplete/ 
                            https://hellogk.tistory.com/74
                            참고하면 될듯해요-->
                        <input type="text"  placeholder="To">
                    </div><!-- // messageTo-->
                    <div class="msgTit">
                        <input type="text" id="msgTitle" placeholder="Title">
                    </div><!-- // messageTit-->
                    <div class="msgText">
                        <textarea id="content" placeholder=""></textarea>
                    </div><!-- // messageText-->
                    <div class="msgBtn">
                        <button onclick="send()">보내기</button>
                        <button class="close_window">닫기</button>
                    </div><!-- // messageBtn-->
                </div><!-- // messageCont-->
          </div><!-- // messageBox-->
 	 </form>
</div><!-- //messenger-wrap -->
      



<script>
	$(document).ready(function() {
		// 체크박스 전체 체크
		$("#checkall").click(function() {
			if ($("#checkall").prop("checked")) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		})

		// 중요메세지 표시
		$('.star-td i').click(function() {
			$(this).toggleClass('on');
		});
	})

	/* 선택 삭제(체크박스된 것 전부) */
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

		if (confirm("정보를 삭제 하시겠습니까?")) {
			//삭제처리 후 다시 불러올 리스트 url      

			
		}
	}

	/* 메시지 작성 */
	function writeAction() {
	   $('.messenger-wrap').fadeIn(200);
	}

	/* 메시지 창 닫기 */
	$('.close_window').click(function(){
          $('input').val('');
          $('textarea').val('');
        $('.messenger-wrap').fadeOut(200);
      });
	

	function searchAction() {
		alert("검색 버튼 클릭");
	}
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>

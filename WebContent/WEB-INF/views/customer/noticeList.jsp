<%@page import="model.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
 <!-- Vue -->
 <script src="/Pickme/js/vue/vue.js"></script><!--vue-->

<!-- subCont 시작 -->
 <!-- 메뉴 -->
        <ul class="tab-default column3 mt30">
          <li class="active"><a href="#" >공지사항</a></li>
        <!-- 	<li><a href="pastCvReq.do">지난요청</a></li>
        --></ul>
<!--  공지사항 데이터  -->
<%
	List<NoticeDto> list = (List<NoticeDto>) request.getAttribute("list");
	int allPage = (int) request.getAttribute("allPage");
	int nowPage = (int) request.getAttribute("nowPage");
	int firstPage = (int) request.getAttribute("firstPage");
%>
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
				<col style="width: 15%">
				<col style="width: 60%">
				<col style="width: 15%">
				<col style="width: 10%"> 
			</colgroup>
			<thead>
				<tr>
					<th>분류</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="(data, index) in noticelist">
					<td>{{data.type}}</td> 
					<td v-on:click="detail(data.seq)" :style="alignLeft">
						{{data.title}}
						<span v-if="data.fileExist != 0">
							<i class="far fa-file-alt"></i>
						</span>
					</td>
					<td>{{data.wdate}}</td>
					<td>{{data.readcount}}</td>
				</tr>
				<!-- 공지가 없는 경우 -->
				<tr v-if="allContents == 0">
					<td colspan="3">새로운 글이 없습니다!</td>
				</tr>
			</tbody>
		</table>
	</div><!-- // table-col close -->
	<!-- 페이징 -->
	<div class="paging">
		<button type="button" class="btn-first"
			onclick="goPage(0)">
			<span>처음</span>
		</button>
		<button type="button" class="btn-prev" onclick="goPage(<%= firstPage == 0 ? firstPage:firstPage-10%>)"> 
			<span>이전</span>
		</button>
		<ul>
		<%	int w = 0;
			for(int i = firstPage; i < allPage; i++ ){
				if( w < 10){
				if(nowPage == i){
			%>
				<li class="active" >
					<span><%=i +1%></span>
				</li>
			<%
				}else{
			%>
				<li ><a href="#none" onclick="goPage(<%=i %>)"><%=i + 1 %></a></li> 
			<%
				}
				w++;
			}else{break;}}
			%>
		</ul>
		<button type="button" class="btn-next" onclick="goPage(<%= allPage > 10 ? firstPage + 10:-1%>)">
			<span>다음</span>
		</button>
		<button type="button" class="btn-last"
			onclick="goPage(<%= allPage-1%>)">
			<span>마지막</span>
		</button>
	</div>
</div>
<script>
var listdata = [];
var listA = {};
<%
for(int i = 0; i < list.size(); i++){
	NoticeDto dto = list.get(i);
	%>
		listA = {
			seq:'<%=dto.getSeq()%>',
			type:'<%=dto.getType()%>',
			title:'<%=dto.getTitle()%>',
			wdate:'<%=dto.getWdate()%>',
			readcount:'<%=dto.getReadcount()%>',
			fileExist:'<%=dto.getFiles()%>'
		}
		listdata.push(listA)
	<%
}
%>
console.log(listdata)

var vue = new Vue({
	  el:'#allList',
	  data:{
	    i:0,
	    noticelist:listdata,
	    allPage:<%=allPage%>,
	    nowPage:<%=nowPage%>,
	    firstPage:<%=firstPage%>,
	    'alignLeft':'text-align:left; cursor:pointer;'
	    
	  },
	  methods:{
		detail: function(seq){
			location.href = "/Pickme/customer/noticeDetail.do?seq=" + seq;
		}
	}
});

// 페이지 이동함수 
goPage = seq => {
	if(seq == -1){
		alert('마지막 페이지 입니다!');
		return false;
	}
	location.href = "noticeList.do?pageNumber=" + seq;
}


</script>
<style>
.fa-file-alt{
color: #4f6eff;
}
</style>
<%@include file="/include/footer.jsp"%>
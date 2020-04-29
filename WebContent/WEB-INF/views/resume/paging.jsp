<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paging 연산 -->
<%
/*		[1]~[10] -> [11]~[20] 
	처음					  끝페이지
	<<  < [1][2][3][4] > >>
*/

	int totalRecCount;	// 전체 글의 수		23 -> 3
	int pageNumber;			// 현재 페이지		0 ~ 9 -> [1] ~ [10]	
	int pageCountPerScreen; // 스크린당 페이지수	[1]~[10], [1]~[5]	-> 10
	int recordCountPerPage;	// 페이지당 글의 수   [1] -> 10
	
	String st1 = request.getParameter("totalRecCount");
	if(st1 == null) totalRecCount = 0;
	else	totalRecCount = Integer.parseInt(st1);

	String st2 = request.getParameter("pageNumber");
	if(st2 == null) pageNumber = 0;
	else	pageNumber = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null) pageCountPerScreen = 0;
	else 	pageCountPerScreen = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null) recordCountPerPage = 0;
	else    recordCountPerPage = Integer.parseInt(st4);

	// 총 페이지의 수	[1][2][3] -> 3
	int totalPageCount = totalRecCount / recordCountPerPage;
	//		2				23					10
	if((totalRecCount % recordCountPerPage) != 0){
		totalPageCount++;
	}
	
	System.out.println("totalRecordCount: " + totalRecCount);
	
	// 시작페이지	[1]	[11] [21]
	int screenStartPageIndex = ((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen;		
	//			0			 =			0			 10						10			
	System.out.println("screeStartPageIndex: " + screenStartPageIndex);	
			
			
	// 끝 페이지     [10] [20] [30]
	int screenEndPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;	
	//			10					0				10                       10 				10
	
	// 끝 페이지는 다시 계산	-> [1]~[10]	[1]~[3]
	if(screenEndPageIndex > totalPageCount){
		screenEndPageIndex = totalPageCount;
	}
	
	
	System.out.println("totalPageCount: " + totalPageCount);
	System.out.println("screenEndPageIndex: " + screenEndPageIndex);
	
	// 0 ~ 9 -> 1 ~ 10
	if((pageNumber + 1) % pageCountPerScreen == 0){
		screenStartPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
		screenEndPageIndex = pageNumber + 1;	// 0 -> 1 		9 -> 10
	}
	
	
	
	System.out.println("screenStartPageIndex:" + screenStartPageIndex);
	System.out.println("screenEndPageIndex:" + screenEndPageIndex);
%>

<!-- paging 출력 -->
<div class="paging">
	<!-- << -->
	<button type="button" class="btn-first" onclick="paging(0)">
		<span>처음</span>
	</button>
	<%if (pageNumber > 0){ %>
	<button type="button" class="btn-prev"
		onclick="paging(<%=pageNumber - 1%>)">
		<span>이전</span>
	</button>
	<%}else if(pageNumber == 0){ %>
	<button type="button" class="btn-prev"
		onclick="paging(<%=pageNumber - 1%>)" disabled="disabled">
		<span>이전</span>
	</button>

	<%} %>

	<!-- <a href="#none" title="처음페이지" onclick="goPage('0')">
		<img alt="" src="./image/arrow_first.gif" style="width: 10px; height: 10px">
	</a>
 -->
	<!-- < [11] ~ [20] -> [1] ~ [10] -->
	<%-- 	<%
	if(screenStartPageIndex > 1){	// 총 글의 수가 100개 넘어야 보인다
		%>
		<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1 %>')">
			<img alt="" src="./image/arrow_back.gif" style="width: 10px; height: 10px">
		</a>
		
		<%
	}	
	%>
 --%>
	<!-- [1] 2 [3] -->

	<ul>
		<%
	if(screenStartPageIndex == screenEndPageIndex){%>
		<li class="active"><span>1</span></li>
		<% }
	
	for(int i = screenStartPageIndex; i < screenEndPageIndex; i++){
		if(i == pageNumber){	// 현재 페이지	2
			%>
		<li class="active"><span><%=i + 1 %></span></li>

		<%}else{ %>
		<li><a href="#none" onclick="paging(<%=i %>)"><%=i + 1 %></a></li>

		<%}} %>
	</ul>

	<!-- 다음페이지 -->
	<%
		int end_page = 0;
		if(totalPageCount > 0){
			end_page = totalPageCount - 1;
		}
		
		if (pageNumber == end_page){ %>
	<button type="button" class="btn-next" disabled="disabled"">
		<span>다음</span>
	</button>
	<%}else { %>
	<button type="button" class="btn-next"
		onclick="paging(<%=pageNumber + 1%>)">
		<span>다음</span>
	</button>

	<%} %>




	<%-- 			<span style="font-size: 10pt; color: #000000; font-weight: bold;">
				<%=i+1 %>			
			</span>			
			<%
		}else{					// 그 외의 페이지 [1] 2 [3][4]
			%>
			<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
				style="font-size: 9.5pt; color: #000000; font-weight: normal;">
				[<%=i+1 %>]
			</a>	
			<%
		}		
	}		
	%> --%>

	<!-- > 1 ~ 10 -> 11 ~ 20	-->
	<%-- 	<%
	if(screenEndPageIndex < totalPageCount){	// [11][12][13] 
		%>
		<a href="#none" title="다음페이지" onclick="goPage(<%=screenEndPageIndex %>)">
			<img alt="" src="./image/arrow_next.gif" style="width: 10px; height: 10px">			
		</a>	
		<%
	}
	%>		 --%>


	<button type="button" class="btn-last" onclick="paging(<%=end_page %>)">
		<span>마지막</span>
	</button>

	<!-- >> -->
	<%-- 	<a href="#none" title="마지막페이지" onclick="goPage(<%=end_page %>)">
		<img alt="" src="./image/arrow_end.gif" style="width: 10px;height: 10px;">
	</a>
	
 --%>
</div>












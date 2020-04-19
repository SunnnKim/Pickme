<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="model.FilesDto"%>
<%@page import="model.NoticeDto"%>
<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<% 
	// 공지사항 디테일
	NoticeDto detail = (NoticeDto) request.getAttribute("detail");
	List<FilesDto> files = (List<FilesDto>) request.getAttribute("files");
%>

<div class="profile-wrap">
	<div class="notice-content">
	    <div class="notice-title">
	        <span class="notice-type">[<%=detail.getType() %>]</span>
	        <span><%=detail.getTitle() %></span>
	        <div class="notice-info">
	            <span>등록일<span><%=detail.getWdate() %></span></span>
	            <span>조회수<span><%=detail.getReadcount() %></span></span>
	        </div>
	    </div>
	    <div class="notice-contents">
	        <div class="contents">
	            <%=detail.getContent()%>
	        </div>
	    </div>
	    <div class="notice-files">
	        <div>첨부파일</div>
	        <!--파일 있으면 반복문 돌림 -->
	        <%
	        	for(int i = 0; i < files.size(); i++){
	        		FilesDto file = files.get(i);
        	%>
		        <div class="files">
		          <a href="noticeFileDownload.do?filename=<%= URLEncoder.encode(file.getNewname())%>">
		            <i class="far fa-file-alt"></i>
		          	<%=file.getOriginname()%>
		          </a>
		        </div>
        		<%
	        	} 
	        	if(files.size() == 0 ){
	        	%>
	        	<div class="files">
	        		첨부파일이 없습니다.	
		        </div>
	        	<%
	        }
	        %>
	    </div>
	    <div class="back-btn" onclick="location.href='noticeList.do'">
	      목록보기
	    </div>
	</div>
</div>
<script>

</script>

<style>
.notice-content {}
.notice-content .notice-title{ font-size: 35px; height: 120px; line-height: 80px; border-bottom: 1px solid #eaeaea; margin-top: -25px; }
.notice-content .notice-title .notice-type{ margin-right: 15px; }
.notice-content .notice-title .notice-info{ height: 30px; line-height: 0; color:#333; font-weight: 300; }
.notice-content .notice-title .notice-info > span{ font-size: 15px; display: inline-block; width: 150px; }
.notice-content .notice-title .notice-info > span > span { display: inline-block; width: 80px; margin-left: 10px; font-weight: 400;}
.notice-content .notice-contents{ min-height: 500px; margin-top: 30px;  }
.notice-content .notice-contents .contents{ }
.notice-content .notice-contents {} 
.notice-content .notice-files{ border-top: 1px solid #eaeaea; border-bottom: 1px solid #eaeaea; } 
.notice-content .notice-files > div{ margin: 10px 0; font-size: 20px; font-weight: 500;}
.notice-content .notice-files > div.files{ min-height: 30px; font-size: 15px; font-weight: 400; }
.notice-content .notice-files > div.files .fa-file-alt{ color:#304edf }
.back-btn{cursor:pointer; border: 1px solid; width:250px; height: 50px; line-height: 50px; text-align: center; background: #304edf; color: #fff; margin: 0 auto; margin-top: 50px;}
</style>



<%@include file ="../../../include/footer.jsp" %>
<%@page import="model.PremierServiceDto"%>
<%@page import="java.util.List"%>
<%@include file ="../../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
	List<PremierServiceDto> list = (List<PremierServiceDto>)request.getAttribute("list");
%>

<div class="profile-wrap">
<!-- 여기부터 복붙하기 -->
        <div class="logo-wrapper">
            <div class="imgbox">
                <div>PICK ME 유료서비스</div>
                <img src="/Pickme/images/sub/paidServiceimg.jpeg">
            </div>
            <div class="intro-img" style="overflow: hidden; height: 450px;">
                <img src="/Pickme/images/sub/service3.png" width="120%" style="position: relative; top: -135px;left: -110px;">
            </div>
            <div class="intro-img" style="margin-bottom: 100px;">
                <a href="#">채용공고 광고 등록하기</a>
                <img src="/Pickme/images/sub/service1.png" width="100%">
            </div>
            <div class="intro-img">
                <img src="/Pickme/images/sub/service2.png" width="100%">
            </div>
        </div>
        <div class="service-content" id="service">
            <div class="content-title">서비스 목록</div>
            <div class="contents-wrapper clfix">
            <% for(int i = 0; i < list.size(); i ++ ){
            	PremierServiceDto dto = list.get(i);
            %>
           		<div class="content-box">
                    <span><%=dto.getServiceName() %></span>
                    <div class="go-btn" onclick="goBtn(<%=dto.getServiceSeq()%>)">자세히보기</div>
                </div>
            <% 
            }
           	%>
              
            </div>
        </div>
</div>
<!-- script -->
<script>
function goBtn( seq ){
	location.href="/Pickme/customer/paidServiceDetail.do?seq="  + seq;	
}

</script>

<style>
.logo-wrapper{
    width: 100%;
}
.logo-wrapper .imgbox{
}
.logo-wrapper .imgbox > img{ width: 100%; opacity: 0.8;}
.logo-wrapper .imgbox > div { color: #fff;
    position: absolute; height: 442px; width: 100%; line-height: 442px; text-align: center; font-size: 50px; z-index: 100;;
 }
.intro-img{
    position: relative; margin: 150px 0; border-top:1px solid #eaeaea; padding-top: 100px;
}
.intro-img img{}
.intro-img > a{
    display: inline-block; width: 300px; height: 50px; line-height: 50px; background: #4f6eff; color:#fff; border-radius: 10px;
    text-align: center; position: absolute;bottom: 29px; left: 30px;
}

/* content */
.service-content{
    border-top:1px solid #eaeaea; 
}
.service-content .content-title{
    margin: 30px 0; text-align: center; height: 100px; font-size: 30px; line-height: 100px; font-weight: 300;
}
.service-content .contents-wrapper{
 margin-bottom: 100px;
}
.service-content .content-box{
    width: 40%; float: left; margin: 50px 5%; height: 200px; background-color: #fff; border-radius: 20px; box-shadow:0px 0px 12px 0px #eaeaea;
}
.service-content .content-box > span {
    display: block; font-size: 30px; font-weight: 200; text-align: center; margin-top: 30px; 
}
.service-content .content-box > .go-btn { transition: all 0.3s ease-in-out; cursor:pointer;
    border: 1px solid #eaeaea; color:#eaeaea; width: 250px; text-align: center; margin: 0 auto; margin-top: 30px;height: 40px; line-height: 40px; border-radius: 20px; 
}
.service-content .content-box > .go-btn:hover{
    background-color: #4f6eff; border: 1px solid #eaeaea; color:#eaeaea;
}
</style>

<%@include file ="../../../../include/footer.jsp" %>
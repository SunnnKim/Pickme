<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="resumeWrite_Wrap">
	<div class="rsm_top">
		<div class="rsm-downBtn"><button><i class="fas fa-download"></i></button></div>
		<h3>김은청</h3>
		<input type="text" value="bitcamp@gmail.com" readonly>
		<input type="text" value="" placeholder="연락처를 입력해주세요">
		<textarea placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요.(3~5줄 권장)"></textarea>
	</div>
	<!-- //rsm_top -->

	<div class="rsmCont">
		<h4>경력</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_left">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
						<span>-</span>
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
					</div>
					<p><label><input type="checkbox"><span></span>현재 재직중</label></p>
				</div><!-- //rsm_left -->
				<div class="rsm_right">
					<input type="text" class="tit" placeholder="회사명">
					<input type="text" class="desc" placeholder="부서명/직책">
				</div><!-- //rsm_right -->
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->
		</div><!-- //rsm_add -->
	</div><!-- //rsmCont -->

	<div class="rsmCont">
		<h4>학력</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_left">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
						<span>-</span>
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
					</div>
					<p><label><input type="checkbox"><span></span>현재 재학중</label></p>
				</div>
				<!-- //rsm_left -->
				<div class="rsm_right">
					<input type="text" class="tit" placeholder="학교명">
					<input type="text" class="desc" placeholder="전공을 입력해주세요">
					<textarea placeholder="이수과목 또는 연구내용"></textarea>
				</div>
				<!-- //rsm_right -->
				<div class="rsm_delete">
					<i class="fas fa-times"></i>
				</div>
			</div>
			<!-- //rsm_addCont -->
		</div>
		<!-- //rsm_add -->
	</div>
	<!-- //rsmCont -->

	<div class="rsmCont">
		<h4>수상 및 기타</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_left">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
					</div>
				</div><!-- //rsm_left -->
				<div class="rsm_right">
					<input type="text" class="tit" placeholder="활동명">
					<textarea placeholder="세부사항"></textarea>
				</div><!-- //rsm_right -->
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->			
		</div><!-- //rsm_add -->		
	</div><!-- //rsmCont -->
	

	<div class="rsmCont">
		<h4>외국어</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="lang">
					<h5>언어</h5>
					<label><input type="radio" name="lang"><span></span>영어</label>
					<label><input type="radio" name="lang"><span></span>중국어</label>
					<label><input type="radio" name="lang"><span></span>일본어</label>
					<label><input type="radio" name="lang"><span></span>독일어</label>
					<label><input type="radio" name="lang"><span></span>프랑스어</label>
					<label><input type="radio" name="lang"><span></span>기타</label>
				</div>
				<div class="level">
					<h5>수준</h5>
					<label><input type="radio" name="level" value="유창함"><span></span>유창함</label>
					<label><input type="radio" name="level" value="비지니스회화"><span></span>비지니스회화</label>
					<label><input type="radio" name="level" value="일상회화"><span></span>일상회화</label>
				</div>
				<div class="lang_testBtn">+ 어학시험 추가</div>
				<div class="lang_test">
					<input type="text" class="desc" placeholder="시험명">
					<input type="text" class="desc" placeholder="점수/급">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
						<span>.</span>
						<input type="text" placeholder="DD" maxlength="2">
						<div class="rsm_delete"><i class="fas fa-times"></i></div>
					</div>
				</div>
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->			
		</div><!-- //rsm_add -->		
	</div><!-- //rsmCont -->
	

	<div class="rsmCont">
		<h4>링크</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_right link"><input type="text" class="desc" placeholder="http://"></div>
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->			
		</div><!-- //rsm_add -->		
	</div><!-- //rsmCont -->
	

	<div class="resumeBtnWrap">
		<button type="button" name="button">임시저장</button>
		<button type="button" name="button">저장완료</button>
	</div>
</div>
<!-- //resumeWrite_Wrap -->

<script type="text/javascript">
        // 날짜 입력 숫자만 가능하게
        $('.rsm_date input[type=text]').keyup(function(event){
          var inputVal = $(this).val();
          $(this).val(inputVal.replace(/[^0-9]/gi,''));
        });

        </script>

<%@include file="../../../include/footer.jsp"%>

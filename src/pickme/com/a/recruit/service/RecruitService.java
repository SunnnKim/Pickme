package pickme.com.a.recruit.service;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;

import model.AwardsEtcDto;
import model.CApplyDto;
import model.CMemberDto;
import model.CareerDto;
import model.EducationDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;

public interface RecruitService {
		//날짜 지나면 DEL=1로 바꾸기
		//public void dayUpdateDel(String today);
	
		// (메인) 조회수 순 4개 보여주기
		public List<RecruitDto> mainTopRec();
	
		//마지막 ref+1 받아오기
		public int getRef();									
		
		//recruit 테이블에 마지막으로 등록된 seq 받아오기
		public int getLastSeq();		
		
		//recruit insert
		public int insertRecruit(RecruitDto dto);
		
		//files insert
		public boolean insertRecFile(List<FilesDto> list);
		
		//file insert -> recruit table imagename -> newname 
		public void updateImgName(int ref);
		
		// 공고 detail
		public RecruitDto getRecruitDetail(int seq);
		
		// 해당되는 공고 img 불러오기
		public List<FilesDto> getRecFile(int ref);
		
		// 기업 분야,주소 받아오기
		public CMemberDto getComInfo(int seq);
		
		//(기업) 로그인한 기업이 볼 수 있는 현재공고
		public List<RecruitDto> myCurrentRecList(RecruitParam param);
		
		//(기업) 현재공고 글 수
		public int getComRecCount(int seq);
		
		//(기업) 로그인한 기업이 볼 수 있는 지난공고
		public List<RecruitDto> myPastRecList(RecruitParam param);
		
		//(기업) 지난공고 글 수
		public int getComPastCount(int seq);
		
		// 공고 마감
		public int delRecruit(int seq);
		
		// (공고 수정) RECRUIT UPDATE
		public int recUpdate(RecruitDto dto);
		
		// (공고 수정 ) FILES DELETE
		public boolean delRecFile(int ref);
		
		
		
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// 지원하기 : resume_after 에 데이터 넣기 
		public int insertResume( ResumeAfterDto dto);
		// 지원하기 : apply테이블에 데이터 넣기 
		public int insertApply( CApplyDto dto);
		// 지원하기 : file 일 경우 resume_file_after 테이블에 넣기 
		public int insertResumeFile(ResumeFileDto file);
		// 지원하기 : file 내역 불러오기 
		public ResumeFileDto getResumeFile(int seq);
		
		// Resume 테이블에서 지원서 꺼내오기
		public ResumeAfterDto getSelectedResume(int seq);
		
		
		// Career 테이블에서 경력사항 꺼내오기 
		public List<CareerDto> getSelectedResumeCareer(int seq);
		// Career_after에 데이터 넣기
		public boolean insertCareerAfter(List<CareerDto> list);
		
		
		// Education 테이블에서 학력사항 꺼내오기 
		public List<EducationDto> getSelectedResumeEducation(int seq);
		// Education_after에 데이터 넣기
		public boolean insertEducationAfter(List<EducationDto> list);
		
		// AwardsEtc 테이블에서 학력사항 꺼내오기 
		public List<AwardsEtcDto> getSelectedResumeAwards(int seq);
		// AwardsEtc_after에 데이터 넣기
		public boolean insertAwardsAfter(List<AwardsEtcDto> list);
		
		// Language 테이블에서 학력사항 꺼내오기 
		public List<LanguageDto> getSelectedResumeLanguage(int seq);
		// Language_after 에 데이터 넣기
		public boolean insertLanguageAfter(List<LanguageDto> list);
		
		// Link 테이블에서 학력사항 꺼내오기 
		public List<LinkDto> getSelectedResumeLink(int seq);
		// Link_after 에 데이터 넣기
		public boolean insertLinkAfter(List<LinkDto> list);
		
		
}

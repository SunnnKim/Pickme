package pickme.com.a.recruit.service;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;

public interface RecruitService {
		//날짜 지나면 DEL=1로 바꾸기
		public void dayUpdateDel(String today);
	
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
		
	
}

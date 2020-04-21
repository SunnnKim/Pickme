package pickme.com.a.searchJob.service;

import java.util.List;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeDto;

public interface SearchJobService {
	public List<RecruitDto> getRecAllList(RecruitParam param);
	//총 게시물 수
	public int getCountRec();
		
	// 공고 detail
	public RecruitDto getRecruitDetail(int seq);
	
	// 해당되는 공고 img 불러오기
	public List<FilesDto> getRecFile(int ref);
	
	// 해당되는 공고 첨부파일 갯수
	public int countFiles(int ref);
	
	// 기업 분야,주소 받아오기
	public CMemberDto getAddr(int seq);
	

	// readcount up
	public void readCountUp(int seq);
	
	
	// @@@@@ 지원하기 @@@@@
	// 나의 이력서 불러오기 
	public List<ResumeDto> getMyResumes(int seq);
}

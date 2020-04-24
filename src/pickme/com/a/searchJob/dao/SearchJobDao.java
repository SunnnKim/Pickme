package pickme.com.a.searchJob.dao;

import java.util.List;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeDto;

public interface SearchJobDao {
	//날짜 지나면 DEL=1로 바꾸기
	public void dayUpdateDel();

	//채용탐색 전체 리스트
	public List<RecruitDto> getRecAllList(RecruitParam param);
	
	//총 게시물 수
	public int getCountRec(RecruitParam param);
	
	// 공고 detail
	public RecruitDto getRecruitDetail(int seq);
	
	// 해당되는 공고 img 불러오기
	public List<FilesDto> getRecFile(int ref);
	
	
	// 기업 주소,분야 뽑아오기
	public CMemberDto getAddr(int seq);
	
	// readcount up
	public void readCountUp(int seq);
	
	// @@@@@ 지원하기 @@@@@
	// 나의 이력서 불러오기 
	public List<ResumeDto> getMyResumes(int seq);
	
}

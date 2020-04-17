package pickme.com.a.searchJob.service;

import java.util.List;

import model.FilesDto;
import model.RecruitDto;

public interface SearchJobService {
	public List<RecruitDto> getRecAllList();
	//총 게시물 수
	public int getCountRec();
		
	// 공고 detail
	public RecruitDto getRecruitDetail(int seq);
	
	// 해당되는 공고 img 불러오기
	public List<FilesDto> getRecFile(int ref);
	
	// 해당되는 공고 첨부파일 갯수
	public int countFiles(int ref);
	
	// 기업 주소 받아오기
	public String getAddr(int seq);
}

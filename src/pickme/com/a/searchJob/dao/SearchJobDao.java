package pickme.com.a.searchJob.dao;

import java.util.List;

import model.CMemberDto;
import model.FavoriteDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeDto;

public interface SearchJobDao {

	//채용탐색 전체 리스트
	public List<RecruitDto> getRecAllList(RecruitParam param);
	
	//총 게시물 수
	public int getCountRec(RecruitParam param);
	
	// readcount up
	public void readCountUp(int seq);
	
	// 좋아요 추가
	public boolean likePlus(FavoriteDto dto);
	
	// 좋아요 삭제
	public boolean likeDel(FavoriteDto dto);
	
	// 전체 좋아요 count
	public int likeRecTotal(FavoriteDto dto);
	
	// 내가 좋아요 한 게시물
	public int likeCountByMem(FavoriteDto dto);
	
	
	// @@@@@ 지원하기 @@@@@
	// 나의 이력서 불러오기 
	public List<ResumeDto> getMyResumes(int seq);
	// 지원한 내역 있는지 확인하기
	public int checkIfApply(ResumeAfterDto dto);
	
}

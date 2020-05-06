package pickme.com.a.searchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CMemberDto;
import model.FavoriteDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeDto;
import pickme.com.a.searchJob.dao.SearchJobDao;

@Service
public class SearchJobServiceImpl implements SearchJobService{

	@Autowired
	SearchJobDao dao;

	@Override
	public List<RecruitDto> getRecAllList(RecruitParam param) {
		return dao.getRecAllList(param);
	}
	@Override
	public int getCountRec(RecruitParam param) {
		return dao.getCountRec(param);
	}

	@Override
	public List<ResumeDto> getMyResumes(int seq) {
		return dao.getMyResumes(seq);
	}
	@Override
	public void readCountUp(int seq) {
		dao.readCountUp(seq);
	}
	
	@Override
	public boolean likePlus(FavoriteDto dto) {
		return dao.likePlus(dto);
	}
	@Override
	public boolean likeDel(FavoriteDto dto) {
		return dao.likeDel(dto);
	}
	@Override
	public int likeRecTotal(FavoriteDto dto) {
		return dao.likeRecTotal(dto);
	}
	@Override
	public int likeCountByMem(FavoriteDto dto) {
		return dao.likeCountByMem(dto);
	}
	@Override
	public int checkIfApply(ResumeAfterDto dto) {
		return dao.checkIfApply(dto);
	}
	

	
	
}

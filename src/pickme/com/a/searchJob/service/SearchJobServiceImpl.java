package pickme.com.a.searchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
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
	public int getCountRec() {
		return dao.getCountRec();
	}
	@Override
	public RecruitDto getRecruitDetail(int seq) {
		return dao.getRecruitDetail(seq);
	}
	@Override
	public List<FilesDto> getRecFile(int ref) {
		return dao.getRecFile(ref);
	}
	@Override
	public int countFiles(int ref) {
		return dao.countFiles(ref);
	}
	@Override
	public String getAddr(int seq) {
		return dao.getAddr(seq);
	}
	
	
	
}

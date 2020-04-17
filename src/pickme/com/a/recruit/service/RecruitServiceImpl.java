package pickme.com.a.recruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import pickme.com.a.recruit.dao.RecruitDao;

@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	RecruitDao dao;

	@Override
	public int getRef() {
		return dao.getRef();
	}
	@Override
	public int getLastSeq() {
		return dao.getLastSeq();
	}
	
	@Override
	public int insertRecruit(RecruitDto dto) {
		return dao.insertRecruit(dto);
	}

	@Override
	public boolean insertRecFile(List<FilesDto> list) {
		return dao.insertRecFile(list);
	}
	@Override
	public void updateImgName(int ref) {
		dao.updateImgName(ref);
	}
	@Override
	public List<RecruitDto> myCurrentRecList(RecruitParam param) {
		return dao.myCurrentRecList(param);
	}
	@Override
	public List<RecruitDto> myPastRecList(RecruitParam param) {
		return dao.myPastRecList(param);
	}
	@Override
	public int getComRecCount(int seq) {
		return dao.getComRecCount(seq);
	}
	@Override
	public int getComPastCount(int seq) {
		return dao.getComPastCount(seq);
	}
	

	
	
}

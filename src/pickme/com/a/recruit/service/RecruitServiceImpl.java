package pickme.com.a.recruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FilesDto;
import model.RecruitDto;
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
	

	
	
}

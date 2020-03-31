package pickme.com.a.recruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.RequestDto;
import pickme.com.a.recruit.dao.RecruitDao;

@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	RecruitDao recruitDao;

	@Override
	public List<RequestDto> getList() {
		return recruitDao.getList();
	}
	
	
}

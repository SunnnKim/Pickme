package pickme.com.a.recruit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pickme.com.a.recruit.dao.RecruitDao;

@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	RecruitDao dao;

	@Override
	public int getRef() {
		return dao.getRef();
	}
	
	
	
}

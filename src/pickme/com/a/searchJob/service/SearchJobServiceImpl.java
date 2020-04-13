package pickme.com.a.searchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.RecruitDto;
import pickme.com.a.searchJob.dao.SearchJobDao;

@Service
public class SearchJobServiceImpl implements SearchJobService{

	@Autowired
	SearchJobDao dao;

	@Override
	public List<RecruitDto> getRecAllList() {
		return dao.getRecAllList();
	}
	
}

package pickme.com.a.searchPeople.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import model.CvRequestDto;
import model.SearchPeopleParam;
import pickme.com.a.searchPeople.dao.SearchPeopleDao;

@Service
public class SearchPeopleServiceImpl implements SearchPeopleService{

	@Autowired
	SearchPeopleDao dao;
	
	
	@Override
	public boolean isPremierMember(int seq) {
		return dao.isPremierMember(seq);
	}
	@Override
	public List<AMemberDto> getSearchBasic(SearchPeopleParam param) {
		return dao.getSearchBasic(param);
	}

	@Override
	public int getSearchBasicNumber(SearchPeopleParam param) {
		return dao.getSearchBasicNumber(param);
	}

	@Override
	public List<AMemberDto> getSearchDetail(SearchPeopleParam param) {
		return dao.getSearchDetail(param);
	}

	@Override
	public int getSearchDetailNumber(SearchPeopleParam param) {
		return dao.getSearchDetailNumber(param);
	}
	@Override
	public AMemberDto getPeopleDetail(int seq) {
		return dao.getPeopleDetail(seq);
	}
	@Override
	public boolean insertCvRequest(CvRequestDto dto) {
		return dao.insertCvRequest(dto);
	}

	
	
}
